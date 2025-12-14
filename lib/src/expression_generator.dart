import 'dart:convert';

import 'package:simple_sparse_list/ranges_helper.dart';
import 'package:unicode/unicode.dart';

import '../parser_generator_options.dart';
import 'allocator.dart';
import 'code_builder.dart';
import 'expression_printer.dart';
import 'expressions.dart';
import 'helper.dart';
import 'range_generator.dart';

class BuildResult {
  final Code code;

  final List<Success> successes;

  final List<Code> failures;

  BuildResult({
    required this.code,
    required this.successes,
    required this.failures,
  });

  Code get singleFailure {
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

class Cache {
  Map<String, String> data = {};

  void clear() {
    data = {};
  }

  void clone() {
    final data = this.data;
    this.data = {};
    this.data.addAll(data);
  }

  void restore(Map<String, String> data) {
    this.data = data;
  }
}

class ExpressionGenerator implements Visitor<BuildResult> {
  static const _invalid = '__INVALID__';

  static const _none = 'Result.none';

  static const _noneValue = 'Result.none.\$1';

  final Allocator allocator;

  Cache cache;

  final ParserGeneratorOptions options;

  final String productionName;

  final Map<Expression, String> suggestedNames = {};

  final Set<Expression> _insidePredicate = <Expression>{};

  ExpressionGenerator({
    required this.allocator,
    required this.cache,
    required this.options,
    required this.productionName,
  });

  BuildResult generate(Expression expression) {
    return _generate(expression);
  }

  @override
  BuildResult visitAction(ActionExpression node) {
    final source = node.source;
    final code = Code();
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

    final data = cache.data;
    final code = Code();
    if (_isSimpleExpression(child)) {
      _insidePredicate.add(child);
      cache.clone();
      final res = _generate(child);
      _checkIsSingleOutput(res);
      cache.restore(data);
      final success = res.singleSuccess;
      final failure = res.singleFailure;
      success.setResultToNone();
      _addErrorHandler(node, [failure]);
      return res;
    }

    final usePosition = child.canChangePosition;
    code.stmt('state.predicate++');
    final state = _saveState(usePosition, code);
    cache.clone();
    final res = _generate(child);
    cache.restore(data);
    code.add(res.code);
    final successes = res.successes;
    final failures = res.failures;
    for (final success in successes) {
      success.setResultToNone();
      success.succeeds((code) {
        _restoreState(usePosition, code, state);
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
    final code = Code();
    final fails = Code();
    final success = Success.none();
    const isTrue = 'state.ch >= 0';
    cache.clear();
    code.if$(isTrue, (code) {
      var variable = _invalid;
      if (!isVoid) {
        variable = _getSuggestedName(node, 'any');
        code.declare('final', variable, 'state.ch');
        success.setValue(variable, false);
      }

      if (!_insidePredicate.contains(node)) {
        code.stmt('state.nextChar()');
      }

      code.add(success.succeeds);
    });
    _addErrorHandler(node, [code]);
    code.add(fails);
    return BuildResult(code: code, successes: [success], failures: [fails]);
  }

  @override
  BuildResult visitCapture(CaptureExpression node) {
    final child = node.expression;
    final isVoid = node.isVoid;
    final code = Code();
    final pos = isVoid ? _invalid : _getPosition(code);
    _copySuggestedName(node, child);
    final res = _generate(child);
    code.add(res.code);
    for (final success in res.successes) {
      success.succeeds((code) {
        if (isVoid) {
          success.setResultToNone();
        } else {
          success.setValue('state.substring($pos, state.position)', false);
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
    final fails = Code();
    final success = Success.none();
    _addNodeSourceToComment(node, code, false);
    final charCode = _getCharCode(ranges, negate);
    if (charCode != null) {
      final isTrue = 'state.ch == $charCode';
      cache.clear();
      code.if$(isTrue, (code) {
        if (!isVoid) {
          success.setValue('$charCode', true);
        }

        if (!_insidePredicate.contains(node)) {
          code.stmt('state.nextChar()');
        }

        code.add(success.succeeds);
      });
      _addErrorHandler(node, [code]);
      code.add(fails);
    } else {
      final ch = _getCh(code);
      final isSuccess = _allocate('isSuccess');
      final isTrue = isSuccess;
      cache.clear();
      RangeGenerator(name: ch, ranges: ranges, negate: negate);
      final predicate = RangeGenerator(
        name: ch,
        ranges: ranges,
        negate: negate,
      ).generate();
      code.declare('final', isSuccess, predicate);
      code.if$(isTrue, (code) {
        if (!isVoid) {
          success.setValue(ch, false);
        }

        if (!_insidePredicate.contains(node)) {
          code.stmt('state.nextChar()');
        }

        code.add(success.succeeds);
      });

      _addErrorHandler(node, [code]);
      code.add(fails);
    }

    return BuildResult(code: code, successes: [success], failures: [fails]);
  }

  @override
  BuildResult visitGroup(GroupExpression node) {
    final child = node.expression;
    final res = _generate(child);
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
    final fails = Code();
    final success = Success.none();
    if (text.isEmpty) {
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
      cache.clear();
      final isTrue = runes.length == 1
          ? 'state.ch == $firstRune'
          : 'state.ch == $firstRune && state.startsWith($escaped)';
      _addNodeSourceToComment(node, code, false);
      code.if$(isTrue, (code) {
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

      _addErrorHandler(node, [code]);
      code.add(fails);
    }

    return BuildResult(code: code, successes: [success], failures: [fails]);
  }

  @override
  BuildResult visitMatch(MatchExpression node) {
    final text = node.text;
    final quote = node.quote;
    final isVoid = node.isVoid;
    final code = Code();
    final fails = Code();
    final success = Success.none();
    final escaped = escapeString(text, quote);
    if (text.isEmpty) {
      _addNodeSourceToComment(node, code, false);
      code.add(success.succeeds);
      if (!isVoid) {
        success.setValue(escaped, true);
      }

      _addErrorHandler(node, const []);
      return BuildResult(code: code, successes: [success], failures: const []);
    }

    (int, int) toRange(int c1, int c2) {
      if (c1 <= c2) {
        return (c1, c2);
      }

      return (c2, c1);
    }

    cache.clear();
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
            variable = _getSuggestedName(node, 'text');
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

    _addErrorHandler(node, [code]);
    code.add(fails);
    return BuildResult(code: code, successes: [success], failures: [fails]);
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
    if (_isSimpleExpression(child)) {
      _insidePredicate.add(child);
      cache.clone();
      final res = _generate(child);
      _checkIsSingleOutput(res);
      code.add(res.code);
      var success = res.singleSuccess;
      final failure = res.singleFailure;
      final fails = Code();
      success.succeeds((code) {
        _addErrorHandler(node, [code]);
        code.add(fails);
      });
      success = Success.none();
      failure((code) {
        code.add(success.succeeds);
      });

      return BuildResult(code: code, successes: [success], failures: [fails]);
    }

    final usePosition = child.canChangePosition;
    final data = cache.data;
    code.stmt('state.predicate++');
    final state = _saveState(usePosition, code);
    cache.clone();
    final res = _generate(child);
    cache.restore(data);
    code.add(res.code);
    final successes = <Success>[];
    final failures = <Code>[];
    for (final success in res.successes) {
      success.succeeds((code) {
        _restoreState(usePosition, code, state);
        code.stmt('state.predicate--');
        _addErrorHandler(node, [code]);
        failures.add(code.add(Code()));
      });
    }

    for (final failure in res.failures) {
      final success = Success.none();
      failure((code) {
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
    final code = Code();
    _copySuggestedName(node, child);
    _addErrorHandler(node, const []);
    if (child is ProductionExpression) {
      final success = Success.none();
      final name = child.name;
      final parse = 'parse$name(state)';
      if (child.canChangePosition) {
        cache.clear();
      }

      if (isVoid) {
        code.stmt(parse);
      } else {
        final variable = _allocate(camelize(name));
        code.declare('final', variable, parse);
        if (child.isAlwaysSuccessful) {
          success.setResult(variable, false);
        } else {
          success.setValue('$variable?.\$1', false);
        }
      }

      code.add(success.succeeds);
      return BuildResult(code: code, successes: [success], failures: const []);
    }

    final res = _generate(child);
    code.add(res.code);
    final successes = <Success>[];
    for (final success in res.successes) {
      success.succeeds((code) {
        if (isVoid) {
          success.setResultToNone();
        }
      });

      successes.add(success);
    }

    for (final failure in res.failures) {
      failure((code) {
        final success = Success.withValue('null', true);
        code.add(success.succeeds);
        successes.add(success);
      });
    }

    return BuildResult(code: code, successes: successes, failures: const []);
  }

  @override
  BuildResult visitOrderedChoice(OrderedChoiceExpression node) {
    final children = node.expressions;
    final isVoid = node.isVoid;
    if (children.length == 1) {
      final child = children.first;
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

    // final data = cache.data;
    // TODO: Needs to be optimized.
    final code = Code();
    var body = code.add(Code());
    final successes = <Success>[];
    final failures = <Code>[];
    for (var i = 0; i < children.length; i++) {
      //cache.restore(data);
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
        body = failure;
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
    cache.clear();
    final code = Code();
    final success = Success.none();
    code.stmt('state.readChar($action)');
    code.add(success.succeeds);
    _addErrorHandler(node, const []);
    return BuildResult(code: code, successes: [success], failures: []);
  }

  @override
  BuildResult visitPredicate(PredicateExpression node) {
    final negate = node.negate;
    final predicate = node.predicate.trim();
    final code = Code();
    final success = Success.none();
    final isSuccess = _allocate('isSuccess');
    code.declare('final', isSuccess, predicate);
    final isTrue = negate ? '!$isSuccess' : isSuccess;
    code.if$(isTrue, (code) {
      code.add(success.succeeds);
    });

    _addErrorHandler(node, [code]);
    final fails = code.add(Code());
    return BuildResult(code: code, successes: [success], failures: [fails]);
  }

  @override
  BuildResult visitProduction(ProductionExpression node) {
    final name = node.name;
    final isVoid = node.isVoid;
    final isAlwaysSuccessful = node.isAlwaysSuccessful;
    final canChangePosition = node.canChangePosition;
    final parse = 'parse$name(state)';
    if (canChangePosition) {
      cache.clear();
    }

    final code = Code();
    final failures = <Code>[];
    final success = Success.none();
    if (isVoid) {
      if (isAlwaysSuccessful) {
        code.stmt(parse);
        code.add(success.succeeds);
      } else {
        final variable = _allocate(camelize(name));
        code.declare('final', variable, parse);
        code.if$('$variable != null', (code) {
          code.add(success.succeeds);
        });

        _addErrorHandler(node, [code]);
        failures.add(code.add(Code()));
      }
    } else {
      final variable = _allocate(camelize(name));
      success.setResult(variable, false);
      code.declare('final', variable, parse);
      if (isAlwaysSuccessful) {
        code.add(success.succeeds);
      } else {
        code.if$('$variable != null', (code) {
          code.add(success.succeeds);
        });

        _addErrorHandler(node, [code]);
        failures.add(code.add(Code()));
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
    final failures = <Code>[];
    final successes = <Success>[];
    final buildResults = <BuildResult>[];
    final res2Child = <BuildResult, Expression>{};
    final state = _saveState(usePosition, code);
    final isConsts = <bool>[];
    final results = <String>[];
    final values = <String>[];
    var restorations = 0;
    for (var i = 0; i < children.length; i++) {
      final child = children[i];
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
        _restoreState(usePosition, labeledCode, state);
        final fails = labeledCode.add(Code());
        failures.add(fails);
      }

      body.add(res.code);
      if (labeledCode == null) {
        failures.addAll(res.failures);
      }

      for (final failure in res.failures) {
        failure((code) {
          if (childrenThatRestorePosition.contains(child)) {
            if (!needReduceRestorations) {
              _restoreState(usePosition, code, state);
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
    final nextToken = options.getNextToken;
    final token = options.getToken;
    final tokenKind = options.getTokenKind.replaceAll('{{0}}', token);
    final tokenKindValue = options.getTokenKindValue.replaceAll('{{0}}', name);
    final code = Code();
    final success = Success.none();
    final fails = Code();
    cache.clear();
    final isTrue = '$tokenKind == $tokenKindValue';
    code.if$(isTrue, (code) {
      var variable = _invalid;
      if (!_insidePredicate.contains(node)) {
        if (!isVoid) {
          variable = _getSuggestedName(node, 'token');
          code.declare('final', variable, nextToken);
          success.setValue(variable, false);
        } else {
          code.stmt(nextToken);
        }
      }

      code.add(success.succeeds);
    });

    _addErrorHandler(node, [code]);
    code.add(fails);
    return BuildResult(code: code, successes: [success], failures: [fails]);
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
    List<Code> failures, [
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
      failure((code) {
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

  BuildResult _combineToSingleFailure(Expression node) {
    if (node.failureCount < 2) {
      final res = _generate(node);
      return res;
    }

    final code = Code();
    final label = _allocate('l');
    code.writeln('$label:');
    final res = _generate(node);
    cache.clear();
    code.group((code) {
      code.add(res.code);
    });
    code.writeln('// $label:');
    final fails = code.add(Code());
    for (final failure in res.failures) {
      failure((code) {
        code.stmt('break $label');
      });
    }

    return BuildResult(code: code, successes: res.successes, failures: [fails]);
  }

  BuildResult _combineToSingleSuccess(
    Expression node,
    String name, {
    required bool isValue,
  }) {
    if (node.successCount < 2) {
      final res = _generate(node);
      return res;
    }

    final isVoid = node.isVoid;
    final code = Code();
    final success = Success.none();
    final label = _allocate('l');
    var variable = _invalid;
    if (!isVoid) {
      final type = node.type;
      variable = _getSuggestedName(node, name);
      if (isValue) {
        success.setValue(variable, false);
        code.declare('final $type', variable);
      } else {
        success.setResult(variable, false);
        code.declare('final Result<$type>', variable);
      }
    }

    code.writeln('$label:');
    final res = _generate(node);
    cache.clear();
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

  void _declareSemanticValue(Expression node, BuildResult res) {
    final semanticValue = node.semanticValue;
    if (semanticValue == null) {
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
            final variable = _getSuggestedName(node, '');
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

  String _getCachedValue(String name, String Function() f) {
    final data = cache.data;
    if (data.containsKey(name)) {
      return data[name]!;
    }

    final value = f();
    data[name] = value;
    return value;
  }

  String _getCh(Code code) {
    return _getCachedValue('ch', () {
      final value = _allocate('c');
      code.declare('final', value, 'state.ch');
      return value;
    });
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

  String _getPosition(Code code) {
    return _getCachedValue('position', () {
      final value = _allocate('pos');
      code.declare('final', value, 'state.position');
      return value;
    });
  }

  String _getSuggestedName(Expression node, String name) {
    final suggestedName = suggestedNames[node];
    if (suggestedName != null) {
      name = suggestedName;
    }

    return _allocate(name);
  }

  String _getTokenIndex(Code code) {
    return _getCachedValue('index', () {
      final value = _allocate('index');
      final index = options.getTokenIndex;
      code.declare('final', value, index);
      return value;
    });
  }

  Never _internalError() {
    throw StateError('Internal error');
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
    final fails = Code();
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
      if (!isVoid) {
        final variable = _getSuggestedName(node, 'tok');
        success.setValue(variable, false);
        code.declare('final', variable, nextToken);
      } else {
        code.stmt(nextToken);
      }

      code.add(success.succeeds);
    });

    handler.elseBlock((code) {
      code.add(fails);
      _addErrorHandler(node, [fails]);
    });

    return BuildResult(code: code, successes: [success], failures: [fails]);
  }

  void _restoreState(bool condition, Code code, List<String> state) {
    if (!condition) {
      return;
    }

    for (final element in state) {
      code.writeln(element);
    }
  }

  List<String> _saveState(bool condition, Code code) {
    final result = <String>[];
    if (!condition) {
      return result;
    }

    if (options.inputType == InputType.tokens) {
      final index = _getTokenIndex(code);
      final restoreToken = options.getRestoreToken.replaceAll('{{0}}', index);
      result.add('$restoreToken;');
    } else {
      final pos = _getPosition(code);
      final ch = _getCh(code);
      result.add('state.ch = $ch;');
      result.add('state.position = $pos;');
    }

    return result;
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
    final state = _saveState(usePosition, code);
    variable = _invalid;
    var elementName = suggestedNames[child];
    if (elementName == null) {
      if (child is ProductionExpression) {
        elementName = camelize(child.name);
      }
    }
    switch (kind) {
      case list:
        final elementType = child.type;
        final name = elementName == null ? 'list' : '${elementName}List';
        variable = _getSuggestedName(node, name);
        code.declare('final', variable, '<$elementType>[]');
        break;
      case counter:
        final name = elementName == null ? 'count' : '${elementName}Count';
        variable = _allocate(name);
        code.declare('var', variable, '0');
        break;
      case flag:
        variable = _allocate('isSuccess');
        code.declare('var', variable, 'false');
        break;
      case none:
        break;
    }

    cache.clear();
    final res = _generate(child);
    cache.clear();
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
      failure((code) {
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
          isSuccess = min == 1
              ? '$variable.isNotEmpty'
              : '$variable.length >= $min';
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

    final fails = Code();
    final failures = <Code>[];
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
      _restoreState(usePosition, code, state);
      if (canFails) {
        code.add(fails);
        failures.add(fails);
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
