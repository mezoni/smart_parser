import 'package:source_span/source_span.dart';

import 'json_token.dart';
import 'json_tokenizer.dart';

Object? parse(String source) {
  final tokens = tokenize(source);
  final parser = JsonParser(tokens);
  final state = State('');
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

// dart format off
class JsonParser {
  Token token;

  int index = 0;

  final List<Token> _tokens;

  JsonParser(List<Token> tokens)
    : _tokens = tokens,
      token = tokens.isEmpty
          ? throw ArgumentError('Must not be empty', 'tokens')
          : tokens.first;

  /// Advances the parsing position to the next token, if possible.
  /// Sets this token as the current token.
  /// Returns the token that was current when this method was called.
  Token nextToken(State state) {
    final token = this.token;
    if (index < _tokens.length) {
      this.token = _tokens[++index];
      final start = this.token.start;
      state.position = start;
      if (state.farthestPosition < start) {
        state.farthestPosition = start;
      }
    }

    return token;
  }

  /// Restores the current token.
  void restoreToken(State state, int index) {
    this.index = index;
    token = _tokens[index];
    state.position = token.start;
  }

  /// [Object?] **Start**
  /// ```txt
  /// `Object?` Start =>
  ///   $ = Value
  ///   & { token.kind == TokenKind.eof }
  ///   ~{ state.errorExpected('enf of file'); }
  /// ```
  Result<Object?>? parseStart(State state) {
    final index$ = index;
    final value$ = parseValue(state);
    if (value$ != null) {
      final isSuccess$ = token.kind == TokenKind.eof;
      if (isSuccess$) {
        return value$;
      }
      state.errorExpected('enf of file');
      restoreToken(state, index$);
      return null;
    }
    return null;
  }

  /// [List<Object?>] **Elements**
  /// ```txt
  /// `List<Object?>` Elements =>
  ///   v = Value
  ///   { final l = [v]; }
  ///   @while (0) {
  ///     comma
  ///     ~{ state.errorExpected(','); }
  ///     v = Value
  ///     { l.add(v); }
  ///   }
  ///   $ = { l }
  /// ```
  Result<List<Object?>>? parseElements(State state) {
    final value$ = parseValue(state);
    if (value$ != null) {
      final v = value$.$1;
      final l = [v];
      // (0)
      while (true) {
        final index$ = index;
        if (token.kind == TokenKind.comma) {
          nextToken(state);
          final value$1 = parseValue(state);
          if (value$1 != null) {
            final v = value$1.$1;
            l.add(v);
            continue;
          }
          restoreToken(state, index$);
          break;
        } else {
          state.errorExpected(',');
          break;
        }
      }
      return Ok(l);
    }
    return null;
  }

  /// [List<Object?>] **Array**
  /// ```txt
  /// `List<Object?>` Array =>
  ///   openBracket
  ///   e = Elements?
  ///   closeBracket
  ///   ~{ state.errorExpected(']'); }
  ///   $ = { e ?? [] }
  /// ```
  Result<List<Object?>>? parseArray(State state) {
    final index$ = index;
    if (token.kind == TokenKind.openBracket) {
      nextToken(state);
      final elements$ = parseElements(state);
      final e = elements$?.$1;
      if (token.kind == TokenKind.closeBracket) {
        nextToken(state);
        return Ok(e ?? []);
      } else {
        state.errorExpected(']');
        restoreToken(state, index$);
        return null;
      }
    } else {
      return null;
    }
  }

  /// [MapEntry<String, Object?>] **KeyValue**
  /// ```txt
  /// `MapEntry<String, Object?>` KeyValue =>
  ///   k = string
  ///   ~{ state.errorExpected('string'); }
  ///   colon
  ///   ~{ state.errorExpected(':'); }
  ///   v = Value
  ///   $ = { MapEntry(k.value as String, v) }
  /// ```
  Result<MapEntry<String, Object?>>? parseKeyValue(State state) {
    final index$ = index;
    if (token.kind == TokenKind.string) {
      final token$ = nextToken(state);
      final k = token$;
      if (token.kind == TokenKind.colon) {
        nextToken(state);
        final value$ = parseValue(state);
        if (value$ != null) {
          final v = value$.$1;
          return Ok(MapEntry(k.value as String, v));
        }
        restoreToken(state, index$);
        return null;
      } else {
        state.errorExpected(':');
        restoreToken(state, index$);
        return null;
      }
    } else {
      state.errorExpected('string');
      return null;
    }
  }

  /// [Map<String, Object?>] **Map**
  /// ```txt
  /// `Map<String, Object?>` Map =>
  ///   v = KeyValue
  ///   {
  ///     final m = <String, Object?>{};
  ///     m[v.key] = v.value;
  ///   }
  ///   @while (0) {
  ///     comma
  ///     ~{ state.errorExpected(','); }
  ///     v = KeyValue
  ///     { m[v.key] = v.value; }
  ///   }
  ///   $ = { m }
  /// ```
  Result<Map<String, Object?>>? parseMap(State state) {
    final keyValue$ = parseKeyValue(state);
    if (keyValue$ != null) {
      final v = keyValue$.$1;
      final m = <String, Object?>{};
      m[v.key] = v.value;
      // (0)
      while (true) {
        final index$ = index;
        if (token.kind == TokenKind.comma) {
          nextToken(state);
          final keyValue$1 = parseKeyValue(state);
          if (keyValue$1 != null) {
            final v = keyValue$1.$1;
            m[v.key] = v.value;
            continue;
          }
          restoreToken(state, index$);
          break;
        } else {
          state.errorExpected(',');
          break;
        }
      }
      return Ok(m);
    }
    return null;
  }

  /// [Map<String, Object?>] **Object**
  /// ```txt
  /// `Map<String, Object?>` Object =>
  ///   openBrace
  ///   m = Map?
  ///   closeBrace
  ///   ~{ state.errorExpected('\u007D'); }
  ///   $ = { m ?? {} }
  /// ```
  Result<Map<String, Object?>>? parseObject(State state) {
    final index$ = index;
    if (token.kind == TokenKind.openBrace) {
      nextToken(state);
      final map$ = parseMap(state);
      final m = map$?.$1;
      if (token.kind == TokenKind.closeBrace) {
        nextToken(state);
        return Ok(m ?? {});
      } else {
        state.errorExpected('\u007D');
        restoreToken(state, index$);
        return null;
      }
    } else {
      return null;
    }
  }

  /// [Object?] **Value**
  /// ```txt
  /// `Object?` Value =>
  ///   (
  ///     v = string
  ///     $ = { v.value }
  ///     ----
  ///     v = number
  ///     $ = { v.value }
  ///     ----
  ///     null$
  ///     $ = `const` { null }
  ///     ----
  ///     true$
  ///     $ = `const` { true }
  ///     ----
  ///     false$
  ///     $ = `const` { false }
  ///     ----
  ///     & openBrace
  ///     $ = Object
  ///     ----
  ///     & openBracket
  ///     $ = Array
  ///   )
  ///   ~{ state.errorExpected(const ['string', 'number', 'array', 'object', 'null', 'boolean value']); }
  /// ```
  Result<Object?>? parseValue(State state) {
    if (token.kind == TokenKind.string) {
      final token$ = nextToken(state);
      final v = token$;
      return Ok(v.value);
    } else {
      if (token.kind == TokenKind.number) {
        final token$1 = nextToken(state);
        final v = token$1;
        return Ok(v.value);
      } else {
        if (token.kind == TokenKind.null$) {
          nextToken(state);
          return const Ok(null);
        } else {
          if (token.kind == TokenKind.true$) {
            nextToken(state);
            return const Ok(true);
          } else {
            if (token.kind == TokenKind.false$) {
              nextToken(state);
              return const Ok(false);
            } else {
              l$:
              {
                if (token.kind == TokenKind.openBrace) {
                  final object$ = parseObject(state);
                  if (object$ != null) {
                    return object$;
                  }
                  break l$;
                } else {
                  break l$;
                }
              }
              // l$:
              if (token.kind == TokenKind.openBracket) {
                final array$ = parseArray(state);
                if (array$ != null) {
                  return array$;
                }
                state.errorExpected(const ['string', 'number', 'array', 'object', 'null', 'boolean value']);
                return null;
              } else {
                state.errorExpected(const ['string', 'number', 'array', 'object', 'null', 'boolean value']);
                return null;
              }
            }
          }
        }
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
