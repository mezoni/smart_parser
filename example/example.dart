import 'package:source_span/source_span.dart';

Object? parse(String source) {
  const parser = JsonParser();
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
class JsonParser {
  const JsonParser();

  /// [Object?] **Start**
  /// ```txt
  /// `Object?` Start =>
  ///   S
  ///   $ = Value
  ///   & { state.ch < 0 }
  ///   ~{ state.errorExpected('enf of file'); }
  /// ```
  Result<Object?>? parseStart(State state) {
    final pos$ = state.position;
    final ch$ = state.ch;
    parseS(state);
    l$:
    {
      final value$ = parseValue(state);
      if (value$ != null) {
        final isSuccess$ = state.ch < 0;
        if (isSuccess$) {
          return value$;
        }
        state.errorExpected('enf of file');
        break l$;
      }
      break l$;
    }
    // l$:
    state.ch = ch$;
    state.position = pos$;
    return null;
  }

  /// [List<Object?>] **Elements**
  /// ```txt
  /// `List<Object?>` Elements =>
  ///   value = Value
  ///   { final elements = [value]; }
  ///   @while (0) {
  ///     ',' S
  ///     value = Value
  ///     { elements.add(value); }
  ///   }
  ///   $ = { elements }
  /// ```
  Result<List<Object?>>? parseElements(State state) {
    final value$ = parseValue(state);
    if (value$ != null) {
      final value = value$.$1;
      final elements = [value];
      // (0)
      while (true) {
        // ','
        if (state.ch == 44) {
          final pos$ = state.position;
          final ch$ = state.ch;
          state.nextChar();
          parseS(state);
          final value$1 = parseValue(state);
          if (value$1 != null) {
            final value = value$1.$1;
            elements.add(value);
            continue;
          }
          state.ch = ch$;
          state.position = pos$;
          break;
        }
        state.errorExpected(',');
        break;
      }
      return Ok(elements);
    }
    return null;
  }

  /// [List<Object?>] **Array**
  /// ```txt
  /// `List<Object?>` Array =>
  ///   "[" S
  ///   elements = Elements?
  ///   ']' S
  ///   $ = { elements ?? [] }
  /// ```
  Result<List<Object?>>? parseArray(State state) {
    // "["
    if (state.ch == 91) {
      final pos$ = state.position;
      final ch$ = state.ch;
      state.nextChar();
      parseS(state);
      final elements$ = parseElements(state);
      final elements = elements$?.$1;
      // ']'
      if (state.ch == 93) {
        state.nextChar();
        parseS(state);
        return Ok(elements ?? []);
      }
      state.errorExpected(']');
      state.ch = ch$;
      state.position = pos$;
      return null;
    }
    return null;
  }

  /// [MapEntry<String, Object?>] **KeyValue**
  /// ```txt
  /// `MapEntry<String, Object?>` KeyValue =>
  ///   key = String
  ///   ~{ state.errorExpected('string'); }
  ///   ':' S
  ///   value = Value
  ///   $ = { MapEntry(key, value) }
  /// ```
  Result<MapEntry<String, Object?>>? parseKeyValue(State state) {
    final pos$ = state.position;
    final ch$ = state.ch;
    final string$ = parseString(state);
    if (string$ != null) {
      final key = string$.$1;
      l$:
      {
        // ':'
        if (state.ch == 58) {
          state.nextChar();
          parseS(state);
          final value$ = parseValue(state);
          if (value$ != null) {
            final value = value$.$1;
            return Ok(MapEntry(key, value));
          }
          break l$;
        }
        state.errorExpected(':');
        break l$;
      }
      // l$:
      state.ch = ch$;
      state.position = pos$;
      return null;
    }
    state.errorExpected('string');
    return null;
  }

  /// [Map<String, Object?>] **Map**
  /// ```txt
  /// `Map<String, Object?>` Map =>
  ///   keyValue = KeyValue
  ///   {
  ///     final map = <String, Object?>{};
  ///     map[keyValue.key] = keyValue.value;
  ///   }
  ///   @while (0) {
  ///     ',' S
  ///     keyValue = KeyValue
  ///     { map[keyValue.key] = keyValue.value; }
  ///   }
  ///   $ = { map }
  /// ```
  Result<Map<String, Object?>>? parseMap(State state) {
    final keyValue$ = parseKeyValue(state);
    if (keyValue$ != null) {
      final keyValue = keyValue$.$1;
      final map = <String, Object?>{};
      map[keyValue.key] = keyValue.value;
      // (0)
      while (true) {
        // ','
        if (state.ch == 44) {
          final pos$ = state.position;
          final ch$ = state.ch;
          state.nextChar();
          parseS(state);
          final keyValue$1 = parseKeyValue(state);
          if (keyValue$1 != null) {
            final keyValue = keyValue$1.$1;
            map[keyValue.key] = keyValue.value;
            continue;
          }
          state.ch = ch$;
          state.position = pos$;
          break;
        }
        state.errorExpected(',');
        break;
      }
      return Ok(map);
    }
    return null;
  }

  /// [Map<String, Object?>] **Object**
  /// ```txt
  /// `Map<String, Object?>` Object =>
  ///   "{" S
  ///   map = Map?
  ///   '}' S
  ///   $ = { map ?? {} }
  /// ```
  Result<Map<String, Object?>>? parseObject(State state) {
    // "{"
    if (state.ch == 123) {
      final pos$ = state.position;
      final ch$ = state.ch;
      state.nextChar();
      parseS(state);
      final map$ = parseMap(state);
      final map = map$?.$1;
      // '}'
      if (state.ch == 125) {
        state.nextChar();
        parseS(state);
        return Ok(map ?? {});
      }
      state.errorExpected('}');
      state.ch = ch$;
      state.position = pos$;
      return null;
    }
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
        final c$ = state.ch;
        final isHexDigit$ = c$ <= 70 ? c$ >= 65 || c$ >= 48 && c$ <= 57 : c$ >= 97 && c$ <= 102;
        if (isHexDigit$) {
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
          final c$ = state.ch;
          final isNotBackslashOrControlOrDoubleQuote$ = !(c$ <= 34 ? c$ >= 34 || c$ >= 0 && c$ <= 31 : c$ == 92) && !(c$ < 0);
          if (isNotBackslashOrControlOrDoubleQuote$) {
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
            final ch$1 = state.ch;
            state.nextChar();
            final escaped$ = parseEscaped(state);
            if (escaped$ != null) {
              parts$.add(escaped$.$1);
              continue;
            }
            state.ch = ch$1;
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
        final ch$1 = state.ch;
        state.nextChar();
        var isSuccess$ = false;
        // (1)
        while (true) {
          // [0-9]
          final c$2 = state.ch;
          final isDigit$1 = c$2 >= 48 && c$2 <= 57;
          if (isDigit$1) {
            state.nextChar();
            isSuccess$ = true;
            continue;
          }
          break;
        }
        if (isSuccess$) {
          flag = false;
          break l$2;
        } else {
          state.errorExpected('digit');
          state.error('Fractional part is missing a number');
          state.error('Malformed number', start: start, end: state.position);
          state.ch = ch$1;
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
      final c$3 = state.ch;
      final isInRange$ = c$3 == 69 || c$3 == 101;
      if (isInRange$) {
        final pos$2 = state.position;
        final ch$2 = state.ch;
        state.nextChar();
        l$4:
        {
          // [\-+]
          final c$4 = state.ch;
          final isMinusOrPlus$ = c$4 == 43 || c$4 == 45;
          if (isMinusOrPlus$) {
            state.nextChar();
            break l$4;
          }
          break l$4;
        }
        // l$4:
        var isSuccess$1 = false;
        // (1)
        while (true) {
          // [0-9]
          final c$5 = state.ch;
          final isDigit$2 = c$5 >= 48 && c$5 <= 57;
          if (isDigit$2) {
            state.nextChar();
            isSuccess$1 = true;
            continue;
          }
          break;
        }
        if (isSuccess$1) {
          flag = false;
          break l$3;
        } else {
          state.errorExpected('digit');
          state.error('Exponent part is missing a number');
          state.error('Malformed number', start: start, end: state.position);
          state.ch = ch$2;
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

  /// [Object?] **Value**
  /// ```txt
  /// `Object?` Value =>
  ///   (
  ///     "null" S
  ///     $ = `const` { null }
  ///     ----
  ///     "true" S
  ///     $ = `const` { true }
  ///     ----
  ///     "false" S
  ///     $ = `const` { false }
  ///     ----
  ///     & "{"
  ///     $ = Object
  ///     ----
  ///     & "["
  ///     $ = Array
  ///     ----
  ///     & ["]
  ///     $ = String
  ///     ----
  ///     Number
  ///   )
  ///   ~{ state.errorExpected(const ['string', 'number', 'array', 'object', 'null', 'boolean value']); }
  /// ```
  Result<Object?>? parseValue(State state) {
    // "null"
    if (state.ch == 110 && state.startsWith('null')) {
      state.readChar(state.position + 4);
      parseS(state);
      return const Ok(null);
    }
    // "true"
    if (state.ch == 116 && state.startsWith('true')) {
      state.readChar(state.position + 4);
      parseS(state);
      return const Ok(true);
    }
    // "false"
    if (state.ch == 102 && state.startsWith('false')) {
      state.readChar(state.position + 5);
      parseS(state);
      return const Ok(false);
    }
    l$:
    {
      // "{"
      if (state.ch == 123) {
        final object$ = parseObject(state);
        if (object$ != null) {
          return object$;
        }
        break l$;
      }
      break l$;
    }
    // l$:
    l$1:
    {
      // "["
      if (state.ch == 91) {
        final array$ = parseArray(state);
        if (array$ != null) {
          return array$;
        }
        break l$1;
      }
      break l$1;
    }
    // l$1:
    l$2:
    {
      // ["]
      if (state.ch == 34) {
        final string$ = parseString(state);
        if (string$ != null) {
          return string$;
        }
        break l$2;
      }
      break l$2;
    }
    // l$2:
    final number$ = parseNumber(state);
    if (number$ != null) {
      return number$;
    }
    state.errorExpected(const ['string', 'number', 'array', 'object', 'null', 'boolean value']);
    return null;
  }

  /// [void] **S**
  /// ```txt
  /// `void` S =>
  ///     [\n\r\t ]*
  /// ```
  Result<void> parseS(State state) {
    // (0)
    while (true) {
      // [\n\r\t ]
      final c$ = state.ch;
      final isWhitespace$ = c$ <= 13 ? c$ >= 13 || c$ >= 9 && c$ <= 10 : c$ == 32;
      if (isWhitespace$) {
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
