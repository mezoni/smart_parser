import 'package:source_span/source_span.dart';

import 'json_token.dart';

List<Token> tokenize(String source) {
  const lexer = JsonTokenizer();
  final state = State(source);
  final result = lexer.parseStart(state);
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

// dart format off
class JsonTokenizer {
  const JsonTokenizer();

  Token _token(int start, int end, TokenType type, Object? value) {
    return Token(start: start, end: end, type: type, value: value);
  }

  /// [List<Token>] **Start**
  /// ```txt
  /// `List<Token>` Start =>
  ///   $ = Tokens
  ///   !.
  /// ```
  Result<List<Token>>? parseStart(State state) {
    final $0 = state.position;
    final $1 = parseTokens(state);
    state.predicate++;
    final $2 = state.position;
    var $3 = true;
    final $4 = state.peek();
    if ($4 >= 0) {
      state.position += $4 > 0xffff ? 2 : 1;
      $3 = false;
      state.backtrack($2);
    }
    state.predicate--;
    if ($3) {
      return $1;
    }
    state.backtrack($0);
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
  ///       $ = { _token(start, state.position, TokenType.colon, ':') }
  ///       ----
  ///       ","
  ///       $ = { _token(start, state.position, TokenType.comma, ',') }
  ///       ----
  ///       "{"
  ///       $ = { _token(start, state.position, TokenType.openBrace, '\u007B') }
  ///       ----
  ///       "}"
  ///       $ = { _token(start, state.position, TokenType.closeBrace, '\u007D') }
  ///       ----
  ///       "["
  ///       $ = { _token(start, state.position, TokenType.openBracket, '[') }
  ///       ----
  ///       "]"
  ///       $ = { _token(start, state.position, TokenType.closeBracket, ']') }
  ///       ----
  ///       "null"
  ///       $ = { _token(start, state.position, TokenType.null$, null) }
  ///       ----
  ///       "true"
  ///       $ = { _token(start, state.position, TokenType.true$, true) }
  ///       ----
  ///       "false"
  ///       $ = { _token(start, state.position, TokenType.false$, false) }
  ///       ----
  ///       "\""
  ///       v = String
  ///       $ = { _token(start, state.position, TokenType.string, v) }
  ///       ----
  ///       v = Number
  ///       $ = { _token(start, state.position, TokenType.number, v) }
  ///     )
  ///   )*
  ///   S
  /// ```
  Result<List<Token>> parseTokens(State state) {
    final $0 = <Token>[];
    while (true) {
      final $1 = state.position;
      parseS(state);
      final int start = state.position;
      final $2 = state.peek();
      // ':'
      if ($2 == 58) {
        state.position += 1;
        final $3 = _token(start, state.position, TokenType.colon, ':');
        $0.add($3);
        continue;
      }
      // ','
      if ($2 == 44) {
        state.position += 1;
        final $4 = _token(start, state.position, TokenType.comma, ',');
        $0.add($4);
        continue;
      }
      // '{'
      if ($2 == 123) {
        state.position += 1;
        final $5 = _token(start, state.position, TokenType.openBrace, '\u007B');
        $0.add($5);
        continue;
      }
      // '}'
      if ($2 == 125) {
        state.position += 1;
        final $6 = _token(start, state.position, TokenType.closeBrace, '\u007D');
        $0.add($6);
        continue;
      }
      // '['
      if ($2 == 91) {
        state.position += 1;
        final $7 = _token(start, state.position, TokenType.openBracket, '[');
        $0.add($7);
        continue;
      }
      // ']'
      if ($2 == 93) {
        state.position += 1;
        final $8 = _token(start, state.position, TokenType.closeBracket, ']');
        $0.add($8);
        continue;
      }
      if ($2 == 110 && state.startsWith('null')) {
        state.position += 4;
        final $9 = _token(start, state.position, TokenType.null$, null);
        $0.add($9);
        continue;
      }
      if ($2 == 116 && state.startsWith('true')) {
        state.position += 4;
        final $10 = _token(start, state.position, TokenType.true$, true);
        $0.add($10);
        continue;
      }
      if ($2 == 102 && state.startsWith('false')) {
        state.position += 5;
        final $11 = _token(start, state.position, TokenType.false$, false);
        $0.add($11);
        continue;
      }
      final $12 = state.position;
      // '"'
      if ($2 == 34) {
        state.position += 1;
        final $13 = parseString(state);
        if ($13 != null) {
          final v = $13.$1;
          final $14 = _token(start, state.position, TokenType.string, v);
          $0.add($14);
          continue;
        }
      }
      state.backtrack($12);
      final $15 = parseNumber(state);
      if ($15 != null) {
        final v = $15.$1;
        final $16 = _token(start, state.position, TokenType.number, v);
        $0.add($16);
        continue;
      }
      state.backtrack($1);
      break;
    }
    parseS(state);
    return Ok($0);
  }

  /// [String] **Hex**
  /// ```txt
  /// `String` Hex =>
  ///   s = <
  ///     @while (4, 4) {
  ///       [a-fA-F0-9]
  ///     }
  ///   >
  ///   $ = { String.fromCharCode(int.parse(s, radix: 16)) }
  ///   ~ {
  ///     state.errorExpected('4 hexadecimal digit number');
  ///     state.errorIncorrect('Expected hexadecimal digit', false);
  ///     state.errorIncorrect('Incorrect 4 hexadecimal digit number', true);
  ///   }
  /// ```
  Result<String>? parseHex(State state) {
    final $0 = state.setErrorState();
    final $1 = state.setFarthestPosition();
    final $2 = state.position;
    var $3 = 0;
    while ($3 < 4) {
      final $4 = state.peek();
      final $5 = $4 <= 70 ? $4 >= 65 || $4 >= 48 && $4 <= 57 : $4 >= 97 && $4 <= 102;
      if ($5) {
        state.position += 1;
        $3++;
        continue;
      }
      break;
    }
    if ($3 >= 4) {
      final $6 = state.substring($2, state.position);
      final s = $6;
      final $7 = String.fromCharCode(int.parse(s, radix: 16));
      state.updateFarthestPosition($1);
      state.restoreErrorState($0);
      return Ok($7);
    } else {
      state.backtrack($2);
    }
    state.errorExpected('4 hexadecimal digit number');
    state.errorIncorrect('Expected hexadecimal digit', false);
    state.errorIncorrect('Incorrect 4 hexadecimal digit number', true);
    state.updateFarthestPosition($1);
    state.restoreErrorState($0);
    return null;
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
  ///   ~ { state.error('Illegal escape character'); }
  /// ```
  Result<String>? parseEscapeC(State state) {
    final $0 = state.setErrorState();
    final $1 = state.setFarthestPosition();
    final $2 = state.peek();
    // '"'
    if ($2 == 34) {
      state.position += 1;
      const $3 = '"';
      state.updateFarthestPosition($1);
      state.restoreErrorState($0);
      return const Ok($3);
    }
    // '\\'
    if ($2 == 92) {
      state.position += 1;
      const $4 = '\\';
      state.updateFarthestPosition($1);
      state.restoreErrorState($0);
      return const Ok($4);
    }
    // '/'
    if ($2 == 47) {
      state.position += 1;
      const $5 = '/';
      state.updateFarthestPosition($1);
      state.restoreErrorState($0);
      return const Ok($5);
    }
    // 'b'
    if ($2 == 98) {
      state.position += 1;
      const $6 = '\b';
      state.updateFarthestPosition($1);
      state.restoreErrorState($0);
      return const Ok($6);
    }
    // 'f'
    if ($2 == 102) {
      state.position += 1;
      const $7 = '\f';
      state.updateFarthestPosition($1);
      state.restoreErrorState($0);
      return const Ok($7);
    }
    // 'n'
    if ($2 == 110) {
      state.position += 1;
      const $8 = '\n';
      state.updateFarthestPosition($1);
      state.restoreErrorState($0);
      return const Ok($8);
    }
    // 'r'
    if ($2 == 114) {
      state.position += 1;
      const $9 = '\r';
      state.updateFarthestPosition($1);
      state.restoreErrorState($0);
      return const Ok($9);
    }
    // 't'
    if ($2 == 116) {
      state.position += 1;
      const $10 = '\t';
      state.updateFarthestPosition($1);
      state.restoreErrorState($0);
      return const Ok($10);
    }
    state.error('Illegal escape character');
    state.updateFarthestPosition($1);
    state.restoreErrorState($0);
    return null;
  }

  /// [String] **Escaped**
  /// ```txt
  /// `String` Escaped =>
  ///   [\\]
  ///   $ = (
  ///     [u]
  ///     $ = Hex
  ///     ----
  ///     EscapeC
  ///   )
  /// ```
  Result<String>? parseEscaped(State state) {
    final $0 = state.position;
    final $1 = state.peek();
    // '\\'
    if ($1 == 92) {
      state.position += 1;
      final $2 = state.position;
      final $3 = state.peek();
      // 'u'
      if ($3 == 117) {
        state.position += 1;
        final $4 = parseHex(state);
        if ($4 != null) {
          return $4;
        }
      }
      state.backtrack($2);
      final $5 = parseEscapeC(state);
      if ($5 != null) {
        return $5;
      }
    }
    state.backtrack($0);
    return null;
  }

  /// [String] **String**
  /// ```txt
  /// `String` String =>
  ///   p = @while (0) {
  ///     <[^{0-1F}"\\]+>
  ///     ---
  ///     Escaped
  ///   }
  ///   '"'
  ///   $ = { p.join() }
  /// ```
  Result<String>? parseString(State state) {
    final $0 = state.position;
    final $1 = <String>[];
    while (true) {
      final $2 = state.position;
      var $3 = false;
      while (true) {
        final $4 = state.peek();
        final $5 = !($4 <= 34 ? $4 >= 34 || $4 >= 0 && $4 <= 31 : $4 == 92) && !($4 < 0);
        if ($5) {
          state.position += $4 > 0xffff ? 2 : 1;
          $3 = true;
          continue;
        }
        break;
      }
      if ($3) {
        final $6 = state.substring($2, state.position);
        $1.add($6);
        continue;
      }
      final $7 = parseEscaped(state);
      if ($7 != null) {
        $1.add($7.$1);
        continue;
      }
      break;
    }
    final p = $1;
    final $8 = state.peek();
    // '"'
    if ($8 == 34) {
      state.position += 1;
      final $9 = p.join();
      return Ok($9);
    } else {
      state.errorExpected('"');
    }
    state.backtrack($0);
    return null;
  }

  /// [num] **Number**
  /// ```txt
  /// `num` Number =>
  ///   {
  ///     final start = state.position;
  ///     var flag = true;
  ///   }
  ///   [-]? ([0] / [1-9] [0-9]*)
  ///   (
  ///     ([.] [0-9]+)
  ///     { flag = false; }
  ///     ~ { state.errorIncorrect('Unterminated fractional number'); }
  ///   )?
  ///   (
  ///     ([eE] [\-+]? [0-9]+)
  ///     { flag = false; }
  ///     ~ { state.errorIncorrect('Exponent part is missing a number'); }
  ///   )?
  ///   s = { state.substring(start, state.position) }
  ///   $ = { flag && s.length <= 18 ? int.parse(s) : num.parse(s)  }
  /// ```
  Result<num>? parseNumber(State state) {
    final $0 = state.position;
    final start = state.position;
    var flag = true;
    final $1 = state.peek();
    // '-'
    if ($1 == 45) {
      state.position += 1;
    }
    var $2 = false;
    $l:
    {
      final $3 = state.peek();
      // '0'
      if ($3 == 48) {
        state.position += 1;
        $2 = true;
        break $l;
      }
      final $4 = state.position;
      final $5 = $3 >= 49 && $3 <= 57;
      if ($5) {
        state.position += 1;
        while (true) {
          final $6 = state.peek();
          final $7 = $6 >= 48 && $6 <= 57;
          if ($7) {
            state.position += 1;
            continue;
          }
          break;
        }
        $2 = true;
        break $l;
      }
      state.backtrack($4);
    }
    if ($2) {
      $l1:
      {
        final $8 = state.setErrorState();
        final $9 = state.setFarthestPosition();
        final $10 = state.position;
        final $11 = state.peek();
        // '.'
        if ($11 == 46) {
          state.position += 1;
          var $12 = false;
          while (true) {
            final $13 = state.peek();
            final $14 = $13 >= 48 && $13 <= 57;
            if ($14) {
              state.position += 1;
              $12 = true;
              continue;
            }
            break;
          }
          if ($12) {
            flag = false;
            state.updateFarthestPosition($9);
            state.restoreErrorState($8);
            break $l1;
          }
        }
        state.backtrack($10);
        state.errorIncorrect('Unterminated fractional number');
        state.updateFarthestPosition($9);
        state.restoreErrorState($8);
      }
      $l2:
      {
        final $15 = state.setErrorState();
        final $16 = state.setFarthestPosition();
        final $17 = state.position;
        final $18 = state.peek();
        final $19 = $18 == 69 || $18 == 101;
        if ($19) {
          state.position += 1;
          final $20 = state.peek();
          final $21 = $20 == 43 || $20 == 45;
          if ($21) {
            state.position += 1;
          }
          var $22 = false;
          while (true) {
            final $23 = state.peek();
            final $24 = $23 >= 48 && $23 <= 57;
            if ($24) {
              state.position += 1;
              $22 = true;
              continue;
            }
            break;
          }
          if ($22) {
            flag = false;
            state.updateFarthestPosition($16);
            state.restoreErrorState($15);
            break $l2;
          }
        }
        state.backtrack($17);
        state.errorIncorrect('Exponent part is missing a number');
        state.updateFarthestPosition($16);
        state.restoreErrorState($15);
      }
      final $25 = state.substring(start, state.position);
      final s = $25;
      final $26 = flag && s.length <= 18 ? int.parse(s) : num.parse(s);
      return Ok($26);
    }
    state.backtrack($0);
    return null;
  }

  /// [void] **S**
  /// ```txt
  /// `void` S =>
  ///   [\n\r\t ]*
  /// ```
  Result<void> parseS(State state) {
    while (true) {
      final $0 = state.peek();
      final $1 = $0 <= 13 ? $0 >= 13 || $0 >= 9 && $0 <= 10 : $0 == 32;
      if ($1) {
        state.position += 1;
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

  /// Intended for internal use only.
  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  void updateFarthestPosition(int farthestPosition) {
    if (this.farthestPosition < farthestPosition) {
      this.farthestPosition = farthestPosition;
    }
  }
}

