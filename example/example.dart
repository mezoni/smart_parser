import 'package:source_span/source_span.dart';

Object? parse(String source) {
  const parser = JsonParser();
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
    final $pos = state.position;
    final $c = state.ch;
    parseS(state);
    final $value = parseValue(state);
    if ($value != null) {
      final $ok = state.ch < 0;
      if ($ok) {
        return $value;
      } else {
        state.errorExpected('enf of file');
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

  /// [List<Object?>] **Elements**
  /// ```txt
  /// `List<Object?>` Elements =>
  ///   v = Value
  ///   { final l = [v]; }
  ///   @while (0) {
  ///     ',' S
  ///     v = Value
  ///     { l.add(v); }
  ///   }
  ///   $ = { l }
  /// ```
  Result<List<Object?>>? parseElements(State state) {
    final $value = parseValue(state);
    if ($value != null) {
      final v = $value.$1;
      final l = [v];
      // (0)
      while (true) {
        final $pos = state.position;
        final $c = state.ch;
        // ','
        if (state.ch == 44) {
          state.nextChar();
          parseS(state);
          final $value1 = parseValue(state);
          if ($value1 != null) {
            final v = $value1.$1;
            l.add(v);
            continue;
          } else {
            state.ch = $c;
            state.position = $pos;
            break;
          }
        } else {
          state.errorExpected(',');
          break;
        }
      }
      final $val = l;
      return Ok($val);
    } else {
      return null;
    }
  }

  /// [List<Object?>] **Array**
  /// ```txt
  /// `List<Object?>` Array =>
  ///   "[" S
  ///   e = Elements?
  ///   ']' S
  ///   $ = { e ?? [] }
  /// ```
  Result<List<Object?>>? parseArray(State state) {
    final $pos = state.position;
    final $c = state.ch;
    // "["
    if (state.ch == 91) {
      state.nextChar();
      parseS(state);
      final $elements = parseElements(state);
      final e = $elements?.$1;
      // ']'
      if (state.ch == 93) {
        state.nextChar();
        parseS(state);
        final $val = e ?? [];
        return Ok($val);
      } else {
        state.errorExpected(']');
        state.ch = $c;
        state.position = $pos;
        return null;
      }
    } else {
      return null;
    }
  }

  /// [MapEntry<String, Object?>] **KeyValue**
  /// ```txt
  /// `MapEntry<String, Object?>` KeyValue =>
  ///   k = String
  ///   ~{ state.errorExpected('string'); }
  ///   ':' S
  ///   v = Value
  ///   $ = { MapEntry(k, v) }
  /// ```
  Result<MapEntry<String, Object?>>? parseKeyValue(State state) {
    final $pos = state.position;
    final $c = state.ch;
    final $string = parseString(state);
    if ($string != null) {
      final k = $string.$1;
      // ':'
      if (state.ch == 58) {
        state.nextChar();
        parseS(state);
        final $value = parseValue(state);
        if ($value != null) {
          final v = $value.$1;
          final $val = MapEntry(k, v);
          return Ok($val);
        } else {
          state.ch = $c;
          state.position = $pos;
          return null;
        }
      } else {
        state.errorExpected(':');
        state.ch = $c;
        state.position = $pos;
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
  ///     ',' S
  ///     v = KeyValue
  ///     { m[v.key] = v.value; }
  ///   }
  ///   $ = { m }
  /// ```
  Result<Map<String, Object?>>? parseMap(State state) {
    final $keyValue = parseKeyValue(state);
    if ($keyValue != null) {
      final v = $keyValue.$1;
      final m = <String, Object?>{};
      m[v.key] = v.value;
      // (0)
      while (true) {
        final $pos = state.position;
        final $c = state.ch;
        // ','
        if (state.ch == 44) {
          state.nextChar();
          parseS(state);
          final $keyValue1 = parseKeyValue(state);
          if ($keyValue1 != null) {
            final v = $keyValue1.$1;
            m[v.key] = v.value;
            continue;
          } else {
            state.ch = $c;
            state.position = $pos;
            break;
          }
        } else {
          state.errorExpected(',');
          break;
        }
      }
      final $val = m;
      return Ok($val);
    } else {
      return null;
    }
  }

  /// [Map<String, Object?>] **Object**
  /// ```txt
  /// `Map<String, Object?>` Object =>
  ///   "{" S
  ///   m = Map?
  ///   '}' S
  ///   $ = { m ?? {} }
  /// ```
  Result<Map<String, Object?>>? parseObject(State state) {
    final $pos = state.position;
    final $c = state.ch;
    // "{"
    if (state.ch == 123) {
      state.nextChar();
      parseS(state);
      final $map = parseMap(state);
      final m = $map?.$1;
      // '}'
      if (state.ch == 125) {
        state.nextChar();
        parseS(state);
        final $val = m ?? {};
        return Ok($val);
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
      const $val = '"';
      return const Ok($val);
    } else {
      // [\\]
      if (state.ch == 92) {
        state.nextChar();
        const $val1 = '\\';
        return const Ok($val1);
      } else {
        // [/]
        if (state.ch == 47) {
          state.nextChar();
          const $val2 = '/';
          return const Ok($val2);
        } else {
          // [b]
          if (state.ch == 98) {
            state.nextChar();
            const $val3 = '\b';
            return const Ok($val3);
          } else {
            // [f]
            if (state.ch == 102) {
              state.nextChar();
              const $val4 = '\f';
              return const Ok($val4);
            } else {
              // [n]
              if (state.ch == 110) {
                state.nextChar();
                const $val5 = '\n';
                return const Ok($val5);
              } else {
                // [r]
                if (state.ch == 114) {
                  state.nextChar();
                  const $val6 = '\r';
                  return const Ok($val6);
                } else {
                  // [t]
                  if (state.ch == 116) {
                    state.nextChar();
                    const $val7 = '\t';
                    return const Ok($val7);
                  } else {
                    if (state.position == state.length) {
                      state.errorExpected('escape character');
                    } else {
                      state.error('Illegal escape character');
                    }
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

  /// [String] **EscapeUnicode**
  /// ```txt
  /// `String` EscapeUnicode =>
  ///   { final start = state.position; }
  ///   "u"
  ///   { var end = 0; }
  ///   s = <
  ///     @while (4, 4) {
  ///       [a-fA-F0-9]
  ///       ~{
  ///         end = state.position;
  ///         state.errorExpected('hexadecimal digit');
  ///       }
  ///     }
  ///   >
  ///   ~{ state.error('Incorrect Unicode escape sequence', position: end, start: start, end: end); }
  ///   $ = { String.fromCharCode(int.parse(s, radix: 16)) }
  /// ```
  Result<String>? parseEscapeUnicode(State state) {
    final $pos = state.position;
    final $c = state.ch;
    final start = state.position;
    // "u"
    if (state.ch == 117) {
      state.nextChar();
      var end = 0;
      final $pos1 = state.position;
      final $c1 = state.ch;
      var $cnt = 0;
      // (4, 4)
      while ($cnt < 4) {
        final $c2 = state.ch;
        final $ok = $c2 <= 70 ? $c2 >= 65 || $c2 >= 48 && $c2 <= 57 : $c2 >= 97 && $c2 <= 102;
        // [a-fA-F0-9]
        // ~{
        //   end = state.position;
        //   state.errorExpected('hexadecimal digit');
        // }
        if ($ok) {
          state.nextChar();
          $cnt++;
          continue;
        } else {
          end = state.position;
          state.errorExpected('hexadecimal digit');
          break;
        }
      }
      if ($cnt >= 4) {
        final $str = state.substring($pos1, state.position);
        final s = $str;
        final $val = String.fromCharCode(int.parse(s, radix: 16));
        return Ok($val);
      } else {
        state.ch = $c1;
        state.position = $pos1;
        state.error('Incorrect Unicode escape sequence', position: end, start: start, end: end);
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
  /// `String` Escaped =>
  ///   & "u"
  ///   $ = EscapeUnicode
  ///   ----
  ///   EscapeC
  /// ```
  Result<String>? parseEscaped(State state) {
    // "u"
    if (state.ch == 117) {
      final $escapeUnicode = parseEscapeUnicode(state);
      if ($escapeUnicode != null) {
        return $escapeUnicode;
      }
    }
    final $escapeC = parseEscapeC(state);
    if ($escapeC != null) {
      return $escapeC;
    } else {
      return null;
    }
  }

  /// [String] **String**
  /// ```txt
  /// `String` String =>
  ///   { final start = state.position; }
  ///   ["]
  ///   p = @while (0) {
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
  ///   $ = { p.join() }
  /// ```
  Result<String>? parseString(State state) {
    final $pos = state.position;
    final $c = state.ch;
    final start = state.position;
    // ["]
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
          final $ok1 = !($c1 <= 34 ? $c1 >= 34 || $c1 >= 0 && $c1 <= 31 : $c1 == 92) && !($c1 < 0);
          // [^{0-1f}"\\]
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
          final $c2 = state.ch;
          // [\\]
          if (state.ch == 92) {
            state.nextChar();
            final $escaped = parseEscaped(state);
            if ($escaped != null) {
              $list.add($escaped.$1);
              continue;
            } else {
              state.ch = $c2;
              state.position = $pos1;
            }
          }
          break;
        }
      }
      final p = $list;
      // ["]
      // ~{
      //   state.error('Unterminated string', start: start);
      //   state.errorExpected('"');
      // }
      if (state.ch == 34) {
        state.nextChar();
        parseS(state);
        final $val = p.join();
        return Ok($val);
      } else {
        state.error('Unterminated string', start: start);
        state.errorExpected('"');
        state.ch = $c;
        state.position = $pos;
        return null;
      }
    } else {
      return null;
    }
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
  ///   s = { state.substring(start, state.position) }
  ///   S
  ///   $ = { flag && s.length <= 18 ? int.parse(s) : num.parse(s) }
  /// ```
  Result<num>? parseNumber(State state) {
    final $pos = state.position;
    final $c = state.ch;
    final start = state.position;
    var flag = true;
    // [\-]
    if (state.ch == 45) {
      state.nextChar();
    }
    var $res = false;
    // [0]
    if (state.ch == 48) {
      state.nextChar();
      $res = true;
    } else {
      final $c1 = state.ch;
      final $ok = $c1 >= 49 && $c1 <= 57;
      // [1-9]
      if ($ok) {
        state.nextChar();
        // (0)
        while (true) {
          final $c2 = state.ch;
          final $ok1 = $c2 >= 48 && $c2 <= 57;
          // [0-9]
          if ($ok1) {
            state.nextChar();
            continue;
          } else {
            break;
          }
        }
        $res = true;
      } else {
        state.errorExpected('digit');
      }
    }
    if ($res) {
      final $pos1 = state.position;
      final $c3 = state.ch;
      // [.]
      if (state.ch == 46) {
        state.nextChar();
        var $ok2 = false;
        // (1)
        while (true) {
          final $c4 = state.ch;
          final $ok3 = $c4 >= 48 && $c4 <= 57;
          // [0-9]
          if ($ok3) {
            state.nextChar();
            $ok2 = true;
            continue;
          } else {
            break;
          }
        }
        if ($ok2) {
          flag = false;
        } else {
          state.errorExpected('digit');
          state.error('Fractional part is missing a number');
          state.error('Malformed number', start: start, end: state.position);
          state.ch = $c3;
          state.position = $pos1;
        }
      }
      final $pos2 = state.position;
      final $c5 = state.ch;
      final $ok4 = $c5 == 69 || $c5 == 101;
      // [eE]
      if ($ok4) {
        state.nextChar();
        final $c6 = state.ch;
        final $ok5 = $c6 == 43 || $c6 == 45;
        // [\-+]
        if ($ok5) {
          state.nextChar();
        }
        var $ok6 = false;
        // (1)
        while (true) {
          final $c7 = state.ch;
          final $ok7 = $c7 >= 48 && $c7 <= 57;
          // [0-9]
          if ($ok7) {
            state.nextChar();
            $ok6 = true;
            continue;
          } else {
            break;
          }
        }
        if ($ok6) {
          flag = false;
        } else {
          state.errorExpected('digit');
          state.error('Exponent part is missing a number');
          state.error('Malformed number', start: start, end: state.position);
          state.ch = $c5;
          state.position = $pos2;
        }
      }
      final $val = state.substring(start, state.position);
      final s = $val;
      parseS(state);
      final $val1 = flag && s.length <= 18 ? int.parse(s) : num.parse(s);
      return Ok($val1);
    } else {
      state.errorExpected('digit');
      state.ch = $c;
      state.position = $pos;
      return null;
    }
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
    if (state.ch == 110 && state.startsWith("null")) {
      state.readChar(state.position + 4, true);
      parseS(state);
      const $val = null;
      return const Ok($val);
    } else {
      // "true"
      if (state.ch == 116 && state.startsWith("true")) {
        state.readChar(state.position + 4, true);
        parseS(state);
        const $val1 = true;
        return const Ok($val1);
      } else {
        // "false"
        if (state.ch == 102 && state.startsWith("false")) {
          state.readChar(state.position + 5, true);
          parseS(state);
          const $val2 = false;
          return const Ok($val2);
        } else {
          // "{"
          if (state.ch == 123) {
            final $object = parseObject(state);
            if ($object != null) {
              return $object;
            }
          }
          // "["
          if (state.ch == 91) {
            final $array = parseArray(state);
            if ($array != null) {
              return $array;
            }
          }
          // ["]
          if (state.ch == 34) {
            final $string = parseString(state);
            if ($string != null) {
              return $string;
            }
          }
          final $number = parseNumber(state);
          if ($number != null) {
            return $number;
          } else {
            state.errorExpected(const ['string', 'number', 'array', 'object', 'null', 'boolean value']);
            return null;
          }
        }
      }
    }
  }

  /// [void] **S**
  /// ```txt
  /// `void` S =>
  ///     [\n\r\t ]*
  /// ```
  Result<void> parseS(State state) {
    // (0)
    while (true) {
      final $c = state.ch;
      final $ok = $c <= 13 ? $c >= 13 || $c >= 9 && $c <= 10 : $c == 32;
      // [\n\r\t ]
      if ($ok) {
        state.nextChar();
        continue;
      } else {
        break;
      }
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
  int match(List<int> lowerCase, List<int> upperCase) {
    if (lowerCase.length != upperCase.length) {
      throw ArgumentError('The lengths of the lists do not match');
    }

    if (upperCase.isEmpty) {
      return 0;
    }

    var ch = this.ch;
    if (ch == lowerCase[0] || ch == upperCase[0]) {
      var length = charSize(ch);
      for (var i = 1; i < lowerCase.length; i++) {
        ch = readChar(position + length, false);
        if (ch != lowerCase[i] && ch != upperCase[i]) {
          return -1;
        }

        length += charSize(ch);
      }

      return length;
    }

    return -1;
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
