import 'package:source_span/source_span.dart';

import '../../expressions.dart';
import '../../grammar.dart';

Grammar parse(String source) {
  const parser = TextParser();
  final state = State(source);
  final result = parser.parseStart(state);
  if (result == null) {
    final file = SourceFile.fromString(source);
    final message = state
        .getErrors()
        .map((e) => file.span(e.start, e.end).message(e.message))
        .join('\n');
    throw FormatException('\n$message');
  }

  return result.$1;
}

// dart format off
class TextParser {
  const TextParser();

  /// [Grammar] **Start**
  /// ```txt
  /// `Grammar`
  /// Start =>
  ///   S
  ///   globals = Globals?
  ///   members = Members?
  ///   productions = Production+
  ///   !.
  ///   ~ { state.errorExpected('end of file'); }
  ///   $ = { Grammar(globals: globals, members: members, productions: productions) }
  /// ```
  Result<Grammar>? parseStart(State state) {
    final pos$ = state.position;
    final ch$ = state.ch;
    parseS(state);
    final globals = parseGlobals(state)?.$1;
    final members = parseMembers(state)?.$1;
    l$:
    {
      final productions$ = <Production>[];
      // (1)
      while (true) {
        final production$ = parseProduction(state);
        if (production$ != null) {
          productions$.add(production$.$1);
          continue;
        }
        break;
      }
      if (productions$.isNotEmpty) {
        final productions = productions$;
        if (state.ch >= 0) {
          state.errorExpected('end of file');
          break l$;
        }
        return Ok(Grammar(globals: globals, members: members, productions: productions));
      } else {
        break l$;
      }
    }
    // l$:
    state.ch = ch$;
    state.position = pos$;
    return null;
  }

  /// [String] **Globals**
  /// ```txt
  /// `String`
  /// Globals =>
  ///   { final start = state.position; }
  ///   "%{"
  ///   { final index = state.indexOf('\u007D%'); }
  ///   $ = <@position({ index == -1 ? state.length : index })>
  ///   "}%"
  ///   ~{ state.error('Unterminated globals section', position: start); } S
  /// ```
  Result<String>? parseGlobals(State state) {
    final start = state.position;
    // "%{"
    if (state.ch == 37 && state.startsWith('%{')) {
      final pos$ = state.position;
      final ch$ = state.ch;
      state.readChar(state.position + 2);
      final index = state.indexOf('\u007D%');
      final start$ = state.position;
      state.readChar(index == -1 ? state.length : index);
      final globals$ = Ok(state.substring(start$, state.position));
      // "}%"
      if (state.ch == 125 && state.startsWith('}%')) {
        state.readChar(state.position + 2);
        parseS(state);
        return globals$;
      }
      state.error('Unterminated globals section', position: start);
      state.ch = ch$;
      state.position = pos$;
      return null;
    }
    return null;
  }

  /// [String] **Members**
  /// ```txt
  /// `String`
  /// Members =>
  ///   { final start = state.position; }
  ///   "%%"
  ///   { final index = state.indexOf('%%'); }
  ///   $ = <@position({ index == -1 ? state.length : index })>
  ///   "%%"
  ///   ~{ state.error('Unterminated members section', position: start); } S
  /// ```
  Result<String>? parseMembers(State state) {
    final start = state.position;
    // "%%"
    if (state.ch == 37 && state.startsWith('%%')) {
      final pos$ = state.position;
      final ch$ = state.ch;
      state.readChar(state.position + 2);
      final index = state.indexOf('%%');
      final start$ = state.position;
      state.readChar(index == -1 ? state.length : index);
      final members$ = Ok(state.substring(start$, state.position));
      // "%%"
      if (state.ch == 37 && state.startsWith('%%')) {
        state.readChar(state.position + 2);
        parseS(state);
        return members$;
      }
      state.error('Unterminated members section', position: start);
      state.ch = ch$;
      state.position = pos$;
      return null;
    }
    return null;
  }

  /// [Production] **Production**
  /// ```txt
  /// `Production`
  /// Production =>
  ///   { final start = state.position; }
  ///   type = Type
  ///   ~{ state.errorExpected('type'); }
  ///   name = ProductionName
  ///   ~{ state.errorExpected('production name'); }
  ///   '=>' S
  ///   expression = Expression
  ///   [;]? S
  ///   {
  ///     final end = state.position;
  ///     final source = state.substring(start, end).trimRight();
  ///   }
  ///   $ = { Production(expression: expression, name: name, sourceCode: source, type: type) }
  /// ```
  Result<Production>? parseProduction(State state) {
    final pos$ = state.position;
    final ch$ = state.ch;
    final start = state.position;
    final type$ = parseType(state);
    if (type$ != null) {
      final type = type$.$1;
      l$1:
      {
        final productionName$ = parseProductionName(state);
        if (productionName$ != null) {
          final name = productionName$.$1;
          // '=>'
          if (state.ch == 61 && state.startsWith('=>')) {
            state.readChar(state.position + 2);
            parseS(state);
            final expression$ = parseExpression(state);
            if (expression$ != null) {
              final expression = expression$.$1;
              l$:
              {
                // [;]
                if (state.ch == 59) {
                  state.nextChar();
                  break l$;
                }
                break l$;
              }
              // l$:
              parseS(state);
              final end = state.position;
              final source = state.substring(start, end).trimRight();
              return Ok(Production(expression: expression, name: name, sourceCode: source, type: type));
            }
            break l$1;
          }
          state.errorExpected('=>');
          break l$1;
        }
        state.errorExpected('production name');
        break l$1;
      }
      // l$1:
      state.ch = ch$;
      state.position = pos$;
      return null;
    }
    state.errorExpected('type');
    return null;
  }

  /// [Expression] **Expression**
  /// ```txt
  /// `Expression`
  /// Expression =>
  ///   { final pos = state.position; }
  ///   expression = OrderedChoice
  ///   ~{ state.errorExpected('expression'); }
  ///   { expression.sourceCode = state.substring(pos, state.position).trimRight(); }
  ///   $ = { expression }
  /// ```
  Result<Expression>? parseExpression(State state) {
    final pos = state.position;
    final orderedChoice$ = parseOrderedChoice(state);
    if (orderedChoice$ != null) {
      final expression = orderedChoice$.$1;
      expression.sourceCode = state.substring(pos, state.position).trimRight();
      return Ok(expression);
    }
    state.errorExpected('expression');
    return null;
  }

  /// [Expression] **OrderedChoice**
  /// ```txt
  /// `Expression`
  /// OrderedChoice =>
  ///   expression = Sequence
  ///   { final expressions = [expression]; }
  ///   @while (0) {
  ///     (
  ///       "/"
  ///       ----
  ///       "-"+
  ///     ) S
  ///     expression = Sequence
  ///     { expressions.add(expression); }
  ///   }
  ///   $ = { OrderedChoiceExpression(expressions: expressions) }
  /// ```
  Result<Expression>? parseOrderedChoice(State state) {
    final sequence$ = parseSequence(state);
    if (sequence$ != null) {
      final expression = sequence$.$1;
      final expressions = [expression];
      // (0)
      while (true) {
        final pos$ = state.position;
        final ch$ = state.ch;
        l$:
        {
          // "/"
          if (state.ch == 47) {
            state.nextChar();
            break l$;
          }
          var isSuccess$ = false;
          // (1)
          while (true) {
            // "-"
            if (state.ch == 45) {
              state.nextChar();
              isSuccess$ = true;
              continue;
            }
            break;
          }
          if (isSuccess$) {
            break l$;
          } else {
            break;
          }
        }
        // l$:
        parseS(state);
        final sequence$1 = parseSequence(state);
        if (sequence$1 != null) {
          final expression = sequence$1.$1;
          expressions.add(expression);
          continue;
        }
        state.ch = ch$;
        state.position = pos$;
        break;
      }
      return Ok(OrderedChoiceExpression(expressions: expressions));
    }
    return null;
  }

  /// [Expression] **Sequence**
  /// ```txt
  /// `Expression`
  /// Sequence =>
  ///   { final pos = state.position; }
  ///   expressions = (
  ///     { final pos = state.position; }
  ///     expression = SequenceElement
  ///     errorHandler = ErrorHandler?
  ///     { expression.sourceCode = state.substring(pos, state.position).trimRight(); }
  ///     $ = `Expression` { expression..errorHandler = errorHandler }
  ///   )+
  ///   expression = { SequenceExpression(expressions: expressions) }
  ///   { expression.sourceCode = state.substring(pos, state.position).trimRight(); }
  ///   $ = { expression }
  /// ```
  Result<Expression>? parseSequence(State state) {
    final pos = state.position;
    final expressions$ = <Expression>[];
    // (1)
    while (true) {
      final pos = state.position;
      final sequenceElement$ = parseSequenceElement(state);
      if (sequenceElement$ != null) {
        final expression = sequenceElement$.$1;
        final errorHandler = parseErrorHandler(state)?.$1;
        expression.sourceCode = state.substring(pos, state.position).trimRight();
        expressions$.add(expression..errorHandler = errorHandler);
        continue;
      }
      break;
    }
    if (expressions$.isNotEmpty) {
      final expressions = expressions$;
      final expression = SequenceExpression(expressions: expressions);
      expression.sourceCode = state.substring(pos, state.position).trimRight();
      return Ok(expression);
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
  ///   semanticValue = (
  ///     $ = SemanticValue
  ///     '=' S
  ///   )?
  ///   type = Type?
  ///   expression = Prefix
  ///   {
  ///     expression.semanticValue = semanticValue;
  ///     expression.explicitType = type;
  ///   }
  ///   $ = { expression }
  /// ```
  Result<Expression>? parseSequenceElement(State state) {
    final action$ = parseAction(state);
    if (action$ != null) {
      return action$;
    }
    final pos$ = state.position;
    final ch$ = state.ch;
    final String? semanticValue$;
    l$:
    {
      final pos$1 = state.position;
      final ch$1 = state.ch;
      final semanticValue$1 = parseSemanticValue(state);
      if (semanticValue$1 != null) {
        // '='
        if (state.ch == 61) {
          state.nextChar();
          parseS(state);
          semanticValue$ = semanticValue$1.$1;
          break l$;
        }
        state.errorExpected('=');
        state.ch = ch$1;
        state.position = pos$1;
        semanticValue$ = null;
        break l$;
      }
      semanticValue$ = null;
      break l$;
    }
    // l$:
    final semanticValue = semanticValue$;
    final type = parseType(state)?.$1;
    final prefix$ = parsePrefix(state);
    if (prefix$ != null) {
      final expression = prefix$.$1;
      expression.semanticValue = semanticValue;
      expression.explicitType = type;
      return Ok(expression);
    }
    state.ch = ch$;
    state.position = pos$;
    return null;
  }

  /// [String] **SemanticValue**
  /// ```txt
  /// `String`
  /// SemanticValue =>
  ///   VariableName
  ///   ---
  ///   $ = '$'
  ///   S
  /// ```
  Result<String>? parseSemanticValue(State state) {
    final variableName$ = parseVariableName(state);
    if (variableName$ != null) {
      return variableName$;
    }
    // '\$'
    if (state.ch == 36) {
      state.nextChar();
      const semanticValue$ = Ok('\$');
      parseS(state);
      return semanticValue$;
    }
    state.errorExpected('\$');
    return null;
  }

  /// [Expression] **Prefix**
  /// ```txt
  /// `Expression`
  /// Prefix =>
  ///   "!" S
  ///   $ = (
  ///     predicate = Block
  ///     $ = { PredicateExpression(negate: true, predicate: predicate) }
  ///     ----
  ///     expression = Suffix
  ///     $ = { NotPredicateExpression(expression: expression) }
  ///   )
  ///   ----
  ///   "&" S
  ///   $ = (
  ///     predicate = Block
  ///     $ = { PredicateExpression(negate: false, predicate: predicate) }
  ///     ---
  ///     expression = Suffix
  ///     $ = { AndPredicateExpression(expression: expression) }
  ///   )
  ///   ----
  ///   Suffix
  /// ```
  Result<Expression>? parsePrefix(State state) {
    l$:
    {
      // "!"
      if (state.ch == 33) {
        final pos$ = state.position;
        final ch$ = state.ch;
        state.nextChar();
        parseS(state);
        final block$ = parseBlock(state);
        if (block$ != null) {
          final predicate = block$.$1;
          return Ok(PredicateExpression(negate: true, predicate: predicate));
        }
        final suffix$ = parseSuffix(state);
        if (suffix$ != null) {
          final expression = suffix$.$1;
          return Ok(NotPredicateExpression(expression: expression));
        }
        state.ch = ch$;
        state.position = pos$;
        break l$;
      }
      break l$;
    }
    // l$:
    l$1:
    {
      // "&"
      if (state.ch == 38) {
        final pos$1 = state.position;
        final ch$1 = state.ch;
        state.nextChar();
        parseS(state);
        final block$1 = parseBlock(state);
        if (block$1 != null) {
          final predicate = block$1.$1;
          return Ok(PredicateExpression(negate: false, predicate: predicate));
        }
        final suffix$1 = parseSuffix(state);
        if (suffix$1 != null) {
          final expression = suffix$1.$1;
          return Ok(AndPredicateExpression(expression: expression));
        }
        state.ch = ch$1;
        state.position = pos$1;
        break l$1;
      }
      break l$1;
    }
    // l$1:
    final suffix$2 = parseSuffix(state);
    if (suffix$2 != null) {
      return suffix$2;
    }
    return null;
  }

  /// [Expression] **Suffix**
  /// ```txt
  /// `Expression`
  /// Suffix =>
  ///   expression = Primary
  ///   $ = (
  ///     "*" S
  ///     $ = { ZeroOrMoreExpression(expression: expression) }
  ///     ----
  ///     "+" S
  ///     $ = { OneOrMoreExpression(expression: expression) }
  ///     ----
  ///     "?" S
  ///     $ = { OptionalExpression(expression: expression) }
  ///     ---
  ///     ""
  ///     $ = { expression }
  ///   )
  /// ```
  Result<Expression>? parseSuffix(State state) {
    final primary$ = parsePrimary(state);
    if (primary$ != null) {
      final expression = primary$.$1;
      // "*"
      if (state.ch == 42) {
        state.nextChar();
        parseS(state);
        return Ok(ZeroOrMoreExpression(expression: expression));
      }
      // "+"
      if (state.ch == 43) {
        state.nextChar();
        parseS(state);
        return Ok(OneOrMoreExpression(expression: expression));
      }
      // "?"
      if (state.ch == 63) {
        state.nextChar();
        parseS(state);
        return Ok(OptionalExpression(expression: expression));
      }
      // ""
      return Ok(expression);
    }
    return null;
  }

  /// [Expression] **Primary**
  /// ```txt
  /// `Expression`
  /// Primary =>
  ///   (
  ///     Symbol
  ///     ---
  ///     Value
  ///     ----
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
  ///   )
  ///   ~{ state.errorExpected('expression'); }
  /// ```
  Result<Expression>? parsePrimary(State state) {
    final symbol$ = parseSymbol(state);
    if (symbol$ != null) {
      return symbol$;
    }
    final value$ = parseValue(state);
    if (value$ != null) {
      return value$;
    }
    final characterClass$ = parseCharacterClass(state);
    if (characterClass$ != null) {
      return characterClass$;
    }
    final literal$ = parseLiteral(state);
    if (literal$ != null) {
      return literal$;
    }
    final group$ = parseGroup(state);
    if (group$ != null) {
      return group$;
    }
    final while$ = parseWhile(state);
    if (while$ != null) {
      return while$;
    }
    final anyCharacter$ = parseAnyCharacter(state);
    if (anyCharacter$ != null) {
      return anyCharacter$;
    }
    final capture$ = parseCapture(state);
    if (capture$ != null) {
      return capture$;
    }
    final position$ = parsePosition(state);
    if (position$ != null) {
      return position$;
    }
    final match$ = parseMatch(state);
    if (match$ != null) {
      return match$;
    }
    state.errorExpected('expression');
    return null;
  }

  /// [Expression] **Symbol**
  /// ```txt
  /// `Expression`
  /// Symbol =>
  ///   name = ProductionName S
  ///   !'=>'
  ///   $ = { ProductionExpression(name: name) }
  /// ```
  Result<Expression>? parseSymbol(State state) {
    final pos$ = state.position;
    final ch$ = state.ch;
    final productionName$ = parseProductionName(state);
    if (productionName$ != null) {
      final name = productionName$.$1;
      parseS(state);
      // '=>'
      if (state.ch == 61 && state.startsWith('=>')) {
        state.ch = ch$;
        state.position = pos$;
        return null;
      }
      state.errorExpected('=>');
      return Ok(ProductionExpression(name: name));
    }
    return null;
  }

  /// [Expression] **Action**
  /// ```txt
  /// `Expression`
  /// Action =>
  ///   source = Block
  ///   $ = { ActionExpression(source: source) }
  /// ```
  Result<Expression>? parseAction(State state) {
    final block$ = parseBlock(state);
    if (block$ != null) {
      final source = block$.$1;
      return Ok(ActionExpression(source: source));
    }
    return null;
  }

  /// [Expression] **Value**
  /// ```txt
  /// `Expression`
  /// Value =>
  ///   source = Block
  ///   $ = { ValueExpression(source: source) }
  /// ```
  Result<Expression>? parseValue(State state) {
    final block$ = parseBlock(state);
    if (block$ != null) {
      final source = block$.$1;
      return Ok(ValueExpression(source: source));
    }
    return null;
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
      return Ok(AnyCharacterExpression());
    }
    return null;
  }

  /// [Expression] **Capture**
  /// ```txt
  /// `Expression`
  /// Capture =>
  ///   "<" S
  ///   expression = Expression
  ///   '>' S
  ///   $ = { CaptureExpression(expression: expression) }
  /// ```
  Result<Expression>? parseCapture(State state) {
    // "<"
    if (state.ch == 60) {
      final pos$ = state.position;
      final ch$ = state.ch;
      state.nextChar();
      parseS(state);
      l$:
      {
        final expression$ = parseExpression(state);
        if (expression$ != null) {
          final expression = expression$.$1;
          // '>'
          if (state.ch == 62) {
            state.nextChar();
            parseS(state);
            return Ok(CaptureExpression(expression: expression));
          }
          state.errorExpected('>');
          break l$;
        }
        break l$;
      }
      // l$:
      state.ch = ch$;
      state.position = pos$;
      return null;
    }
    return null;
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
  ///   ranges = @while (1) {
  ///     ! "]"
  ///     $ = Range
  ///   } ~{ state.errorExpected('characters'); }
  ///   ']' S
  ///   $ = { CharacterClassExpression(ranges: ranges, negate: negate) }
  /// ```
  Result<Expression>? parseCharacterClass(State state) {
    final pos$ = state.position;
    final ch$ = state.ch;
    var negate = false;
    l$:
    {
      // "[^"
      if (state.ch == 91 && state.startsWith('[^')) {
        state.readChar(state.position + 2);
        negate = true;
        break l$;
      }
      // "["
      if (state.ch == 91) {
        state.nextChar();
        break l$;
      }
      return null;
    }
    // l$:
    l$1:
    {
      final ranges$ = <(int, int)>[];
      // (1)
      while (true) {
        // "]"
        if (state.ch == 93) {
          break;
        }
        final range$ = parseRange(state);
        if (range$ != null) {
          ranges$.add(range$.$1);
          continue;
        }
        break;
      }
      if (ranges$.isNotEmpty) {
        final ranges = ranges$;
        // ']'
        if (state.ch == 93) {
          state.nextChar();
          parseS(state);
          return Ok(CharacterClassExpression(ranges: ranges, negate: negate));
        }
        state.errorExpected(']');
        break l$1;
      } else {
        state.errorExpected('characters');
        break l$1;
      }
    }
    // l$1:
    state.ch = ch$;
    state.position = pos$;
    return null;
  }

  /// [Expression] **Group**
  /// ```txt
  /// `Expression`
  /// Group =>
  ///   "(" S
  ///   expression = Expression
  ///   ')' S
  ///   $ = { GroupExpression(expression: expression) }
  /// ```
  Result<Expression>? parseGroup(State state) {
    // "("
    if (state.ch == 40) {
      final pos$ = state.position;
      final ch$ = state.ch;
      state.nextChar();
      parseS(state);
      l$:
      {
        final expression$ = parseExpression(state);
        if (expression$ != null) {
          final expression = expression$.$1;
          // ')'
          if (state.ch == 41) {
            state.nextChar();
            parseS(state);
            return Ok(GroupExpression(expression: expression));
          }
          state.errorExpected(')');
          break l$;
        }
        break l$;
      }
      // l$:
      state.ch = ch$;
      state.position = pos$;
      return null;
    }
    return null;
  }

  /// [Expression] **Literal**
  /// ```txt
  /// `Expression`
  /// Literal =>
  ///   text = SQString
  ///   $ = { LiteralExpression(text: text) }
  ///   ----
  ///   text = DQString
  ///   $ = { LiteralExpression(isPrimitive: true, text: text) }
  /// ```
  Result<Expression>? parseLiteral(State state) {
    final sQString$ = parseSQString(state);
    if (sQString$ != null) {
      final text = sQString$.$1;
      return Ok(LiteralExpression(text: text));
    }
    final dQString$ = parseDQString(state);
    if (dQString$ != null) {
      final text = dQString$.$1;
      return Ok(LiteralExpression(isPrimitive: true, text: text));
    }
    return null;
  }

  /// [Expression] **Match**
  /// ```txt
  /// `Expression`
  /// Match =>
  ///   "@match" S
  ///   '(' S
  ///   { var quote = '\''; }
  ///   text = (
  ///     SQString
  ///     ---
  ///     $ = DQString
  ///     { quote = '"'; }
  ///   )
  ///   ~{ state.errorExpected('string value'); }
  ///   ')' S
  ///   $ = { MatchExpression(quote: quote, text: text) }
  /// ```
  Result<Expression>? parseMatch(State state) {
    // "@match"
    if (state.ch == 64 && state.startsWith('@match')) {
      final pos$ = state.position;
      final ch$ = state.ch;
      state.readChar(state.position + 6);
      parseS(state);
      l$1:
      {
        // '('
        if (state.ch == 40) {
          state.nextChar();
          parseS(state);
          var quote = '\'';
          final String text$;
          l$:
          {
            final sQString$ = parseSQString(state);
            if (sQString$ != null) {
              text$ = sQString$.$1;
              break l$;
            }
            final dQString$ = parseDQString(state);
            if (dQString$ != null) {
              quote = '"';
              text$ = dQString$.$1;
              break l$;
            }
            state.errorExpected('string value');
            break l$1;
          }
          // l$:
          final text = text$;
          // ')'
          if (state.ch == 41) {
            state.nextChar();
            parseS(state);
            return Ok(MatchExpression(quote: quote, text: text));
          }
          state.errorExpected(')');
          break l$1;
        }
        state.errorExpected('(');
        break l$1;
      }
      // l$1:
      state.ch = ch$;
      state.position = pos$;
      return null;
    }
    return null;
  }

  /// [Expression] **Position**
  /// ```txt
  /// `Expression`
  /// Position =>
  ///   "@position" S
  ///   '(' S
  ///   action = Block
  ///   ~{ state.errorExpected('position value'); }
  ///   ')' S
  ///   $ = { PositionExpression(action: action) }
  /// ```
  Result<Expression>? parsePosition(State state) {
    // "@position"
    if (state.ch == 64 && state.startsWith('@position')) {
      final pos$ = state.position;
      final ch$ = state.ch;
      state.readChar(state.position + 9);
      parseS(state);
      l$:
      {
        // '('
        if (state.ch == 40) {
          state.nextChar();
          parseS(state);
          final block$ = parseBlock(state);
          if (block$ != null) {
            final action = block$.$1;
            // ')'
            if (state.ch == 41) {
              state.nextChar();
              parseS(state);
              return Ok(PositionExpression(action: action));
            }
            state.errorExpected(')');
            break l$;
          }
          state.errorExpected('position value');
          break l$;
        }
        state.errorExpected('(');
        break l$;
      }
      // l$:
      state.ch = ch$;
      state.position = pos$;
      return null;
    }
    return null;
  }

  /// [Expression] **While**
  /// ```txt
  /// `Expression`
  /// While =>
  ///   "@while" S
  ///   '(' S
  ///   range = WhileRange
  ///   ~{ state.errorExpected('while range'); }
  ///   ')' S
  ///   '{' S
  ///   expression = Expression
  ///   '}' S
  ///   $ = { WhileExpression(expression: expression, range: range) }
  /// ```
  Result<Expression>? parseWhile(State state) {
    // "@while"
    if (state.ch == 64 && state.startsWith('@while')) {
      final pos$ = state.position;
      final ch$ = state.ch;
      state.readChar(state.position + 6);
      parseS(state);
      l$:
      {
        // '('
        if (state.ch == 40) {
          state.nextChar();
          parseS(state);
          final whileRange$ = parseWhileRange(state);
          if (whileRange$ != null) {
            final range = whileRange$.$1;
            // ')'
            if (state.ch == 41) {
              state.nextChar();
              parseS(state);
              // '{'
              if (state.ch == 123) {
                state.nextChar();
                parseS(state);
                final expression$ = parseExpression(state);
                if (expression$ != null) {
                  final expression = expression$.$1;
                  // '}'
                  if (state.ch == 125) {
                    state.nextChar();
                    parseS(state);
                    return Ok(WhileExpression(expression: expression, range: range));
                  }
                  state.errorExpected('}');
                  break l$;
                }
                break l$;
              }
              state.errorExpected('{');
              break l$;
            }
            state.errorExpected(')');
            break l$;
          }
          state.errorExpected('while range');
          break l$;
        }
        state.errorExpected('(');
        break l$;
      }
      // l$:
      state.ch = ch$;
      state.position = pos$;
      return null;
    }
    return null;
  }

  /// [(int, int?)] **WhileRange**
  /// ```txt
  /// `(int, int?)`
  /// WhileRange =>
  ///   min = DecValue S
  ///   max = (
  ///     ',' S
  ///     $ = DecValue1 S
  ///   )?
  ///   $ = { (min, max) }
  /// ```
  Result<(int, int?)>? parseWhileRange(State state) {
    final decValue$ = parseDecValue(state);
    if (decValue$ != null) {
      final min = decValue$.$1;
      parseS(state);
      final int? max$;
      l$:
      {
        // ','
        if (state.ch == 44) {
          final pos$ = state.position;
          final ch$ = state.ch;
          state.nextChar();
          parseS(state);
          final decValue1$ = parseDecValue1(state);
          if (decValue1$ != null) {
            parseS(state);
            max$ = decValue1$.$1;
            break l$;
          }
          state.ch = ch$;
          state.position = pos$;
          max$ = null;
          break l$;
        }
        state.errorExpected(',');
        max$ = null;
        break l$;
      }
      // l$:
      final max = max$;
      return Ok((min, max));
    }
    return null;
  }

  /// [String] **ErrorHandler**
  /// ```txt
  /// `String`
  /// ErrorHandler =>
  ///   "~" S
  ///   $ = Block
  /// ```
  Result<String>? parseErrorHandler(State state) {
    // "~"
    if (state.ch == 126) {
      final pos$ = state.position;
      final ch$ = state.ch;
      state.nextChar();
      parseS(state);
      final block$ = parseBlock(state);
      if (block$ != null) {
        return block$;
      }
      state.ch = ch$;
      state.position = pos$;
      return null;
    }
    return null;
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
    // "`"
    if (state.ch == 96) {
      final pos$ = state.position;
      final ch$ = state.ch;
      state.nextChar();
      l$:
      {
        final start$ = state.position;
        var isSuccess$ = false;
        // (1)
        while (true) {
          // [`]
          if (state.ch == 96) {
            break;
          }
          // [a-zA-Z0-9_$<(\{,:\})>? ]
          final c$ = state.ch;
          final isInRange$ = c$ <= 60 ? c$ >= 60 || c$ <= 41 ? c$ >= 40 || c$ == 32 || c$ == 36 : c$ == 44 || c$ >= 48 && c$ <= 58 : c$ <= 95 ? c$ >= 95 || c$ <= 63 ? c$ >= 62 : c$ >= 65 && c$ <= 90 : c$ <= 123 ? c$ >= 97 : c$ == 125;
          if (isInRange$) {
            state.nextChar();
            isSuccess$ = true;
            continue;
          }
          break;
        }
        if (isSuccess$) {
          final type$ = Ok(state.substring(start$, state.position));
          // '`'
          if (state.ch == 96) {
            state.nextChar();
            parseS(state);
            return type$;
          }
          state.errorExpected('`');
          break l$;
        } else {
          state.errorExpected('type description');
          break l$;
        }
      }
      // l$:
      state.ch = ch$;
      state.position = pos$;
      return null;
    }
    return null;
  }

  /// [String] **DQString**
  /// ```txt
  /// `String`
  /// DQString =>
  ///   "\""
  ///   parts = @while (0) {
  ///     <[{20-21}{23-5B}{5D-10FFFF}]+>
  ///     ---
  ///     Escaped
  ///   }
  ///   '"' S
  ///   $ = { parts.join() }
  /// ```
  Result<String>? parseDQString(State state) {
    // "\""
    if (state.ch == 34) {
      final pos$ = state.position;
      final ch$ = state.ch;
      state.nextChar();
      final parts$ = <String>[];
      // (0)
      while (true) {
        final start$ = state.position;
        var isSuccess$ = false;
        // (1)
        while (true) {
          // [ -!#-\[\]-{10ffff}]
          final c$ = state.ch;
          final isInRange$ = c$ <= 91 ? c$ >= 35 || c$ >= 32 && c$ <= 33 : c$ >= 93 && c$ <= 1114111;
          if (isInRange$) {
            state.nextChar();
            isSuccess$ = true;
            continue;
          }
          break;
        }
        if (isSuccess$) {
          parts$.add(state.substring(start$, state.position));
          continue;
        } else {
          final escaped$ = parseEscaped(state);
          if (escaped$ != null) {
            parts$.add(escaped$.$1);
            continue;
          }
          break;
        }
      }
      final parts = parts$;
      // '"'
      if (state.ch == 34) {
        state.nextChar();
        parseS(state);
        return Ok(parts.join());
      }
      state.errorExpected('"');
      state.ch = ch$;
      state.position = pos$;
      return null;
    }
    return null;
  }

  /// [String] **SQString**
  /// ```txt
  /// `String`
  /// SQString =>
  ///   "'"
  ///   parts = @while (0) {
  ///     <[{20-26}{28-5B}{5D-10FFFF}]+>
  ///     ---
  ///     Escaped
  ///   }
  ///   '\'' S
  ///   $ = { parts.join() }
  /// ```
  Result<String>? parseSQString(State state) {
    // "'"
    if (state.ch == 39) {
      final pos$ = state.position;
      final ch$ = state.ch;
      state.nextChar();
      final parts$ = <String>[];
      // (0)
      while (true) {
        final start$ = state.position;
        var isSuccess$ = false;
        // (1)
        while (true) {
          // [ -&(-\[\]-{10ffff}]
          final c$ = state.ch;
          final isInRange$ = c$ <= 91 ? c$ >= 40 || c$ >= 32 && c$ <= 38 : c$ >= 93 && c$ <= 1114111;
          if (isInRange$) {
            state.nextChar();
            isSuccess$ = true;
            continue;
          }
          break;
        }
        if (isSuccess$) {
          parts$.add(state.substring(start$, state.position));
          continue;
        } else {
          final escaped$ = parseEscaped(state);
          if (escaped$ != null) {
            parts$.add(escaped$.$1);
            continue;
          }
          break;
        }
      }
      final parts = parts$;
      // '\''
      if (state.ch == 39) {
        state.nextChar();
        parseS(state);
        return Ok(parts.join());
      }
      state.errorExpected('\'');
      state.ch = ch$;
      state.position = pos$;
      return null;
    }
    return null;
  }

  /// [String] **Escaped**
  /// ```txt
  /// `String`
  /// Escaped =>
  ///   "\\"
  ///   $ = (
  ///     "u"
  ///     '{'
  ///     charCode = HexValue
  ///     ~{ state.error('unicode escape'); }
  ///     '}'
  ///     ~{ state.error('Unterminated Unicode escape sequence'); }
  ///     $ = { String.fromCharCode(charCode) }
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
  ///   ~{ state.error('Illegal escape character'); }
  /// ```
  Result<String>? parseEscaped(State state) {
    // "\\"
    if (state.ch == 92) {
      final pos$ = state.position;
      final ch$ = state.ch;
      state.nextChar();
      l$:
      {
        // "u"
        if (state.ch == 117) {
          final pos$1 = state.position;
          final ch$1 = state.ch;
          state.nextChar();
          l$1:
          {
            // '{'
            if (state.ch == 123) {
              state.nextChar();
              final hexValue$ = parseHexValue(state);
              if (hexValue$ != null) {
                final charCode = hexValue$.$1;
                // '}'
                if (state.ch == 125) {
                  state.nextChar();
                  return Ok(String.fromCharCode(charCode));
                }
                state.errorExpected('}');
                state.error('Unterminated Unicode escape sequence');
                break l$1;
              }
              state.error('unicode escape');
              break l$1;
            }
            state.errorExpected('{');
            break l$1;
          }
          // l$1:
          state.ch = ch$1;
          state.position = pos$1;
          break l$;
        }
        break l$;
      }
      // l$:
      // "a"
      if (state.ch == 97) {
        state.nextChar();
        return const Ok('\u0007');
      }
      // "b"
      if (state.ch == 98) {
        state.nextChar();
        return const Ok('\b');
      }
      // "e"
      if (state.ch == 101) {
        state.nextChar();
        return const Ok('\u001B');
      }
      // "f"
      if (state.ch == 102) {
        state.nextChar();
        return const Ok('\f');
      }
      // "n"
      if (state.ch == 110) {
        state.nextChar();
        return const Ok('\n');
      }
      // "r"
      if (state.ch == 114) {
        state.nextChar();
        return const Ok('\r');
      }
      // "t"
      if (state.ch == 116) {
        state.nextChar();
        return const Ok('\t');
      }
      // "v"
      if (state.ch == 118) {
        state.nextChar();
        return const Ok('\v');
      }
      // "\\"
      if (state.ch == 92) {
        state.nextChar();
        return const Ok('\\');
      }
      // "\""
      if (state.ch == 34) {
        state.nextChar();
        return const Ok('"');
      }
      // "'"
      if (state.ch == 39) {
        state.nextChar();
        return const Ok('\'');
      }
      state.error('Illegal escape character');
      state.ch = ch$;
      state.position = pos$;
      return null;
    }
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
    l$:
    {
      // "\\"
      if (state.ch == 92) {
        break l$;
      }
      // [^{0-1f}\{\}\[\]\\]
      final c$ = state.ch;
      final isInRange$ = !(c$ <= 93 ? c$ >= 91 || c$ >= 0 && c$ <= 31 : c$ == 123 || c$ == 125) && !(c$ < 0);
      if (isInRange$) {
        state.nextChar();
        return Ok(c$);
      }
      break l$;
    }
    // l$:
    // "\\"
    if (state.ch == 92) {
      final pos$ = state.position;
      final ch$ = state.ch;
      state.nextChar();
      l$1:
      {
        // "u"
        if (state.ch == 117) {
          final pos$1 = state.position;
          final ch$1 = state.ch;
          state.nextChar();
          l$2:
          {
            // '{'
            if (state.ch == 123) {
              state.nextChar();
              final hexValue$ = parseHexValue(state);
              if (hexValue$ != null) {
                // '}'
                if (state.ch == 125) {
                  state.nextChar();
                  return hexValue$;
                }
                state.errorExpected('}');
                break l$2;
              }
              state.errorExpected('hex number');
              break l$2;
            }
            state.errorExpected('{');
            break l$2;
          }
          // l$2:
          state.ch = ch$1;
          state.position = pos$1;
          break l$1;
        }
        break l$1;
      }
      // l$1:
      // "a"
      if (state.ch == 97) {
        state.nextChar();
        return const Ok(0x07);
      }
      // "b"
      if (state.ch == 98) {
        state.nextChar();
        return const Ok(0x08);
      }
      // "e"
      if (state.ch == 101) {
        state.nextChar();
        return const Ok(0x1B);
      }
      // "f"
      if (state.ch == 102) {
        state.nextChar();
        return const Ok(0x0C);
      }
      // "n"
      if (state.ch == 110) {
        state.nextChar();
        return const Ok(0x0A);
      }
      // "r"
      if (state.ch == 114) {
        state.nextChar();
        return const Ok(0x0D);
      }
      // "t"
      if (state.ch == 116) {
        state.nextChar();
        return const Ok(0x09);
      }
      // "v"
      if (state.ch == 118) {
        state.nextChar();
        return const Ok(0x0B);
      }
      // "-"
      if (state.ch == 45) {
        state.nextChar();
        return const Ok(0x2D);
      }
      // "["
      if (state.ch == 91) {
        state.nextChar();
        return const Ok(0x5B);
      }
      // "\\"
      if (state.ch == 92) {
        state.nextChar();
        return const Ok(0x5C);
      }
      // "]"
      if (state.ch == 93) {
        state.nextChar();
        return const Ok(0x5D);
      }
      // "^"
      if (state.ch == 94) {
        state.nextChar();
        return const Ok(0x5E);
      }
      // "{"
      if (state.ch == 123) {
        state.nextChar();
        return const Ok(0x7B);
      }
      // "}"
      if (state.ch == 125) {
        state.nextChar();
        return const Ok(0x7D);
      }
      state.error('Illegal escape character');
      state.ch = ch$;
      state.position = pos$;
      return null;
    }
    return null;
  }

  /// [int] **DecValue**
  /// ```txt
  /// `int`
  /// DecValue =>
  ///   text = <[0-9]+>
  ///   ~{ state.errorExpected('decimal number'); }
  ///   $ = { int.parse(text) }
  /// ```
  Result<int>? parseDecValue(State state) {
    final start$ = state.position;
    var isSuccess$ = false;
    // (1)
    while (true) {
      // [0-9]
      final c$ = state.ch;
      final isDigit$ = c$ >= 48 && c$ <= 57;
      if (isDigit$) {
        state.nextChar();
        isSuccess$ = true;
        continue;
      }
      break;
    }
    if (isSuccess$) {
      final text = state.substring(start$, state.position);
      return Ok(int.parse(text));
    } else {
      state.errorExpected('decimal number');
      return null;
    }
  }

  /// [int] **DecValue1**
  /// ```txt
  /// `int`
  /// DecValue1 =>
  ///   text = <[1-9] [0-9]*>
  ///   ~{ state.errorExpected('decimal number from 1'); }
  ///   $ = { int.parse(text) }
  /// ```
  Result<int>? parseDecValue1(State state) {
    final start$ = state.position;
    // [1-9]
    final c$ = state.ch;
    final isNonZeroDigit$ = c$ >= 49 && c$ <= 57;
    if (isNonZeroDigit$) {
      state.nextChar();
      // (0)
      while (true) {
        // [0-9]
        final c$1 = state.ch;
        final isDigit$ = c$1 >= 48 && c$1 <= 57;
        if (isDigit$) {
          state.nextChar();
          continue;
        }
        break;
      }
      final text = state.substring(start$, state.position);
      return Ok(int.parse(text));
    }
    state.errorExpected('decimal number from 1');
    return null;
  }

  /// [int] **HexValue**
  /// ```txt
  /// `int`
  /// HexValue =>
  ///   text = <[a-fA-F0-9]+>
  ///   ~{ state.errorExpected('hexadecimal number'); }
  ///   $ = { int.parse(text, radix: 16) }
  /// ```
  Result<int>? parseHexValue(State state) {
    final start$ = state.position;
    var isSuccess$ = false;
    // (1)
    while (true) {
      // [a-fA-F0-9]
      final c$ = state.ch;
      final isHexDigit$ = c$ <= 70 ? c$ >= 65 || c$ >= 48 && c$ <= 57 : c$ >= 97 && c$ <= 102;
      if (isHexDigit$) {
        state.nextChar();
        isSuccess$ = true;
        continue;
      }
      break;
    }
    if (isSuccess$) {
      final text = state.substring(start$, state.position);
      return Ok(int.parse(text, radix: 16));
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
  ///     start = HexValue
  ///     '-'
  ///     end = HexValue
  ///     '}'
  ///     $ = { (start, end) }
  ///     ----
  ///     "{"
  ///     char = HexValue
  ///     '}'
  ///     $ = { (char, char) }
  ///     ---
  ///     start = RangeChar
  ///     '-'
  ///     end = RangeChar
  ///     $ = { (start, end) }
  ///     ----
  ///     char = RangeChar
  ///     $ = { (char, char) }
  ///   )
  /// ```
  Result<(int, int)>? parseRange(State state) {
    l$:
    {
      // "{"
      if (state.ch == 123) {
        final pos$ = state.position;
        final ch$ = state.ch;
        state.nextChar();
        l$1:
        {
          final hexValue$ = parseHexValue(state);
          if (hexValue$ != null) {
            final start = hexValue$.$1;
            // '-'
            if (state.ch == 45) {
              state.nextChar();
              final hexValue$1 = parseHexValue(state);
              if (hexValue$1 != null) {
                final end = hexValue$1.$1;
                // '}'
                if (state.ch == 125) {
                  state.nextChar();
                  return Ok((start, end));
                }
                state.errorExpected('}');
                break l$1;
              }
              break l$1;
            }
            state.errorExpected('-');
            break l$1;
          }
          break l$1;
        }
        // l$1:
        state.ch = ch$;
        state.position = pos$;
        break l$;
      }
      break l$;
    }
    // l$:
    l$2:
    {
      // "{"
      if (state.ch == 123) {
        final pos$1 = state.position;
        final ch$1 = state.ch;
        state.nextChar();
        l$3:
        {
          final hexValue$2 = parseHexValue(state);
          if (hexValue$2 != null) {
            final char = hexValue$2.$1;
            // '}'
            if (state.ch == 125) {
              state.nextChar();
              return Ok((char, char));
            }
            state.errorExpected('}');
            break l$3;
          }
          break l$3;
        }
        // l$3:
        state.ch = ch$1;
        state.position = pos$1;
        break l$2;
      }
      break l$2;
    }
    // l$2:
    l$4:
    {
      final pos$2 = state.position;
      final ch$2 = state.ch;
      final rangeChar$ = parseRangeChar(state);
      if (rangeChar$ != null) {
        final start = rangeChar$.$1;
        l$5:
        {
          // '-'
          if (state.ch == 45) {
            state.nextChar();
            final rangeChar$1 = parseRangeChar(state);
            if (rangeChar$1 != null) {
              final end = rangeChar$1.$1;
              return Ok((start, end));
            }
            break l$5;
          }
          state.errorExpected('-');
          break l$5;
        }
        // l$5:
        state.ch = ch$2;
        state.position = pos$2;
        break l$4;
      }
      break l$4;
    }
    // l$4:
    final rangeChar$2 = parseRangeChar(state);
    if (rangeChar$2 != null) {
      final char = rangeChar$2.$1;
      return Ok((char, char));
    }
    return null;
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
    // "{"
    if (state.ch == 123) {
      final pos$ = state.position;
      final ch$ = state.ch;
      state.nextChar();
      final start$ = state.position;
      // (0)
      while (true) {
        if (parseBlockBody(state) != null) {
          continue;
        }
        break;
      }
      final block$ = Ok(state.substring(start$, state.position));
      // '}'
      if (state.ch == 125) {
        state.nextChar();
        parseS(state);
        return block$;
      }
      state.errorExpected('}');
      state.ch = ch$;
      state.position = pos$;
      return null;
    }
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
  ///   !"}"
  ///   .
  /// ```
  Result<void>? parseBlockBody(State state) {
    l$:
    {
      // "{"
      if (state.ch == 123) {
        final pos$ = state.position;
        final ch$ = state.ch;
        state.nextChar();
        // (0)
        while (true) {
          if (parseBlockBody(state) != null) {
            continue;
          }
          break;
        }
        // '}'
        if (state.ch == 125) {
          state.nextChar();
          return Result.none;
        }
        state.errorExpected('}');
        state.ch = ch$;
        state.position = pos$;
        break l$;
      }
      break l$;
    }
    // l$:
    // "}"
    if (state.ch == 125) {
      return null;
    }
    if (state.ch >= 0) {
      state.nextChar();
      return Result.none;
    }
    return null;
  }

  /// [String] **VariableName**
  /// ```txt
  /// `String`
  /// VariableName =>
  ///   $ = <[a-z] [a-zA-Z0-9_]*>
  ///   S
  /// ```
  Result<String>? parseVariableName(State state) {
    final start$ = state.position;
    // [a-z]
    final c$ = state.ch;
    final isLower$ = c$ >= 97 && c$ <= 122;
    if (isLower$) {
      state.nextChar();
      // (0)
      while (true) {
        // [a-zA-Z0-9_]
        final c$1 = state.ch;
        final isAlphaOrDigitOrUnderscore$ = c$1 <= 90 ? c$1 >= 65 || c$1 >= 48 && c$1 <= 57 : c$1 == 95 || c$1 >= 97 && c$1 <= 122;
        if (isAlphaOrDigitOrUnderscore$) {
          state.nextChar();
          continue;
        }
        break;
      }
      final variableName$ = Ok(state.substring(start$, state.position));
      parseS(state);
      return variableName$;
    }
    return null;
  }

  /// [String] **ProductionName**
  /// ```txt
  /// `String`
  /// ProductionName =>
  ///   $ = <[A-Z] [a-zA-Z0-9_]*>
  ///   S
  /// ```
  Result<String>? parseProductionName(State state) {
    final start$ = state.position;
    // [A-Z]
    final c$ = state.ch;
    final isUpper$ = c$ >= 65 && c$ <= 90;
    if (isUpper$) {
      state.nextChar();
      // (0)
      while (true) {
        // [a-zA-Z0-9_]
        final c$1 = state.ch;
        final isAlphaOrDigitOrUnderscore$ = c$1 <= 90 ? c$1 >= 65 || c$1 >= 48 && c$1 <= 57 : c$1 == 95 || c$1 >= 97 && c$1 <= 122;
        if (isAlphaOrDigitOrUnderscore$) {
          state.nextChar();
          continue;
        }
        break;
      }
      final productionName$ = Ok(state.substring(start$, state.position));
      parseS(state);
      return productionName$;
    }
    return null;
  }

  /// [void] **S**
  /// ```txt
  /// `void` S =>
  ///   @while (0) {
  ///     Space
  ///     ----
  ///     Comment
  ///   }
  /// ```
  Result<void> parseS(State state) {
    // (0)
    while (true) {
      if (parseSpace(state) != null) {
        continue;
      }
      if (parseComment(state) != null) {
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
  ///     !EndOfLine
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
        final pos$ = state.position;
        final ch$ = state.ch;
        if (parseEndOfLine(state) != null) {
          state.ch = ch$;
          state.position = pos$;
          state.predicate--;
          break;
        }
        state.predicate--;
        if (state.ch >= 0) {
          state.nextChar();
          continue;
        }
        break;
      }
      parseEndOfLine(state);
      return Result.none;
    }
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
    // [ \t]
    final c$ = state.ch;
    final isBlank$ = c$ == 9 || c$ == 32;
    if (isBlank$) {
      state.nextChar();
      return Result.none;
    }
    if (parseEndOfLine(state) != null) {
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
    // "\r\n"
    if (state.ch == 13 && state.startsWith('\r\n')) {
      state.readChar(state.position + 2);
      return Result.none;
    }
    // [\n\r]
    final c$ = state.ch;
    final isNewline$ = c$ == 10 || c$ == 13;
    if (isNewline$) {
      state.nextChar();
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
    readChar(0);
  }

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  int charAt(int position) {
    if (position < length) {
      final ch = _input.codeUnitAt(position);
      if (ch < 0xd800) {
        return ch;
      }

      if (ch < 0xe000) {
        final c = _input.codeUnitAt(position + 1);
        if ((c & 0xfc00) == 0xdc00) {
          return 0x10000 + ((ch & 0x3ff) << 10) + (c & 0x3ff);
        }

        throw FormatException('Invalid UTF-16 character', this, position);
      }

      return ch;
    }

    return -1;
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
  /// Reads the next character, advances the position to the next character and
  /// returns that character.
  int nextChar() {
    if (position < length) {
      position += charSize(ch);
      if (predicate == 0 && farthestPosition < position) {
        farthestPosition = position;
      }

      return ch = charAt(position);
    }

    return ch = -1;
  }

  /// Intended for internal use only.
  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  int readChar(int position) {
    ch = charAt(position);
    this.position = position < length ? position : length;
    if (predicate == 0 && farthestPosition < position) {
      farthestPosition = position;
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
