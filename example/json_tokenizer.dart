import 'package:source_span/source_span.dart';

import 'json_token.dart';

List<Token> tokenize(String source) {
  const tokenizer = JsonTokenizer();
  final state = State(source);
  final result = tokenizer.parseStart(state);
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
class JsonTokenizer {
  const JsonTokenizer();

  Token _token(int start, int end, TokenKind kind, Object? value) {
    return Token(start: start, end: end, kind: kind, value: value);
  }

  /// [List<Token>] **Start**
  /// ```txt
  /// `List<Token>` Start =>
  ///   t = Tokens
  ///   & { state.ch < 0 }
  ///   {
  ///     final eof = _token(state.position, state.position, TokenKind.eof, null);
  ///     t.add(eof);
  ///   }
  ///   $ = { t }
  /// ```
  Result<List<Token>>? parseStart(State state) {
    final pos$ = state.position;
    final ch$ = state.ch;
    final t = parseTokens(state).$1;
    final isSuccess$ = state.ch < 0;
    if (isSuccess$) {
      final eof = _token(state.position, state.position, TokenKind.eof, null);
      t.add(eof);
      return Ok(t);
    }
    state.ch = ch$;
    state.position = pos$;
    return null;
  }

  /// [List<Token>] **Tokens**
  /// ```txt
  /// `List<Token>` Tokens =>
  ///   $ = (
  ///     S
  ///     $ = (
  ///       { final int start = state.position; }
  ///       ":"
  ///       $ = { _token(start, state.position, TokenKind.colon, ':') }
  ///       ----
  ///       ","
  ///       $ = { _token(start, state.position, TokenKind.comma, ',') }
  ///       ----
  ///       "{"
  ///       $ = { _token(start, state.position, TokenKind.openBrace, '\u007B') }
  ///       ----
  ///       "}"
  ///       $ = { _token(start, state.position, TokenKind.closeBrace, '\u007D') }
  ///       ----
  ///       "["
  ///       $ = { _token(start, state.position, TokenKind.openBracket, '[') }
  ///       ----
  ///       "]"
  ///       $ = { _token(start, state.position, TokenKind.closeBracket, ']') }
  ///       ----
  ///       "null"
  ///       $ = { _token(start, state.position, TokenKind.nullKeyword, null) }
  ///       ----
  ///       "true"
  ///       $ = { _token(start, state.position, TokenKind.trueKeyword, true) }
  ///       ----
  ///       "false"
  ///       $ = { _token(start, state.position, TokenKind.falseKeyword, false) }
  ///       ----
  ///       &["]
  ///       string = String
  ///       $ = { _token(start, state.position, TokenKind.string, string) }
  ///       ----
  ///       number = Number
  ///       $ = { _token(start, state.position, TokenKind.number, number) }
  ///     )
  ///   )*
  ///   S
  /// ```
  Result<List<Token>> parseTokens(State state) {
    final tokens$ = <Token>[];
    // (0)
    while (true) {
      final pos$ = state.position;
      final ch$ = state.ch;
      parseS(state);
      final int start = state.position;
      // ":"
      if (state.ch == 58) {
        state.nextChar();
        tokens$.add(_token(start, state.position, TokenKind.colon, ':'));
        continue;
      }
      // ","
      if (state.ch == 44) {
        state.nextChar();
        tokens$.add(_token(start, state.position, TokenKind.comma, ','));
        continue;
      }
      // "{"
      if (state.ch == 123) {
        state.nextChar();
        tokens$.add(_token(start, state.position, TokenKind.openBrace, '\u007B'));
        continue;
      }
      // "}"
      if (state.ch == 125) {
        state.nextChar();
        tokens$.add(_token(start, state.position, TokenKind.closeBrace, '\u007D'));
        continue;
      }
      // "["
      if (state.ch == 91) {
        state.nextChar();
        tokens$.add(_token(start, state.position, TokenKind.openBracket, '['));
        continue;
      }
      // "]"
      if (state.ch == 93) {
        state.nextChar();
        tokens$.add(_token(start, state.position, TokenKind.closeBracket, ']'));
        continue;
      }
      // "null"
      if (state.ch == 110 && state.startsWith('null')) {
        state.readChar(state.position + 4);
        tokens$.add(_token(start, state.position, TokenKind.nullKeyword, null));
        continue;
      }
      // "true"
      if (state.ch == 116 && state.startsWith('true')) {
        state.readChar(state.position + 4);
        tokens$.add(_token(start, state.position, TokenKind.trueKeyword, true));
        continue;
      }
      // "false"
      if (state.ch == 102 && state.startsWith('false')) {
        state.readChar(state.position + 5);
        tokens$.add(_token(start, state.position, TokenKind.falseKeyword, false));
        continue;
      }
      l$:
      {
        // ["]
        if (state.ch == 34) {
          final string$ = parseString(state);
          if (string$ != null) {
            final string = string$.$1;
            tokens$.add(_token(start, state.position, TokenKind.string, string));
            continue;
          }
          break l$;
        }
        break l$;
      }
      // l$:
      final number$ = parseNumber(state);
      if (number$ != null) {
        final number = number$.$1;
        tokens$.add(_token(start, state.position, TokenKind.number, number));
        continue;
      }
      state.ch = ch$;
      state.position = pos$;
      break;
    }
    final tokens$1 = Ok(tokens$);
    parseS(state);
    return tokens$1;
  }

  /// [String] **EscapeC**
  /// ```txt
  /// `String` EscapeC =>
  ///   (
  ///     ["]
  ///     $ = `const` { '"' }
  ///     ----
  ///     [\\]
  ///     $ = `const` { '\\' }
  ///     ----
  ///     [/]
  ///     $ = `const` { '/' }
  ///     ----
  ///     [b]
  ///     $ = `const` { '\b' }
  ///     ----
  ///     [f]
  ///     $ = `const` { '\f' }
  ///     ----
  ///     [n]
  ///     $ = `const` { '\n' }
  ///     ----
  ///     [r]
  ///     $ = `const` { '\r' }
  ///     ----
  ///     [t]
  ///     $ = `const` { '\t' }
  ///   )
  ///   ~{
  ///     if (state.position == state.length) {
  ///       state.errorExpected('escape character');
  ///     } else {
  ///       state.error('Illegal escape character');
  ///     }
  ///   }
  /// ```
  Result<String>? parseEscapeC(State state) {
    // ["]
    if (state.ch == 34) {
      state.nextChar();
      return const Ok('"');
    }
    // [\\]
    if (state.ch == 92) {
      state.nextChar();
      return const Ok('\\');
    }
    // [/]
    if (state.ch == 47) {
      state.nextChar();
      return const Ok('/');
    }
    // [b]
    if (state.ch == 98) {
      state.nextChar();
      return const Ok('\b');
    }
    // [f]
    if (state.ch == 102) {
      state.nextChar();
      return const Ok('\f');
    }
    // [n]
    if (state.ch == 110) {
      state.nextChar();
      return const Ok('\n');
    }
    // [r]
    if (state.ch == 114) {
      state.nextChar();
      return const Ok('\r');
    }
    // [t]
    if (state.ch == 116) {
      state.nextChar();
      return const Ok('\t');
    }
    if (state.position == state.length) {
      state.errorExpected('escape character');
    } else {
      state.error('Illegal escape character');
    }
    return null;
  }

  /// [String] **EscapeUnicode**
  /// ```txt
  /// `String` EscapeUnicode =>
  ///   { final start = state.position; }
  ///   "u"
  ///   { var end = 0; }
  ///   text = <
  ///     @while (4, 4) {
  ///       [a-fA-F0-9]
  ///       ~{
  ///         end = state.position;
  ///         state.errorExpected('hexadecimal digit');
  ///       }
  ///     }
  ///   >
  ///   ~{ state.error('Incorrect Unicode escape sequence', position: end, start: start, end: end); }
  ///   $ = { String.fromCharCode(int.parse(text, radix: 16)) }
  /// ```
  Result<String>? parseEscapeUnicode(State state) {
    final start = state.position;
    // "u"
    if (state.ch == 117) {
      final pos$ = state.position;
      final ch$ = state.ch;
      state.nextChar();
      var end = 0;
      final start$ = state.position;
      final pos$1 = state.position;
      final ch$1 = state.ch;
      var count$ = 0;
      // (4, 4)
      while (count$ < 4) {
        // [a-fA-F0-9]
        final ch$2 = state.ch;
        final isSuccess$ = ch$2 <= 70 ? ch$2 >= 65 || ch$2 >= 48 && ch$2 <= 57 : ch$2 >= 97 && ch$2 <= 102;
        if (isSuccess$) {
          state.nextChar();
          count$++;
          continue;
        }
        end = state.position;
        state.errorExpected('hexadecimal digit');
        break;
      }
      if (count$ >= 4) {
        final text = state.substring(start$, state.position);
        return Ok(String.fromCharCode(int.parse(text, radix: 16)));
      } else {
        state.ch = ch$1;
        state.position = pos$1;
        state.error('Incorrect Unicode escape sequence', position: end, start: start, end: end);
        state.ch = ch$;
        state.position = pos$;
        return null;
      }
    }
    return null;
  }

  /// [String] **Escaped**
  /// ```txt
  /// `String` Escaped =>
  ///   & "u"
  ///   $ = EscapeUnicode
  ///   ----
  ///   EscapeC
  /// ```
  Result<String>? parseEscaped(State state) {
    l$:
    {
      // "u"
      if (state.ch == 117) {
        final escapeUnicode$ = parseEscapeUnicode(state);
        if (escapeUnicode$ != null) {
          return escapeUnicode$;
        }
        break l$;
      }
      break l$;
    }
    // l$:
    final escapeC$ = parseEscapeC(state);
    if (escapeC$ != null) {
      return escapeC$;
    }
    return null;
  }

  /// [String] **String**
  /// ```txt
  /// `String` String =>
  ///   { final start = state.position; }
  ///   ["]
  ///   parts = @while (0) {
  ///     <[^{0-1F}"\\]+>
  ///     ---
  ///     [\\]
  ///     $ = Escaped
  ///   }
  ///   ["]
  ///   ~{
  ///     state.error('Unterminated string', start: start);
  ///     state.errorExpected('"');
  ///   }
  ///   S
  ///   $ = { parts.length == 1 ? parts[0] : parts.isNotEmpty ? parts.join() : '' }
  /// ```
  Result<String>? parseString(State state) {
    final start = state.position;
    // ["]
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
          // [^{0-1f}"\\]
          final ch$1 = state.ch;
          final isSuccess$1 = !(ch$1 <= 34 ? ch$1 >= 34 || ch$1 >= 0 && ch$1 <= 31 : ch$1 == 92) && !(ch$1 < 0);
          if (isSuccess$1) {
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
          // [\\]
          if (state.ch == 92) {
            final pos$1 = state.position;
            final ch$2 = state.ch;
            state.nextChar();
            final escaped$ = parseEscaped(state);
            if (escaped$ != null) {
              parts$.add(escaped$.$1);
              continue;
            }
            state.ch = ch$2;
            state.position = pos$1;
            break;
          }
          break;
        }
      }
      final parts = parts$;
      // ["]
      if (state.ch == 34) {
        state.nextChar();
        parseS(state);
        return Ok(parts.length == 1 ? parts[0] : parts.isNotEmpty ? parts.join() : '');
      }
      state.error('Unterminated string', start: start);
      state.errorExpected('"');
      state.ch = ch$;
      state.position = pos$;
      return null;
    }
    return null;
  }

  /// [num] **Number**
  /// ```txt
  /// `num` Number =>
  ///   {
  ///     final start = state.position;
  ///     var flag = true;
  ///   }
  ///   [-]?
  ///   ([0] / [1-9] [0-9]*)
  ///   ~{ state.errorExpected('digit'); }
  ///   (
  ///     [.]
  ///     [0-9]+
  ///     ~{
  ///       state.errorExpected('digit');
  ///       state.error('Fractional part is missing a number');
  ///       state.error('Malformed number', start: start, end: state.position);
  ///     }
  ///     { flag = false; }
  ///   )?
  ///   (
  ///     [eE]
  ///     [\-+]?
  ///     [0-9]+
  ///     ~{
  ///       state.errorExpected('digit');
  ///       state.error('Exponent part is missing a number');
  ///       state.error('Malformed number', start: start, end: state.position);
  ///     }
  ///     { flag = false; }
  ///   )?
  ///   text = { state.substring(start, state.position) }
  ///   S
  ///   $ = { flag && text.length <= 18 ? int.parse(text) : num.parse(text) }
  /// ```
  Result<num>? parseNumber(State state) {
    final pos$ = state.position;
    final ch$ = state.ch;
    final start = state.position;
    var flag = true;
    l$:
    {
      // [\-]
      if (state.ch == 45) {
        state.nextChar();
        break l$;
      }
      break l$;
    }
    // l$:
    l$1:
    {
      // [0]
      if (state.ch == 48) {
        state.nextChar();
        break l$1;
      }
      // [1-9]
      final ch$1 = state.ch;
      final isSuccess$ = ch$1 >= 49 && ch$1 <= 57;
      if (isSuccess$) {
        state.nextChar();
        // (0)
        while (true) {
          // [0-9]
          final ch$2 = state.ch;
          final isSuccess$1 = ch$2 >= 48 && ch$2 <= 57;
          if (isSuccess$1) {
            state.nextChar();
            continue;
          }
          break;
        }
        break l$1;
      }
      state.errorExpected('digit');
      state.ch = ch$;
      state.position = pos$;
      return null;
    }
    // l$1:
    l$2:
    {
      // [.]
      if (state.ch == 46) {
        final pos$1 = state.position;
        final ch$3 = state.ch;
        state.nextChar();
        var isSuccess$2 = false;
        // (1)
        while (true) {
          // [0-9]
          final ch$4 = state.ch;
          final isSuccess$3 = ch$4 >= 48 && ch$4 <= 57;
          if (isSuccess$3) {
            state.nextChar();
            isSuccess$2 = true;
            continue;
          }
          break;
        }
        if (isSuccess$2) {
          flag = false;
          break l$2;
        } else {
          state.errorExpected('digit');
          state.error('Fractional part is missing a number');
          state.error('Malformed number', start: start, end: state.position);
          state.ch = ch$3;
          state.position = pos$1;
          break l$2;
        }
      }
      break l$2;
    }
    // l$2:
    l$3:
    {
      // [eE]
      final ch$6 = state.ch;
      final isSuccess$4 = ch$6 == 69 || ch$6 == 101;
      if (isSuccess$4) {
        final pos$2 = state.position;
        final ch$5 = state.ch;
        state.nextChar();
        l$4:
        {
          // [\-+]
          final ch$7 = state.ch;
          final isSuccess$5 = ch$7 == 43 || ch$7 == 45;
          if (isSuccess$5) {
            state.nextChar();
            break l$4;
          }
          break l$4;
        }
        // l$4:
        var isSuccess$6 = false;
        // (1)
        while (true) {
          // [0-9]
          final ch$8 = state.ch;
          final isSuccess$7 = ch$8 >= 48 && ch$8 <= 57;
          if (isSuccess$7) {
            state.nextChar();
            isSuccess$6 = true;
            continue;
          }
          break;
        }
        if (isSuccess$6) {
          flag = false;
          break l$3;
        } else {
          state.errorExpected('digit');
          state.error('Exponent part is missing a number');
          state.error('Malformed number', start: start, end: state.position);
          state.ch = ch$5;
          state.position = pos$2;
          break l$3;
        }
      }
      break l$3;
    }
    // l$3:
    final text = state.substring(start, state.position);
    parseS(state);
    return Ok(flag && text.length <= 18 ? int.parse(text) : num.parse(text));
  }

  /// [void] **S**
  /// ```txt
  /// `void` S =>
  ///   [\n\r\t ]*
  /// ```
  Result<void> parseS(State state) {
    // (0)
    while (true) {
      // [\n\r\t ]
      final ch$ = state.ch;
      final isSuccess$ = ch$ <= 13 ? ch$ >= 13 || ch$ >= 9 && ch$ <= 10 : ch$ == 32;
      if (isSuccess$) {
        state.nextChar();
        continue;
      }
      break;
    }
    return Result.none;
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
