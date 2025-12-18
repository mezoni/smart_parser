import 'dart:convert';

import 'package:simple_sparse_list/ranges_helper.dart';
import 'package:strings/strings.dart';
import 'package:unicode/unicode.dart';

import '../parser_generator_options.dart';
import 'allocator.dart';
import 'code_builder.dart';
import 'expression_printer.dart';
import 'expressions.dart';
import 'helper.dart';
import 'range_generator.dart';

typedef _ParsingState = ({Code save, Code restore});

class BuildResult {
  final Code code;

  final List<Failure> failures;

  final List<Success> successes;

  BuildResult({
    required this.code,
    required this.successes,
    required this.failures,
  });

  Failure get singleFailure {
    if (failures.length != 1) {
      throw StateError('Failed to get single failure');
    }

    return failures.first;
  }

  Success get singleSuccess {
    if (successes.length != 1) {
      throw StateError('Failed to get single success');
    }

    return successes.first;
  }
}

class ExpressionGenerator implements Visitor<BuildResult> {
  static const _invalid = '__INVALID__';

  static const _none = 'Result.none';

  static const _noneValue = 'Result.none.\$1';

  final Allocator allocator;

  final ParserGeneratorOptions options;

  final String productionName;

  final Map<Expression, String> suggestedNames = {};

  final Set<Expression> _declaredSemanticValues = {};

  final Set<Expression> _insidePredicate = {};

  final Map<Expression, Code> _parsingStates = {};

  ExpressionGenerator({
    required this.allocator,
    required this.options,
    required this.productionName,
  });

  BuildResult generate(Expression expression) {
    final identifiers = _collectIdentifiers(expression);
    allocator.reserved.addAll(identifiers);
    return _generate(expression);
  }

  @override
  BuildResult visitAction(ActionExpression node) {
    final source = node.source;
    final code = Code();
    _writeSaveParsingState(code, node);
    _writeBlock(code, source);
    final success = Success.none();
    code.add(success.succeeds);
    _addErrorHandler(node, const []);
    return BuildResult(code: code, successes: [success], failures: []);
  }

  @override
  BuildResult visitAndPredicate(AndPredicateExpression node) {
    final child = node.expression;
    if (child.isAlwaysSuccessful) {
      _wrongExpression(
        node,
        'The child expression always succeeds',
        'The predicate expression will always succeeds',
      );
    }

    final code = Code();
    _writeSaveParsingState(code, node);
    if (_isSimpleExpression(child)) {
      _insidePredicate.add(child);
      final res = _generate(child);
      _checkIsSingleOutput(res);
      final success = res.singleSuccess;
      final failure = res.singleFailure;
      success.setResultToNone();
      _addErrorHandler(node, [failure]);
      return res;
    }

    final usePosition = child.canChangePosition;
    code.stmt('state.predicate++');
    final state = _createParsingState(usePosition);
    _saveParsingState(code, state);
    final res = _generate(child);
    code.add(res.code);
    final successes = res.successes;
    final failures = res.failures;
    for (final success in successes) {
      success.setResultToNone();
      success.succeeds((code) {
        _restoreParsingState(code, state);
        code.stmt('state.predicate--');
      });
    }

    _addErrorHandler(node, failures, (code) {
      code.stmt('state.predicate--');
    });

    return BuildResult(code: code, successes: successes, failures: failures);
  }

  @override
  BuildResult visitAnyCharacter(AnyCharacterExpression node) {
    final isVoid = node.isVoid;
    final semanticValue = _getSemanticValue(node);
    final code = Code();
    final failure = Failure(isSafe: true);
    final success = Success.none();
    const isTrue = 'state.ch >= 0';
    code.if$(isTrue, (code) {
      _writeSaveParsingState(code, node);
      var variable = _invalid;
      if (!isVoid) {
        variable =
            semanticValue ?? _allocate(_getSuitableName(node) ?? 'anyChar');
        code.declare('final', variable, 'state.ch');
        if (semanticValue != null) {
          _declaredSemanticValues.add(node);
        }

        success.setValue(variable, false);
      }

      if (!_insidePredicate.contains(node)) {
        code.stmt('state.nextChar()');
      }

      code.add(success.succeeds);
    });

    _addErrorHandler(node, [failure]);
    code.add(failure.fails);
    return BuildResult(code: code, successes: [success], failures: [failure]);
  }

  @override
  BuildResult visitCapture(CaptureExpression node) {
    final child = node.expression;
    final isVoid = node.isVoid;
    final semanticValue = _getSemanticValue(node);
    final code = Code();
    _writeSaveParsingState(code, node);
    var start = _invalid;
    if (!isVoid) {
      start = _allocate('start');
      code.declare('final', start, 'state.position');
    }

    _copySuggestedName(node, child);
    final res = _generate(child);
    code.add(res.code);
    for (final success in res.successes) {
      success.succeeds((code) {
        if (isVoid) {
          success.setResultToNone();
        } else {
          if (semanticValue == null) {
            success.setValue('state.substring($start, state.position)', false);
          } else {
            _declaredSemanticValues.add(node);
            code.declare(
              'final',
              semanticValue,
              'state.substring($start, state.position)',
            );
            success.setValue('state.substring($start, state.position)', false);
          }
        }
      });
    }

    _addErrorHandler(node, res.failures);
    return BuildResult(
      code: code,
      successes: res.successes,
      failures: res.failures,
    );
  }

  @override
  BuildResult visitCharacterClass(CharacterClassExpression node) {
    final isVoid = node.isVoid;
    final negate = node.negate;
    final ranges = node.ranges;
    final code = Code();
    final failure = Failure(isSafe: true);
    final success = Success.none();
    _addNodeSourceToComment(node, code, false);
    final charCode = _getCharCode(ranges, negate);
    if (charCode != null) {
      final isTrue = 'state.ch == $charCode';
      code.if$(isTrue, (code) {
        _writeSaveParsingState(code, node);
        if (!isVoid) {
          success.setValue('$charCode', true);
        }

        if (!_insidePredicate.contains(node)) {
          code.stmt('state.nextChar()');
        }

        code.add(success.succeeds);
      });
      _addErrorHandler(node, [failure]);
      code.add(failure.fails);
    } else {
      final ch = _allocate('c');
      final isInRange = _allocate(_getRangeName(ranges, negate) ?? 'isInRange');
      final isTrue = isInRange;
      RangeGenerator(name: ch, ranges: ranges, negate: negate);
      final predicate = RangeGenerator(
        name: ch,
        ranges: ranges,
        negate: negate,
      ).generate();
      code.declare('final', ch, 'state.ch');
      code.declare('final', isInRange, predicate);
      code.if$(isTrue, (code) {
        _writeSaveParsingState(code, node);
        if (!isVoid) {
          success.setValue(ch, false);
        }

        if (!_insidePredicate.contains(node)) {
          code.stmt('state.nextChar()');
        }

        code.add(success.succeeds);
      });

      _addErrorHandler(node, [failure]);
      code.add(failure.fails);
    }

    return BuildResult(code: code, successes: [success], failures: [failure]);
  }

  @override
  BuildResult visitGroup(GroupExpression node) {
    final child = node.expression;
    final isVoid = node.isVoid;
    _redirectWritingParsingState(node, child);
    final name = suggestedNames[node];
    if (name != null) {
      _copySuggestedName(node, child);
    } else {
      final semanticValue = _getSemanticValue(node);
      if (semanticValue != null) {
        suggestedNames[child] = semanticValue;
      }
    }

    final res = _generate(child);
    if (isVoid) {
      for (final success in res.successes) {
        success.setResultToNone();
      }
    }

    _addErrorHandler(node, res.failures);
    return res;
  }

  @override
  BuildResult visitLiteral(LiteralExpression node) {
    final text = node.text;
    final isPrimitive = node.isPrimitive;
    final isVoid = node.isVoid;
    final escaped = escapeString(text);
    final code = Code();
    final failure = Failure(isSafe: true);
    final success = Success.none();
    if (text.isEmpty) {
      _writeSaveParsingState(code, node);
      _addNodeSourceToComment(node, code, false);
      code.add(success.succeeds);
      if (!isVoid) {
        success.setValue(escaped, true);
      }

      _addErrorHandler(node, const []);
    } else {
      final runes = text.runes;
      final firstRune = runes.first;
      final strlen = _strlen(escaped, text);
      final isTrue = runes.length == 1
          ? 'state.ch == $firstRune'
          : 'state.ch == $firstRune && state.startsWith($escaped)';
      _addNodeSourceToComment(node, code, false);
      code.if$(isTrue, (code) {
        _writeSaveParsingState(code, node);
        if (!_insidePredicate.contains(node)) {
          if (runes.length == 1) {
            code.stmt('state.nextChar()');
          } else {
            code.stmt('state.readChar(state.position + $strlen)');
          }
        }

        if (!isVoid) {
          success.setValue(escaped, true);
        }

        code.add(success.succeeds);
      });

      if (!isPrimitive) {
        code.stmt('state.errorExpected($escaped)');
      }

      _addErrorHandler(node, [failure]);
      code.add(failure.fails);
    }

    return BuildResult(code: code, successes: [success], failures: [failure]);
  }

  @override
  BuildResult visitMatch(MatchExpression node) {
    final text = node.text;
    final quote = node.quote;
    final isVoid = node.isVoid;
    final code = Code();
    final failure = Failure();
    final success = Success.none();
    final escaped = escapeString(text, quote);
    if (text.isEmpty) {
      _writeSaveParsingState(code, node);
      _addNodeSourceToComment(node, code, false);
      code.add(success.succeeds);
      if (!isVoid) {
        success.setValue(escaped, true);
      }

      _addErrorHandler(node, const []);
      return BuildResult(code: code, successes: [success], failures: const []);
    }

    _writeSaveParsingState(code, node);
    (int, int) toRange(int c1, int c2) {
      if (c1 <= c2) {
        return (c1, c2);
      }

      return (c2, c1);
    }

    final lowerCase = toLowerCase(text);
    final upperCase = toUpperCase(text);
    final lowerCaseRunes = lowerCase.runes.toList();
    final upperCaseRunes = upperCase.runes.toList();
    final pos = _allocate('pos');
    final c = _allocate('c');
    _addNodeSourceToComment(node, code, false);
    code.declare('var', pos, 'state.position');
    var variable = _invalid;
    var body = code.add(Code());
    var ch = 'state.ch';
    for (var i = 0; i < lowerCaseRunes.length; i++) {
      final lc = lowerCaseRunes[i];
      final uc = upperCaseRunes[i];
      final range = toRange(lc, uc);
      body.if$('$ch == $lc || $ch == $uc', (code) {
        final charSize = _charSize(ch, [range], false);
        if (i != lowerCaseRunes.length - 1) {
          if (i == 0) {
            ch = c;
            code.declare('var', ch, 'state.charAt($pos += $charSize)');
          } else {
            code.assign(ch, 'state.charAt($pos += $charSize)');
          }
        } else {
          if (!isVoid) {
            variable = _allocate(_getSuitableName(node) ?? 'temp');
            code.declare(
              'final',
              variable,
              'state.substring(state.position, $pos += $charSize)',
            );
            code.stmt('state.readChar($pos)');
            success.setValue(variable, false);
          } else {
            code.stmt('state.readChar($pos += $charSize)');
          }

          code.add(success.succeeds);
        }

        body = code.add(Code());
      });
    }

    _addErrorHandler(node, [failure]);
    code.add(failure.fails);
    return BuildResult(code: code, successes: [success], failures: [failure]);
  }

  @override
  BuildResult visitNotPredicate(NotPredicateExpression node) {
    final child = node.expression;
    if (child.isAlwaysSuccessful) {
      _wrongExpression(
        node,
        'The child expression always succeeds',
        'The predicate expression will always fails',
      );
    }

    final code = Code();
    _writeSaveParsingState(code, node);
    if (_isSimpleExpression(child)) {
      _insidePredicate.add(child);
      final res = _generate(child);
      _checkIsSingleOutput(res);
      code.add(res.code);
      var success = res.singleSuccess;
      final singleFailure = res.singleFailure;
      final failure = Failure();
      singleFailure.isSafe = false;
      success.succeeds((code) {
        _addErrorHandler(node, [failure]);
        code.add(failure.fails);
      });
      success = Success.none();
      singleFailure.fails((code) {
        code.add(success.succeeds);
      });

      return BuildResult(code: code, successes: [success], failures: [failure]);
    }

    final usePosition = child.canChangePosition;
    code.stmt('state.predicate++');
    final state = _createParsingState(usePosition);
    _saveParsingState(code, state);
    final res = _generate(child);
    code.add(res.code);
    final successes = <Success>[];
    final failures = <Failure>[];
    for (final success in res.successes) {
      success.succeeds((code) {
        final failure = Failure();
        _restoreParsingState(code, state);
        code.stmt('state.predicate--');
        _addErrorHandler(node, [failure]);
        code.add(failure.fails);
        failures.add(failure);
      });
    }

    for (final failure in res.failures) {
      final success = Success.none();
      failure.fails((code) {
        code.stmt('state.predicate--');
        code.add(success.succeeds);
      });

      successes.add(success);
    }

    _addErrorHandler(node, failures);
    return BuildResult(code: code, successes: successes, failures: failures);
  }

  @override
  BuildResult visitOneOrMore(OneOrMoreExpression node) {
    const range = (1, null);
    return _visitWhile(node, range);
  }

  @override
  BuildResult visitOptional(OptionalExpression node) {
    final child = node.expression;
    final isVoid = node.isVoid;
    final semanticValue = _getSemanticValue(node);
    final code = Code();
    _writeSaveParsingState(code, node);
    _copySuggestedName(node, child);
    _addErrorHandler(node, const []);
    if (child is ProductionExpression) {
      final success = Success.none();
      final name = child.name;
      final parse = 'parse$name(state)';
      if (isVoid) {
        code.stmt(parse);
      } else {
        var variable = _invalid;
        if (child.isAlwaysSuccessful) {
          if (semanticValue == null) {
            variable = _allocate(
              _getSuitableName(node) ?? _getSuitableName(child) ?? 'temp',
            );
            success.setResult(variable, false);
            code.declare('final', variable, parse);
          } else {
            _declaredSemanticValues.add(node);
            variable = semanticValue;
            success.setValue(variable, false);
            code.declare('final', variable, '$parse.\$1');
          }
        } else {
          if (semanticValue == null) {
            variable = _allocate(
              _getSuitableName(node) ?? _getSuitableName(child) ?? 'temp',
            );
            success.setValue(variable, false);
            code.declare('final', variable, '$parse?.\$1');
          } else {
            _declaredSemanticValues.add(node);
            final variable = semanticValue;
            success.setValue(variable, false);
            code.declare('final', variable, '$parse?.\$1');
          }
        }
      }

      code.add(success.succeeds);
      return BuildResult(code: code, successes: [success], failures: const []);
    }

    final res = _generate(child);
    code.add(res.code);
    final successes = <Success>[];
    final failures = res.failures;
    final isSafeFailure = _isSafeFailure(failures);
    if (isSafeFailure && isVoid && res.successes.length < 2) {
      final success = Success.none();
      code.add(success.succeeds);
      successes.add(success);
    } else {
      for (final success in res.successes) {
        success.succeeds((code) {
          if (isVoid) {
            success.setResultToNone();
          }
        });

        successes.add(success);
      }

      for (final failure in failures) {
        failure.fails((code) {
          final success = Success.none();
          if (!isVoid) {
            success.setValue('null', true);
          }

          code.add(success.succeeds);
          successes.add(success);
        });
      }
    }

    return BuildResult(code: code, successes: successes, failures: const []);
  }

  @override
  BuildResult visitOrderedChoice(OrderedChoiceExpression node) {
    final children = node.expressions;
    final isVoid = node.isVoid;
    if (children.length == 1) {
      final child = children.first;
      _redirectWritingParsingState(node, child);
      _copySuggestedName(node, child);
      final res = _generate(child);
      if (isVoid) {
        for (final success in res.successes) {
          success.setResultToNone();
        }
      }

      _addErrorHandler(node, res.failures);
      return res;
    }

    for (var i = 0; i < children.length - 1; i++) {
      final child = children[i];
      if (child.isAlwaysSuccessful) {
        _wrongExpression(
          node,
          'Not the last expression always succeeds',
          'The subsequent expression(s) will never be tried',
          [],
        );
      }
    }

    if (node.isAlwaysSuccessful) {
      _addErrorHandler(node, const []);
    }

    final alternatives = _choiceAlternatives(node);
    if (alternatives.isNotEmpty) {
      final res = _optimizeTokenChoice(node, alternatives);
      if (res != null) {
        return res;
      }
    }

    final code = Code();
    _writeSaveParsingState(code, node);
    var body = code.add(Code());
    final successes = <Success>[];
    final failures = <Failure>[];
    for (var i = 0; i < children.length; i++) {
      final child = children[i];
      _copySuggestedName(node, child);
      final BuildResult res;
      if (i != children.length - 1) {
        res = _combineToSingleFailure(child);
        _checkIsSingleFailure(res);
      } else {
        res = _generate(child);
      }

      body.add(res.code);
      successes.addAll(res.successes);
      if (i != children.length - 1) {
        final failure = res.singleFailure;
        body = failure.fails;
      } else {
        if (!child.isAlwaysSuccessful) {
          for (final failure in res.failures) {
            failures.add(failure);
          }
        }
      }
    }

    _addErrorHandler(node, failures);
    return BuildResult(code: code, successes: successes, failures: failures);
  }

  @override
  BuildResult visitPosition(PositionExpression node) {
    final action = node.action.trim();
    final code = Code();
    _writeSaveParsingState(code, node);
    final success = Success.none();
    code.stmt('state.readChar($action)');
    code.add(success.succeeds);
    _addErrorHandler(node, const []);
    return BuildResult(code: code, successes: [success], failures: []);
  }

  @override
  BuildResult visitPredicate(PredicateExpression node) {
    final negate = node.negate;
    final predicate = node.source.trim();
    final code = Code();
    final failure = Failure();
    final success = Success.none();
    final isSuccess = _allocate('isSuccess');
    _writeSaveParsingState(code, node);
    code.declare('final', isSuccess, predicate);
    final isTrue = negate ? '!$isSuccess' : isSuccess;
    code.if$(isTrue, (code) {
      code.add(success.succeeds);
    });

    _addErrorHandler(node, [failure]);
    code.add(failure.fails);
    return BuildResult(code: code, successes: [success], failures: [failure]);
  }

  @override
  BuildResult visitProduction(ProductionExpression node) {
    final name = node.name;
    final isVoid = node.isVoid;
    final isAlwaysSuccessful = node.isAlwaysSuccessful;
    final semanticValue = _getSemanticValue(node);
    final parse = 'parse$name(state)';
    final code = Code();
    final success = Success.none();
    final failure = Failure(isSafe: true);
    final failures = <Failure>[];
    _writeSaveParsingState(code, node);
    if (isVoid) {
      if (isAlwaysSuccessful) {
        code.stmt(parse);
        code.add(success.succeeds);
      } else {
        code.if$('$parse != null', (code) {
          code.add(success.succeeds);
        });

        _addErrorHandler(node, [failure]);
        code.add(failure.fails);
        failures.add(failure);
      }
    } else {
      if (isAlwaysSuccessful) {
        final variable =
            semanticValue ?? _allocate(_getSuitableName(node) ?? 'temp');
        if (semanticValue == null) {
          success.setResult(variable, false);
          code.declare('final', variable, parse);
        } else {
          _declaredSemanticValues.add(node);
          success.setValue(variable, false);
          code.declare('final', variable, '$parse.\$1');
        }

        code.add(success.succeeds);
      } else {
        final variable = _allocate(_getSuitableName(node) ?? 'temp');
        success.setResult(variable, false);
        code.declare('final', variable, parse);
        code.if$('$variable != null', (code) {
          code.add(success.succeeds);
        });

        _addErrorHandler(node, [failure]);
        code.add(failure.fails);
        failures.add(failure);
      }
    }

    return BuildResult(code: code, successes: [success], failures: failures);
  }

  @override
  BuildResult visitSequence(SequenceExpression node) {
    final children = node.expressions;
    final isVoid = node.isVoid;
    if (children.length == 1) {
      final child = children.first;
      _redirectWritingParsingState(node, child);
      _copySuggestedName(node, child);
      final res = _generate(child);
      _declareSemanticValue(child, res);
      if (isVoid) {
        for (final success in res.successes) {
          success.setResultToNone();
        }
      }

      return res;
    }

    final childrenThatRestorePosition = <Expression>{};
    var positionChanged = false;
    for (var i = 0; i < children.length; i++) {
      final child = children[i];
      if (!child.isAlwaysSuccessful) {
        if (positionChanged) {
          childrenThatRestorePosition.add(child);
        }
      }

      if (child.canChangePosition) {
        positionChanged = true;
      }

      final semanticValue = child.semanticValue;
      if (semanticValue == '\$') {
        _copySuggestedName(node, child);
      }
    }

    final usePosition = childrenThatRestorePosition.isNotEmpty;
    final code = Code();
    final failures = <Failure>[];
    final successes = <Success>[];
    final buildResults = <BuildResult>[];
    final res2Child = <BuildResult, Expression>{};
    final state = _createParsingState(usePosition);
    final isConsts = <bool>[];
    final results = <String>[];
    final values = <String>[];
    var restorations = 0;
    var triedSaveParsingState = false;
    var parsingStateSaved = false;
    for (var i = 0; i < children.length; i++) {
      final child = children[i];
      if (child.canChangePosition) {
        if (state != null) {
          if (!triedSaveParsingState) {
            triedSaveParsingState = true;
            if (_isSimpleExpression(child)) {
              parsingStateSaved = true;
              _parsingStates[child] = state.save;
            }
          }
        }
      }

      final BuildResult res;
      if (i != children.length - 1) {
        var isValue = false;
        var name = 'element$i';
        final semanticValue = child.semanticValue;
        if (semanticValue != null) {
          if (semanticValue != '\$') {
            isValue = true;
            name = semanticValue;
          }
        }

        res = _combineToSingleSuccess(child, name, isValue: isValue);
        _checkIsSingleSuccess(res);
      } else {
        res = _generate(child);
      }

      _declareSemanticValue(child, res);
      buildResults.add(res);
      res2Child[res] = child;
      final semanticValue = child.semanticValue;
      if (semanticValue == '\$') {
        for (final success in res.successes) {
          isConsts.add(success.isConst);
          results.add(success.result);
          values.add(success.value);
        }
      }

      if (childrenThatRestorePosition.contains(child)) {
        restorations += res.failures.length;
      }
    }

    if (!parsingStateSaved) {
      parsingStateSaved = true;
      _saveParsingState(code, state);
    }

    final needReduceRestorations = restorations > 1;
    Code? labeledCode;
    var label = _invalid;
    var body = code.add(Code());
    for (var i = 0; i < children.length; i++) {
      final res = buildResults[i];
      final child = res2Child[res];
      var needCreateLabeledCode = false;
      if (needReduceRestorations) {
        if (childrenThatRestorePosition.contains(child)) {
          if (labeledCode == null) {
            needCreateLabeledCode = true;
          }
        }
      }

      if (needCreateLabeledCode) {
        labeledCode = body;
        label = _allocate('l');
        body.writeln('$label:');
        body.group((code) {
          body = code;
        });
        labeledCode.writeln('// $label:');
        _restoreParsingState(labeledCode, state);
        final failure = Failure();
        labeledCode.add(failure.fails);
        failures.add(failure);
      }

      body.add(res.code);
      if (labeledCode == null) {
        failures.addAll(res.failures);
      }

      for (final failure in res.failures) {
        failure.fails((code) {
          if (childrenThatRestorePosition.contains(child)) {
            if (!needReduceRestorations) {
              _restoreParsingState(code, state);
            } else {
              code.stmt('break $label');
            }
          }
        });
      }

      if (i != children.length - 1) {
        final successes = res.successes;
        if (successes.length > 1) {
          _internalError();
        }

        final success = successes.first;
        body = success.succeeds;
      } else {
        successes.addAll(res.successes);
        final isSingleResult = results.length == 1;
        for (var i = 0; i < successes.length; i++) {
          final success = successes[i];
          success.succeeds((code) {
            if (isVoid || results.isEmpty) {
              success.setResultToNone();
            } else {
              final index = isSingleResult ? 0 : i;
              success.isConst = isConsts[index];
              success.result = results[index];
              success.value = values[index];
            }
          });
        }
      }
    }

    return BuildResult(code: code, successes: successes, failures: failures);
  }

  @override
  BuildResult visitToken(TokenExpression node) {
    final name = node.name;
    final isVoid = node.isVoid;
    final semanticValue = _getSemanticValue(node);
    final nextToken = options.getNextToken;
    final token = options.getToken;
    final tokenKind = options.getTokenKind.replaceAll('{{0}}', token);
    final tokenKindValue = options.getTokenKindValue.replaceAll('{{0}}', name);
    final code = Code();
    final success = Success.none();
    final failure = Failure(isSafe: true);
    final isTrue = '$tokenKind == $tokenKindValue';
    code.if$(isTrue, (code) {
      _writeSaveParsingState(code, node);
      var variable = _invalid;
      if (!_insidePredicate.contains(node)) {
        if (!isVoid) {
          if (semanticValue != null) {
            _declaredSemanticValues.add(node);
            code.declare('final', semanticValue, nextToken);
            success.setValue(semanticValue, false);
          } else {
            variable = _allocate(_getSuitableName(node) ?? 'token');
            code.declare('final', variable, nextToken);
            success.setValue(variable, false);
          }
        } else {
          code.stmt(nextToken);
        }
      }

      code.add(success.succeeds);
    });

    _addErrorHandler(node, [failure]);
    code.add(failure.fails);
    return BuildResult(code: code, successes: [success], failures: [failure]);
  }

  @override
  BuildResult visitValue(ValueExpression node) {
    final semanticValue = node.semanticValue;
    final source = node.source.trim();
    final isVoid = node.isVoid;
    final isConst = node.isConst;
    final code = Code();
    final success = Success.none();
    if (semanticValue == null) {
      _wrongExpression(
        node,
        'The expression \'ValueExpression\' must have a semantic value',
        'It is impossible to assign semantic value',
      );
    }

    if (!isVoid) {
      success.setValue(source, isConst);
    }

    _writeSaveParsingState(code, node);
    code.add(success.succeeds);
    return BuildResult(code: code, successes: [success], failures: []);
  }

  @override
  BuildResult visitWhile(WhileExpression node) {
    final range = node.range;
    return _visitWhile(node, range);
  }

  @override
  BuildResult visitZeroOrMore(ZeroOrMoreExpression node) {
    const range = (0, null);
    return _visitWhile(node, range);
  }

  void _addErrorHandler(
    Expression node,
    List<Failure> failures, [
    void Function(Code code)? f,
  ]) {
    final errorHandler = node.errorHandler;
    if (errorHandler == null) {
      return;
    }

    if (failures.isEmpty) {
      _wrongExpression(
        node,
        'An error handler is specified for an expression that always succeeds',
        'The error handler will never be executed',
      );
    }

    for (final failure in failures) {
      failure.fails((code) {
        _writeBlock(code, errorHandler);
      });
    }
  }

  void _addNodeSourceToComment(
    Expression node,
    Code code,
    bool withErrorHandler,
  ) {
    final printer = ExpressionPrinter(withErrorHandler: withErrorHandler);
    final source = printer.print(node);
    final lines = const LineSplitter().convert(source);
    for (final line in lines) {
      code.writeln('// $line');
    }
  }

  String _allocate([String name = '']) {
    return allocator.allocate(name);
  }

  String _charSize(String name, List<(int, int)> ranges, bool negate) {
    String calc() {
      return '$name > 0xffff ? 2 : 1';
    }

    if (options.inputType != InputType.string) {
      return 'state.charSize($name)';
    }

    if (negate) {
      return calc();
    }

    ranges = normalizeRanges(ranges);
    if (ranges.any((e) => e.$1 > 0xffff || e.$2 > 0xffff)) {
      return calc();
    }

    return '1';
  }

  void _checkIsSingleFailure(BuildResult result) {
    if (result.failures.length > 1) {
      _internalError();
    }
  }

  void _checkIsSingleOutput(BuildResult result) {
    if (result.successes.length > 1) {
      _internalError();
    }

    if (result.failures.length > 1) {
      _internalError();
    }
  }

  void _checkIsSingleSuccess(BuildResult result) {
    if (result.successes.length > 1) {
      _internalError();
    }
  }

  List<Expression> _choiceAlternatives(OrderedChoiceExpression node) {
    final children = node.expressions;
    final alternatives = <Expression>[];
    for (final sequence in children) {
      if (sequence is SequenceExpression) {
        final expressions = sequence.expressions;
        if (expressions.length == 1 &&
            sequence.errorHandler == null &&
            sequence.semanticValue == null) {
          final first = expressions.first;
          if (first.errorHandler == null && first.semanticValue == null) {
            alternatives.add(first);
          }
        }
      }
    }

    if (alternatives.length == children.length) {
      return alternatives;
    } else {
      return const [];
    }
  }

  Set<String> _collectIdentifiers(Expression expression) {
    final identifierCollector = _IdentifierCollector();
    final collected = identifierCollector.collect(expression, options);
    return collected;
  }

  BuildResult _combineToSingleFailure(Expression node) {
    final res = _generate(node);
    final failures = res.failures;
    if (failures.length < 2) {
      return res;
    }

    final isSafeFailure = _isSafeFailure(failures);
    if (isSafeFailure) {
      final first = failures.first;
      failures.clear();
      failures.add(first);
      return res;
    }

    final code = Code();
    final label = _allocate('l');
    code.writeln('$label:');
    code.group((code) {
      code.add(res.code);
    });
    code.writeln('// $label:');
    final failure = Failure();
    code.add(failure.fails);
    for (final failure in res.failures) {
      failure.fails((code) {
        code.stmt('break $label');
      });
    }

    return BuildResult(
      code: code,
      successes: res.successes,
      failures: [failure],
    );
  }

  BuildResult _combineToSingleSuccess(
    Expression node,
    String name, {
    required bool isValue,
  }) {
    final res = _generate(node);
    if (res.successes.length < 2) {
      return res;
    }

    final isVoid = node.isVoid;
    final code = Code();
    final success = Success.none();
    final label = _allocate('l');
    var variable = _invalid;
    if (!isVoid) {
      final type = node.type;
      variable = _allocate(_getSuitableName(node) ?? 'temp');
      if (isValue) {
        success.setValue(variable, false);
        code.declare('final $type', variable);
      } else {
        success.setResult(variable, false);
        code.declare('final Result<$type>', variable);
      }
    }

    code.writeln('$label:');
    code.group((code) {
      code.add(res.code);
    });
    code.writeln('// $label:');
    code.add(success.succeeds);
    for (final success in res.successes) {
      success.succeeds((code) {
        if (!isVoid) {
          if (isValue) {
            code.assign(variable, success.value);
          } else {
            code.assign(variable, success.result);
          }
        }

        code.stmt('break $label');
      });
    }

    return BuildResult(
      code: code,
      successes: [success],
      failures: res.failures,
    );
  }

  void _copySuggestedName(Expression parent, Expression child) {
    final suggestedName = suggestedNames[parent];
    if (suggestedName == null) {
      return;
    }

    suggestedNames[child] = suggestedName;
  }

  _ParsingState? _createParsingState(bool condition) {
    if (!condition) {
      return null;
    }

    final save = Code();
    final restore = Code();
    if (options.inputType == InputType.tokens) {
      final tokenIndex = options.getTokenIndex;
      final index = _allocate('index');
      save.declare('final', index, tokenIndex);
      final restoreToken = options.getRestoreToken.replaceAll('{{0}}', index);
      restore.stmt(restoreToken);
    } else {
      final pos = _allocate('pos');
      final ch = _allocate('ch');
      save.declare('final', pos, 'state.position');
      save.declare('final', ch, 'state.ch');
      restore.assign('state.ch', ch);
      restore.assign('state.position', pos);
    }

    return (save: save, restore: restore);
  }

  void _declareSemanticValue(Expression node, BuildResult res) {
    final semanticValue = node.semanticValue;
    if (semanticValue == null) {
      return;
    }

    if (_declaredSemanticValues.contains(node)) {
      return;
    }

    final isDollar = semanticValue == '\$';
    var needDeclare = true;
    if (isDollar) {
      final parent = node.parent;
      if (parent is SequenceExpression) {
        final children = parent.expressions;
        final isLast = node.index == children.length - 1;
        if (isLast) {
          needDeclare = parent.isVoid;
        } else {
          if (node is ProductionExpression) {
            needDeclare = false;
          }
        }
      }
    }

    for (final success in res.successes) {
      success.succeeds((code) {
        if (needDeclare) {
          if (isDollar) {
            final variable = _allocate(_getSuitableName(node) ?? 'temp');
            _declareVariable(
              code,
              isConst: success.isConst,
              value: success.result,
              variable: variable,
            );
            final result = variable;
            success.result = result;
            success.value = '$result.\$1';
          } else {
            _declareVariable(
              code,
              isConst: success.isConst,
              value: success.value,
              variable: semanticValue,
            );
          }
        }
      });
    }
  }

  String _declareVariable(
    Code code, {
    required bool isConst,
    String? type,
    required String value,
    required String variable,
  }) {
    if (type != null) {
      type = type.trim();
    }

    if (isConst) {
      if (type == null) {
        type = 'const';
      } else {
        if (!type.startsWith('const')) {
          type = 'const $type';
        }
      }
    }

    type ??= 'final';
    if (!isConst) {
      if (!type.startsWith('final')) {
        type = 'final $type';
      }
    }

    value = value.trim();
    if (isConst) {
      if (value.startsWith('const')) {
        value = value.substring('const'.length);
        value = value.trimRight();
      }
    }

    code.declare(type, variable, value.trim());
    final result = isConst ? 'const Ok($variable)' : 'Ok($variable)';
    return result;
  }

  BuildResult _generate(Expression node) {
    final res = node.accept(this);
    return res;
  }

  int? _getCharCode(List<(int, int)> ranges, bool negate) {
    final length = ranges.length;
    if (length == 1 && !negate) {
      final range = ranges.first;
      final start = range.$1;
      if (start == range.$2) {
        return start;
      }
    }

    return null;
  }

  String? _getRangeName(List<(int, int)> ranges, bool negate) {
    ranges = normalizeRanges(ranges);
    String? rename(String name) {
      name = negate ? 'is_not_$name' : 'is_$name';
      name = name.toCamelCase(lower: true);
      if (name.length <= 63) {
        return name;
      }

      return null;
    }

    var name = switch (ranges) {
      [(0x09, 0x0a), (0x0d, 0xd), (0x20, 0x20)] => 'whitespace',
      [(0x09, 0x09), (0x20, 0x20)] => 'blank',
      _ => null,
    };

    if (name != null) {
      return rename(name);
    }

    const names = {
      (0x00, 0x1f): 'control',
      (0x09, 0x09): 'tab',
      (0x0a, 0x0a): 'line_feed',
      (0x0d, 0x0d): 'carriage_return',
      (0x22, 0x22): 'double_quote',
      (0x24, 0x24): 'dollar',
      (0x27, 0x27): 'single_quote',
      (0x2b, 0x2b): 'plus',
      (0x2d, 0x2d): 'minus',
      (0x30, 0x39): 'digit',
      (0x31, 0x39): 'non_zero_digit',
      (0x41, 0x5a): 'upper',
      (0x41, 0x46): 'hex',
      (0x5c, 0x5c): 'backslash',
      (0x61, 0x7a): 'lower',
      (0x61, 0x66): 'hex',
      (0x5f, 0x5f): 'underscore',
    };

    final parts = <String>{};
    for (final range in ranges) {
      final name = names[range];
      if (name != null) {
        parts.add(name);
      } else {
        return null;
      }
    }

    const replacements = [
      (['lower', 'upper'], 'alpha'),
      (['carriage_return', 'line_feed'], 'newline'),
      (['digit', 'hex'], 'hex_digit'),
    ];

    for (final element in replacements) {
      var ok = true;
      for (final element in element.$1) {
        if (!parts.contains(element)) {
          ok = false;
          break;
        }
      }

      if (ok) {
        for (final element in element.$1) {
          parts.remove(element);
        }

        parts.add(element.$2);
      }
    }

    final list = parts.toList();
    list.sort();
    name = list.join('_or_');
    return rename(name);
  }

  String? _getSemanticValue(Expression node) {
    final semanticValue = node.semanticValue;
    if (semanticValue == null) {
      return null;
    }

    return semanticValue != '\$' ? semanticValue : null;
  }

  String? _getSuitableName(Expression node) {
    if (node is ProductionExpression) {
      return camelize(node.name);
    }

    if (node is TokenExpression) {
      return node.name;
    }

    final semanticValue = _getSemanticValue(node);
    if (semanticValue != null) {
      return semanticValue;
    }

    final suggestedName = suggestedNames[node];
    if (suggestedName != null) {
      return suggestedName;
    }

    return null;
  }

  Never _internalError() {
    throw StateError('Internal error');
  }

  bool _isSafeFailure(List<Failure> failures) {
    return !failures.any((e) => !e.isSafe) &&
        !failures.any((e) => e.fails.isNotEmpty);
  }

  bool _isSimpleExpression(Expression node) {
    return node is AnyCharacterExpression ||
        node is CharacterClassExpression ||
        node is LiteralExpression ||
        node is TokenExpression;
  }

  BuildResult? _optimizeTokenChoice(
    OrderedChoiceExpression node,
    List<Expression> alternatives,
  ) {
    if (alternatives.isEmpty) {
      return null;
    }

    final tokens = alternatives.whereType<TokenExpression>().toList();
    if (tokens.length != alternatives.length) {
      return null;
    }

    final isVoid = node.isVoid;
    final code = Code();
    final failure = Failure(isSafe: true);
    final token = options.getToken;
    final tokenKind = options.getTokenKind.replaceAll('{{0}}', token);
    final kind = _allocate('kind');
    final success = Success.none();
    code.declare('final', kind, tokenKind);
    final isTrue = tokens
        .map(
          (e) =>
              '$kind == ${options.getTokenKindValue.replaceAll('{{0}}', e.name)}',
        )
        .join(' || ');
    final handler = code.ifElse(isTrue);
    handler.ifBlock((code) {
      final nextToken = options.getNextToken;
      _writeSaveParsingState(code, node);
      if (!isVoid) {
        final variable = _allocate(_getSuitableName(node) ?? 'token');
        success.setValue(variable, false);
        code.declare('final', variable, nextToken);
      } else {
        code.stmt(nextToken);
      }

      code.add(success.succeeds);
    });

    handler.elseBlock((code) {
      _addErrorHandler(node, [failure]);
      code.add(failure.fails);
    });

    return BuildResult(code: code, successes: [success], failures: [failure]);
  }

  void _redirectWritingParsingState(Expression node, Expression child) {
    final parsingStates = _parsingStates[node];
    if (parsingStates == null) {
      return;
    }

    _parsingStates.remove(node);
    _parsingStates[child] = parsingStates;
  }

  void _restoreParsingState(Code code, _ParsingState? state) {
    if (state == null) {
      return;
    }

    code.add(state.restore);
  }

  void _saveParsingState(Code code, _ParsingState? state) {
    if (state == null) {
      return;
    }

    code.add(state.save);
  }

  String _strlen(String expression, String text) {
    return switch (options.inputType) {
      InputType.file => 'state.strlen($expression)',
      InputType.string => '${text.length}',
      InputType.tokens => throw UnsupportedError('_strlen'),
    };
  }

  BuildResult _visitWhile(SingleExpression node, (int?, int?)? range) {
    final child = node.expression;
    final isVoid = node.isVoid;
    range = range ?? (0, null);
    final min = range.$1 ?? 0;
    final max = range.$2;
    if (min < 0) {
      throw ArgumentError.value(min, 'min', 'Must be not less than 0');
    }

    if (max != null) {
      if (max < 1) {
        throw ArgumentError.value(max, 'max', 'Must be not less than 1');
      } else if (max < min) {
        throw ArgumentError.value(max, 'max', 'Must be not less than $min');
      }
    }

    if (child.isAlwaysSuccessful) {
      if (max == null) {
        _wrongExpression(
          node,
          'The child expression always succeeds and the maximum number of repetitions is not specified',
          'The repetition will cause an infinite loop',
        );
      }
    }

    final usePosition = min > 1;
    const list = 1;
    const counter = 2;
    const flag = 3;
    const none = 4;
    var kind = 0;
    if (!isVoid) {
      kind = list;
    } else {
      if (min > 1 || (max != null && max > 1)) {
        kind = counter;
      } else {
        if (min > 0 || (max != null && max > 0)) {
          kind = flag;
        } else {
          kind = none;
        }
      }
    }

    final code = Code();
    var variable = _invalid;
    final state = _createParsingState(usePosition);
    _saveParsingState(code, state);
    variable = _invalid;
    switch (kind) {
      case list:
        final elementType = child.type;
        variable = _allocate(_getSuitableName(node) ?? 'list');
        code.declare('final', variable, '<$elementType>[]');
        break;
      case counter:
        variable = _allocate('count');
        code.declare('var', variable, '0');
        break;
      case flag:
        variable = _allocate('isSuccess');
        code.declare('var', variable, 'false');
        break;
      case none:
        break;
    }

    final res = _generate(child);
    for (final success in res.successes) {
      success.succeeds((code) {
        switch (kind) {
          case list:
            final value = success.value;
            code.stmt('$variable.add($value)');
            break;
          case counter:
            code.stmt('$variable++');
            break;
          case flag:
            code.assign(variable, 'true');
            break;
          case none:
            break;
        }

        code.stmt('continue');
      });
    }

    for (final failure in res.failures) {
      failure.fails((code) {
        code.stmt('break');
      });
    }

    var loopCondition = _invalid;
    switch (kind) {
      case list:
        if (max == null) {
          loopCondition = 'true';
        } else {
          loopCondition = max == 1
              ? '$variable.isEmpty'
              : '$variable.length < $max';
        }

        break;
      case counter:
        if (max == null) {
          loopCondition = 'true';
        } else {
          loopCondition = '$variable < $max';
        }

        break;
      case flag:
        if (max == null) {
          loopCondition = 'true';
        } else {
          loopCondition = '!$variable';
        }

        break;
      case none:
        loopCondition = 'true';
        break;
    }

    final q = max == null ? '($min)' : '($min, $max)';
    code.writeln('// $q');
    code.while$(loopCondition, (code) {
      code.add(res.code);
    });

    var isSuccess = 'true';
    switch (kind) {
      case list:
        if (min > 0) {
          if (min == 1) {
            isSuccess = '$variable.isNotEmpty';
          } else {
            if (max == null) {
              isSuccess = '$variable.length >= $min';
            } else {
              isSuccess = min == max
                  ? '$variable.length == $min'
                  : '$variable.length >= $min';
            }
          }
        }

        break;
      case counter:
        if (min > 0) {
          isSuccess = '$variable >= $min';
        }

        break;
      case flag:
        if (min > 0) {
          isSuccess = variable;
        }

        break;
      case none:
        break;
    }

    final failure = Failure();
    final failures = <Failure>[];
    final success = Success.none();
    if (!isVoid) {
      success.setValue(variable, false);
    }

    final isTrue = isSuccess;
    final isFalse = isTrue == 'true' ? 'false' : '!($isTrue)';
    final handler = code.ifElse(isTrue, isFalse);
    handler.ifBlock((code) {
      code.add(success.succeeds);
    });

    final canFails = isTrue != 'true';
    handler.elseBlock((code) {
      _restoreParsingState(code, state);
      if (canFails) {
        code.add(failure.fails);
        failures.add(failure);
      }

      _addErrorHandler(node, failures);
    });

    return BuildResult(code: code, successes: [success], failures: failures);
  }

  void _writeBlock(Code code, String source) {
    final lines = CodeBuilder.unindentText(source);
    for (final line in lines) {
      code.writeln(line.trimRight());
    }
  }

  void _writeSaveParsingState(Code code, Expression node) {
    final parsingState = _parsingStates[node];
    if (parsingState == null) {
      return;
    }

    _parsingStates.remove(node);
    code.add(parsingState);
  }

  Never _wrongExpression(
    Expression node,
    String cause,
    String effect, [
    List<String> details = const [],
  ]) {
    const printer = ExpressionPrinter();
    final printed = printer.print(node);
    final lines = <String>[
      'Not a well-formed expression \'${node.runtimeType}\'',
      cause,
      effect,
      ...details,
      'Production: $productionName',
      'Expression source:\n$printed',
    ];

    throw StateError(lines.join('\n'));
  }
}

class Failure {
  final Code fails = Code();

  bool isSafe;

  Failure({this.isSafe = false});
}

class Success {
  final Code succeeds;

  bool isConst;

  String result;

  String value;

  Success({
    required this.succeeds,
    required this.isConst,
    required this.result,
    required this.value,
  });

  Success.none()
    : this(
        succeeds: Code(),
        isConst: true,
        result: ExpressionGenerator._none,
        value: ExpressionGenerator._noneValue,
      );

  Success.withValue(String value, bool isConst)
    : this(
        succeeds: Code(),
        isConst: isConst,
        result: isConst ? 'const Ok($value)' : 'Ok($value)',
        value: value,
      );

  void setResult(String result, bool isConst) {
    this.isConst = isConst;
    this.result = result;
    value = '$result.\$1';
  }

  void setResultToNone() {
    isConst = true;
    result = ExpressionGenerator._none;
    value = ExpressionGenerator._noneValue;
  }

  void setValue(String value, bool isConst) {
    this.isConst = isConst;
    this.value = value;
    if (isConst) {
      result = 'const Ok($value)';
    } else {
      result = 'Ok($value)';
    }
  }
}

class _IdentifierCollector extends VisitorBase<void> {
  static const _other = {'await', 'dynamic', 'yield'};

  static const Set<String> _reserved = {
    'assert',
    'break',
    'case',
    'catch',
    'class',
    'const',
    'continue',
    'default',
    'do',
    'else',
    'enum',
    'extends',
    'false',
    'final',
    'finally',
    'for',
    'if',
    'in',
    'is',
    'new',
    'null',
    'rethrow',
    'return',
    'super',
    'switch',
    'this',
    'throw',
    'true',
    'try',
    'var',
    'void',
    'while',
    'with',
  };

  static const _types = {'bool', 'double', 'int'};

  Set<String> _found = const {};

  Set<String> collect(Expression expression, ParserGeneratorOptions options) {
    _found = {..._other, ..._reserved, ..._types};
    _found.add('state');
    final inputType = options.inputType;
    if (inputType == InputType.tokens) {
      final list = [
        options.getNextToken,
        options.getRestoreToken,
        options.getToken,
        options.getTokenIndex,
        options.getTokenKind,
        options.getTokenKindValue,
      ];

      for (final element in list) {
        _processSourceCode(element);
      }
    }

    expression.accept(this);
    return _found;
  }

  @override
  void visitAction(ActionExpression node) {
    final source = node.source;
    _processSourceCode(source);
  }

  @override
  void visitNode(Expression node) {
    final errorHandler = node.errorHandler;
    final explicitType = node.explicitType;
    final semanticValue = node.semanticValue;
    final type = node.type;
    if (errorHandler != null) {
      _processSourceCode(errorHandler);
    }

    if (explicitType != null) {
      _scanIdentifier(explicitType.trim(), 0);
    }

    if (semanticValue != null) {
      _found.add(semanticValue);
    }

    _scanIdentifier(type.trim(), 0);
    node.visitChildren(this);
  }

  @override
  void visitPredicate(PredicateExpression node) {
    final source = node.source;
    _processSourceCode(source);
  }

  @override
  void visitValue(ValueExpression node) {
    final source = node.source;
    _processSourceCode(source);
  }

  bool _isIdentifierEnd(int c) {
    return _isLetterOrDigit(c) || c == 0x24 || c == 0x5f;
  }

  bool _isIdentifierStart(int c) {
    return _isLetter(c) || c == 0x24 || c == 0x5f;
  }

  bool _isLetter(int c) {
    return c >= 0x41 && c <= 0x5a || c >= 0x61 && c <= 0x7a;
  }

  bool _isLetterOrDigit(int c) {
    return c >= 0x30 && c <= 0x39 ||
        c >= 0x41 && c <= 0x5a ||
        c >= 0x61 && c <= 0x7a;
  }

  void _processSourceCode(String text) {
    for (var i = 0; i < text.length; i++) {
      i = _scanIdentifier(text, i);
    }
  }

  int _scanIdentifier(String text, int index) {
    if (index >= text.length) {
      return index;
    }

    final c = text.codeUnitAt(index);
    if (!_isIdentifierStart(c)) {
      return index;
    }

    final start = index;
    index++;
    while (index < text.length) {
      final c = text.codeUnitAt(index);
      if (!_isIdentifierEnd(c)) {
        break;
      }

      index++;
    }

    final name = text.substring(start, index);
    _found.add(name);
    return index;
  }
}
