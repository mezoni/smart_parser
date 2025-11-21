import 'package:simple_sparse_list/ranges_helper.dart';

import '../parser_generator_options.dart';
import 'allocator.dart';
import 'code_builder.dart';
import 'expressions.dart';
import 'helper.dart';
import 'printer.dart';
import 'range_generator.dart';
import 'state_machine.dart';

typedef ExpressionState = State2<Code>;

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

class ExpressionGenerator implements Visitor<ExpressionState> {
  static const _invalid = '__INVALID__';

  static const _none = 'Result.none';

  static const _noneValue = 'Result.none.\$1';

  final Allocator allocator;

  Cache cache;

  final ParserGeneratorOptions options;

  ExpressionGenerator({
    required this.allocator,
    required this.cache,
    required this.options,
  });

  ExpressionState generate(Expression expression) {
    return _buildExpression(expression);
  }

  @override
  ExpressionState visitAction(ActionExpression node) {
    final source = node.source;
    final start = _newState();
    start.onProcess((code) {
      _writeBlock(code, source);
      const isTrue = 'true';
      const isFalse = 'false';
      final handler = code.ifElse(isTrue, isFalse);
      handler.ifBlock((code) {
        _acceptVoid(code, start);
      });
      handler.elseBlock(start.reject);
    });

    return start;
  }

  @override
  ExpressionState visitAndPredicate(AndPredicateExpression node) {
    final child = node.expression;
    final start = _newState();
    final state0 = _buildExpression(child);
    final usePosition = child.canChangePosition;
    start.onPreprocess((code) {
      code.stmt('state.predicate++');
      final data = cache.data;
      final pos = !usePosition ? _invalid : _getPosition(code);
      cache.clone();
      state0.onAccept((event) {
        final code = event.output;
        if (usePosition) {
          code.stmt('state.backtrack($pos)');
        }

        code.stmt('state.predicate--');
        cache.restore(data);
        _acceptVoid(code, start);
      });
      state0.onReject((code) {
        code.stmt('state.predicate--');
        start.reject(code);
      });
    });

    start.onProcess(state0.build);
    return start;
  }

  @override
  ExpressionState visitAnyCharacter(AnyCharacterExpression node) {
    final start = _newState();
    start.onProcess((code) {
      final value = _getCh(code);
      cache.clear();
      final charSize = _charSize(value, const [(0, 0x10ffff)], false);
      final result = 'Ok($value)';
      final isTrue = '$value >= 0';
      final isFalse = '$value < 0';
      final handler = code.ifElse(isTrue, isFalse);
      handler.ifBlock((code) {
        code.stmt('state.position += $charSize');
        start.accept(
          AcceptEvent(
            output: code,
            isConst: false,
            result: result,
            value: value,
          ),
        );
      });
      handler.elseBlock(start.reject);
    });

    return start;
  }

  @override
  ExpressionState visitCapture(CaptureExpression node) {
    final child = node.expression;
    final isVoid = node.isVoid;
    final start = _newState();
    final state0 = _buildExpression(child);
    start.onPreprocess((code) {
      final pos = isVoid ? _invalid : _getPosition(code);
      state0.onAccept((event) {
        final code = event.output;
        if (isVoid) {
          _acceptVoid(code, start);
        } else {
          final value = _allocate();
          final result = 'Ok($value)';
          code.declare('final', value, 'state.substring($pos, state.position)');
          start.accept(
            AcceptEvent(
              output: code,
              isConst: false,
              result: result,
              value: value,
            ),
          );
        }
      });
      state0.onReject(start.reject);
    });

    start.onProcess(state0.build);
    return start;
  }

  @override
  ExpressionState visitCharacterClass(CharacterClassExpression node) {
    final negate = node.negate;
    final ranges = node.ranges;
    final start = _newState();
    start.onProcess((code) {
      final ch = _getCh(code);
      cache.clear();
      final (predicate, char) = _getPredicateAndChar(ch, ranges, negate);
      const printer = Printer();
      final printed = node.accept(printer);
      if (char != null) {
        final value = '$char';
        final result = 'const Result($value)';
        final charSize = _charSize(value, [(char, char)], false);
        code.writeln('// $printed');
        final isTrue = '$ch == $char';
        final isFalse = '$ch != $char';
        final handler = code.ifElse(isTrue, isFalse);
        handler.ifBlock((code) {
          code.stmt('state.position += $charSize');
          start.accept(
            AcceptEvent(
              output: code,
              isConst: true,
              result: result,
              value: value,
            ),
          );
        });
        handler.elseBlock(start.reject);
      } else {
        final value = ch;
        final result = 'Ok($value)';
        final isSuccess = _allocate();
        final charSize = _charSize(value, ranges, negate);
        code.writeln('// $printed');
        code.declare('final', isSuccess, predicate);
        final isTrue = isSuccess;
        final isFalse = '!$isSuccess';
        final handler = code.ifElse(isTrue, isFalse);
        handler.ifBlock((code) {
          code.stmt('state.position += $charSize');
          start.accept(
            AcceptEvent(
              output: code,
              isConst: false,
              result: result,
              value: value,
            ),
          );
        });
        handler.elseBlock(start.reject);
      }
    });

    return start;
  }

  @override
  ExpressionState visitGroup(GroupExpression node) {
    final child = node.expression;
    return _buildExpression(child);
  }

  @override
  ExpressionState visitLiteral(LiteralExpression node) {
    final text = node.text;
    final start = _newState();
    final isVoid = node.isVoid;
    final isPrimitive = node.isPrimitive;
    final escaped = escapeString(text);
    start.onProcess((code) {
      if (text.isEmpty) {
        final value = escaped;
        final result = 'const Result($escaped)';
        const isTrue = 'true';
        const isFalse = 'false';
        final handler = code.ifElse(isTrue, isFalse);
        handler.ifBlock((code) {
          start.accept(
            AcceptEvent(
              output: code,
              isConst: true,
              result: result,
              value: value,
            ),
          );
        });
        handler.elseBlock((code) {
          if (!isPrimitive) {
            code.stmt('state.errorExpected($escaped)');
          }

          start.reject(code);
        });
      } else {
        final runes = text.runes;
        final firstRune = runes.first;
        final c = _getCh(code);
        cache.clear();
        final value = isVoid ? _noneValue : escaped;
        final result = isVoid ? _none : 'const Result($escaped)';
        final length = _strlen(escaped, text);
        final test = runes.length == 1
            ? '$c == $firstRune'
            : '$c == $firstRune && state.startsWith($escaped)';
        if (runes.length == 1 && isVoid) {
          code.writeln('// $escaped');
        }

        final isTrue = test;
        final isFalse = '$c != $firstRune';
        final handler = code.ifElse(isTrue, isFalse);
        handler.ifBlock((code) {
          code.stmt('state.position += $length');
          start.accept(
            AcceptEvent(
              output: code,
              isConst: true,
              result: result,
              value: value,
            ),
          );
        });
        handler.elseBlock((code) {
          if (!isPrimitive) {
            code.stmt('state.errorExpected($escaped)');
          }

          start.reject(code);
        });
      }
    });

    return start;
  }

  @override
  ExpressionState visitNotPredicate(NotPredicateExpression node) {
    final child = node.expression;
    final canChangePosition = child.canChangePosition;
    final isAlwaysSuccessful = child.isAlwaysSuccessful;
    final usePosition = canChangePosition;
    final start = _newState();
    final state0 = _buildExpression(child);
    var label = _invalid;
    start.onPreprocess((code) {
      final pos = !usePosition ? _invalid : _getPosition(code);
      code.stmt('state.predicate++');
      cache.clone();
      label = _allocate('l');
      state0.onAccept((event) {
        final code = event.output;
        if (usePosition) {
          code.stmt('state.backtrack($pos)');
        }

        code.stmt('break $label');
      });
    });

    start.onProcess((code) {
      final data = cache.data;
      code.writeln('$label:');
      code.group((code) {
        cache.clone();
        state0.build(code);
        cache.restore(data);
        if (isAlwaysSuccessful) {
          code.writeln('// Not a well-formed \'NotPredicate\' expression.');
          code.writeln(
            '// The child expression \'${child.runtimeType}\' always succeeds.',
          );
        }

        code.stmt('state.predicate--');
        _acceptVoid(code, start);
      });
      code.writeln('// $label:');
      code.stmt('state.predicate--');
      cache.restore(data);
      start.reject(code);
    });

    return start;
  }

  @override
  ExpressionState visitNotPredicate__(NotPredicateExpression node) {
    final child = node.expression;
    final canChangePosition = child.canChangePosition;
    final isComplete = node.isComplete;
    final combine = !isComplete;
    final usePosition = canChangePosition;
    final start = _newState();
    final state0 = _buildExpression(child);
    var label = _invalid;
    var isSuccess = _invalid;
    start.onPreprocess((code) {
      final pos = !usePosition ? _invalid : _getPosition(code);
      code.stmt('state.predicate++');
      cache.clone();
      isSuccess = _allocate();
      code.declare('var', isSuccess, 'true');
      label = _allocateIf(combine, 'l');
      state0.onAccept((event) {
        final code = event.output;
        code.assign(isSuccess, 'false');
        if (usePosition) {
          code.stmt('state.backtrack($pos)');
        }

        if (combine) {
          code.stmt('break $label');
        }
      });
    });

    start.onProcess((code) {
      final data = cache.data;
      if (combine) {
        code.writeln('$label:');
        code.group((code) {
          cache.clone();
          state0.build(code);
        });
        code.writeln('// $label:');
      } else {
        state0.build(code);
      }

      final isTrue = isSuccess;
      final isFalse = '!$isSuccess';
      code.stmt('state.predicate--');
      final handler = code.ifElse(isTrue, isFalse);
      handler.ifBlock((code) {
        cache.restore(data);
        _acceptVoid(code, start);
      });
      handler.elseBlock(start.reject);
    });

    return start;
  }

  @override
  ExpressionState visitOneOrMore(OneOrMoreExpression node) {
    const range = (1, null);
    return _visitWhile(node, range);
  }

  @override
  ExpressionState visitOptional(OptionalExpression node) {
    final child = node.expression;
    final isVoid = node.isVoid;
    final isProduction = child is ProductionExpression;
    final combine = child.acceptancePoints > 1;
    final hasVariable = !isVoid && !isProduction;
    final start = _newState();
    final state0 = _buildExpression(child);
    var variable = _invalid;
    var label = _invalid;
    start.onPreprocess((code) {
      variable = _allocateIf(!isVoid);
      label = _allocateIf(combine, 'l');
      if (hasVariable) {
        final type = getNullableType(node.type);
        code.declare(type, variable);
      }

      state0.onAccept((event) {
        final code = event.output;
        if (hasVariable) {
          code.assign(variable, event.value);
        }

        if (combine) {
          code.stmt('break $label');
        }
      });
    });

    start.onProcess((code) {
      if (combine) {
        code.writeln('$label:');
        code.group((code) {
          cache.clone();
          state0.build(code);
        });
        code.writeln('// $label:');
      } else {
        if (child case final ProductionExpression child) {
          final name = child.name;
          final invocation = 'parse$name(state)';
          if (isVoid) {
            code.stmt(invocation);
          } else {
            code.declare('final', variable, invocation);
          }
        } else {
          state0.build(code);
        }
      }
    });

    start.onPostprocess((code) {
      const isTrue = 'true';
      const isFalse = 'false';
      final handler = code.ifElse(isTrue, isFalse);
      handler.ifBlock((code) {
        if (isVoid) {
          _acceptVoid(code, start);
        } else {
          var value = _invalid;
          var result = _invalid;
          if (child is ProductionExpression) {
            value = '$variable?.\$1';
            result = variable;
          } else {
            value = variable;
            result = 'Ok($value)';
          }

          start.accept(
            AcceptEvent(
              output: code,
              isConst: false,
              result: result,
              value: value,
            ),
          );
        }
      });
      handler.elseBlock(start.reject);
    });

    return start;
  }

  @override
  ExpressionState visitOrderedChoice(OrderedChoiceExpression node) {
    final children = node.expressions;
    if (children.length == 1) {
      final child = children.first;
      return _buildExpression(child);
    }

    final start = _newState();
    final states = <ExpressionState>[];
    for (var i = 0; i < children.length; i++) {
      final child = children[i];
      final state = _buildExpression(child);
      states.add(state);
    }

    start.onPreprocess((code) {
      for (var i = 0; i < states.length; i++) {
        final state = states[i];
        state.onAccept(start.accept);
      }
    });

    final canChangePosition = node.canChangePosition;
    start.onProcess((code) {
      final data = cache.data;
      for (var i = 0; i < states.length; i++) {
        final state = states[i];
        cache.restore(data);
        state.build(code);
      }

      if (canChangePosition) {
        cache.clear();
      } else {
        cache.restore(data);
      }
    });

    start.onPostprocess(start.reject);
    return start;
  }

  @override
  ExpressionState visitPosition(PositionExpression node) {
    final action = node.action;
    final start = _newState();
    start.onProcess((code) {
      cache.clear();
      const isTrue = 'true';
      const isFalse = 'false';
      final handler = code.ifElse(isTrue, isFalse);
      handler.ifBlock((code) {
        code.assign('state.position', action.trim());
        _acceptVoid(code, start);
      });
      handler.elseBlock(start.reject);
    });

    return start;
  }

  @override
  ExpressionState visitPredicate(PredicateExpression node) {
    final negate = node.negate;
    final predicate = node.predicate;
    final start = _newState();
    start.onProcess((code) {
      final isSuccess = _allocate();
      code.declare('final', isSuccess, predicate.trim());
      final isTrue = negate ? '!$isSuccess' : isSuccess;
      final isFalse = negate ? isSuccess : '!$isSuccess';
      final handler = code.ifElse(isTrue, isFalse);
      handler.ifBlock((code) {
        _acceptVoid(code, start);
      });
      handler.elseBlock(start.reject);
    });

    return start;
  }

  @override
  ExpressionState visitProduction(ProductionExpression node) {
    final name = node.name;
    final isVoid = node.isVoid;
    final isAlwaysSuccessful = node.isAlwaysSuccessful;
    final canChangePosition = node.canChangePosition;
    final start = _newState();
    start.onProcess((code) {
      if (canChangePosition) {
        cache.clear();
      }

      if (isAlwaysSuccessful) {
        final result = _allocateIf(!isVoid);
        if (isVoid) {
          code.stmt('parse$name(state)');
        } else {
          code.declare('final', result, 'parse$name(state)');
        }

        const isTrue = 'true';
        const isFalse = 'false';
        final handler = code.ifElse(isTrue, isFalse);
        handler.ifBlock((code) {
          if (isVoid) {
            _acceptVoid(code, start);
          } else {
            final value = '$result.\$1';
            start.accept(
              AcceptEvent(
                output: code,
                isConst: false,
                result: result,
                value: value,
              ),
            );
          }
        });
        handler.elseBlock(start.reject);
      } else {
        final result = _allocate();
        code.declare('final', result, 'parse$name(state)');
        final isTrue = '$result != null';
        final isFalse = '$result == null';
        final handler = code.ifElse(isTrue, isFalse);
        handler.ifBlock((code) {
          if (isVoid) {
            _acceptVoid(code, start);
          } else {
            final value = '$result.\$1';
            start.accept(
              AcceptEvent(
                output: code,
                isConst: false,
                result: result,
                value: value,
              ),
            );
          }
        });
        handler.elseBlock(start.reject);
      }
    });

    return start;
  }

  @override
  ExpressionState visitSequence(SequenceExpression node) {
    final children = node.expressions;
    final errorHandler = node.errorHandler;

    ExpressionState handleErrors(ExpressionState state) {
      if (errorHandler == null) {
        return state;
      }

      final isVoid = node.isVoid;
      final hasRemoveRecentErrors = errorHandler.contains('removeRecentErrors');
      var packed = errorHandler.replaceAll(' ', '');
      packed = packed.replaceAll('\n', '');
      packed = packed.replaceAll('\r', '');
      packed = packed.replaceAll('\t', '');
      var useErrorHandler = false;
      if (packed.contains('state.error(')) {
        useErrorHandler = true;
      }

      if (packed.contains('errorIncorrect')) {
        useErrorHandler = true;
      }

      final combine = node.rejectionPoints > 1;
      if (combine) {
        state = _combine(state, isVoid, node);
      }

      var errorState = _invalid;
      var farthestPosition = _invalid;
      state.onPreprocess((code) {
        errorState = _allocateIf(hasRemoveRecentErrors);
        farthestPosition = _allocateIf(useErrorHandler);
        if (hasRemoveRecentErrors) {
          code.declare('final', errorState, 'state.setErrorState()');
        }

        if (useErrorHandler) {
          code.declare('final', farthestPosition, 'state.beginErrorHandling()');
        }
      });

      state.onAccept((event) {
        final code = event.output;
        if (useErrorHandler) {
          code.stmt('state.endErrorHandling($farthestPosition)');
        }

        if (hasRemoveRecentErrors) {
          code.stmt('state.restoreErrorState($errorState)');
        }
      });

      state.onReject((code) {
        _writeBlock(code, errorHandler);
        if (useErrorHandler) {
          code.stmt('state.endErrorHandling($farthestPosition)');
        }

        if (hasRemoveRecentErrors) {
          code.stmt('state.restoreErrorState($errorState)');
        }
      });

      return state;
    }

    if (children.length == 1) {
      final child = children.first;
      final state = _buildExpression(child);
      return handleErrors(state);
    }

    final statesThatRestorePosition = <ExpressionState>{};
    ExpressionState? res;
    var positionChanged = false;
    final states = <ExpressionState>[];
    final start = _newState();
    for (var i = 0; i < children.length; i++) {
      final child = children[i];
      final combine = i != children.length - 1;
      final state = _buildExpression(child, combine: combine);
      states.add(state);
      if (!child.isAlwaysSuccessful) {
        if (positionChanged) {
          statesThatRestorePosition.add(state);
        }
      }

      if (child.canChangePosition) {
        positionChanged = true;
      }

      final semanticValue = child.semanticValue;
      if (semanticValue == '\$') {
        res = state;
      }
    }

    final usePosition = statesThatRestorePosition.isNotEmpty;
    var pos = _invalid;
    start.onPreprocess((code) {
      if (usePosition) {
        pos = _getPosition(code);
      }

      var result = _none;
      var value = _noneValue;
      var isConst = true;
      if (res != null) {
        res.onAccept((event) {
          isConst = event.isConst;
          result = event.result;
          value = event.value;
        });
      }

      for (var i = 0; i < states.length; i++) {
        final state = states[i];
        if (i == states.length - 1) {
          state.onAccept((event) {
            final code = event.output;
            start.accept(
              AcceptEvent(
                output: code,
                isConst: isConst,
                result: result,
                value: value,
              ),
            );
          });
          state.onReject((code) {
            if (statesThatRestorePosition.contains(state)) {
              code.stmt('state.backtrack($pos)');
            }
          });
        } else {
          final next = states[i + 1];
          state.onAccept((event) {
            final code = event.output;
            next.build(code);
          });
          state.onReject((code) {
            if (statesThatRestorePosition.contains(state)) {
              code.stmt('state.backtrack($pos)');
            }
          });
        }
      }
    });

    start.onProcess((code) {
      final state = states.first;
      state.build(code);
    });

    start.onPostprocess(start.reject);
    return handleErrors(start);
  }

  @override
  ExpressionState visitValue(ValueExpression node) {
    final source = node.source;
    final valueType = node.valueType;
    final start = _newState();
    start.onProcess((code) {
      const isTrue = 'true';
      const isFalse = 'false';
      final handler = code.ifElse(isTrue, isFalse);
      handler.ifBlock((code) {
        var isConst = false;
        var type = valueType;
        if (type != null) {
          if (type.startsWith('const')) {
            isConst = true;
          }
        }

        type ??= 'final';
        if (!isConst) {
          if (!type.startsWith('final')) {
            type = 'final $type';
          }
        }

        final value = _allocate();
        code.declare(type, value, source.trim());
        final result = isConst ? 'const Result($value)' : 'Ok($value)';
        start.accept(
          AcceptEvent(
            output: code,
            isConst: isConst,
            result: result,
            value: value,
          ),
        );
      });
      handler.elseBlock(start.reject);
    });

    return start;
  }

  @override
  ExpressionState visitWhile(WhileExpression node) {
    final range = node.range;
    return _visitWhile(node, range);
  }

  @override
  ExpressionState visitZeroOrMore(ZeroOrMoreExpression node) {
    const range = (0, null);
    return _visitWhile(node, range);
  }

  void _acceptVoid(Code output, ExpressionState state) {
    state.accept(
      AcceptEvent(
        output: output,
        isConst: true,
        result: _none,
        value: _noneValue,
      ),
    );
  }

  String _allocate([String name = '']) {
    return allocator.allocate(name);
  }

  String _allocateIf(bool cond, [String name = '']) {
    return !cond ? _invalid : allocator.allocate(name);
  }

  ExpressionState _buildExpression(Expression node, {bool combine = false}) {
    final semanticValue = node.semanticValue;
    final isVoid = node.isVoid;
    var start = node.accept(this);
    if (combine) {
      start = _combine(start, isVoid, node);
    }

    if (semanticValue != null && semanticValue != '\$') {
      start.onAccept((event) {
        final code = event.output;
        final value = event.value;
        if (event.isConst) {
          code.declare('const', semanticValue, value);
        } else {
          code.declare('final', semanticValue, value);
        }
      });
    }

    return start;
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

  ExpressionState _combine(
    ExpressionState state,
    bool isVoid,
    Expression node,
  ) {
    final acceptancePoints = node.acceptancePoints;
    final rejectionPoints = node.rejectionPoints;
    final isAlwaysSuccessful = node.isAlwaysSuccessful;
    final isComplete = node.isComplete;
    final type = node.type;
    var needCombine = false;
    if (!isComplete) {
      needCombine = true;
    }

    if (acceptancePoints > 1) {
      needCombine = true;
    }

    if (rejectionPoints > 1) {
      needCombine = true;
    }

    if (!needCombine) {
      return state;
    }

    final start = _newState();
    start.onProcess((code) {
      final reject = _allocateIf(!isAlwaysSuccessful, 'l');
      final accept = _allocate('l');
      final variable = _allocateIf(!isVoid);
      state.onAccept((event) {
        final code = event.output;
        if (!isVoid) {
          code.assign(variable, event.value);
        }

        code.stmt('break $accept');
      });

      if (isAlwaysSuccessful) {
        if (!isVoid) {
          code.declare('final $type', variable);
        }

        code.writeln('$accept:');
        code.group((code) {
          cache.clone();
          state.build(code);
        });
        code.writeln('// $accept:');

        const isTrue = 'true';
        const isFalse = 'false';
        final handler = code.ifElse(isTrue, isFalse);
        handler.ifBlock((code) {
          final value = isVoid ? _noneValue : variable;
          final result = isVoid ? _none : 'Ok($value)';
          final isConst = isVoid;
          start.accept(
            AcceptEvent(
              output: code,
              isConst: isConst,
              result: result,
              value: value,
            ),
          );
        });
        handler.elseBlock(start.reject);
      } else {
        code.writeln('$reject:');
        code.group((code) {
          cache.clone();
          if (!isVoid) {
            code.declare('final $type', variable);
          }

          code.writeln('$accept:');
          code.group((code) {
            cache.clone();
            state.build(code);
            code.stmt('break $reject');
          });
          code.writeln('// $accept:');
          final value = isVoid ? _noneValue : variable;
          final result = isVoid ? _none : 'Ok($variable)';
          final isConst = isVoid;
          start.accept(
            AcceptEvent(
              output: code,
              isConst: isConst,
              result: result,
              value: value,
            ),
          );
        });
        code.writeln('// $reject:');
        const isTrue = 'true';
        const isFalse = 'false';
        final handler = code.ifElse(isTrue, isFalse);
        handler.ifBlock(start.reject);
      }
    });

    return start;
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
      final value = _allocate();
      code.declare('final', value, 'state.peek()');
      return value;
    });
  }

  String _getPosition(Code code) {
    return _getCachedValue('position', () {
      final value = _allocate();
      code.declare('final', value, 'state.position');
      return value;
    });
  }

  (String, int?) _getPredicateAndChar(
    String name,
    List<(int, int)> ranges,
    bool negate,
  ) {
    final length = ranges.length;
    if (length == 1 && !negate) {
      final range = ranges[0];
      final min = range.$1;
      if (min == range.$2) {
        return ('$name == $min', min);
      }
    }

    final rangeGenerator = RangeGenerator(
      name: name,
      ranges: ranges,
      negate: negate,
    );
    final predicate = rangeGenerator.generate();
    return (predicate, null);
  }

  ExpressionState _newState() => State2<Code>();

  String _strlen(String string, String value) {
    return switch (options.inputType) {
      InputType.file => 'state.strlen($string)',
      InputType.string => '${value.length}',
    };
  }

  ExpressionState _visitWhile(SingleExpression node, (int?, int?)? range) {
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

    final usePosition = min > 1;
    final start = _newState();
    final state0 = _buildExpression(child);
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

    var variable = _invalid;
    var pos = _invalid;
    start.onPreprocess((code) {
      pos = !usePosition ? _invalid : _getPosition(code);
      variable = _allocateIf(kind != none);
      switch (kind) {
        case list:
          final elementType = child.type;
          code.declare('final', variable, '<$elementType>[]');
          break;
        case counter:
          code.declare('var', variable, '0');
          break;
        case flag:
          code.declare('var', variable, 'false');
          break;
        case none:
          break;
      }

      state0.onAccept((event) {
        final code = event.output;
        switch (kind) {
          case list:
            final value = event.value;
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
    });

    start.onProcess((code) {
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
        cache.clear();
        state0.build(code);
        cache.clear();
        if (!child.isAlwaysSuccessful) {
          code.stmt('break');
        }
      });
    });

    start.onPostprocess((code) {
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

      final isTrue = isSuccess;
      final isFalse = isTrue == 'true' ? 'false' : '!($isTrue)';
      final value = isVoid ? _noneValue : variable;
      final result = isVoid ? _none : 'Ok($variable)';
      final handler = code.ifElse(isTrue, isFalse);
      handler.ifBlock((code) {
        start.accept(
          AcceptEvent(
            output: code,
            isConst: false,
            result: result,
            value: value,
          ),
        );
      });
      handler.elseBlock((code) {
        if (usePosition) {
          code.stmt('state.backtrack($pos)');
        }

        start.reject(code);
      });
    });

    return start;
  }

  void _writeBlock(Code code, String source) {
    final lines = CodeBuilder.unindentText(source);
    for (final line in lines) {
      code.writeln(line.trimRight());
    }
  }
}
