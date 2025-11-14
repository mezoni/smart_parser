//ignore_for_file: prefer_conditional_assignment, prefer_final_locals

import 'package:source_span/source_span.dart';

import '../expressions.dart';
import '../grammar.dart';

Grammar parse(String source) {
  const parser = SmartParser();
  final state = State(source);
  final result = parser.parseStart(state);
  if (result == null) {
    final file = SourceFile.fromString(source);
    throw FormatException(state
        .getErrors()
        .map((e) => file.span(e.start, e.end).message(e.message))
        .join('\n'));
  }

  return result.$1;
}

// dart format off
class SmartParser {
  const SmartParser();

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
    final $0 = state.position;
    parseS(state);
    final $1 = parseGlobals(state);
    final g = $1?.$1;
    final $2 = parseMembers(state);
    final m = $2?.$1;
    final $3 = <Production>[];
    while (true) {
      final $4 = parseProduction(state);
      if ($4 != null) {
        $3.add($4.$1);
        continue;
      }
      break;
    }
    if ($3.isNotEmpty) {
      final p = $3;
      state.predicate++;
      final $5 = state.position;
      var $6 = true;
      final $7 = state.peek();
      if ($7 >= 0) {
        state.position += $7 > 0xffff ? 2 : 1;
        $6 = false;
        state.backtrack($5);
      }
      state.predicate--;
      if ($6) {
        final $8 = Grammar(globals: g, members: m, productions: p);
        return Ok($8);
      }
    }
    state.backtrack($0);
    return null;
  }

  /// [String] **Globals**
  /// ```txt
  /// `String`
  /// Globals =>
  ///   '%{'
  ///   { final index = state.indexOf('\u{7D}%'); }
  ///   $ = <@position({ index == -1 ? state.length : index })>
  ///   '}%' S
  /// ```
  Result<String>? parseGlobals(State state) {
    final $0 = state.position;
    final $1 = state.peek();
    if ($1 == 37 && state.startsWith('%{')) {
      state.position += 2;
      final index = state.indexOf('\u{7D}%');
      final $2 = state.position;
      state.position = index == -1 ? state.length : index;
      final $3 = state.substring($2, state.position);
      final $4 = state.peek();
      if ($4 == 125 && state.startsWith('}%')) {
        state.position += 2;
        parseS(state);
        return Ok($3);
      } else {
        state.errorExpected('}%');
      }
    } else {
      state.errorExpected('%{');
    }
    state.backtrack($0);
    return null;
  }

  /// [String] **Members**
  /// ```txt
  /// `String`
  /// Members =>
  ///   '%%'
  ///   { final index = state.indexOf('%%'); }
  ///   $ = <@position({ index == -1 ? state.length : index })>
  ///   '%%' S
  /// ```
  Result<String>? parseMembers(State state) {
    final $0 = state.position;
    final $1 = state.peek();
    if ($1 == 37 && state.startsWith('%%')) {
      state.position += 2;
      final index = state.indexOf('%%');
      final $2 = state.position;
      state.position = index == -1 ? state.length : index;
      final $3 = state.substring($2, state.position);
      final $4 = state.peek();
      if ($4 == 37 && state.startsWith('%%')) {
        state.position += 2;
        parseS(state);
        return Ok($3);
      } else {
        state.errorExpected('%%');
      }
    } else {
      state.errorExpected('%%');
    }
    state.backtrack($0);
    return null;
  }

  /// [Production] **Production**
  /// ```txt
  /// `Production`
  /// Production =>
  ///   { final start = state.position; }
  ///   t = Type
  ///   i = ProductionName
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
    final $0 = state.position;
    final start = state.position;
    final $1 = parseType(state);
    if ($1 != null) {
      final t = $1.$1;
      final $2 = parseProductionName(state);
      if ($2 != null) {
        final i = $2.$1;
        final $3 = state.peek();
        if ($3 == 61 && state.startsWith('=>')) {
          state.position += 2;
          parseS(state);
          final $4 = parseExpression(state);
          if ($4 != null) {
            final e = $4.$1;
            final $5 = state.peek();
            // ';'
            if ($5 == 59) {
              state.position += 1;
            }
            parseS(state);
            final end = state.position;
            final src = state.substring(start, end).trimRight();
            final $6 = Production(expression: e, name: i, sourceCode: src, type: t);
            return Ok($6);
          }
        } else {
          state.errorExpected('=>');
        }
      }
    }
    state.backtrack($0);
    return null;
  }

  /// [Expression] **Expression**
  /// ```txt
  /// `Expression`
  /// Expression =>
  ///   {
  ///     final pos = state.position;
  ///   }
  ///   e = OrderedChoice
  ///   { e.sourceCode = state.substring(pos, state.position).trimRight(); }
  ///   $ = { e }
  ///   ~ { state.errorExpected('expression'); }
  /// ```
  Result<Expression>? parseExpression(State state) {
    final $0 = state.setErrorState();
    final $1 = state.setFarthestPosition();
    final pos = state.position;
    final $2 = parseOrderedChoice(state);
    if ($2 != null) {
      final e = $2.$1;
      e.sourceCode = state.substring(pos, state.position).trimRight();
      final $3 = e;
      state.restoreFarthestPosition($1);
      state.restoreErrorState($0);
      return Ok($3);
    }
    state.errorExpected('expression');
    state.restoreFarthestPosition($1);
    state.restoreErrorState($0);
    return null;
  }

  /// [Expression] **OrderedChoice**
  /// ```txt
  /// `Expression`
  /// OrderedChoice =>
  ///   n = Sequence
  ///   { final l = [n]; }
  ///   @while (0) {
  ///     (
  ///       '/'
  ///       ----
  ///       '-'+
  ///     ) S
  ///     n = Sequence
  ///     { l.add(n); }
  ///   }
  ///   $ = { OrderedChoiceExpression(expressions: l) }
  /// ```
  Result<Expression>? parseOrderedChoice(State state) {
    final $0 = state.position;
    final $1 = parseSequence(state);
    if ($1 != null) {
      final n = $1.$1;
      final l = [n];
      while (true) {
        final $2 = state.position;
        var $3 = false;
        $l:
        {
          final $4 = state.peek();
          // '/'
          if ($4 == 47) {
            state.position += 1;
            $3 = true;
            break $l;
          } else {
            state.errorExpected('/');
          }
          var $5 = false;
          while (true) {
            final $6 = state.peek();
            // '-'
            if ($6 == 45) {
              state.position += 1;
              $5 = true;
              continue;
            } else {
              state.errorExpected('-');
            }
            break;
          }
          if ($5) {
            $3 = true;
            break $l;
          }
        }
        if ($3) {
          parseS(state);
          final $7 = parseSequence(state);
          if ($7 != null) {
            final n = $7.$1;
            l.add(n);
            continue;
          }
        }
        state.backtrack($2);
        break;
      }
      final $8 = OrderedChoiceExpression(expressions: l);
      return Ok($8);
    }
    state.backtrack($0);
    return null;
  }

  /// [Expression] **Sequence**
  /// ```txt
  /// `Expression`
  /// Sequence =>
  ///   { final pos = state.position; }
  ///   n = (
  ///     { final pos = state.position; }
  ///     e = SequenceElement
  ///     { e.sourceCode = state.substring(pos, state.position).trimRight(); }
  ///     $ = `Expression` { e }
  ///   )+
  ///   h = (
  ///     '~' S
  ///     $ = Block
  ///   )?
  ///   e = { SequenceExpression(errorHandler: h, expressions: n) }
  ///   { e.sourceCode = state.substring(pos, state.position).trimRight(); }
  ///   $ = { e }
  /// ```
  Result<Expression>? parseSequence(State state) {
    final $0 = state.position;
    final pos = state.position;
    final $1 = <Expression>[];
    while (true) {
      final pos = state.position;
      final $2 = parseSequenceElement(state);
      if ($2 != null) {
        final e = $2.$1;
        e.sourceCode = state.substring(pos, state.position).trimRight();
        Expression $3 = e;
        $1.add($3);
        continue;
      }
      break;
    }
    if ($1.isNotEmpty) {
      final n = $1;
      String? $4;
      $l:
      {
        final $5 = state.position;
        final $6 = state.peek();
        // '~'
        if ($6 == 126) {
          state.position += 1;
          parseS(state);
          final $7 = parseBlock(state);
          if ($7 != null) {
            $4 = $7.$1;
            break $l;
          }
        } else {
          state.errorExpected('~');
        }
        state.backtrack($5);
      }
      final h = $4;
      final $8 = SequenceExpression(errorHandler: h, expressions: n);
      final e = $8;
      e.sourceCode = state.substring(pos, state.position).trimRight();
      final $9 = e;
      return Ok($9);
    }
    state.backtrack($0);
    return null;
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
    final $0 = parseAction(state);
    if ($0 != null) {
      return $0;
    }
    final $1 = state.position;
    Result<String>? $2;
    $l:
    {
      final $3 = parseVariableName(state);
      if ($3 != null) {
        $2 = $3;
        break $l;
      }
      final $4 = state.peek();
      if ($4 == 36) {
        state.position += 1;
        parseS(state);
        $2 = const Ok('\$');
        break $l;
      } else {
        state.errorExpected('\$');
      }
      state.backtrack($1);
    }
    if ($2 != null) {
      final n = $2.$1;
      final $5 = state.peek();
      // '='
      if ($5 == 61) {
        state.position += 1;
        parseS(state);
        Result<Expression>? $6;
        $l1:
        {
          final $7 = parsePrefix(state);
          if ($7 != null) {
            $6 = $7;
            break $l1;
          }
          final $8 = parseValue(state);
          if ($8 != null) {
            $6 = $8;
            break $l1;
          }
        }
        if ($6 != null) {
          final e = $6.$1;
          e.semanticValue = n;
          final $9 = e;
          return Ok($9);
        }
      } else {
        state.errorExpected('=');
      }
    }
    state.backtrack($1);
    final $10 = parsePrefix(state);
    if ($10 != null) {
      return $10;
    }
    return null;
  }

  /// [Expression] **Prefix**
  /// ```txt
  /// `Expression`
  /// Prefix =>
  ///   '!' S
  ///   $ = (
  ///     b = Block
  ///     $ = { PredicateExpression(negate: true, predicate: b) }
  ///     ----
  ///     s = Suffix
  ///     $ = { NotPredicateExpression(expression: s) }
  ///   )
  ///   ----
  ///   '&' S
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
    final $0 = state.position;
    final $1 = state.peek();
    // '!'
    if ($1 == 33) {
      state.position += 1;
      parseS(state);
      final $2 = parseBlock(state);
      if ($2 != null) {
        final b = $2.$1;
        final $3 = PredicateExpression(negate: true, predicate: b);
        return Ok($3);
      }
      final $4 = parseSuffix(state);
      if ($4 != null) {
        final s = $4.$1;
        final $5 = NotPredicateExpression(expression: s);
        return Ok($5);
      }
    } else {
      state.errorExpected('!');
    }
    state.backtrack($0);
    // '&'
    if ($1 == 38) {
      state.position += 1;
      parseS(state);
      final $6 = parseBlock(state);
      if ($6 != null) {
        final b = $6.$1;
        final $7 = PredicateExpression(negate: false, predicate: b);
        return Ok($7);
      }
      final $8 = parseSuffix(state);
      if ($8 != null) {
        final s = $8.$1;
        final $9 = AndPredicateExpression(expression: s);
        return Ok($9);
      }
    } else {
      state.errorExpected('&');
    }
    state.backtrack($0);
    final $10 = parseSuffix(state);
    if ($10 != null) {
      return $10;
    }
    return null;
  }

  /// [Expression] **Suffix**
  /// ```txt
  /// `Expression`
  /// Suffix =>
  ///   p = Primary
  ///   $ = (
  ///     '*' S
  ///     $ = { ZeroOrMoreExpression(expression: p) }
  ///     ----
  ///     '+' S
  ///     $ = { OneOrMoreExpression(expression: p) }
  ///     ----
  ///     '?' S
  ///     $ = { OptionalExpression(expression: p) }
  ///     ---
  ///     ""
  ///     $ = { p }
  ///   )
  /// ```
  Result<Expression>? parseSuffix(State state) {
    final $0 = state.position;
    final $1 = parsePrimary(state);
    if ($1 != null) {
      final p = $1.$1;
      final $2 = state.position;
      final $3 = state.peek();
      // '*'
      if ($3 == 42) {
        state.position += 1;
        parseS(state);
        final $4 = ZeroOrMoreExpression(expression: p);
        return Ok($4);
      } else {
        state.errorExpected('*');
      }
      state.backtrack($2);
      // '+'
      if ($3 == 43) {
        state.position += 1;
        parseS(state);
        final $5 = OneOrMoreExpression(expression: p);
        return Ok($5);
      } else {
        state.errorExpected('+');
      }
      state.backtrack($2);
      // '?'
      if ($3 == 63) {
        state.position += 1;
        parseS(state);
        final $6 = OptionalExpression(expression: p);
        return Ok($6);
      } else {
        state.errorExpected('?');
      }
      state.backtrack($2);
      final $7 = p;
      return Ok($7);
    }
    state.backtrack($0);
    return null;
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
  ///   )
  ///   ~ { state.errorExpected('expression'); }
  /// ```
  Result<Expression>? parsePrimary(State state) {
    final $0 = state.setErrorState();
    final $1 = state.setFarthestPosition();
    final $2 = parseSymbol(state);
    if ($2 != null) {
      return $2;
    }
    final $3 = parseCharacterClass(state);
    if ($3 != null) {
      return $3;
    }
    final $4 = parseLiteral(state);
    if ($4 != null) {
      return $4;
    }
    final $5 = parseGroup(state);
    if ($5 != null) {
      return $5;
    }
    final $6 = parseWhile(state);
    if ($6 != null) {
      return $6;
    }
    final $7 = parseAnyCharacter(state);
    if ($7 != null) {
      return $7;
    }
    final $8 = parseCapture(state);
    if ($8 != null) {
      return $8;
    }
    final $9 = parsePosition(state);
    if ($9 != null) {
      return $9;
    }
    state.errorExpected('expression');
    state.restoreFarthestPosition($1);
    state.restoreErrorState($0);
    return null;
  }

  /// [Expression] **Symbol**
  /// ```txt
  /// `Expression`
  /// Symbol =>
  ///   n = ProductionName S
  ///   $ = { ProductionExpression(name: n) }
  /// ```
  Result<Expression>? parseSymbol(State state) {
    final $0 = state.position;
    final $1 = parseProductionName(state);
    if ($1 != null) {
      final n = $1.$1;
      parseS(state);
      final $2 = ProductionExpression(name: n);
      return Ok($2);
    }
    state.backtrack($0);
    return null;
  }

  /// [Expression] **Action**
  /// ```txt
  /// `Expression`
  /// Action =>
  ///   b = Block
  ///   $ = { ActionExpression(source: b) }
  /// ```
  Result<Expression>? parseAction(State state) {
    final $0 = parseBlock(state);
    if ($0 != null) {
      final b = $0.$1;
      final $1 = ActionExpression(source: b);
      return Ok($1);
    }
    return null;
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
    final $0 = state.position;
    final $1 = parseType(state);
    final t = $1?.$1;
    final $2 = parseBlock(state);
    if ($2 != null) {
      final b = $2.$1;
      final $3 = ValueExpression(source: b, valueType: t);
      return Ok($3);
    }
    state.backtrack($0);
    return null;
  }

  /// [Expression] **AnyCharacter**
  /// ```txt
  /// `Expression`
  /// AnyCharacter =>
  ///   '.' S
  ///   $ = { AnyCharacterExpression() }
  /// ```
  Result<Expression>? parseAnyCharacter(State state) {
    final $0 = state.position;
    final $1 = state.peek();
    // '.'
    if ($1 == 46) {
      state.position += 1;
      parseS(state);
      final $2 = AnyCharacterExpression();
      return Ok($2);
    } else {
      state.errorExpected('.');
    }
    state.backtrack($0);
    return null;
  }

  /// [Expression] **Capture**
  /// ```txt
  /// `Expression`
  /// Capture =>
  ///   '<' S
  ///   e = Expression
  ///   '>' S
  ///   $ = { CaptureExpression(expression: e) }
  /// ;
  /// ```
  Result<Expression>? parseCapture(State state) {
    final $0 = state.position;
    final $1 = state.peek();
    // '<'
    if ($1 == 60) {
      state.position += 1;
      parseS(state);
      final $2 = parseExpression(state);
      if ($2 != null) {
        final e = $2.$1;
        final $3 = state.peek();
        // '>'
        if ($3 == 62) {
          state.position += 1;
          parseS(state);
          final $4 = CaptureExpression(expression: e);
          return Ok($4);
        } else {
          state.errorExpected('>');
        }
      }
    } else {
      state.errorExpected('<');
    }
    state.backtrack($0);
    return null;
  }

  /// [Expression] **CharacterClass**
  /// ```txt
  /// `Expression`
  /// CharacterClass =>
  ///   { var negate = false; }
  ///   (
  ///     '[^'
  ///     { negate = true; }
  ///     ----
  ///     '['
  ///   )
  ///   r = @while (1) {
  ///     ! ']'
  ///     $ = Range
  ///   }
  ///   ']' S
  ///   $ = { CharacterClassExpression(ranges: r, negate: negate) }
  /// ```
  Result<Expression>? parseCharacterClass(State state) {
    final $0 = state.position;
    var negate = false;
    var $1 = false;
    $l:
    {
      final $2 = state.peek();
      if ($2 == 91 && state.startsWith('[^')) {
        state.position += 2;
        negate = true;
        $1 = true;
        break $l;
      } else {
        state.errorExpected('[^');
      }
      // '['
      if ($2 == 91) {
        state.position += 1;
        $1 = true;
        break $l;
      } else {
        state.errorExpected('[');
      }
    }
    if ($1) {
      final $3 = <(int, int)>[];
      while (true) {
        final $4 = state.position;
        state.predicate++;
        var $5 = true;
        final $6 = state.peek();
        // ']'
        if ($6 == 93) {
          state.position += 1;
          $5 = false;
          state.backtrack($4);
        } else {
          state.errorExpected(']');
        }
        state.predicate--;
        if ($5) {
          final $7 = parseRange(state);
          if ($7 != null) {
            $3.add($7.$1);
            continue;
          }
        }
        state.backtrack($4);
        break;
      }
      if ($3.isNotEmpty) {
        final r = $3;
        final $8 = state.peek();
        // ']'
        if ($8 == 93) {
          state.position += 1;
          parseS(state);
          final $9 = CharacterClassExpression(ranges: r, negate: negate);
          return Ok($9);
        } else {
          state.errorExpected(']');
        }
      }
    }
    state.backtrack($0);
    return null;
  }

  /// [Expression] **Group**
  /// ```txt
  /// `Expression`
  /// Group =>
  ///   t = Type?
  ///   '(' S
  ///   e = Expression
  ///   ')' S
  ///   g = { GroupExpression(expression: e) }
  ///   { t != null ? g.type = t : null; }
  ///   $ = { g }
  /// ```
  Result<Expression>? parseGroup(State state) {
    final $0 = state.position;
    final $1 = parseType(state);
    final t = $1?.$1;
    final $2 = state.peek();
    // '('
    if ($2 == 40) {
      state.position += 1;
      parseS(state);
      final $3 = parseExpression(state);
      if ($3 != null) {
        final e = $3.$1;
        final $4 = state.peek();
        // ')'
        if ($4 == 41) {
          state.position += 1;
          parseS(state);
          final $5 = GroupExpression(expression: e);
          final g = $5;
          t != null ? g.type = t : null;
          final $6 = g;
          return Ok($6);
        } else {
          state.errorExpected(')');
        }
      }
    } else {
      state.errorExpected('(');
    }
    state.backtrack($0);
    return null;
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
    final $0 = parseSQString(state);
    if ($0 != null) {
      final s = $0.$1;
      final $1 = LiteralExpression(text: s);
      return Ok($1);
    }
    final $2 = parseDQString(state);
    if ($2 != null) {
      final s = $2.$1;
      final $3 = LiteralExpression(isPrimitive: true, text: s);
      return Ok($3);
    }
    return null;
  }

  /// [Expression] **Position**
  /// ```txt
  /// `Expression`
  /// Position =>
  ///   '@position' S
  ///   '(' S
  ///   b = Block
  ///   ')' S
  ///   $ = { PositionExpression(action: b) }
  /// ```
  Result<Expression>? parsePosition(State state) {
    final $0 = state.position;
    final $1 = state.peek();
    if ($1 == 64 && state.startsWith('@position')) {
      state.position += 9;
      parseS(state);
      final $2 = state.peek();
      // '('
      if ($2 == 40) {
        state.position += 1;
        parseS(state);
        final $3 = parseBlock(state);
        if ($3 != null) {
          final b = $3.$1;
          final $4 = state.peek();
          // ')'
          if ($4 == 41) {
            state.position += 1;
            parseS(state);
            final $5 = PositionExpression(action: b);
            return Ok($5);
          } else {
            state.errorExpected(')');
          }
        }
      } else {
        state.errorExpected('(');
      }
    } else {
      state.errorExpected('@position');
    }
    state.backtrack($0);
    return null;
  }

  /// [Expression] **While**
  /// ```txt
  /// `Expression`
  ///   While =>
  ///   '@while' S
  ///   '(' S
  ///   r = WhileRange
  ///   ')' S
  ///   '{' S
  ///   e = Expression
  ///   '}' S
  ///   $ = { WhileExpression(expression: e, range: r) }
  /// ```
  Result<Expression>? parseWhile(State state) {
    final $0 = state.position;
    final $1 = state.peek();
    if ($1 == 64 && state.startsWith('@while')) {
      state.position += 6;
      parseS(state);
      final $2 = state.peek();
      // '('
      if ($2 == 40) {
        state.position += 1;
        parseS(state);
        final $3 = parseWhileRange(state);
        if ($3 != null) {
          final r = $3.$1;
          final $4 = state.peek();
          // ')'
          if ($4 == 41) {
            state.position += 1;
            parseS(state);
            final $5 = state.peek();
            // '{'
            if ($5 == 123) {
              state.position += 1;
              parseS(state);
              final $6 = parseExpression(state);
              if ($6 != null) {
                final e = $6.$1;
                final $7 = state.peek();
                // '}'
                if ($7 == 125) {
                  state.position += 1;
                  parseS(state);
                  final $8 = WhileExpression(expression: e, range: r);
                  return Ok($8);
                } else {
                  state.errorExpected('}');
                }
              }
            } else {
              state.errorExpected('{');
            }
          } else {
            state.errorExpected(')');
          }
        }
      } else {
        state.errorExpected('(');
      }
    } else {
      state.errorExpected('@while');
    }
    state.backtrack($0);
    return null;
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
    final $0 = state.position;
    final $1 = parseDecValue(state);
    if ($1 != null) {
      final m = $1.$1;
      parseS(state);
      int? $2;
      $l:
      {
        final $3 = state.position;
        final $4 = state.peek();
        // ','
        if ($4 == 44) {
          state.position += 1;
          parseS(state);
          final $5 = parseDecValue1(state);
          if ($5 != null) {
            parseS(state);
            $2 = $5.$1;
            break $l;
          }
        } else {
          state.errorExpected(',');
        }
        state.backtrack($3);
      }
      final n = $2;
      final $6 = (m, n);
      return Ok($6);
    }
    state.backtrack($0);
    return null;
  }

  /// [String] **Type**
  /// ```txt
  /// `String`
  /// Type =>
  ///   '`'
  ///   $ = <
  ///     @while (0) {
  ///       ! [`]
  ///       [a-zA-Z0-9_$<(\{,:\})>? ]
  ///     }
  ///   >
  ///   '`' S
  ///   ~ { state.errorExpected('type'); }
  /// ```
  Result<String>? parseType(State state) {
    final $0 = state.setErrorState();
    final $1 = state.setFarthestPosition();
    final $2 = state.position;
    final $3 = state.peek();
    // '`'
    if ($3 == 96) {
      state.position += 1;
      final $4 = state.position;
      while (true) {
        final $5 = state.position;
        state.predicate++;
        var $6 = true;
        final $7 = state.peek();
        // '`'
        if ($7 == 96) {
          state.position += 1;
          $6 = false;
          state.backtrack($5);
        }
        state.predicate--;
        if ($6) {
          final $8 = state.peek();
          final $9 = $8 <= 60 ? $8 >= 60 || $8 <= 41 ? $8 >= 40 || $8 == 32 || $8 == 36 : $8 == 44 || $8 >= 48 && $8 <= 58 : $8 <= 95 ? $8 >= 95 || $8 <= 63 ? $8 >= 62 : $8 >= 65 && $8 <= 90 : $8 <= 123 ? $8 >= 97 : $8 == 125;
          if ($9) {
            state.position += 1;
            continue;
          }
        }
        state.backtrack($5);
        break;
      }
      final $10 = state.substring($4, state.position);
      final $11 = state.peek();
      // '`'
      if ($11 == 96) {
        state.position += 1;
        parseS(state);
        state.restoreFarthestPosition($1);
        state.restoreErrorState($0);
        return Ok($10);
      } else {
        state.errorExpected('`');
      }
    } else {
      state.errorExpected('`');
    }
    state.backtrack($2);
    state.errorExpected('type');
    state.restoreFarthestPosition($1);
    state.restoreErrorState($0);
    return null;
  }

  /// [String] **DQString**
  /// ```txt
  /// `String`
  /// DQString =>
  ///   '"'
  ///   p = @while (0) {
  ///     <[{20-21}{23-5B}{5D-10FFFF}]+>
  ///     ---
  ///     Escaped
  ///   }
  ///   '"' S
  ///   $ = { p.join() }
  /// ```
  Result<String>? parseDQString(State state) {
    final $0 = state.position;
    final $1 = state.peek();
    // '"'
    if ($1 == 34) {
      state.position += 1;
      final $2 = <String>[];
      while (true) {
        final $3 = state.position;
        var $4 = false;
        while (true) {
          final $5 = state.peek();
          final $6 = $5 <= 91 ? $5 >= 35 || $5 >= 32 && $5 <= 33 : $5 >= 93 && $5 <= 1114111;
          if ($6) {
            state.position += $5 > 0xffff ? 2 : 1;
            $4 = true;
            continue;
          }
          break;
        }
        if ($4) {
          final $7 = state.substring($3, state.position);
          $2.add($7);
          continue;
        }
        final $8 = parseEscaped(state);
        if ($8 != null) {
          $2.add($8.$1);
          continue;
        }
        break;
      }
      final p = $2;
      final $9 = state.peek();
      // '"'
      if ($9 == 34) {
        state.position += 1;
        parseS(state);
        final $10 = p.join();
        return Ok($10);
      } else {
        state.errorExpected('"');
      }
    } else {
      state.errorExpected('"');
    }
    state.backtrack($0);
    return null;
  }

  /// [String] **SQString**
  /// ```txt
  /// `String`
  /// SQString =>
  ///   '\''
  ///   p = @while (0) {
  ///     <[{20-26}{28-5B}{5D-10FFFF}]+>
  ///     ---
  ///     Escaped
  ///   }
  ///   '\'' S
  ///   $ = { p.join() }
  /// ```
  Result<String>? parseSQString(State state) {
    final $0 = state.position;
    final $1 = state.peek();
    // '\''
    if ($1 == 39) {
      state.position += 1;
      final $2 = <String>[];
      while (true) {
        final $3 = state.position;
        var $4 = false;
        while (true) {
          final $5 = state.peek();
          final $6 = $5 <= 91 ? $5 >= 40 || $5 >= 32 && $5 <= 38 : $5 >= 93 && $5 <= 1114111;
          if ($6) {
            state.position += $5 > 0xffff ? 2 : 1;
            $4 = true;
            continue;
          }
          break;
        }
        if ($4) {
          final $7 = state.substring($3, state.position);
          $2.add($7);
          continue;
        }
        final $8 = parseEscaped(state);
        if ($8 != null) {
          $2.add($8.$1);
          continue;
        }
        break;
      }
      final p = $2;
      final $9 = state.peek();
      // '\''
      if ($9 == 39) {
        state.position += 1;
        parseS(state);
        final $10 = p.join();
        return Ok($10);
      } else {
        state.errorExpected('\'');
      }
    } else {
      state.errorExpected('\'');
    }
    state.backtrack($0);
    return null;
  }

  /// [String] **Escaped**
  /// ```txt
  /// `String`
  /// Escaped =>
  ///   "\\"
  ///   $ = (
  ///     "u"
  ///     "{"
  ///     v = HexValue
  ///     "}"
  ///     $ = {String.fromCharCode(v) }
  ///     ~ { state.errorIncorrect('Unterminated Unicode escape sequence'); }
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
  /// ```
  Result<String>? parseEscaped(State state) {
    final $0 = state.position;
    final $1 = state.peek();
    // '\\'
    if ($1 == 92) {
      state.position += 1;
      final $2 = state.setErrorState();
      final $3 = state.setFarthestPosition();
      final $4 = state.position;
      final $5 = state.peek();
      // 'u'
      if ($5 == 117) {
        state.position += 1;
        final $6 = state.peek();
        // '{'
        if ($6 == 123) {
          state.position += 1;
          final $7 = parseHexValue(state);
          if ($7 != null) {
            final v = $7.$1;
            final $8 = state.peek();
            // '}'
            if ($8 == 125) {
              state.position += 1;
              final $9 = String.fromCharCode(v);
              state.restoreFarthestPosition($3);
              state.restoreErrorState($2);
              return Ok($9);
            }
          }
        }
      }
      state.backtrack($4);
      state.errorIncorrect('Unterminated Unicode escape sequence');
      state.restoreFarthestPosition($3);
      state.restoreErrorState($2);
      // 'a'
      if ($5 == 97) {
        state.position += 1;
        const $10 = '\u0007';
        return const Ok($10);
      }
      // 'b'
      if ($5 == 98) {
        state.position += 1;
        const $11 = '\b';
        return const Ok($11);
      }
      // 'e'
      if ($5 == 101) {
        state.position += 1;
        const $12 = '\u001B';
        return const Ok($12);
      }
      // 'f'
      if ($5 == 102) {
        state.position += 1;
        const $13 = '\f';
        return const Ok($13);
      }
      // 'n'
      if ($5 == 110) {
        state.position += 1;
        const $14 = '\n';
        return const Ok($14);
      }
      // 'r'
      if ($5 == 114) {
        state.position += 1;
        const $15 = '\r';
        return const Ok($15);
      }
      // 't'
      if ($5 == 116) {
        state.position += 1;
        const $16 = '\t';
        return const Ok($16);
      }
      // 'v'
      if ($5 == 118) {
        state.position += 1;
        const $17 = '\v';
        return const Ok($17);
      }
      // '\\'
      if ($5 == 92) {
        state.position += 1;
        const $18 = '\\';
        return const Ok($18);
      }
      // '"'
      if ($5 == 34) {
        state.position += 1;
        const $19 = '"';
        return const Ok($19);
      }
      // '\''
      if ($5 == 39) {
        state.position += 1;
        const $20 = '\'';
        return const Ok($20);
      }
    }
    state.backtrack($0);
    return null;
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
  ///     "{"
  ///     $ = HexValue
  ///     "}"
  ///     ~ { state.errorIncorrect('Unterminated Unicode escape sequence'); }
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
  /// ```
  Result<int>? parseRangeChar(State state) {
    final $0 = state.position;
    state.predicate++;
    var $1 = true;
    final $2 = state.peek();
    // '\\'
    if ($2 == 92) {
      state.position += 1;
      $1 = false;
      state.backtrack($0);
    }
    state.predicate--;
    if ($1) {
      final $3 = state.peek();
      final $4 = !($3 <= 93 ? $3 >= 91 || $3 >= 0 && $3 <= 31 : $3 == 123 || $3 == 125) && !($3 < 0);
      if ($4) {
        state.position += $3 > 0xffff ? 2 : 1;
        return Ok($3);
      }
    }
    state.backtrack($0);
    // '\\'
    if ($2 == 92) {
      state.position += 1;
      final $5 = state.setErrorState();
      final $6 = state.setFarthestPosition();
      final $7 = state.position;
      final $8 = state.peek();
      // 'u'
      if ($8 == 117) {
        state.position += 1;
        final $9 = state.peek();
        // '{'
        if ($9 == 123) {
          state.position += 1;
          final $10 = parseHexValue(state);
          if ($10 != null) {
            final $11 = state.peek();
            // '}'
            if ($11 == 125) {
              state.position += 1;
              state.restoreFarthestPosition($6);
              state.restoreErrorState($5);
              return $10;
            }
          }
        }
      }
      state.backtrack($7);
      state.errorIncorrect('Unterminated Unicode escape sequence');
      state.restoreFarthestPosition($6);
      state.restoreErrorState($5);
      // 'a'
      if ($8 == 97) {
        state.position += 1;
        const $12 = 0x07;
        return const Ok($12);
      }
      // 'b'
      if ($8 == 98) {
        state.position += 1;
        const $13 = 0x08;
        return const Ok($13);
      }
      // 'e'
      if ($8 == 101) {
        state.position += 1;
        const $14 = 0x1B;
        return const Ok($14);
      }
      // 'f'
      if ($8 == 102) {
        state.position += 1;
        const $15 = 0x0C;
        return const Ok($15);
      }
      // 'n'
      if ($8 == 110) {
        state.position += 1;
        const $16 = 0x0A;
        return const Ok($16);
      }
      // 'r'
      if ($8 == 114) {
        state.position += 1;
        const $17 = 0x0D;
        return const Ok($17);
      }
      // 't'
      if ($8 == 116) {
        state.position += 1;
        const $18 = 0x09;
        return const Ok($18);
      }
      // 'v'
      if ($8 == 118) {
        state.position += 1;
        const $19 = 0x0B;
        return const Ok($19);
      }
      // '-'
      if ($8 == 45) {
        state.position += 1;
        const $20 = 0x2D;
        return const Ok($20);
      }
      // '['
      if ($8 == 91) {
        state.position += 1;
        const $21 = 0x5B;
        return const Ok($21);
      }
      // '\\'
      if ($8 == 92) {
        state.position += 1;
        const $22 = 0x5C;
        return const Ok($22);
      }
      // ']'
      if ($8 == 93) {
        state.position += 1;
        const $23 = 0x5D;
        return const Ok($23);
      }
      // '^'
      if ($8 == 94) {
        state.position += 1;
        const $24 = 0x5E;
        return const Ok($24);
      }
      // '{'
      if ($8 == 123) {
        state.position += 1;
        const $25 = 0x7B;
        return const Ok($25);
      }
      // '}'
      if ($8 == 125) {
        state.position += 1;
        const $26 = 0x7D;
        return const Ok($26);
      }
    }
    state.backtrack($0);
    return null;
  }

  /// [int] **DecValue**
  /// ```txt
  /// `int`
  /// DecValue =>
  ///   n = <[0-9]+>
  ///   $ = { int.parse(n) }
  ///   ~ { state.errorExpected('number'); }
  /// ```
  Result<int>? parseDecValue(State state) {
    final $0 = state.setErrorState();
    final $1 = state.setFarthestPosition();
    final $2 = state.position;
    var $3 = false;
    while (true) {
      final $4 = state.peek();
      final $5 = $4 >= 48 && $4 <= 57;
      if ($5) {
        state.position += 1;
        $3 = true;
        continue;
      }
      break;
    }
    if ($3) {
      final $6 = state.substring($2, state.position);
      final n = $6;
      final $7 = int.parse(n);
      state.restoreFarthestPosition($1);
      state.restoreErrorState($0);
      return Ok($7);
    }
    state.errorExpected('number');
    state.restoreFarthestPosition($1);
    state.restoreErrorState($0);
    return null;
  }

  /// [int] **DecValue1**
  /// ```txt
  /// `int`
  /// DecValue1 =>
  ///   n = <[1-9] [0-9]*>
  ///   $ = { int.parse(n) }
  ///   ~ { state.errorExpected('number'); }
  /// ```
  Result<int>? parseDecValue1(State state) {
    final $0 = state.setErrorState();
    final $1 = state.setFarthestPosition();
    final $2 = state.position;
    final $3 = state.peek();
    final $4 = $3 >= 49 && $3 <= 57;
    if ($4) {
      state.position += 1;
      while (true) {
        final $5 = state.peek();
        final $6 = $5 >= 48 && $5 <= 57;
        if ($6) {
          state.position += 1;
          continue;
        }
        break;
      }
      final $7 = state.substring($2, state.position);
      final n = $7;
      final $8 = int.parse(n);
      state.restoreFarthestPosition($1);
      state.restoreErrorState($0);
      return Ok($8);
    }
    state.backtrack($2);
    state.errorExpected('number');
    state.restoreFarthestPosition($1);
    state.restoreErrorState($0);
    return null;
  }

  /// [int] **HexValue**
  /// ```txt
  /// `int`
  /// HexValue =>
  ///   n = <[a-fA-F0-9]+>
  ///   $ = { int.parse(n, radix: 16) }
  ///   ~ { state.errorExpected('hexadecimal number'); }
  /// ```
  Result<int>? parseHexValue(State state) {
    final $0 = state.setErrorState();
    final $1 = state.setFarthestPosition();
    final $2 = state.position;
    var $3 = false;
    while (true) {
      final $4 = state.peek();
      final $5 = $4 <= 70 ? $4 >= 65 || $4 >= 48 && $4 <= 57 : $4 >= 97 && $4 <= 102;
      if ($5) {
        state.position += 1;
        $3 = true;
        continue;
      }
      break;
    }
    if ($3) {
      final $6 = state.substring($2, state.position);
      final n = $6;
      final $7 = int.parse(n, radix: 16);
      state.restoreFarthestPosition($1);
      state.restoreErrorState($0);
      return Ok($7);
    }
    state.errorExpected('hexadecimal number');
    state.restoreFarthestPosition($1);
    state.restoreErrorState($0);
    return null;
  }

  /// [(int, int)] **Range**
  /// ```txt
  /// `(int, int)`
  /// Range =>
  ///   (
  ///     "{"
  ///     s = HexValue
  ///     "-"
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
  ///     "-"
  ///     e = RangeChar
  ///     $ = { (s, e) }
  ///     ----
  ///     n = RangeChar
  ///     $ = { (n, n) }
  ///   )
  ///   ~ { state.errorExpected('range'); }
  /// ```
  Result<(int, int)>? parseRange(State state) {
    final $0 = state.setErrorState();
    final $1 = state.setFarthestPosition();
    final $2 = state.position;
    final $3 = state.peek();
    // '{'
    if ($3 == 123) {
      state.position += 1;
      final $4 = parseHexValue(state);
      if ($4 != null) {
        final s = $4.$1;
        final $5 = state.peek();
        // '-'
        if ($5 == 45) {
          state.position += 1;
          final $6 = parseHexValue(state);
          if ($6 != null) {
            final e = $6.$1;
            final $7 = state.peek();
            // '}'
            if ($7 == 125) {
              state.position += 1;
              final $8 = (s, e);
              return Ok($8);
            } else {
              state.errorExpected('}');
            }
          }
        }
      }
    }
    state.backtrack($2);
    // '{'
    if ($3 == 123) {
      state.position += 1;
      final $9 = parseHexValue(state);
      if ($9 != null) {
        final n = $9.$1;
        final $10 = state.peek();
        // '}'
        if ($10 == 125) {
          state.position += 1;
          final $11 = (n, n);
          return Ok($11);
        } else {
          state.errorExpected('}');
        }
      }
    }
    state.backtrack($2);
    final $12 = parseRangeChar(state);
    if ($12 != null) {
      final s = $12.$1;
      final $13 = state.peek();
      // '-'
      if ($13 == 45) {
        state.position += 1;
        final $14 = parseRangeChar(state);
        if ($14 != null) {
          final e = $14.$1;
          final $15 = (s, e);
          return Ok($15);
        }
      }
    }
    state.backtrack($2);
    final $16 = parseRangeChar(state);
    if ($16 != null) {
      final n = $16.$1;
      final $17 = (n, n);
      return Ok($17);
    }
    state.errorExpected('range');
    state.restoreFarthestPosition($1);
    state.restoreErrorState($0);
    return null;
  }

  /// [String] **Block**
  /// ```txt
  /// `String`
  /// Block =>
  ///   '{'
  ///   $ = <BlockBody*>
  ///   '}' S
  /// ```
  Result<String>? parseBlock(State state) {
    final $0 = state.position;
    final $1 = state.peek();
    // '{'
    if ($1 == 123) {
      state.position += 1;
      final $2 = state.position;
      while (true) {
        final $3 = parseBlockBody(state);
        if ($3 != null) {
          continue;
        }
        break;
      }
      final $4 = state.substring($2, state.position);
      final $5 = state.peek();
      // '}'
      if ($5 == 125) {
        state.position += 1;
        parseS(state);
        return Ok($4);
      } else {
        state.errorExpected('}');
      }
    } else {
      state.errorExpected('{');
    }
    state.backtrack($0);
    return null;
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
    final $0 = state.position;
    final $1 = state.peek();
    // '{'
    if ($1 == 123) {
      state.position += 1;
      while (true) {
        final $2 = parseBlockBody(state);
        if ($2 != null) {
          continue;
        }
        break;
      }
      final $3 = state.peek();
      // '}'
      if ($3 == 125) {
        state.position += 1;
        return Result.none;
      } else {
        state.errorExpected('}');
      }
    }
    state.backtrack($0);
    state.predicate++;
    var $4 = true;
    // '}'
    if ($1 == 125) {
      state.position += 1;
      $4 = false;
      state.backtrack($0);
    }
    state.predicate--;
    if ($4) {
      final $5 = state.peek();
      if ($5 >= 0) {
        state.position += $5 > 0xffff ? 2 : 1;
        return Result.none;
      }
    }
    state.backtrack($0);
    return null;
  }

  /// [String] **VariableName**
  /// ```txt
  /// `String`
  /// VariableName =>
  ///   $ = <[a-z] [a-zA-Z0-9_]*>
  ///   S
  ///   ~ { state.errorExpected('variable name'); }
  /// ```
  Result<String>? parseVariableName(State state) {
    final $0 = state.setErrorState();
    final $1 = state.setFarthestPosition();
    final $2 = state.position;
    final $3 = state.peek();
    final $4 = $3 >= 97 && $3 <= 122;
    if ($4) {
      state.position += 1;
      while (true) {
        final $5 = state.peek();
        final $6 = $5 <= 90 ? $5 >= 65 || $5 >= 48 && $5 <= 57 : $5 == 95 || $5 >= 97 && $5 <= 122;
        if ($6) {
          state.position += 1;
          continue;
        }
        break;
      }
      final $7 = state.substring($2, state.position);
      parseS(state);
      state.restoreFarthestPosition($1);
      state.restoreErrorState($0);
      return Ok($7);
    }
    state.backtrack($2);
    state.backtrack($2);
    state.errorExpected('variable name');
    state.restoreFarthestPosition($1);
    state.restoreErrorState($0);
    return null;
  }

  /// [String] **ProductionName**
  /// ```txt
  /// `String`
  /// ProductionName =>
  ///   $ = <[A-Z] [a-zA-Z0-9_]*>
  ///   S
  ///   ~ { state.errorExpected('production name'); }
  /// ```
  Result<String>? parseProductionName(State state) {
    final $0 = state.setErrorState();
    final $1 = state.setFarthestPosition();
    final $2 = state.position;
    final $3 = state.peek();
    final $4 = $3 >= 65 && $3 <= 90;
    if ($4) {
      state.position += 1;
      while (true) {
        final $5 = state.peek();
        final $6 = $5 <= 90 ? $5 >= 65 || $5 >= 48 && $5 <= 57 : $5 == 95 || $5 >= 97 && $5 <= 122;
        if ($6) {
          state.position += 1;
          continue;
        }
        break;
      }
      final $7 = state.substring($2, state.position);
      parseS(state);
      state.restoreFarthestPosition($1);
      state.restoreErrorState($0);
      return Ok($7);
    }
    state.backtrack($2);
    state.backtrack($2);
    state.errorExpected('production name');
    state.restoreFarthestPosition($1);
    state.restoreErrorState($0);
    return null;
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
    while (true) {
      final $0 = parseSpace(state);
      if ($0 != null) {
        continue;
      }
      final $1 = parseComment(state);
      if ($1 != null) {
        continue;
      }
      break;
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
    final $0 = state.position;
    final $1 = state.peek();
    // '#'
    if ($1 == 35) {
      state.position += 1;
      while (true) {
        final $2 = state.position;
        state.predicate++;
        var $3 = true;
        final $4 = parseEndOfLine(state);
        if ($4 != null) {
          $3 = false;
          state.backtrack($2);
        }
        state.predicate--;
        if ($3) {
          final $5 = state.peek();
          if ($5 >= 0) {
            state.position += $5 > 0xffff ? 2 : 1;
            continue;
          }
        }
        state.backtrack($2);
        break;
      }
      parseEndOfLine(state);
      return Result.none;
    }
    state.backtrack($0);
    return null;
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
    final $0 = state.peek();
    final $1 = $0 == 9 || $0 == 32;
    if ($1) {
      state.position += 1;
      return Result.none;
    }
    final $2 = parseEndOfLine(state);
    if ($2 != null) {
      return Result.none;
    }
    return null;
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
    final $0 = state.peek();
    if ($0 == 13 && state.startsWith('\r\n')) {
      state.position += 2;
      return Result.none;
    }
    final $1 = $0 == 10 || $0 == 13;
    if ($1) {
      state.position += 1;
      return Result.none;
    }
    return null;
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
  static const _expected = Object();

  static const _maxErrorCount = 64;

  /// The farthest local parsing position.
  int farthestPosition = 0;

  /// The length of the input data.
  final int length;

  /// Current parsing position.
  int position = 0;

  /// Intended for internal use only.
  int predicate = 0;

  int _ch = 0;

  final List<Object?> _flags = List.filled(_maxErrorCount, null);

  int _errorCount = 0;

  int _errorState = -1;

  int _farthestError = 0;

  int _farthestPosition = 0;

  final String _input;

  final List<String?> _messages = List.filled(_maxErrorCount, null);

  int _peekPosition = -1;

  final List<int?> _starts = List.filled(_maxErrorCount, null);

  State(String input) : _input = input, length = input.length {
    peek();
  }

  void backtrack(int position) {
    if (position > this.position) {
      throw RangeError.range(position, 0, this.position, 'position');
    }

    if (predicate == 0) {
      if (_farthestPosition < this.position) {
        _farthestPosition = this.position;
      }

      if (farthestPosition < this.position) {
        farthestPosition = this.position;
      }
    }

    this.position = position;
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
  ///  - [message]: The message text used when building error messages.
  ///  - [fullSpan]: Specifies information about the location of the error.
  ///  - `true` - (start, end)
  ///  - `false` - (end, end)
  ///  - `null` - (start, start)
  void error(String message, [bool? fullSpan = false]) {
    if (predicate != 0) {
      return;
    }

    if (_farthestError <= farthestPosition) {
      if (_farthestError < farthestPosition) {
        _farthestError = farthestPosition;
        _errorCount = 0;
      }

      if (_errorCount < _messages.length) {
        _flags[_errorCount] = fullSpan;
        _messages[_errorCount] = message;
        _starts[_errorCount] = position;
        _errorCount++;
      }
    }
  }

  /// Intended for internal use only.
  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  /// Adds (if possible) an `expected` error to the error buffer at the current
  /// position.
  ///
  /// Parameters:
  ///
  ///  - [element]: A specific syntactic element that was expected but was
  /// missing.
  void errorExpected(String element) {
    if (predicate != 0) {
      return;
    }

    if (_farthestError <= position) {
      if (_farthestError < position) {
        _farthestError = position;
        _errorCount = 0;
      }

      if (_errorCount < _messages.length) {
        _flags[_errorCount] = _expected;
        _messages[_errorCount] = element;
        _errorCount++;
      }
    }

    if (_farthestPosition < position) {
      _farthestPosition = position;
    }

    if (farthestPosition < position) {
      farthestPosition = position;
    }
  }

  /// Intended for internal use only.
  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  /// Adds (if possible) an error to the error buffer in the case where the
  /// error has a position further than the staring parsing position.
  ///
  /// Parameters:
  ///
  ///  - [message]: The message text used when building error messages.
  ///  - [fullSpan]: Specifies information about the location of the error.
  ///  - `true` - (start, end)
  ///  - `false` - (end, end)
  ///  - `null` - (start, start)
  void errorIncorrect(String message, [bool? fullSpan = false]) {
    if (predicate != 0) {
      return;
    }

    if (farthestPosition > position) {
      error(message, fullSpan);
    }
  }

  /// Converts error messages to errors and returns them as an error list.
  List<({int end, String message, int start})> getErrors() {
    final errors = <({int end, String message, int start})>[];
    if (_farthestPosition < position) {
      _farthestPosition = position;
    }

    final end = _farthestError;
    final expected = <String>{};
    for (var i = 0; i < _errorCount; i++) {
      final message = _messages[i];
      if (message == null) {
        continue;
      }

      switch (_flags[i]) {
        case _expected:
          expected.add(message);
          break;
        case true:
          final start = _starts[i]!;
          errors.add((message: message, start: start, end: end));
          break;
        case false:
          errors.add((message: message, start: end, end: end));
          break;
        case null:
          final start = _starts[i]!;
          errors.add((message: message, start: start, end: start));
          break;
        default:
          errors.add((message: message, start: end, end: end));
      }
    }

    if (expected.isNotEmpty) {
      final list = expected.toList();
      list.sort();
      final message = 'Expected: ${list.map((e) => '\'$e\'').join(', ')}';
      errors.add((
        message: message,
        start: _farthestError,
        end: _farthestError,
      ));
    }

    if (errors.isEmpty) {
      errors.add((
        message: 'Unexpected input data',
        start: _farthestPosition,
        end: _farthestPosition,
      ));
    }

    return errors.toSet().toList();
  }

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  /// Returns the position of the first match of [string] in input, starting at
  /// [position,.
  int indexOf(String string) => _input.indexOf(string, position);

  /// Intended for internal use only.
  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  int peek() {
    if (_peekPosition == position) {
      return _ch;
    }

    _peekPosition = position;
    if (position < length) {
      if ((_ch = _input.codeUnitAt(position)) < 0xd800) {
        return _ch;
      }

      if (_ch < 0xe000) {
        final c = _input.codeUnitAt(position + 1);
        if ((c & 0xfc00) == 0xdc00) {
          return _ch = 0x10000 + ((_ch & 0x3ff) << 10) + (c & 0x3ff);
        }

        throw FormatException('Invalid UTF-16 character', this, position);
      }

      return _ch;
    } else {
      return _ch = -1;
    }
  }

  /// Removes recent errors. Recent errors are errors that were added while
  /// parsing the expression.
  void removeRecentErrors() {
    if (_farthestError == position) {
      if (_errorState >= 0) {
        _errorCount = _errorState > _maxErrorCount
            ? _maxErrorCount
            : _errorState;
      }
    }
  }

  /// Intended for internal use only.
  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  void restoreErrorState(int errorState) {
    _errorState = errorState;
  }

  /// Intended for internal use only.
  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  void restoreFarthestPosition(int farthestPosition) {
    if (this.farthestPosition < farthestPosition) {
      this.farthestPosition = farthestPosition;
    }
  }

  /// Intended for internal use only.
  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  int setErrorState() {
    final errorState = _errorState;
    if (_farthestError < position) {
      _errorState = 0;
    } else if (_farthestError == position) {
      _errorState = _errorCount;
    } else {
      _errorState = -1;
    }
    return errorState;
  }

  /// Intended for internal use only.
  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  int setFarthestPosition() {
    final farthestPosition = this.farthestPosition;
    this.farthestPosition = position;
    return farthestPosition;
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

