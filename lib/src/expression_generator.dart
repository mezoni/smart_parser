// ignore_for_file: unused_element

import 'dart:convert';

import 'package:simple_sparse_list/ranges_helper.dart';
import 'package:unicode/unicode.dart';

import '../parser_generator_options.dart';
import 'allocator.dart';
import 'code_builder.dart';
import 'expressions.dart';
import 'helper.dart';
import 'printer.dart';
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

  final Set<Expression> _insidePredicate = <Expression>{};

  final Set<Expression> _noNeedToStoreValue = <Expression>{};

  String? suggestedName;

  ExpressionGenerator({
    required this.allocator,
    required this.cache,
    required this.options,
    required this.productionName,
    this.suggestedName,
  });

  BuildResult generate(Expression expression) {
    return expression.accept(this);
  }

  @override
  BuildResult visitAction(ActionExpression node) {
    final source = node.source;
    final code = Code();
    final succeeds = Code();
    _writeBlock(code, source);
    code.add(succeeds);
    _addErrorHandler(node, const []);
    return BuildResult(
      code: code,
      successes: [
        Success(
          succeeds: succeeds,
          isConst: true,
          result: _none,
          value: _noneValue,
        ),
      ],
      failures: [],
    );
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
    if (child is AnyCharacterExpression ||
        child is CharacterClassExpression ||
        child is LiteralExpression ||
        child is MatchExpression ||
        child is TokenExpression) {
      _insidePredicate.add(child);
      cache.clone();
      final res = child.accept(this);
      cache.restore(data);
      final successes = res.successes;
      final success = successes.first;
      success.isConst = true;
      success.result = _none;
      success.value = _noneValue;
      _addErrorHandler(node, res.failures);
      return res;
    }

    final usePosition = child.canChangePosition;
    final code = Code();
    code.stmt('state.predicate++');
    final state = _saveState(usePosition, code);
    cache.clone();
    final res = child.accept(this);
    cache.restore(data);
    code.add(res.code);
    for (final success in res.successes) {
      _setVoidResult(success);
      success.succeeds((code) {
        _restoreState(usePosition, code, state);
        code.stmt('state.predicate--');
      });
    }

    _addErrorHandler(node, res.failures, (code) {
      code.stmt('state.predicate--');
    });

    return BuildResult(
      code: code,
      successes: res.successes,
      failures: res.failures,
    );
  }

  @override
  BuildResult visitAnyCharacter(AnyCharacterExpression node) {
    final isVoid = node.isVoid;
    final code = Code();
    final succeeds = Code();
    final fails = Code();
    final isConst = isVoid;
    var result = _none;
    var value = _noneValue;
    cache.clear();
    final handler = code.ifElse('state.ch >= 0');
    handler.ifBlock((code) {
      var variable = _invalid;
      if (!isVoid) {
        variable = _getSuggestedName('any');
        code.declare('final', variable, 'state.ch');
        value = variable;
        result = 'Ok($value)';
      }

      if (!_insidePredicate.contains(node)) {
        code.stmt('state.nextChar()');
      }

      code.add(succeeds);
    });

    handler.elseBlock((code) {
      code.add(fails);
    });

    _addErrorHandler(node, [fails]);
    return BuildResult(
      code: code,
      successes: [
        Success(
          succeeds: succeeds,
          isConst: isConst,
          result: result,
          value: value,
        ),
      ],
      failures: [fails],
    );
  }

  @override
  BuildResult visitCapture(CaptureExpression node) {
    final child = node.expression;
    final isVoid = node.isVoid;
    final code = Code();
    final pos = isVoid ? _invalid : _getPosition(code);
    final res = child.accept(this);
    code.add(res.code);
    for (final success in res.successes) {
      success.succeeds((code) {
        if (isVoid) {
          _setVoidResult(success);
        } else {
          final variable = _getSuggestedName('str');
          code.declare(
            'final',
            variable,
            'state.substring($pos, state.position)',
          );
          final value = variable;
          final result = 'Ok($value)';
          success.isConst = false;
          success.result = result;
          success.value = value;
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
    final succeeds = Code();
    final fails = Code();
    var isConst = isVoid;
    var result = _none;
    var value = _noneValue;
    final charCode = _getCharCode(ranges, negate);
    if (charCode != null) {
      cache.clear();
      isConst = true;
      _addNodeSourceToComment(node, code);
      final handler = code.ifElse('state.ch == $charCode');
      handler.ifBlock((code) {
        if (!isVoid) {
          value = '$charCode';
          result = 'const Ok($value)';
        }

        if (!_insidePredicate.contains(node)) {
          code.stmt('state.nextChar()');
        }

        code.add(succeeds);
      });

      handler.elseBlock((code) {
        code.add(fails);
      });

      _addErrorHandler(node, [fails]);
    } else {
      final variable = _getCh(code);
      final ok = _allocate('ok');
      cache.clear();
      RangeGenerator(name: variable, ranges: ranges, negate: negate);
      final predicate = RangeGenerator(
        name: variable,
        ranges: ranges,
        negate: negate,
      ).generate();
      code.declare('final', ok, predicate);
      _addNodeSourceToComment(node, code);
      final handler = code.ifElse(ok);
      handler.ifBlock((code) {
        if (!isVoid) {
          value = variable;
          result = 'Ok($value)';
        }

        if (!_insidePredicate.contains(node)) {
          code.stmt('state.nextChar()');
        }

        code.add(succeeds);
      });

      handler.elseBlock((code) {
        code.add(fails);
      });

      _addErrorHandler(node, [fails]);
    }

    return BuildResult(
      code: code,
      successes: [
        Success(
          succeeds: succeeds,
          isConst: isConst,
          result: result,
          value: value,
        ),
      ],
      failures: [fails],
    );
  }

  @override
  BuildResult visitGroup(GroupExpression node) {
    final child = node.expression;
    final res = child.accept(this);
    _addErrorHandler(node, res.failures);
    return res;
  }

  @override
  BuildResult visitLiteral(LiteralExpression node) {
    final text = node.text;
    final isPrimitive = node.isPrimitive;
    final isVoid = node.isVoid;
    final quote = isPrimitive ? '"' : '\'';
    final escaped = escapeString(text, quote);
    final code = Code();
    final succeeds = Code();
    final fails = Code();
    var result = _none;
    var value = _noneValue;
    if (text.isEmpty) {
      code.add(succeeds);
      if (!isVoid) {
        value = escaped;
        result = 'const Ok($escaped)';
      }

      _addErrorHandler(node, const []);
    } else {
      cache.clear();
      final runes = text.runes;
      final firstRune = runes.first;
      final strlen = _strlen(escaped, text);
      final test = runes.length == 1
          ? 'state.ch == $firstRune'
          : 'state.ch == $firstRune && state.startsWith($escaped)';
      _addNodeSourceToComment(node, code);
      final handler = code.ifElse(test);
      handler.ifBlock((code) {
        if (!_insidePredicate.contains(node)) {
          if (runes.length == 1) {
            code.stmt('state.nextChar()');
          } else {
            code.stmt('state.readChar(state.position + $strlen, true)');
          }
        }

        if (!isVoid) {
          value = escaped;
          result = 'const Ok($escaped)';
        }

        code.add(succeeds);
      });

      handler.elseBlock((code) {
        if (!isPrimitive) {
          code.stmt('state.errorExpected($escaped)');
        }

        code.add(fails);
      });

      _addErrorHandler(node, [fails]);
    }

    return BuildResult(
      code: code,
      successes: [
        Success(
          succeeds: succeeds,
          isConst: true,
          result: result,
          value: value,
        ),
      ],
      failures: [fails],
    );
  }

  @override
  BuildResult visitMatch(MatchExpression node) {
    final text = node.text;
    final isVoid = node.isVoid;
    final lowerCase = toLowerCase(text);
    final upperCase = toUpperCase(text);
    final lowerCaseList = 'const [${lowerCase.runes.join(', ')}]';
    final upperCaseList = 'const [${upperCase.runes.join(', ')}]';
    final code = Code();
    final succeeds = Code();
    final fails = Code();
    final isConst = isVoid;
    var result = _none;
    var value = _noneValue;
    var variable = _invalid;
    final length = _allocate('length');
    _addNodeSourceToComment(node, code);
    code.declare(
      'final',
      length,
      'state.match($lowerCaseList, $upperCaseList)',
    );
    final isTrue = '$length >= 0';
    final isFalse = '$length > 0';
    final handler = code.ifElse(isTrue, isFalse);
    handler.ifBlock((code) {
      if (!_insidePredicate.contains(node)) {
        if (!isVoid) {
          final start = _allocate('start');
          variable = _getSuggestedName('str');
          code.declare('final', start, 'state.position');
          code.stmt('state.readChar($start + $length, true)');
          code.declare(
            'final',
            variable,
            'state.substring($start, state.position)',
          );
          value = variable;
          result = 'Ok($value)';
        } else {
          code.stmt('state.readChar(state.position + $length, true)');
        }
      }

      code.add(succeeds);
    });

    handler.elseBlock((code) {
      _addErrorHandler(node, [code]);
      code.add(fails);
    });

    return BuildResult(
      code: code,
      successes: [
        Success(
          succeeds: succeeds,
          isConst: isConst,
          result: result,
          value: value,
        ),
      ],
      failures: [fails],
    );
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
    if (child is AnyCharacterExpression ||
        child is CharacterClassExpression ||
        child is LiteralExpression ||
        child is MatchExpression ||
        child is TokenExpression) {
      _insidePredicate.add(child);
      cache.clone();
      final res = child.accept(this);
      code.add(res.code);
      final successes = <Success>[];
      final failures = <Code>[];
      for (final success in res.successes) {
        success.succeeds(failures.add);
      }

      for (final failure in res.failures) {
        successes.add(
          Success(
            succeeds: failure,
            isConst: true,
            result: _none,
            value: _noneValue,
          ),
        );
      }

      _addErrorHandler(node, failures);
      return BuildResult(code: code, successes: successes, failures: failures);
    }

    final usePosition = child.canChangePosition;
    final data = cache.data;
    code.stmt('state.predicate++');
    final state = _saveState(usePosition, code);
    cache.clone();
    final res = child.accept(this);
    cache.restore(data);
    code.add(res.code);
    final successes = <Success>[];
    final failures = <Code>[];
    for (final success in res.successes) {
      final fail = Code();
      success.succeeds((code) {
        _restoreState(usePosition, code, state);
        code.stmt('state.predicate--');
        code.add(fail);
      });

      failures.add(fail);
    }

    for (final failure in res.failures) {
      final succeeds = Code();
      failure((code) {
        code.stmt('state.predicate--');
        code.add(succeeds);
      });

      successes.add(
        Success(
          succeeds: succeeds,
          isConst: true,
          result: _none,
          value: _noneValue,
        ),
      );
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
    final type = node.type;
    final code = Code();
    final isConst = isVoid;
    var result = _none;
    var value = _noneValue;
    final successes = <Success>[];
    if (child is ProductionExpression) {
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
          result = variable;
          value = '$result.\$1';
        } else {
          value = '$variable?.\$1';
          result = 'Ok($value)';
        }
      }

      final succeeds = code.add(Code());
      successes.add(
        Success(
          succeeds: succeeds,
          isConst: isConst,
          result: result,
          value: value,
        ),
      );

      return BuildResult(code: code, successes: successes, failures: const []);
    }

    if (child is AnyCharacterExpression ||
        child is CharacterClassExpression ||
        child is LiteralExpression ||
        child is MatchExpression ||
        child is TokenExpression) {
      var variable = _invalid;
      if (!isVoid) {
        variable = _getSuggestedName('opt');
        code.declare(type, variable);
        value = variable;
        result = 'Ok($value)';
      }

      final res = child.accept(this);
      if (res.successes.length > 1) {
        _internalError();
      }

      final success = res.successes.first;
      success.succeeds((code) {
        if (!isVoid) {
          code.assign(variable, success.value);
        }
      });

      code.add(res.code);
      final succeeds = code.add(Code());
      successes.add(
        Success(
          succeeds: succeeds,
          isConst: isConst,
          result: result,
          value: value,
        ),
      );

      return BuildResult(code: code, successes: successes, failures: const []);
    }

    final res = child.accept(this);
    code.add(res.code);
    for (final success in res.successes) {
      success.succeeds((code) {
        if (isVoid) {
          success.isConst = true;
          success.result = _none;
          success.value = _noneValue;
        }
      });

      successes.add(success);
    }

    for (final failure in res.failures) {
      failure((code) {
        successes.add(
          Success(
            succeeds: code,
            isConst: isConst,
            result: 'const Ok(null)',
            value: 'null',
          ),
        );
      });
    }

    _addErrorHandler(node, const []);
    return BuildResult(code: code, successes: successes, failures: const []);
  }

  @override
  BuildResult visitOrderedChoice(OrderedChoiceExpression node) {
    final children = node.expressions;
    if (children.length == 1) {
      final child = children.first;
      final res = child.accept(this);
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

    final alternatives = _choiceAlternatives(node);
    if (alternatives.isNotEmpty) {
      final res = _optimizeTokenChoice(node, alternatives);
      if (res != null) {
        return res;
      }
    }

    final isVoid = node.isVoid;
    final data = cache.data;
    final code = Code();
    final successes = <Success>[];
    final failures = <Code>[];
    var body = code.add(Code());
    if (node.isReturn) {
      for (var i = 0; i < children.length; i++) {
        cache.restore(data);
        final child = children[i];
        final res = child.accept(this);
        body.add(res.code);
        successes.addAll(res.successes);
        if (i == children.length - 1) {
          if (!child.isAlwaysSuccessful) {
            failures.add(code.add(Code()));
          }
        }
      }
    } else {
      BuildResult combine(Expression node) {
        final res = node.accept(this);
        var needCombine = false;
        if (res.successes.length > 1) {
          needCombine = true;
        }

        if (res.failures.length > 1) {
          needCombine = true;
        }

        if (!needCombine) {
          return res;
        }

        final isConst = isVoid;
        final code = Code();
        final succeeds = Code();
        final fails = Code();
        var result = _none;
        var value = _noneValue;
        final variable = _getSuggestedName('res');
        if (!node.isVoid) {
          final type = node.type;
          code.declare('Result<$type>?', variable);
          result = variable;
          value = '$result.\$1';
        } else {
          code.declare('var', variable, 'false');
        }

        code.add(res.code);
        for (final success in res.successes) {
          success.succeeds((code) {
            if (!isVoid) {
              code.assign(variable, success.result);
            } else {
              code.assign(variable, 'true');
            }
          });
        }

        final isTrue = isVoid ? variable : '$variable != null';
        final isFalse = isVoid ? '!$variable' : '$variable == null';
        final handler = code.ifElse(isTrue, isFalse);
        handler.ifBlock((code) {
          code.add(succeeds);
        });

        handler.elseBlock((code) {
          code.add(fails);
        });

        return BuildResult(
          code: code,
          successes: [
            Success(
              succeeds: succeeds,
              isConst: isConst,
              result: result,
              value: value,
            ),
          ],
          failures: [fails],
        );
      }

      for (var i = 0; i < children.length; i++) {
        cache.restore(data);
        final child = children[i];
        final res = combine(child);
        if (res.successes.length > 1) {
          throw StateError('Internal error');
        }

        if (res.failures.length > 1) {
          throw StateError('Internal error');
        }

        body.add(res.code);
        successes.addAll(res.successes);
        if (res.failures.isNotEmpty) {
          final failure = res.failures.first;
          body = failure;
          if (i == children.length - 1) {
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
    final succeeds = Code();
    code.stmt('state.readChar($action, true)');
    code.add(succeeds);
    _addErrorHandler(node, const []);
    return BuildResult(
      code: code,
      successes: [
        Success(
          succeeds: succeeds,
          isConst: true,
          result: _none,
          value: _noneValue,
        ),
      ],
      failures: [],
    );
  }

  @override
  BuildResult visitPredicate(PredicateExpression node) {
    final negate = node.negate;
    final predicate = node.predicate.trim();
    final code = Code();
    final succeeds = Code();
    final fails = Code();
    final ok = _allocate('ok');
    code.declare('final', ok, predicate);
    final isTrue = negate ? '!$ok' : ok;
    final isFalse = negate ? ok : '!$ok';
    final handler = code.ifElse(isTrue, isFalse);
    handler.ifBlock((code) {
      code.add(succeeds);
    });

    handler.elseBlock((code) {
      code.add(fails);
    });

    _addErrorHandler(node, [fails]);
    return BuildResult(
      code: code,
      successes: [
        Success(
          succeeds: succeeds,
          isConst: true,
          result: _none,
          value: _noneValue,
        ),
      ],
      failures: [fails],
    );
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
    final succeeds = Code();
    final failures = <Code>[];
    var result = _none;
    var value = _noneValue;
    if (isVoid) {
      if (isAlwaysSuccessful) {
        code.stmt(parse);
        code.add(succeeds);
      } else {
        final variable = _allocate(camelize(name));
        code.declare('final', variable, parse);
        final isTrue = '$variable != null';
        final isFalse = '$variable == null';
        final handler = code.ifElse(isTrue, isFalse);
        handler.ifBlock((code) {
          code.add(succeeds);
        });

        handler.elseBlock((code) {
          failures.add(code.add(Code()));
        });
      }
    } else {
      final variable = _allocate(camelize(name));
      code.declare('final', variable, parse);
      if (isAlwaysSuccessful) {
        code.add(succeeds);
        result = variable;
        value = '$result.\$1';
      } else {
        final isTrue = '$variable != null';
        final isFalse = '$variable == null';
        final handler = code.ifElse(isTrue, isFalse);
        handler.ifBlock((code) {
          code.add(succeeds);
          result = variable;
          value = '$result.\$1';
        });

        handler.elseBlock((code) {
          failures.add(code.add(Code()));
        });
      }
    }

    _addErrorHandler(node, failures);
    return BuildResult(
      code: code,
      successes: [
        Success(
          succeeds: succeeds,
          isConst: false,
          result: result,
          value: value,
        ),
      ],
      failures: failures,
    );
  }

  @override
  BuildResult visitSequence(SequenceExpression node) {
    final children = node.expressions;
    final isVoid = node.isVoid;
    if (children.length > 1) {
      suggestedName = null;
    }

    if (children.length == 1) {
      final child = children.first;
      final semanticValue = child.semanticValue;
      final res = child.accept(this);
      for (final success in res.successes) {
        success.succeeds((code) {
          if (semanticValue != null && semanticValue != '\$') {
            _declareResult(
              code,
              isConst: success.isConst,
              value: success.value,
              variable: semanticValue,
            );
          }

          if (isVoid) {
            _setVoidResult(success);
          }
        });
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
    }

    final usePosition = childrenThatRestorePosition.isNotEmpty;
    final code = Code();
    final failures = <Code>[];
    final successes = <Success>[];
    final buildResults = <BuildResult>[];
    final res2Child = <BuildResult, Expression>{};
    final state = _saveState(usePosition, code);
    BuildResult combine(Expression node) {
      final res = node.accept(this);
      if (res.successes.length < 2) {
        return res;
      }

      final isVoid = node.isVoid;
      if (node.isAlwaysSuccessful) {
        final code = Code();
        final succeeds = Code();
        final isConst = isVoid;
        var result = _none;
        var value = _noneValue;
        var variable = _invalid;
        if (!isVoid) {
          final type = node.type;
          variable = _getSuggestedName('val');
          value = variable;
          result = 'Ok($value)';
          code.declare(type, variable);
        }

        for (final success in res.successes) {
          success.succeeds((code) {
            if (!isVoid) {
              code.assign(variable, success.value);
            }
          });
        }

        code.add(res.code);
        code.add(succeeds);
        return BuildResult(
          code: code,
          successes: [
            Success(
              succeeds: succeeds,
              isConst: isConst,
              result: result,
              value: value,
            ),
          ],
          failures: const [],
        );
      }

      final code = Code();
      final fails = Code();
      final succeeds = Code();
      final isConst = isVoid;
      final variable = _allocate('res');
      final result = variable;
      final value = '$result.\$1';
      if (!isVoid) {
        final type = node.type;
        code.declare('Result<$type>?', variable);
      } else {
        code.declare('var', variable, 'false');
      }

      code.add(res.code);
      for (final success in res.successes) {
        success.succeeds((code) {
          if (!isVoid) {
            code.assign(variable, success.result);
          } else {
            code.assign(variable, 'true');
          }
        });
      }

      final isTrue = isVoid ? variable : '$variable != null';
      final isFalse = isVoid ? variable : '$variable == null';
      final handler = code.ifElse(isTrue, isFalse);
      handler.ifBlock((code) {
        code.add(succeeds);
      });

      handler.elseBlock((code) {
        code.add(fails);
      });

      return BuildResult(
        code: code,
        successes: [
          Success(
            succeeds: succeeds,
            isConst: isConst,
            result: result,
            value: value,
          ),
        ],
        failures: [fails],
      );
    }

    final isConsts = <bool>[];
    final results = <String>[];
    final values = <String>[];
    for (var i = 0; i < children.length; i++) {
      final child = children[i];
      final BuildResult res;
      if (i != children.length - 1 || !child.isReturn) {
        res = combine(child);
        if (res.successes.length > 1) {
          _internalError();
        }
      } else {
        if (i == children.length - 1) {
          if (child is ValueExpression) {
            final semanticValue = child.semanticValue;
            if (semanticValue == '\$' && child.errorHandler == null) {
              _noNeedToStoreValue.add(child);
            }
          }
        }

        res = child.accept(this);
      }

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
    }

    var body = code.add(Code());
    for (var i = 0; i < children.length; i++) {
      final child = children[i];
      final res = buildResults[i];
      body.add(res.code);
      for (final success in res.successes) {
        success.succeeds((code) {
          final semanticValue = child.semanticValue;
          if (semanticValue != null && semanticValue != '\$') {
            _declareResult(
              code,
              isConst: success.isConst,
              value: success.value,
              variable: semanticValue,
            );
          }
        });
      }

      failures.addAll(res.failures);
      for (final failure in res.failures) {
        failure((code) {
          final child = res2Child[res];
          if (childrenThatRestorePosition.contains(child)) {
            _restoreState(usePosition, code, state);
          }
        });
      }

      if (i != children.length - 1) {
        if (res.successes.length > 1) {
          _internalError();
        }

        final success = res.successes.first;
        body = success.succeeds;
      } else {
        successes.addAll(res.successes);
        final isSingleResult = results.length == 1;
        for (var i = 0; i < successes.length; i++) {
          final success = successes[i];
          success.succeeds((code) {
            if (isVoid || results.isEmpty) {
              success.isConst = true;
              success.result = _none;
              success.value = _noneValue;
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
    final succeeds = Code();
    final fails = Code();
    final isConst = isVoid;
    var result = _none;
    var value = _noneValue;
    cache.clear();
    final handler = code.ifElse('$tokenKind == $tokenKindValue');
    handler.ifBlock((code) {
      var variable = _invalid;
      if (!_insidePredicate.contains(node)) {
        if (!isVoid) {
          variable = _getSuggestedName('tok');
          code.declare('final', variable, nextToken);
          value = variable;
          result = 'Ok($value)';
        } else {
          code.stmt(nextToken);
        }
      }

      code.add(succeeds);
    });

    handler.elseBlock((code) {
      code.add(fails);
    });

    _addErrorHandler(node, [fails]);
    return BuildResult(
      code: code,
      successes: [
        Success(
          succeeds: succeeds,
          isConst: isConst,
          result: result,
          value: value,
        ),
      ],
      failures: [fails],
    );
  }

  @override
  BuildResult visitValue(ValueExpression node) {
    final source = node.source.trim();
    final valueType = node.valueType;
    final isVoid = node.isVoid;
    final isConst = node.isConst;
    final code = Code();
    final succeeds = Code();
    var result = _none;
    var value = _noneValue;
    if (_noNeedToStoreValue.contains(node)) {
      if (!isVoid) {
        value = source;
        result = isConst ? 'const Ok($value)' : 'Ok($value)';
      }
    } else {
      final variable = _getSuggestedName('val');
      final result2 = _declareResult(
        code,
        isConst: isConst,
        type: valueType,
        value: source,
        variable: variable,
      );
      if (!isVoid) {
        result = result2;
        value = variable;
      }
    }

    code.add(succeeds);
    return BuildResult(
      code: code,
      successes: [
        Success(
          succeeds: succeeds,
          isConst: isConst,
          result: result,
          value: value,
        ),
      ],
      failures: [],
    );
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

  void _addNodeSourceToComment(Expression node, Code code) {
    const printer = Printer();
    final source = node.accept(printer);
    final lines = const LineSplitter().convert(source);
    for (final line in lines) {
      code.writeln('// $line');
    }
  }

  String _allocate([String name = '']) {
    return allocator.allocate(name);
  }

  String _allocateIf(bool cond, [String name = '']) {
    return !cond ? _invalid : allocator.allocate(name);
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

  String _declareResult(
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

    code.declare(type, variable, value.trim());
    final result = isConst ? 'const Ok($variable)' : 'Ok($variable)';
    return result;
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

  String _getSuggestedName(String name) {
    if (suggestedName != null) {
      name = suggestedName!;
      suggestedName = null;
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
    final succeeds = Code();
    final fails = Code();
    final token = options.getToken;
    final tokenKind = options.getTokenKind.replaceAll('{{0}}', token);
    final kind = _allocate('kind');
    final isConst = isVoid;
    var result = _none;
    var value = _noneValue;
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
        final variable = _getSuggestedName('tok');
        code.declare('final', variable, nextToken);
        value = variable;
        result = 'Ok($value)';
      } else {
        code.stmt(nextToken);
      }

      code.add(succeeds);
    });

    handler.elseBlock((code) {
      code.add(fails);
      _addErrorHandler(node, [fails]);
    });

    return BuildResult(
      code: code,
      successes: [
        Success(
          succeeds: succeeds,
          isConst: isConst,
          result: result,
          value: value,
        ),
      ],
      failures: [fails],
    );
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

  void _setVoidResult(Success success) {
    success.isConst = true;
    success.result = _none;
    success.value = _noneValue;
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
    final succeeds = Code();
    final fails = Code();
    var variable = _invalid;
    final state = _saveState(usePosition, code);
    variable = _invalid;
    switch (kind) {
      case list:
        final elementType = child.type;
        variable = _allocate('list');
        code.declare('final', variable, '<$elementType>[]');
        break;
      case counter:
        variable = _allocate('cnt');
        code.declare('var', variable, '0');
        break;
      case flag:
        variable = _allocate('ok');
        code.declare('var', variable, 'false');
        break;
      case none:
        break;
    }

    cache.clear();
    final res = child.accept(this);

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

    final failures = <Code>[];
    final value = isVoid ? _noneValue : variable;
    final result = isVoid ? _none : 'Ok($variable)';
    final isTrue = isSuccess;
    final isFalse = isTrue == 'true' ? 'false' : '!($isTrue)';
    final isConst = isVoid;
    final handler = code.ifElse(isTrue, isFalse);
    handler.ifBlock((code) {
      code.add(succeeds);
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

    return BuildResult(
      code: code,
      successes: [
        Success(
          succeeds: succeeds,
          isConst: isConst,
          result: result,
          value: value,
        ),
      ],
      failures: failures,
    );
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
    const printer = Printer();
    final printed = node.accept(printer);
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
}
