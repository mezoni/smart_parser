import 'package:source_span/source_span.dart';

import '../../expressions.dart';
import '../../grammar.dart';

Grammar parse(String source) {
  const parser = TextParser();
  final state = State(source);
  final result = parser.parseStart(state);
  if (result == null) {
    final file = SourceFile.fromString(source);
    throw FormatException(
      state
          .getErrors()
          .map((e) => file.span(e.start, e.end).message(e.message))
          .join('\n'),
    );
  }

  return result.$1;
}

extension _Ext<T extends Expression> on T {
  T setType(String? type) {
    if (type != null) {
      this.type = type;
    }
    return this;
  }
}

// dart format off
class TextParser {
  const TextParser();

  /// [Grammar] **Start**
  /// ```txt
  /// `Grammar`
  /// Start =>
  ///   S
  ///   g = Globals?
  ///   m = Members?
  ///   p = Production+
  ///   ! .
  ///   $ = { Grammar(globals: g, members: m, productions: p) }
  /// ```
  Result<Grammar>? parseStart(State state) {
    final $pos = state.position;
    final $c = state.ch;
    parseS(state);
    final $globals = parseGlobals(state);
    final g = $globals?.$1;
    final $members = parseMembers(state);
    final m = $members?.$1;
    final $list = <Production>[];
    // (1)
    while (true) {
      final $production = parseProduction(state);
      if ($production != null) {
        $list.add($production.$1);
        continue;
      } else {
        break;
      }
    }
    if ($list.isNotEmpty) {
      final p = $list;
      if (state.ch >= 0) {
        state.ch = $c;
        state.position = $pos;
        return null;
      } else {
        final $val = Grammar(globals: g, members: m, productions: p);
        return Ok($val);
      }
    } else {
      state.ch = $c;
      state.position = $pos;
      return null;
    }
  }

  /// [String] **Globals**
  /// ```txt
  /// `String`
  /// Globals =>
  ///   { final start = state.position; }
  ///   "%{"
  ///   { final index = state.indexOf('\u007D%'); }
  ///   $ = <@position({ index == -1 ? state.length : index })>
  ///   "}%" ~{ state.error('Unterminated globals section', position: start); } S
  /// ```
  Result<String>? parseGlobals(State state) {
    final $pos = state.position;
    final $c = state.ch;
    final start = state.position;
    // "%{"
    if (state.ch == 37 && state.startsWith("%{")) {
      state.readChar(state.position + 2, true);
      final index = state.indexOf('\u007D%');
      final $pos1 = state.position;
      state.readChar(index == -1 ? state.length : index, true);
      final $str = state.substring($pos1, state.position);
      // "}%"
      // ~{ state.error('Unterminated globals section', position: start); }
      if (state.ch == 125 && state.startsWith("}%")) {
        state.readChar(state.position + 2, true);
        parseS(state);
        return Ok($str);
      } else {
        state.error('Unterminated globals section', position: start);
        state.ch = $c;
        state.position = $pos;
        return null;
      }
    } else {
      return null;
    }
  }

  /// [String] **Members**
  /// ```txt
  /// `String`
  /// Members =>
  ///   { final start = state.position; }
  ///   "%%"
  ///   { final index = state.indexOf('%%'); }
  ///   $ = <@position({ index == -1 ? state.length : index })>
  ///   "%%" ~{ state.error('Unterminated members section', position: start); } S
  /// ```
  Result<String>? parseMembers(State state) {
    final $pos = state.position;
    final $c = state.ch;
    final start = state.position;
    // "%%"
    if (state.ch == 37 && state.startsWith("%%")) {
      state.readChar(state.position + 2, true);
      final index = state.indexOf('%%');
      final $pos1 = state.position;
      state.readChar(index == -1 ? state.length : index, true);
      final $str = state.substring($pos1, state.position);
      // "%%"
      // ~{ state.error('Unterminated members section', position: start); }
      if (state.ch == 37 && state.startsWith("%%")) {
        state.readChar(state.position + 2, true);
        parseS(state);
        return Ok($str);
      } else {
        state.error('Unterminated members section', position: start);
        state.ch = $c;
        state.position = $pos;
        return null;
      }
    } else {
      return null;
    }
  }

  /// [Production] **Production**
  /// ```txt
  /// `Production`
  /// Production =>
  ///   { final start = state.position; }
  ///   t = Type
  ///   ~{ state.errorExpected('type'); }
  ///   i = ProductionName
  ///   ~{ state.errorExpected('production name'); }
  ///   '=>' S
  ///   e = Expression
  ///   [;]? S
  ///   {
  ///     final end = state.position;
  ///     final src = state.substring(start, end).trimRight();
  ///   }
  ///   $ = { Production(expression: e, name: i, sourceCode: src, type: t) }
  /// ```
  Result<Production>? parseProduction(State state) {
    final $pos = state.position;
    final $c = state.ch;
    final start = state.position;
    final $type = parseType(state);
    if ($type != null) {
      final t = $type.$1;
      final $productionName = parseProductionName(state);
      if ($productionName != null) {
        final i = $productionName.$1;
        // '=>'
        if (state.ch == 61 && state.startsWith('=>')) {
          state.readChar(state.position + 2, true);
          parseS(state);
          final $expression = parseExpression(state);
          if ($expression != null) {
            final e = $expression.$1;
            // [;]
            if (state.ch == 59) {
              state.nextChar();
            }
            parseS(state);
            final end = state.position;
            final src = state.substring(start, end).trimRight();
            final $val = Production(expression: e, name: i, sourceCode: src, type: t);
            return Ok($val);
          } else {
            state.ch = $c;
            state.position = $pos;
            return null;
          }
        } else {
          state.errorExpected('=>');
          state.ch = $c;
          state.position = $pos;
          return null;
        }
      } else {
        state.errorExpected('production name');
        state.ch = $c;
        state.position = $pos;
        return null;
      }
    } else {
      state.errorExpected('type');
      return null;
    }
  }

  /// [Expression] **Expression**
  /// ```txt
  /// `Expression`
  /// Expression =>
  ///   { final pos = state.position; }
  ///   e = OrderedChoice
  ///   ~{ state.errorExpected('expression'); }
  ///   { e.sourceCode = state.substring(pos, state.position).trimRight(); }
  ///   $ = { e }
  /// ```
  Result<Expression>? parseExpression(State state) {
    final pos = state.position;
    final $orderedChoice = parseOrderedChoice(state);
    if ($orderedChoice != null) {
      final e = $orderedChoice.$1;
      e.sourceCode = state.substring(pos, state.position).trimRight();
      final $val = e;
      return Ok($val);
    } else {
      state.errorExpected('expression');
      return null;
    }
  }

  /// [Expression] **OrderedChoice**
  /// ```txt
  /// `Expression`
  /// OrderedChoice =>
  ///   n = Sequence
  ///   { final l = [n]; }
  ///   @while (0) {
  ///     (
  ///       "/"
  ///       ----
  ///       "-"+
  ///     ) S
  ///     n = Sequence
  ///     { l.add(n); }
  ///   }
  ///   $ = { OrderedChoiceExpression(expressions: l) }
  /// ```
  Result<Expression>? parseOrderedChoice(State state) {
    final $sequence = parseSequence(state);
    if ($sequence != null) {
      final n = $sequence.$1;
      final l = [n];
      // (0)
      while (true) {
        final $pos = state.position;
        final $c = state.ch;
        var $res = false;
        // "/"
        if (state.ch == 47) {
          state.nextChar();
          $res = true;
        } else {
          var $ok = false;
          // (1)
          while (true) {
            // "-"
            if (state.ch == 45) {
              state.nextChar();
              $ok = true;
              continue;
            } else {
              break;
            }
          }
          if ($ok) {
            $res = true;
          }
        }
        if ($res) {
          parseS(state);
          final $sequence1 = parseSequence(state);
          if ($sequence1 != null) {
            final n = $sequence1.$1;
            l.add(n);
            continue;
          } else {
            state.ch = $c;
            state.position = $pos;
            break;
          }
        } else {
          break;
        }
      }
      final $val = OrderedChoiceExpression(expressions: l);
      return Ok($val);
    } else {
      return null;
    }
  }

  /// [Expression] **Sequence**
  /// ```txt
  /// `Expression`
  /// Sequence =>
  ///   { final pos = state.position; }
  ///   n = (
  ///     { final pos = state.position; }
  ///     e = SequenceElement
  ///     h = ErrorHandler?
  ///     { e.sourceCode = state.substring(pos, state.position).trimRight(); }
  ///     $ = `Expression` { e..errorHandler = h }
  ///   )+
  ///   e = { SequenceExpression(expressions: n) }
  ///   { e.sourceCode = state.substring(pos, state.position).trimRight(); }
  ///   $ = { e }
  /// ```
  Result<Expression>? parseSequence(State state) {
    final pos = state.position;
    final $list = <Expression>[];
    // (1)
    while (true) {
      final pos = state.position;
      final $sequenceElement = parseSequenceElement(state);
      if ($sequenceElement != null) {
        final e = $sequenceElement.$1;
        final $errorHandler = parseErrorHandler(state);
        final h = $errorHandler?.$1;
        e.sourceCode = state.substring(pos, state.position).trimRight();
        final Expression $val = e..errorHandler = h;
        $list.add($val);
        continue;
      } else {
        break;
      }
    }
    if ($list.isNotEmpty) {
      final n = $list;
      final $val1 = SequenceExpression(expressions: n);
      final e = $val1;
      e.sourceCode = state.substring(pos, state.position).trimRight();
      final $val2 = e;
      return Ok($val2);
    } else {
      return null;
    }
  }

  /// [Expression] **SequenceElement**
  /// ```txt
  /// `Expression`
  /// SequenceElement =>
  ///   Action
  ///   ----
  ///   n = (
  ///     VariableName
  ///     ---
  ///     $ = '$'
  ///     S
  ///   )
  ///   '=' S
  ///   e = (
  ///     Prefix
  ///     ----
  ///     Value
  ///   )
  ///   { e.semanticValue = n; }
  ///   $ = { e }
  ///   ----
  ///   Prefix
  /// ```
  Result<Expression>? parseSequenceElement(State state) {
    final $action = parseAction(state);
    if ($action != null) {
      return $action;
    } else {
      Result<Expression>? $res2;
      final $pos = state.position;
      final $c = state.ch;
      Result<String>? $res;
      final $variableName = parseVariableName(state);
      if ($variableName != null) {
        $res = $variableName;
      } else {
        // '\$'
        if (state.ch == 36) {
          state.nextChar();
          parseS(state);
          $res = const Ok('\$');
        } else {
          state.errorExpected('\$');
        }
      }
      if ($res != null) {
        final n = $res.$1;
        // '='
        if (state.ch == 61) {
          state.nextChar();
          parseS(state);
          Result<Expression>? $res1;
          final $prefix = parsePrefix(state);
          if ($prefix != null) {
            $res1 = $prefix;
          } else {
            final $value = parseValue(state);
            if ($value != null) {
              $res1 = $value;
            }
          }
          if ($res1 != null) {
            final e = $res1.$1;
            e.semanticValue = n;
            final $val = e;
            $res2 = Ok($val);
          } else {
            state.ch = $c;
            state.position = $pos;
          }
        } else {
          state.errorExpected('=');
          state.ch = $c;
          state.position = $pos;
        }
      }
      if ($res2 != null) {
        return $res2;
      } else {
        final $prefix1 = parsePrefix(state);
        if ($prefix1 != null) {
          return $prefix1;
        } else {
          return null;
        }
      }
    }
  }

  /// [Expression] **Prefix**
  /// ```txt
  /// `Expression`
  /// Prefix =>
  ///   "!" S
  ///   $ = (
  ///     b = Block
  ///     $ = { PredicateExpression(negate: true, predicate: b) }
  ///     ----
  ///     s = Suffix
  ///     $ = { NotPredicateExpression(expression: s) }
  ///   )
  ///   ----
  ///   "&" S
  ///   $ = (
  ///     b = Block
  ///     $ = { PredicateExpression(negate: false, predicate: b) }
  ///     ---
  ///     s = Suffix
  ///     $ = { AndPredicateExpression(expression: s) }
  ///   )
  ///   ----
  ///   Suffix
  /// ```
  Result<Expression>? parsePrefix(State state) {
    Result<Expression>? $res1;
    final $pos = state.position;
    final $c = state.ch;
    // "!"
    if (state.ch == 33) {
      state.nextChar();
      parseS(state);
      Result<Expression>? $res;
      final $block = parseBlock(state);
      if ($block != null) {
        final b = $block.$1;
        final $val = PredicateExpression(negate: true, predicate: b);
        $res = Ok($val);
      } else {
        final $suffix = parseSuffix(state);
        if ($suffix != null) {
          final s = $suffix.$1;
          final $val1 = NotPredicateExpression(expression: s);
          $res = Ok($val1);
        }
      }
      if ($res != null) {
        $res1 = $res;
      } else {
        state.ch = $c;
        state.position = $pos;
      }
    }
    if ($res1 != null) {
      return $res1;
    } else {
      Result<Expression>? $res3;
      // "&"
      if (state.ch == 38) {
        state.nextChar();
        parseS(state);
        Result<Expression>? $res2;
        final $block1 = parseBlock(state);
        if ($block1 != null) {
          final b = $block1.$1;
          final $val2 = PredicateExpression(negate: false, predicate: b);
          $res2 = Ok($val2);
        } else {
          final $suffix1 = parseSuffix(state);
          if ($suffix1 != null) {
            final s = $suffix1.$1;
            final $val3 = AndPredicateExpression(expression: s);
            $res2 = Ok($val3);
          }
        }
        if ($res2 != null) {
          $res3 = $res2;
        } else {
          state.ch = $c;
          state.position = $pos;
        }
      }
      if ($res3 != null) {
        return $res3;
      } else {
        final $suffix2 = parseSuffix(state);
        if ($suffix2 != null) {
          return $suffix2;
        } else {
          return null;
        }
      }
    }
  }

  /// [Expression] **Suffix**
  /// ```txt
  /// `Expression`
  /// Suffix =>
  ///   p = Primary
  ///   $ = (
  ///     "*" S
  ///     $ = { ZeroOrMoreExpression(expression: p) }
  ///     ----
  ///     "+" S
  ///     $ = { OneOrMoreExpression(expression: p) }
  ///     ----
  ///     "?" S
  ///     $ = { OptionalExpression(expression: p) }
  ///     ---
  ///     ""
  ///     $ = { p }
  ///   )
  /// ```
  Result<Expression>? parseSuffix(State state) {
    final $primary = parsePrimary(state);
    if ($primary != null) {
      final p = $primary.$1;
      Expression $res;
      // "*"
      if (state.ch == 42) {
        state.nextChar();
        parseS(state);
        final $val = ZeroOrMoreExpression(expression: p);
        $res = $val;
      } else {
        // "+"
        if (state.ch == 43) {
          state.nextChar();
          parseS(state);
          final $val1 = OneOrMoreExpression(expression: p);
          $res = $val1;
        } else {
          // "?"
          if (state.ch == 63) {
            state.nextChar();
            parseS(state);
            final $val2 = OptionalExpression(expression: p);
            $res = $val2;
          } else {
            final $val3 = p;
            $res = $val3;
          }
        }
      }
      return Ok($res);
    } else {
      return null;
    }
  }

  /// [Expression] **Primary**
  /// ```txt
  /// `Expression`
  /// Primary =>
  ///   (
  ///     Symbol
  ///     ---
  ///     CharacterClass
  ///     ----
  ///     Literal
  ///     ----
  ///     Group
  ///     ----
  ///     While
  ///     ----
  ///     AnyCharacter
  ///     ----
  ///     Capture
  ///     ----
  ///     Position
  ///     ----
  ///     Match
  ///   ) ~{ state.errorExpected('expression'); }
  /// ```
  Result<Expression>? parsePrimary(State state) {
    final $symbol = parseSymbol(state);
    if ($symbol != null) {
      return $symbol;
    } else {
      final $characterClass = parseCharacterClass(state);
      if ($characterClass != null) {
        return $characterClass;
      } else {
        final $literal = parseLiteral(state);
        if ($literal != null) {
          return $literal;
        } else {
          final $group = parseGroup(state);
          if ($group != null) {
            return $group;
          } else {
            final $while = parseWhile(state);
            if ($while != null) {
              return $while;
            } else {
              final $anyCharacter = parseAnyCharacter(state);
              if ($anyCharacter != null) {
                return $anyCharacter;
              } else {
                final $capture = parseCapture(state);
                if ($capture != null) {
                  return $capture;
                } else {
                  final $position = parsePosition(state);
                  if ($position != null) {
                    return $position;
                  } else {
                    final $match = parseMatch(state);
                    if ($match != null) {
                      return $match;
                    } else {
                      state.errorExpected('expression');
                      return null;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  /// [Expression] **Symbol**
  /// ```txt
  /// `Expression`
  /// Symbol =>
  ///   n = ProductionName S
  ///   $ = { ProductionExpression(name: n) }
  /// ```
  Result<Expression>? parseSymbol(State state) {
    final $productionName = parseProductionName(state);
    if ($productionName != null) {
      final n = $productionName.$1;
      parseS(state);
      final $val = ProductionExpression(name: n);
      return Ok($val);
    } else {
      return null;
    }
  }

  /// [Expression] **Action**
  /// ```txt
  /// `Expression`
  /// Action =>
  ///   b = Block
  ///   $ = { ActionExpression(source: b) }
  /// ```
  Result<Expression>? parseAction(State state) {
    final $block = parseBlock(state);
    if ($block != null) {
      final b = $block.$1;
      final $val = ActionExpression(source: b);
      return Ok($val);
    } else {
      return null;
    }
  }

  /// [Expression] **Value**
  /// ```txt
  /// `Expression`
  /// Value =>
  ///   t = Type?
  ///   b = Block
  ///   $ = { ValueExpression(source: b, valueType: t) }
  /// ```
  Result<Expression>? parseValue(State state) {
    final $pos = state.position;
    final $c = state.ch;
    final $type = parseType(state);
    final t = $type?.$1;
    final $block = parseBlock(state);
    if ($block != null) {
      final b = $block.$1;
      final $val = ValueExpression(source: b, valueType: t);
      return Ok($val);
    } else {
      state.ch = $c;
      state.position = $pos;
      return null;
    }
  }

  /// [Expression] **AnyCharacter**
  /// ```txt
  /// `Expression`
  /// AnyCharacter =>
  ///   "." S
  ///   $ = { AnyCharacterExpression() }
  /// ```
  Result<Expression>? parseAnyCharacter(State state) {
    // "."
    if (state.ch == 46) {
      state.nextChar();
      parseS(state);
      final $val = AnyCharacterExpression();
      return Ok($val);
    } else {
      return null;
    }
  }

  /// [Expression] **Capture**
  /// ```txt
  /// `Expression`
  /// Capture =>
  ///   "<" S
  ///   e = Expression
  ///   '>' S
  ///   $ = { CaptureExpression(expression: e) }
  /// ```
  Result<Expression>? parseCapture(State state) {
    final $pos = state.position;
    final $c = state.ch;
    // "<"
    if (state.ch == 60) {
      state.nextChar();
      parseS(state);
      final $expression = parseExpression(state);
      if ($expression != null) {
        final e = $expression.$1;
        // '>'
        if (state.ch == 62) {
          state.nextChar();
          parseS(state);
          final $val = CaptureExpression(expression: e);
          return Ok($val);
        } else {
          state.errorExpected('>');
          state.ch = $c;
          state.position = $pos;
          return null;
        }
      } else {
        state.ch = $c;
        state.position = $pos;
        return null;
      }
    } else {
      return null;
    }
  }

  /// [Expression] **CharacterClass**
  /// ```txt
  /// `Expression`
  /// CharacterClass =>
  ///   { var negate = false; }
  ///   (
  ///     "[^"
  ///     { negate = true; }
  ///     ----
  ///     "["
  ///   )
  ///   r = @while (1) {
  ///     ! "]"
  ///     $ = Range
  ///   } ~{ state.errorExpected('characters'); }
  ///   ']' S
  ///   $ = { CharacterClassExpression(ranges: r, negate: negate) }
  /// ```
  Result<Expression>? parseCharacterClass(State state) {
    final $pos = state.position;
    final $c = state.ch;
    var negate = false;
    var $res = false;
    // "[^"
    if (state.ch == 91 && state.startsWith("[^")) {
      state.readChar(state.position + 2, true);
      negate = true;
      $res = true;
    } else {
      // "["
      if (state.ch == 91) {
        state.nextChar();
        $res = true;
      }
    }
    if ($res) {
      final $list = <(int, int)>[];
      // (1)
      while (true) {
        // "]"
        if (state.ch == 93) {
          break;
        } else {
          final $range = parseRange(state);
          if ($range != null) {
            $list.add($range.$1);
            continue;
          } else {
            break;
          }
        }
      }
      if ($list.isNotEmpty) {
        final r = $list;
        // ']'
        if (state.ch == 93) {
          state.nextChar();
          parseS(state);
          final $val = CharacterClassExpression(ranges: r, negate: negate);
          return Ok($val);
        } else {
          state.errorExpected(']');
          state.ch = $c;
          state.position = $pos;
          return null;
        }
      } else {
        state.errorExpected('characters');
        state.ch = $c;
        state.position = $pos;
        return null;
      }
    } else {
      return null;
    }
  }

  /// [Expression] **Group**
  /// ```txt
  /// `Expression`
  /// Group =>
  ///   t = Type?
  ///   "(" S
  ///   e = Expression
  ///   ')' S
  ///   g = { GroupExpression(expression: e) }
  ///   { t != null ? g.type = t : null; }
  ///   $ = { g }
  /// ```
  Result<Expression>? parseGroup(State state) {
    final $pos = state.position;
    final $c = state.ch;
    final $type = parseType(state);
    final t = $type?.$1;
    // "("
    if (state.ch == 40) {
      state.nextChar();
      parseS(state);
      final $expression = parseExpression(state);
      if ($expression != null) {
        final e = $expression.$1;
        // ')'
        if (state.ch == 41) {
          state.nextChar();
          parseS(state);
          final $val = GroupExpression(expression: e);
          final g = $val;
          t != null ? g.type = t : null;
          final $val1 = g;
          return Ok($val1);
        } else {
          state.errorExpected(')');
          state.ch = $c;
          state.position = $pos;
          return null;
        }
      } else {
        state.ch = $c;
        state.position = $pos;
        return null;
      }
    } else {
      state.ch = $c;
      state.position = $pos;
      return null;
    }
  }

  /// [Expression] **Literal**
  /// ```txt
  /// `Expression`
  /// Literal =>
  ///   s = SQString
  ///   $ = { LiteralExpression(text: s) }
  ///   ----
  ///   s = DQString
  ///   $ = { LiteralExpression(isPrimitive: true, text: s) }
  /// ```
  Result<Expression>? parseLiteral(State state) {
    final $sQString = parseSQString(state);
    if ($sQString != null) {
      final s = $sQString.$1;
      final $val = LiteralExpression(text: s);
      return Ok($val);
    } else {
      final $dQString = parseDQString(state);
      if ($dQString != null) {
        final s = $dQString.$1;
        final $val1 = LiteralExpression(isPrimitive: true, text: s);
        return Ok($val1);
      } else {
        return null;
      }
    }
  }

  /// [Expression] **Match**
  /// ```txt
  /// `Expression`
  /// Match =>
  ///   "@match" S
  ///   '(' S
  ///   { var quote = '\''; }
  ///   s = (
  ///     SQString
  ///     ---
  ///     $ = DQString
  ///     { quote = '"'; }
  ///   )
  ///   ~{ state.errorExpected('string value'); }
  ///   ')' S
  ///   $ = { MatchExpression(quote: quote, text: s) }
  /// ```
  Result<Expression>? parseMatch(State state) {
    final $pos = state.position;
    final $c = state.ch;
    // "@match"
    if (state.ch == 64 && state.startsWith("@match")) {
      state.readChar(state.position + 6, true);
      parseS(state);
      // '('
      if (state.ch == 40) {
        state.nextChar();
        parseS(state);
        var quote = '\'';
        Result<String>? $res;
        final $sQString = parseSQString(state);
        if ($sQString != null) {
          $res = $sQString;
        } else {
          final $dQString = parseDQString(state);
          if ($dQString != null) {
            quote = '"';
            $res = $dQString;
          } else {
            state.errorExpected('string value');
          }
        }
        if ($res != null) {
          final s = $res.$1;
          // ')'
          if (state.ch == 41) {
            state.nextChar();
            parseS(state);
            final $val = MatchExpression(quote: quote, text: s);
            return Ok($val);
          } else {
            state.errorExpected(')');
            state.ch = $c;
            state.position = $pos;
            return null;
          }
        } else {
          state.errorExpected('string value');
          state.ch = $c;
          state.position = $pos;
          return null;
        }
      } else {
        state.errorExpected('(');
        state.ch = $c;
        state.position = $pos;
        return null;
      }
    } else {
      return null;
    }
  }

  /// [Expression] **Position**
  /// ```txt
  /// `Expression`
  /// Position =>
  ///   "@position" S
  ///   '(' S
  ///   b = Block
  ///   ~{ state.errorExpected('position value'); }
  ///   ')' S
  ///   $ = { PositionExpression(action: b) }
  /// ```
  Result<Expression>? parsePosition(State state) {
    final $pos = state.position;
    final $c = state.ch;
    // "@position"
    if (state.ch == 64 && state.startsWith("@position")) {
      state.readChar(state.position + 9, true);
      parseS(state);
      // '('
      if (state.ch == 40) {
        state.nextChar();
        parseS(state);
        final $block = parseBlock(state);
        if ($block != null) {
          final b = $block.$1;
          // ')'
          if (state.ch == 41) {
            state.nextChar();
            parseS(state);
            final $val = PositionExpression(action: b);
            return Ok($val);
          } else {
            state.errorExpected(')');
            state.ch = $c;
            state.position = $pos;
            return null;
          }
        } else {
          state.errorExpected('position value');
          state.ch = $c;
          state.position = $pos;
          return null;
        }
      } else {
        state.errorExpected('(');
        state.ch = $c;
        state.position = $pos;
        return null;
      }
    } else {
      return null;
    }
  }

  /// [Expression] **While**
  /// ```txt
  /// `Expression`
  /// While =>
  ///   t = Type?
  ///   "@while" S
  ///   '(' S
  ///   r = WhileRange
  ///   ~{ state.errorExpected('while range'); }
  ///   ')' S
  ///   '{' S
  ///   e = Expression
  ///   '}' S
  ///   $ = { WhileExpression(expression: e, range: r).setType(t) }
  /// ```
  Result<Expression>? parseWhile(State state) {
    final $pos = state.position;
    final $c = state.ch;
    final $type = parseType(state);
    final t = $type?.$1;
    // "@while"
    if (state.ch == 64 && state.startsWith("@while")) {
      state.readChar(state.position + 6, true);
      parseS(state);
      // '('
      if (state.ch == 40) {
        state.nextChar();
        parseS(state);
        final $whileRange = parseWhileRange(state);
        if ($whileRange != null) {
          final r = $whileRange.$1;
          // ')'
          if (state.ch == 41) {
            state.nextChar();
            parseS(state);
            // '{'
            if (state.ch == 123) {
              state.nextChar();
              parseS(state);
              final $expression = parseExpression(state);
              if ($expression != null) {
                final e = $expression.$1;
                // '}'
                if (state.ch == 125) {
                  state.nextChar();
                  parseS(state);
                  final $val = WhileExpression(expression: e, range: r).setType(t);
                  return Ok($val);
                } else {
                  state.errorExpected('}');
                  state.ch = $c;
                  state.position = $pos;
                  return null;
                }
              } else {
                state.ch = $c;
                state.position = $pos;
                return null;
              }
            } else {
              state.errorExpected('{');
              state.ch = $c;
              state.position = $pos;
              return null;
            }
          } else {
            state.errorExpected(')');
            state.ch = $c;
            state.position = $pos;
            return null;
          }
        } else {
          state.errorExpected('while range');
          state.ch = $c;
          state.position = $pos;
          return null;
        }
      } else {
        state.errorExpected('(');
        state.ch = $c;
        state.position = $pos;
        return null;
      }
    } else {
      state.ch = $c;
      state.position = $pos;
      return null;
    }
  }

  /// [(int, int?)] **WhileRange**
  /// ```txt
  /// `(int, int?)`
  /// WhileRange =>
  ///   m = DecValue S
  ///   n = (
  ///     ',' S
  ///     $ = DecValue1 S
  ///   )?
  ///   $ = { (m, n) }
  /// ```
  Result<(int, int?)>? parseWhileRange(State state) {
    final $decValue = parseDecValue(state);
    if ($decValue != null) {
      final m = $decValue.$1;
      parseS(state);
      int? $res;
      final $pos = state.position;
      final $c = state.ch;
      // ','
      if (state.ch == 44) {
        state.nextChar();
        parseS(state);
        final $decValue1 = parseDecValue1(state);
        if ($decValue1 != null) {
          parseS(state);
          $res = $decValue1.$1;
        } else {
          state.ch = $c;
          state.position = $pos;
          $res = null;
        }
      } else {
        state.errorExpected(',');
        $res = null;
      }
      final n = $res;
      final $val = (m, n);
      return Ok($val);
    } else {
      return null;
    }
  }

  /// [String] **ErrorHandler**
  /// ```txt
  /// `String`
  /// ErrorHandler =>
  ///   "~" S
  ///   $ = Block
  /// ```
  Result<String>? parseErrorHandler(State state) {
    final $pos = state.position;
    final $c = state.ch;
    // "~"
    if (state.ch == 126) {
      state.nextChar();
      parseS(state);
      final $block = parseBlock(state);
      if ($block != null) {
        return $block;
      } else {
        state.ch = $c;
        state.position = $pos;
        return null;
      }
    } else {
      return null;
    }
  }

  /// [String] **Type**
  /// ```txt
  /// `String`
  /// Type =>
  ///   "`"
  ///   $ = <
  ///     @while (1) {
  ///       ! [`]
  ///       [a-zA-Z0-9_$<(\{,:\})>? ]
  ///     }
  ///   >
  ///   ~{ state.errorExpected('type description'); }
  ///   '`' S
  /// ```
  Result<String>? parseType(State state) {
    final $pos = state.position;
    final $c = state.ch;
    // "`"
    if (state.ch == 96) {
      state.nextChar();
      final $pos1 = state.position;
      var $ok = false;
      // (1)
      while (true) {
        // [`]
        if (state.ch == 96) {
          break;
        } else {
          final $c1 = state.ch;
          final $ok1 = $c1 <= 60 ? $c1 >= 60 || $c1 <= 41 ? $c1 >= 40 || $c1 == 32 || $c1 == 36 : $c1 == 44 || $c1 >= 48 && $c1 <= 58 : $c1 <= 95 ? $c1 >= 95 || $c1 <= 63 ? $c1 >= 62 : $c1 >= 65 && $c1 <= 90 : $c1 <= 123 ? $c1 >= 97 : $c1 == 125;
          // [a-zA-Z0-9_$<(\{,:\})>? ]
          if ($ok1) {
            state.nextChar();
            $ok = true;
            continue;
          } else {
            break;
          }
        }
      }
      if ($ok) {
        final $str = state.substring($pos1, state.position);
        // '`'
        if (state.ch == 96) {
          state.nextChar();
          parseS(state);
          return Ok($str);
        } else {
          state.errorExpected('`');
          state.ch = $c;
          state.position = $pos;
          return null;
        }
      } else {
        state.errorExpected('type description');
        state.ch = $c;
        state.position = $pos;
        return null;
      }
    } else {
      return null;
    }
  }

  /// [String] **DQString**
  /// ```txt
  /// `String`
  /// DQString =>
  ///   "\""
  ///   p = @while (0) {
  ///     <[{20-21}{23-5B}{5D-10FFFF}]+>
  ///     ---
  ///     Escaped
  ///   }
  ///   '"' S
  ///   $ = { p.join() }
  /// ```
  Result<String>? parseDQString(State state) {
    final $pos = state.position;
    final $c = state.ch;
    // "\""
    if (state.ch == 34) {
      state.nextChar();
      final $list = <String>[];
      // (0)
      while (true) {
        final $pos1 = state.position;
        var $ok = false;
        // (1)
        while (true) {
          final $c1 = state.ch;
          final $ok1 = $c1 <= 91 ? $c1 >= 35 || $c1 >= 32 && $c1 <= 33 : $c1 >= 93 && $c1 <= 1114111;
          // [ -!#-\[\]-{10ffff}]
          if ($ok1) {
            state.nextChar();
            $ok = true;
            continue;
          } else {
            break;
          }
        }
        if ($ok) {
          final $str = state.substring($pos1, state.position);
          $list.add($str);
          continue;
        } else {
          final $escaped = parseEscaped(state);
          if ($escaped != null) {
            $list.add($escaped.$1);
            continue;
          } else {
            break;
          }
        }
      }
      final p = $list;
      // '"'
      if (state.ch == 34) {
        state.nextChar();
        parseS(state);
        final $val = p.join();
        return Ok($val);
      } else {
        state.errorExpected('"');
        state.ch = $c;
        state.position = $pos;
        return null;
      }
    } else {
      return null;
    }
  }

  /// [String] **SQString**
  /// ```txt
  /// `String`
  /// SQString =>
  ///   "'"
  ///   p = @while (0) {
  ///     <[{20-26}{28-5B}{5D-10FFFF}]+>
  ///     ---
  ///     Escaped
  ///   }
  ///   '\'' S
  ///   $ = { p.join() }
  /// ```
  Result<String>? parseSQString(State state) {
    final $pos = state.position;
    final $c = state.ch;
    // "'"
    if (state.ch == 39) {
      state.nextChar();
      final $list = <String>[];
      // (0)
      while (true) {
        final $pos1 = state.position;
        var $ok = false;
        // (1)
        while (true) {
          final $c1 = state.ch;
          final $ok1 = $c1 <= 91 ? $c1 >= 40 || $c1 >= 32 && $c1 <= 38 : $c1 >= 93 && $c1 <= 1114111;
          // [ -&(-\[\]-{10ffff}]
          if ($ok1) {
            state.nextChar();
            $ok = true;
            continue;
          } else {
            break;
          }
        }
        if ($ok) {
          final $str = state.substring($pos1, state.position);
          $list.add($str);
          continue;
        } else {
          final $escaped = parseEscaped(state);
          if ($escaped != null) {
            $list.add($escaped.$1);
            continue;
          } else {
            break;
          }
        }
      }
      final p = $list;
      // '\''
      if (state.ch == 39) {
        state.nextChar();
        parseS(state);
        final $val = p.join();
        return Ok($val);
      } else {
        state.errorExpected('\'');
        state.ch = $c;
        state.position = $pos;
        return null;
      }
    } else {
      return null;
    }
  }

  /// [String] **Escaped**
  /// ```txt
  /// `String`
  /// Escaped =>
  ///   "\\"
  ///   $ = (
  ///     "u"
  ///     '{'
  ///     v = HexValue
  ///     ~{ state.error('unicode escape'); }
  ///     '}'
  ///     ~{ state.error('Unterminated Unicode escape sequence'); }
  ///     $ = {String.fromCharCode(v) }
  ///     ----
  ///     "a"
  ///     $ = `const` { '\u0007' }
  ///     ----
  ///     "b"
  ///     $ = `const` { '\b' }
  ///     ----
  ///     "e"
  ///     $ = `const` { '\u001B' }
  ///     ----
  ///     "f"
  ///     $ = `const` { '\f' }
  ///     ----
  ///     "n"
  ///     $ = `const` { '\n' }
  ///     ----
  ///     "r"
  ///     $ = `const` { '\r' }
  ///     ----
  ///     "t"
  ///     $ = `const` { '\t' }
  ///     ----
  ///     "v"
  ///     $ = `const` { '\v' }
  ///     ----
  ///     "\\"
  ///     $ = `const` { '\\' }
  ///     ----
  ///     "\""
  ///     $ = `const` { '"' }
  ///     ----
  ///     "'"
  ///     $ = `const` { '\'' }
  ///   )
  ///   ~{state.error('Illegal escape character'); }
  /// ```
  Result<String>? parseEscaped(State state) {
    final $pos = state.position;
    final $c = state.ch;
    // "\\"
    if (state.ch == 92) {
      state.nextChar();
      Result<String>? $res1;
      Result<String>? $res;
      final $pos1 = state.position;
      final $c1 = state.ch;
      // "u"
      if (state.ch == 117) {
        state.nextChar();
        // '{'
        if (state.ch == 123) {
          state.nextChar();
          final $hexValue = parseHexValue(state);
          if ($hexValue != null) {
            final v = $hexValue.$1;
            // '}'
            // ~{ state.error('Unterminated Unicode escape sequence'); }
            if (state.ch == 125) {
              state.nextChar();
              final $val = String.fromCharCode(v);
              $res = Ok($val);
            } else {
              state.errorExpected('}');
              state.error('Unterminated Unicode escape sequence');
              state.ch = $c1;
              state.position = $pos1;
            }
          } else {
            state.error('unicode escape');
            state.ch = $c1;
            state.position = $pos1;
          }
        } else {
          state.errorExpected('{');
          state.ch = $c1;
          state.position = $pos1;
        }
      }
      if ($res != null) {
        $res1 = $res;
      } else {
        // "a"
        if (state.ch == 97) {
          state.nextChar();
          const $val1 = '\u0007';
          $res1 = const Ok($val1);
        } else {
          // "b"
          if (state.ch == 98) {
            state.nextChar();
            const $val2 = '\b';
            $res1 = const Ok($val2);
          } else {
            // "e"
            if (state.ch == 101) {
              state.nextChar();
              const $val3 = '\u001B';
              $res1 = const Ok($val3);
            } else {
              // "f"
              if (state.ch == 102) {
                state.nextChar();
                const $val4 = '\f';
                $res1 = const Ok($val4);
              } else {
                // "n"
                if (state.ch == 110) {
                  state.nextChar();
                  const $val5 = '\n';
                  $res1 = const Ok($val5);
                } else {
                  // "r"
                  if (state.ch == 114) {
                    state.nextChar();
                    const $val6 = '\r';
                    $res1 = const Ok($val6);
                  } else {
                    // "t"
                    if (state.ch == 116) {
                      state.nextChar();
                      const $val7 = '\t';
                      $res1 = const Ok($val7);
                    } else {
                      // "v"
                      if (state.ch == 118) {
                        state.nextChar();
                        const $val8 = '\v';
                        $res1 = const Ok($val8);
                      } else {
                        // "\\"
                        if (state.ch == 92) {
                          state.nextChar();
                          const $val9 = '\\';
                          $res1 = const Ok($val9);
                        } else {
                          // "\""
                          if (state.ch == 34) {
                            state.nextChar();
                            const $val10 = '"';
                            $res1 = const Ok($val10);
                          } else {
                            // "'"
                            if (state.ch == 39) {
                              state.nextChar();
                              const $val11 = '\'';
                              $res1 = const Ok($val11);
                            } else {
                              state.error('Illegal escape character');
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      if ($res1 != null) {
        return $res1;
      } else {
        state.error('Illegal escape character');
        state.ch = $c;
        state.position = $pos;
        return null;
      }
    } else {
      return null;
    }
  }

  /// [int] **RangeChar**
  /// ```txt
  /// `int`
  /// RangeChar =>
  ///   ! "\\"
  ///   $ = [^{0-1F}\{\}\[\]\\]
  ///   ---
  ///   "\\"
  ///   $ = (
  ///     "u"
  ///     '{'
  ///     $ = HexValue
  ///     ~{ state.errorExpected('hex number'); }
  ///     '}'
  ///     ----
  ///     "a"
  ///     $ = `const` { 0x07 }
  ///     ---
  ///     "b"
  ///     $ = `const` { 0x08 }
  ///     ---
  ///     "e"
  ///     $ = `const` { 0x1B }
  ///     ---
  ///     "f"
  ///     $ = `const` { 0x0C }
  ///     ---
  ///     "n"
  ///     $ = `const` { 0x0A }
  ///     ---
  ///     "r"
  ///     $ = `const` { 0x0D }
  ///     ---
  ///     "t"
  ///     $ = `const` { 0x09 }
  ///     ---
  ///     "v"
  ///     $ = `const` { 0x0B }
  ///     ---
  ///     "-"
  ///     $ = `const` { 0x2D }
  ///     ---
  ///     "["
  ///     $ = `const` { 0x5B }
  ///     ---
  ///     "\\"
  ///     $ = `const` { 0x5C }
  ///     ---
  ///     "]"
  ///     $ = `const` { 0x5D }
  ///     ---
  ///     "^"
  ///     $ = `const` { 0x5E }
  ///     ---
  ///     "{"
  ///     $ = `const` { 0x7B }
  ///     ---
  ///     "}"
  ///     $ = `const` { 0x7D }
  ///   )
  ///   ~{ state.error('Illegal escape character'); }
  /// ```
  Result<int>? parseRangeChar(State state) {
    Result<int>? $res;
    // "\\"
    if (!(state.ch == 92)) {
      final $c = state.ch;
      final $ok = !($c <= 93 ? $c >= 91 || $c >= 0 && $c <= 31 : $c == 123 || $c == 125) && !($c < 0);
      // [^{0-1f}\{\}\[\]\\]
      if ($ok) {
        state.nextChar();
        $res = Ok($c);
      }
    }
    if ($res != null) {
      return $res;
    } else {
      Result<int>? $res3;
      final $pos = state.position;
      final $c1 = state.ch;
      // "\\"
      if (state.ch == 92) {
        state.nextChar();
        Result<int>? $res2;
        Result<int>? $res1;
        final $pos1 = state.position;
        final $c2 = state.ch;
        // "u"
        if (state.ch == 117) {
          state.nextChar();
          // '{'
          if (state.ch == 123) {
            state.nextChar();
            final $hexValue = parseHexValue(state);
            if ($hexValue != null) {
              // '}'
              if (state.ch == 125) {
                state.nextChar();
                $res1 = $hexValue;
              } else {
                state.errorExpected('}');
                state.ch = $c2;
                state.position = $pos1;
              }
            } else {
              state.errorExpected('hex number');
              state.ch = $c2;
              state.position = $pos1;
            }
          } else {
            state.errorExpected('{');
            state.ch = $c2;
            state.position = $pos1;
          }
        }
        if ($res1 != null) {
          $res2 = $res1;
        } else {
          // "a"
          if (state.ch == 97) {
            state.nextChar();
            const $val = 0x07;
            $res2 = const Ok($val);
          } else {
            // "b"
            if (state.ch == 98) {
              state.nextChar();
              const $val1 = 0x08;
              $res2 = const Ok($val1);
            } else {
              // "e"
              if (state.ch == 101) {
                state.nextChar();
                const $val2 = 0x1B;
                $res2 = const Ok($val2);
              } else {
                // "f"
                if (state.ch == 102) {
                  state.nextChar();
                  const $val3 = 0x0C;
                  $res2 = const Ok($val3);
                } else {
                  // "n"
                  if (state.ch == 110) {
                    state.nextChar();
                    const $val4 = 0x0A;
                    $res2 = const Ok($val4);
                  } else {
                    // "r"
                    if (state.ch == 114) {
                      state.nextChar();
                      const $val5 = 0x0D;
                      $res2 = const Ok($val5);
                    } else {
                      // "t"
                      if (state.ch == 116) {
                        state.nextChar();
                        const $val6 = 0x09;
                        $res2 = const Ok($val6);
                      } else {
                        // "v"
                        if (state.ch == 118) {
                          state.nextChar();
                          const $val7 = 0x0B;
                          $res2 = const Ok($val7);
                        } else {
                          // "-"
                          if (state.ch == 45) {
                            state.nextChar();
                            const $val8 = 0x2D;
                            $res2 = const Ok($val8);
                          } else {
                            // "["
                            if (state.ch == 91) {
                              state.nextChar();
                              const $val9 = 0x5B;
                              $res2 = const Ok($val9);
                            } else {
                              // "\\"
                              if (state.ch == 92) {
                                state.nextChar();
                                const $val10 = 0x5C;
                                $res2 = const Ok($val10);
                              } else {
                                // "]"
                                if (state.ch == 93) {
                                  state.nextChar();
                                  const $val11 = 0x5D;
                                  $res2 = const Ok($val11);
                                } else {
                                  // "^"
                                  if (state.ch == 94) {
                                    state.nextChar();
                                    const $val12 = 0x5E;
                                    $res2 = const Ok($val12);
                                  } else {
                                    // "{"
                                    if (state.ch == 123) {
                                      state.nextChar();
                                      const $val13 = 0x7B;
                                      $res2 = const Ok($val13);
                                    } else {
                                      // "}"
                                      if (state.ch == 125) {
                                        state.nextChar();
                                        const $val14 = 0x7D;
                                        $res2 = const Ok($val14);
                                      } else {
                                        state.error('Illegal escape character');
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        if ($res2 != null) {
          $res3 = $res2;
        } else {
          state.error('Illegal escape character');
          state.ch = $c1;
          state.position = $pos;
        }
      }
      if ($res3 != null) {
        return $res3;
      } else {
        return null;
      }
    }
  }

  /// [int] **DecValue**
  /// ```txt
  /// `int`
  /// DecValue =>
  ///   n = <[0-9]+>
  ///   ~{ state.errorExpected('decimal number'); }
  ///   $ = { int.parse(n) }
  /// ```
  Result<int>? parseDecValue(State state) {
    final $pos = state.position;
    var $ok = false;
    // (1)
    while (true) {
      final $c = state.ch;
      final $ok1 = $c >= 48 && $c <= 57;
      // [0-9]
      if ($ok1) {
        state.nextChar();
        $ok = true;
        continue;
      } else {
        break;
      }
    }
    if ($ok) {
      final $str = state.substring($pos, state.position);
      final n = $str;
      final $val = int.parse(n);
      return Ok($val);
    } else {
      state.errorExpected('decimal number');
      return null;
    }
  }

  /// [int] **DecValue1**
  /// ```txt
  /// `int`
  /// DecValue1 =>
  ///   n = <[1-9] [0-9]*>
  ///   ~{ state.errorExpected('decimal number from 1'); }
  ///   $ = { int.parse(n) }
  /// ```
  Result<int>? parseDecValue1(State state) {
    final $pos = state.position;
    final $c = state.ch;
    final $ok = $c >= 49 && $c <= 57;
    // [1-9]
    if ($ok) {
      state.nextChar();
      // (0)
      while (true) {
        final $c1 = state.ch;
        final $ok1 = $c1 >= 48 && $c1 <= 57;
        // [0-9]
        if ($ok1) {
          state.nextChar();
          continue;
        } else {
          break;
        }
      }
      final $str = state.substring($pos, state.position);
      final n = $str;
      final $val = int.parse(n);
      return Ok($val);
    } else {
      state.errorExpected('decimal number from 1');
      return null;
    }
  }

  /// [int] **HexValue**
  /// ```txt
  /// `int`
  /// HexValue =>
  ///   n = <[a-fA-F0-9]+>
  ///   ~{ state.errorExpected('hexadecimal number'); }
  ///   $ = { int.parse(n, radix: 16) }
  /// ```
  Result<int>? parseHexValue(State state) {
    final $pos = state.position;
    var $ok = false;
    // (1)
    while (true) {
      final $c = state.ch;
      final $ok1 = $c <= 70 ? $c >= 65 || $c >= 48 && $c <= 57 : $c >= 97 && $c <= 102;
      // [a-fA-F0-9]
      if ($ok1) {
        state.nextChar();
        $ok = true;
        continue;
      } else {
        break;
      }
    }
    if ($ok) {
      final $str = state.substring($pos, state.position);
      final n = $str;
      final $val = int.parse(n, radix: 16);
      return Ok($val);
    } else {
      state.errorExpected('hexadecimal number');
      return null;
    }
  }

  /// [(int, int)] **Range**
  /// ```txt
  /// `(int, int)`
  /// Range =>
  ///   (
  ///     "{"
  ///     s = HexValue
  ///     '-'
  ///     e = HexValue
  ///     '}'
  ///     $ = { (s, e) }
  ///     ----
  ///     "{"
  ///     n = HexValue
  ///     '}'
  ///     $ = { (n, n) }
  ///     ---
  ///     s = RangeChar
  ///     '-'
  ///     e = RangeChar
  ///     $ = { (s, e) }
  ///     ----
  ///     n = RangeChar
  ///     $ = { (n, n) }
  ///   )
  /// ```
  Result<(int, int)>? parseRange(State state) {
    Result<(int, int)>? $res;
    final $pos = state.position;
    final $c = state.ch;
    // "{"
    if (state.ch == 123) {
      state.nextChar();
      final $hexValue = parseHexValue(state);
      if ($hexValue != null) {
        final s = $hexValue.$1;
        // '-'
        if (state.ch == 45) {
          state.nextChar();
          final $hexValue1 = parseHexValue(state);
          if ($hexValue1 != null) {
            final e = $hexValue1.$1;
            // '}'
            if (state.ch == 125) {
              state.nextChar();
              final $val = (s, e);
              $res = Ok($val);
            } else {
              state.errorExpected('}');
              state.ch = $c;
              state.position = $pos;
            }
          } else {
            state.ch = $c;
            state.position = $pos;
          }
        } else {
          state.errorExpected('-');
          state.ch = $c;
          state.position = $pos;
        }
      } else {
        state.ch = $c;
        state.position = $pos;
      }
    }
    if ($res != null) {
      return $res;
    } else {
      Result<(int, int)>? $res1;
      // "{"
      if (state.ch == 123) {
        state.nextChar();
        final $hexValue2 = parseHexValue(state);
        if ($hexValue2 != null) {
          final n = $hexValue2.$1;
          // '}'
          if (state.ch == 125) {
            state.nextChar();
            final $val1 = (n, n);
            $res1 = Ok($val1);
          } else {
            state.errorExpected('}');
            state.ch = $c;
            state.position = $pos;
          }
        } else {
          state.ch = $c;
          state.position = $pos;
        }
      }
      if ($res1 != null) {
        return $res1;
      } else {
        Result<(int, int)>? $res2;
        final $rangeChar = parseRangeChar(state);
        if ($rangeChar != null) {
          final s = $rangeChar.$1;
          // '-'
          if (state.ch == 45) {
            state.nextChar();
            final $rangeChar1 = parseRangeChar(state);
            if ($rangeChar1 != null) {
              final e = $rangeChar1.$1;
              final $val2 = (s, e);
              $res2 = Ok($val2);
            } else {
              state.ch = $c;
              state.position = $pos;
            }
          } else {
            state.errorExpected('-');
            state.ch = $c;
            state.position = $pos;
          }
        }
        if ($res2 != null) {
          return $res2;
        } else {
          final $rangeChar2 = parseRangeChar(state);
          if ($rangeChar2 != null) {
            final n = $rangeChar2.$1;
            final $val3 = (n, n);
            return Ok($val3);
          } else {
            return null;
          }
        }
      }
    }
  }

  /// [String] **Block**
  /// ```txt
  /// `String`
  /// Block =>
  ///   "{"
  ///   $ = <BlockBody*>
  ///   '}' S
  /// ```
  Result<String>? parseBlock(State state) {
    final $pos = state.position;
    final $c = state.ch;
    // "{"
    if (state.ch == 123) {
      state.nextChar();
      final $pos1 = state.position;
      // (0)
      while (true) {
        final $blockBody = parseBlockBody(state);
        if ($blockBody != null) {
          continue;
        } else {
          break;
        }
      }
      final $str = state.substring($pos1, state.position);
      // '}'
      if (state.ch == 125) {
        state.nextChar();
        parseS(state);
        return Ok($str);
      } else {
        state.errorExpected('}');
        state.ch = $c;
        state.position = $pos;
        return null;
      }
    } else {
      return null;
    }
  }

  /// [void] **BlockBody**
  /// ```txt
  /// `void`
  /// BlockBody =>
  ///   "{"
  ///   BlockBody*
  ///   '}'
  ///   ----
  ///   ! "}"
  ///   .
  /// ```
  Result<void>? parseBlockBody(State state) {
    var $res = false;
    final $pos = state.position;
    final $c = state.ch;
    // "{"
    if (state.ch == 123) {
      state.nextChar();
      // (0)
      while (true) {
        final $blockBody = parseBlockBody(state);
        if ($blockBody != null) {
          continue;
        } else {
          break;
        }
      }
      // '}'
      if (state.ch == 125) {
        state.nextChar();
        $res = true;
      } else {
        state.errorExpected('}');
        state.ch = $c;
        state.position = $pos;
      }
    }
    if ($res) {
      return Result.none;
    } else {
      var $res1 = false;
      // "}"
      if (!(state.ch == 125)) {
        if (state.ch >= 0) {
          state.nextChar();
          $res1 = true;
        }
      }
      if ($res1) {
        return Result.none;
      } else {
        return null;
      }
    }
  }

  /// [String] **VariableName**
  /// ```txt
  /// `String`
  /// VariableName =>
  ///   $ = <[a-z] [a-zA-Z0-9_]*>
  ///   S
  /// ```
  Result<String>? parseVariableName(State state) {
    final $pos = state.position;
    final $c = state.ch;
    final $ok = $c >= 97 && $c <= 122;
    // [a-z]
    if ($ok) {
      state.nextChar();
      // (0)
      while (true) {
        final $c1 = state.ch;
        final $ok1 = $c1 <= 90 ? $c1 >= 65 || $c1 >= 48 && $c1 <= 57 : $c1 == 95 || $c1 >= 97 && $c1 <= 122;
        // [a-zA-Z0-9_]
        if ($ok1) {
          state.nextChar();
          continue;
        } else {
          break;
        }
      }
      final $str = state.substring($pos, state.position);
      parseS(state);
      return Ok($str);
    } else {
      return null;
    }
  }

  /// [String] **ProductionName**
  /// ```txt
  /// `String`
  /// ProductionName =>
  ///   $ = <[A-Z] [a-zA-Z0-9_]*>
  ///   S
  /// ```
  Result<String>? parseProductionName(State state) {
    final $pos = state.position;
    final $c = state.ch;
    final $ok = $c >= 65 && $c <= 90;
    // [A-Z]
    if ($ok) {
      state.nextChar();
      // (0)
      while (true) {
        final $c1 = state.ch;
        final $ok1 = $c1 <= 90 ? $c1 >= 65 || $c1 >= 48 && $c1 <= 57 : $c1 == 95 || $c1 >= 97 && $c1 <= 122;
        // [a-zA-Z0-9_]
        if ($ok1) {
          state.nextChar();
          continue;
        } else {
          break;
        }
      }
      final $str = state.substring($pos, state.position);
      parseS(state);
      return Ok($str);
    } else {
      return null;
    }
  }

  /// [void] **S**
  /// ```txt
  /// `void`
  /// S => @while (0) {
  ///   Space
  ///   ----
  ///   Comment
  /// }
  /// ```
  Result<void> parseS(State state) {
    // (0)
    while (true) {
      final $space = parseSpace(state);
      if ($space != null) {
        continue;
      } else {
        final $comment = parseComment(state);
        if ($comment != null) {
          continue;
        } else {
          break;
        }
      }
    }
    return Result.none;
  }

  /// [void] **Comment**
  /// ```txt
  /// `void`
  /// Comment =>
  ///   "#"
  ///   @while (0) {
  ///     ! EndOfLine
  ///     .
  ///   }
  ///   EndOfLine?
  /// ```
  Result<void>? parseComment(State state) {
    // "#"
    if (state.ch == 35) {
      state.nextChar();
      // (0)
      while (true) {
        state.predicate++;
        final $pos = state.position;
        final $c = state.ch;
        final $endOfLine = parseEndOfLine(state);
        if ($endOfLine != null) {
          state.ch = $c;
          state.position = $pos;
          state.predicate--;
          break;
        } else {
          state.predicate--;
          if (state.ch >= 0) {
            state.nextChar();
            continue;
          } else {
            break;
          }
        }
      }
      parseEndOfLine(state);
      return Result.none;
    } else {
      return null;
    }
  }

  /// [void] **Space**
  /// ```txt
  /// `void`
  /// Space =>
  ///   [ \t]
  ///   ----
  ///   EndOfLine
  /// ```
  Result<void>? parseSpace(State state) {
    final $c = state.ch;
    final $ok = $c == 9 || $c == 32;
    // [ \t]
    if ($ok) {
      state.nextChar();
      return Result.none;
    } else {
      final $endOfLine = parseEndOfLine(state);
      if ($endOfLine != null) {
        return Result.none;
      } else {
        return null;
      }
    }
  }

  /// [void] **EndOfLine**
  /// ```txt
  /// `void`
  /// EndOfLine =>
  ///   "\r\n"
  ///   ----
  ///   [\n\r]
  /// ```
  Result<void>? parseEndOfLine(State state) {
    // "\r\n"
    if (state.ch == 13 && state.startsWith("\r\n")) {
      state.readChar(state.position + 2, true);
      return Result.none;
    } else {
      final $c = state.ch;
      final $ok = $c == 10 || $c == 13;
      // [\n\r]
      if ($ok) {
        state.nextChar();
        return Result.none;
      } else {
        return null;
      }
    }
  }

}
// dart format on

/// Shortened name (alias) for the [Result] type.
typedef Ok<T> = Result<T>;

class Result<R> {
  /// A successful result that does not provide any resulting value.
  static const none = Result<void>(null);

  // Resulting value.
  final R $1;

  const Result(this.$1);

  @override
  int get hashCode => $1.hashCode;

  @override
  bool operator ==(Object other) => other is Result<R> && other.$1 == $1;

  @override
  String toString() => $1.toString();
}

class State {
  static const _errorExpected = 0;

  static const _maxErrorCount = 64;

  /// Current character.
  int ch = -1;

  /// The furthest position of parsing.
  int farthestPosition = 0;

  /// The length of the input data.
  final int length;

  /// Current parsing position.
  int position = 0;

  /// Intended for internal use only.
  int predicate = 0;

  int _errorCount = 0;

  int _farthestError = 0;

  final List<int?> _flags = List.filled(_maxErrorCount, null);

  final String _input;

  final List<int?> _ends = List.filled(_maxErrorCount, null);

  final List<Object?> _messages = List.filled(_maxErrorCount, null);

  final List<int?> _starts = List.filled(_maxErrorCount, null);

  State(String input) : _input = input, length = input.length {
    readChar(0, true);
  }

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  /// Returns the size (as the length of the equivalent string) of the character
  /// [char].
  int charSize(int char) => char > 0xffff ? 2 : 1;

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  /// Adds (if possible) an error to the error buffer.
  ///
  /// Parameters:
  ///
  ///  - [message]: A message that describes the error.
  ///  - [position]: Farthest position of the error. Used to determine whether
  /// errors can be added in the error buffer.
  ///  - [start]: Starting position of the location. Used to display the start
  /// of an error.
  ///  - [end]: Ending position of the location. Used to display the end of an
  /// error.
  void error(String message, {int? position, int? start, int? end}) {
    position ??= this.position;
    if (_farthestError <= position) {
      if (_farthestError < position) {
        _farthestError = position;
        _errorCount = 0;
      }

      if (_errorCount < _messages.length) {
        _ends[_errorCount] = end;
        _flags[_errorCount] = null;
        _messages[_errorCount] = message;
        _starts[_errorCount] = start;
        _errorCount++;
      }
    }
  }

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  /// Adds (if possible) an `expected` error to the error buffer.
  ///
  /// Parameters:
  ///
  ///  - [expected]: One or more expected syntactic elements.
  ///  - [position]: Farthest position of the error. Used to determine whether
  /// errors can be added in the error buffer.
  ///  - [start]: Starting position of the location. Used to display the start
  /// of an error.
  ///
  /// Example with one element:
  ///
  /// ```dart
  /// state.errorExpected('string');
  /// ```
  /// Example with multiple elements:
  ///
  /// ```dart
  /// state.errorExpected(const ['string', 'number']);
  /// ```
  void errorExpected(Object expected, {int? position, int? start}) {
    position ??= this.position;
    if (_farthestError <= position) {
      if (_farthestError < position) {
        _farthestError = position;
        _errorCount = 0;
      }

      if (_errorCount < _messages.length) {
        _flags[_errorCount] = _errorExpected;
        _messages[_errorCount] = expected;
        _starts[_errorCount] = start;
        _errorCount++;
      }
    }
  }

  /// Converts error messages to errors and returns them as an error list.
  List<({int end, String message, int start})> getErrors() {
    final position = _farthestError;
    final errors = <({int end, String message, int start})>[];
    final expected = <int, Set<String>>{};
    for (var i = 0; i < _errorCount; i++) {
      final message = _messages[i];
      switch (_flags[i]) {
        case _errorExpected:
          final start = _starts[i] ??= position;
          if (message is List) {
            (expected[start] ??= {}).addAll(message.map((e) => '$e'));
          } else {
            (expected[start] ??= {}).add('$message');
          }

          break;
        default:
          var start = _starts[i];
          var end = _ends[i];
          if (end == null && start != null) {
            end = start;
          } else if (start == null && end != null) {
            start = end;
          }

          start ??= position;
          end ??= position;
          errors.add((message: '$message', start: start, end: end));
      }
    }

    if (expected.isNotEmpty) {
      for (final position in expected.keys) {
        final list = expected[position]!.toList();
        final message = 'Expected: ${list.map((e) => '\'$e\'').join(', ')}';
        errors.add((message: message, start: position, end: position));
      }
    }

    if (errors.isEmpty) {
      errors.add((
        message: 'Syntax error',
        start: farthestPosition,
        end: farthestPosition,
      ));
    }

    return errors.toSet().toList();
  }

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  /// Returns the position of the first match of [string] in input, starting at
  /// [position,.
  int indexOf(String string) => _input.indexOf(string, position);

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  @pragma('vm:unsafe:no-interrupts')
  /// Intended for internal use only.
  int? match(List<int> lowerCase, List<int> upperCase) {
    if (lowerCase.length != upperCase.length) {
      throw ArgumentError('The lengths of the lists do not match.');
    }

    var ch = this.ch;
    if (lowerCase.isNotEmpty) {
      if (ch == lowerCase[0] || ch == upperCase[0]) {
        var length = charSize(ch);
        ch = readChar(position, false);
        for (var i = 1; i < lowerCase.length; i++) {
          if (ch != lowerCase[i] && ch != upperCase[i]) {
            return null;
          }

          length += charSize(ch);
          ch = readChar(position + length, false);
        }

        return length;
      }
    }

    return 0;
  }

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  /// Reads the next character, advances the position to the next character and
  /// returns that character.
  int nextChar() {
    if (position >= length) {
      return ch = -1;
    }

    position += charSize(ch);
    if (predicate == 0 && farthestPosition < position) {
      farthestPosition = position;
    }

    if (position < length) {
      if ((ch = _input.codeUnitAt(position)) < 0xd800) {
        return ch;
      }

      if (ch < 0xe000) {
        final c = _input.codeUnitAt(position + 1);
        if ((c & 0xfc00) == 0xdc00) {
          return ch = 0x10000 + ((ch & 0x3ff) << 10) + (c & 0x3ff);
        }

        throw FormatException('Invalid UTF-16 character', this, position);
      }

      return ch;
    } else {
      return ch = -1;
    }
  }

  /// Intended for internal use only.
  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  int readChar(int position, bool advance) {
    var ch = -1;
    l:
    {
      if (position < length) {
        if ((ch = _input.codeUnitAt(position)) < 0xd800) {
          break l;
        }

        if (ch < 0xe000) {
          final c = _input.codeUnitAt(position + 1);
          if ((c & 0xfc00) == 0xdc00) {
            ch = 0x10000 + ((ch & 0x3ff) << 10) + (c & 0x3ff);
            break l;
          }

          throw FormatException('Invalid UTF-16 character', this, position);
        }
      }
    }

    if (advance) {
      this.position = position < length ? position : length;
      this.ch = ch;
      if (predicate == 0 && farthestPosition < position) {
        farthestPosition = position;
      }
    }

    return ch;
  }

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  @pragma('vm:unsafe:no-interrupts')
  /// The [startsWith] method is used to check if a string begins with a
  /// specified [substring].
  bool startsWith(String substring, [int? position]) {
    if (substring.isNotEmpty) {
      position ??= this.position;
      final count = substring.length - 1;
      if (position + count < length) {
        if (_input.codeUnitAt(position) == substring.codeUnitAt(0)) {
          for (var i = 1; i <= count; i++) {
            if (_input.codeUnitAt(position + i) != substring.codeUnitAt(i)) {
              return false;
            }
          }
        }

        return true;
      }
    } else {
      return true;
    }

    return false;
  }

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  /// Returns the lengths of the input data.
  int strlen(String string) => string.length;

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  /// Returns the substring of the input data.
  String substring(int start, int end) => _input.substring(start, end);

  @override
  String toString() {
    if (position >= length) {
      return '';
    }

    var rest = length - position;
    if (rest > 80) {
      rest = 80;
    }

    var line = substring(position, position + rest);
    line = line.replaceAll('\n', r'\n');
    return '|$position|$line';
  }
}
