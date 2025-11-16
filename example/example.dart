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
  ///   & { state.peek() < 0 }
  /// ```
  Result<Object?>? parseStart(State state) {
    final $0 = state.position;
    parseS(state);
    final $1 = parseValue(state);
    if ($1 != null) {
      final $2 = state.peek() < 0;
      if ($2) {
        return $1;
      } else {
        state.backtrack($0);
      }
    } else {
      state.backtrack($0);
    }
    return null;
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
    final $0 = parseValue(state);
    if ($0 != null) {
      final v = $0.$1;
      final l = [v];
      while (true) {
        final $1 = state.position;
        final $2 = state.peek();
        // ','
        if ($2 == 44) {
          state.position += 1;
          parseS(state);
          final $3 = parseValue(state);
          if ($3 != null) {
            final v = $3.$1;
            l.add(v);
            continue;
          } else {
            state.backtrack($1);
          }
        } else {
          state.errorExpected(',');
        }
        break;
      }
      final $4 = l;
      return Ok($4);
    }
    return null;
  }

  /// [List<Object?>] **Array**
  /// ```txt
  /// `List<Object?>` Array =>
  ///   '[' S
  ///   e = Elements?
  ///   ']' S
  ///   $ = { e ?? [] }
  /// ```
  Result<List<Object?>>? parseArray(State state) {
    final $0 = state.position;
    final $1 = state.peek();
    // '['
    if ($1 == 91) {
      state.position += 1;
      parseS(state);
      final $2 = parseElements(state);
      final e = $2?.$1;
      final $3 = state.peek();
      // ']'
      if ($3 == 93) {
        state.position += 1;
        parseS(state);
        final $4 = e ?? [];
        return Ok($4);
      } else {
        state.errorExpected(']');
        state.backtrack($0);
      }
    } else {
      state.errorExpected('[');
    }
    return null;
  }

  /// [MapEntry<String, Object?>] **KeyValue**
  /// ```txt
  /// `MapEntry<String, Object?>` KeyValue =>
  ///   k = String
  ///   ':' S
  ///   v = Value
  ///   $ = { MapEntry(k, v) }
  /// ```
  Result<MapEntry<String, Object?>>? parseKeyValue(State state) {
    final $0 = state.position;
    final $1 = parseString(state);
    if ($1 != null) {
      final k = $1.$1;
      final $2 = state.peek();
      // ':'
      if ($2 == 58) {
        state.position += 1;
        parseS(state);
        final $3 = parseValue(state);
        if ($3 != null) {
          final v = $3.$1;
          final $4 = MapEntry(k, v);
          return Ok($4);
        } else {
          state.backtrack($0);
        }
      } else {
        state.errorExpected(':');
        state.backtrack($0);
      }
    }
    return null;
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
    final $0 = parseKeyValue(state);
    if ($0 != null) {
      final v = $0.$1;
      final m = <String, Object?>{};
      m[v.key] = v.value;
      while (true) {
        final $1 = state.position;
        final $2 = state.peek();
        // ','
        if ($2 == 44) {
          state.position += 1;
          parseS(state);
          final $3 = parseKeyValue(state);
          if ($3 != null) {
            final v = $3.$1;
            m[v.key] = v.value;
            continue;
          } else {
            state.backtrack($1);
          }
        } else {
          state.errorExpected(',');
        }
        break;
      }
      final $4 = m;
      return Ok($4);
    }
    return null;
  }

  /// [Map<String, Object?>] **Object**
  /// ```txt
  /// `Map<String, Object?>` Object =>
  ///   '{' S
  ///   m = Map?
  ///   '}' S
  ///   $ = { m ?? {} }
  /// ```
  Result<Map<String, Object?>>? parseObject(State state) {
    final $0 = state.position;
    final $1 = state.peek();
    // '{'
    if ($1 == 123) {
      state.position += 1;
      parseS(state);
      final $2 = parseMap(state);
      final m = $2?.$1;
      final $3 = state.peek();
      // '}'
      if ($3 == 125) {
        state.position += 1;
        parseS(state);
        final $4 = m ?? {};
        return Ok($4);
      } else {
        state.errorExpected('}');
        state.backtrack($0);
      }
    } else {
      state.errorExpected('{');
    }
    return null;
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
  ///     state.errorIncorrect('Expected hexadecimal digit', false);
  ///     state.errorIncorrect('Unterminated 4 hexadecimal digit number', true);
  ///     state.errorExpected('4 hexadecimal digit number');
  ///   }
  /// ```
  Result<String>? parseHex(State state) {
    Result<String>? $0;
    final $1 = state.farthestPosition;
    state.farthestPosition = state.position;
    $l:
    {
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
        $0 = Ok($7);
        break $l;
      } else {
        state.backtrack($2);
      }
    }
    if ($0 != null) {
      state.farthestPosition < $1 ? state.farthestPosition = $1 : null;
      return $0;
    } else {
      state.errorIncorrect('Expected hexadecimal digit', false);
      state.errorIncorrect('Unterminated 4 hexadecimal digit number', true);
      state.errorExpected('4 hexadecimal digit number');
      state.farthestPosition < $1 ? state.farthestPosition = $1 : null;
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
  ///   ~ {
  ///     if (state.position == state.length) {
  ///       state.errorExpected('escape character');
  ///     } else {
  ///       state.error('Illegal escape character');
  ///     }
  ///   }
  /// ```
  Result<String>? parseEscapeC(State state) {
    Result<String>? $0;
    final $1 = state.farthestPosition;
    state.farthestPosition = state.position;
    $l:
    {
      final $2 = state.peek();
      // '"'
      if ($2 == 34) {
        state.position += 1;
        const $3 = '"';
        $0 = const Ok($3);
        break $l;
      }
      // '\\'
      if ($2 == 92) {
        state.position += 1;
        const $4 = '\\';
        $0 = const Ok($4);
        break $l;
      }
      // '/'
      if ($2 == 47) {
        state.position += 1;
        const $5 = '/';
        $0 = const Ok($5);
        break $l;
      }
      // 'b'
      if ($2 == 98) {
        state.position += 1;
        const $6 = '\b';
        $0 = const Ok($6);
        break $l;
      }
      // 'f'
      if ($2 == 102) {
        state.position += 1;
        const $7 = '\f';
        $0 = const Ok($7);
        break $l;
      }
      // 'n'
      if ($2 == 110) {
        state.position += 1;
        const $8 = '\n';
        $0 = const Ok($8);
        break $l;
      }
      // 'r'
      if ($2 == 114) {
        state.position += 1;
        const $9 = '\r';
        $0 = const Ok($9);
        break $l;
      }
      // 't'
      if ($2 == 116) {
        state.position += 1;
        const $10 = '\t';
        $0 = const Ok($10);
        break $l;
      }
    }
    if ($0 != null) {
      state.farthestPosition < $1 ? state.farthestPosition = $1 : null;
      return $0;
    } else {
      if (state.position == state.length) {
        state.errorExpected('escape character');
      } else {
        state.error('Illegal escape character');
      }
      state.farthestPosition < $1 ? state.farthestPosition = $1 : null;
    }
    return null;
  }

  /// [String] **Escaped**
  /// ```txt
  /// `String` Escaped =>
  ///   [u]
  ///   $ = Hex
  ///   ----
  ///   EscapeC
  /// ```
  Result<String>? parseEscaped(State state) {
    final $0 = state.position;
    final $1 = state.peek();
    // 'u'
    if ($1 == 117) {
      state.position += 1;
      final $2 = parseHex(state);
      if ($2 != null) {
        return $2;
      } else {
        state.backtrack($0);
      }
    }
    final $3 = parseEscapeC(state);
    if ($3 != null) {
      return $3;
    }
    return null;
  }

  /// [String] **String**
  /// ```txt
  /// `String` String =>
  ///   '"' S
  ///   p = @while (0) {
  ///     <[^{0-1F}"\\]+>
  ///     ---
  ///     [\\]
  ///     $ = Escaped
  ///   }
  ///   '"' S
  ///   $ = { p.join() }
  /// ```
  Result<String>? parseString(State state) {
    final $0 = state.position;
    final $1 = state.peek();
    // '"'
    if ($1 == 34) {
      state.position += 1;
      parseS(state);
      final $2 = <String>[];
      while (true) {
        final $3 = state.position;
        var $4 = false;
        while (true) {
          final $5 = state.peek();
          final $6 = !($5 <= 34 ? $5 >= 34 || $5 >= 0 && $5 <= 31 : $5 == 92) && !($5 < 0);
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
        final $8 = state.peek();
        // '\\'
        if ($8 == 92) {
          state.position += 1;
          final $9 = parseEscaped(state);
          if ($9 != null) {
            $2.add($9.$1);
            continue;
          } else {
            state.backtrack($3);
          }
        }
        break;
      }
      final p = $2;
      final $10 = state.peek();
      // '"'
      if ($10 == 34) {
        state.position += 1;
        parseS(state);
        final $11 = p.join();
        return Ok($11);
      } else {
        state.errorExpected('"');
        state.backtrack($0);
      }
    } else {
      state.errorExpected('"');
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
  ///   [-]? ([0] / [1-9] [0-9]*)
  ///   (
  ///     ([.] [0-9]+)
  ///     { flag = false; }
  ///     ~ { state.errorIncorrect('Fractional part is missing a number'); }
  ///   )?
  ///   (
  ///     ([eE] [\-+]? [0-9]+)
  ///     { flag = false; }
  ///     ~ { state.errorIncorrect('Exponent part is missing a number'); }
  ///   )?
  ///   s = { state.substring(start, state.position) }
  ///   S
  ///   $ = { flag && s.length <= 18 ? int.parse(s) : num.parse(s) }
  ///   ~ {
  ///     state.errorIncorrect('Unterminated number', true);
  ///     state.errorExpected('number');
  ///   }
  /// ```
  Result<num>? parseNumber(State state) {
    Result<num>? $0;
    final $1 = state.farthestPosition;
    state.farthestPosition = state.position;
    $l:
    {
      final $2 = state.position;
      final start = state.position;
      var flag = true;
      final $3 = state.peek();
      // '-'
      if ($3 == 45) {
        state.position += 1;
      }
      var $4 = false;
      $l1:
      {
        final $5 = state.peek();
        // '0'
        if ($5 == 48) {
          state.position += 1;
          $4 = true;
          break $l1;
        }
        final $6 = $5 >= 49 && $5 <= 57;
        if ($6) {
          state.position += 1;
          while (true) {
            final $7 = state.peek();
            final $8 = $7 >= 48 && $7 <= 57;
            if ($8) {
              state.position += 1;
              continue;
            }
            break;
          }
          $4 = true;
          break $l1;
        }
      }
      if ($4) {
        var $9 = false;
        final $10 = state.farthestPosition;
        state.farthestPosition = state.position;
        $l2:
        {
          final $11 = state.position;
          final $12 = state.peek();
          // '.'
          if ($12 == 46) {
            state.position += 1;
            var $13 = false;
            while (true) {
              final $14 = state.peek();
              final $15 = $14 >= 48 && $14 <= 57;
              if ($15) {
                state.position += 1;
                $13 = true;
                continue;
              }
              break;
            }
            if ($13) {
              flag = false;
              $9 = true;
              break $l2;
            } else {
              state.backtrack($11);
            }
          }
        }
        if ($9) {
          state.farthestPosition < $10 ? state.farthestPosition = $10 : null;
        } else {
          state.errorIncorrect('Fractional part is missing a number');
          state.farthestPosition < $10 ? state.farthestPosition = $10 : null;
        }
        var $16 = false;
        final $17 = state.farthestPosition;
        state.farthestPosition = state.position;
        $l3:
        {
          final $18 = state.position;
          final $19 = state.peek();
          final $20 = $19 == 69 || $19 == 101;
          if ($20) {
            state.position += 1;
            final $21 = state.peek();
            final $22 = $21 == 43 || $21 == 45;
            if ($22) {
              state.position += 1;
            }
            var $23 = false;
            while (true) {
              final $24 = state.peek();
              final $25 = $24 >= 48 && $24 <= 57;
              if ($25) {
                state.position += 1;
                $23 = true;
                continue;
              }
              break;
            }
            if ($23) {
              flag = false;
              $16 = true;
              break $l3;
            } else {
              state.backtrack($18);
            }
          }
        }
        if ($16) {
          state.farthestPosition < $17 ? state.farthestPosition = $17 : null;
        } else {
          state.errorIncorrect('Exponent part is missing a number');
          state.farthestPosition < $17 ? state.farthestPosition = $17 : null;
        }
        final $26 = state.substring(start, state.position);
        final s = $26;
        parseS(state);
        final $27 = flag && s.length <= 18 ? int.parse(s) : num.parse(s);
        $0 = Ok($27);
        break $l;
      } else {
        state.backtrack($2);
      }
    }
    if ($0 != null) {
      state.farthestPosition < $1 ? state.farthestPosition = $1 : null;
      return $0;
    } else {
      state.errorIncorrect('Unterminated number', true);
      state.errorExpected('number');
      state.farthestPosition < $1 ? state.farthestPosition = $1 : null;
    }
    return null;
  }

  /// [Object?] **Value**
  /// ```txt
  /// `Object?` Value =>
  ///   'null' S
  ///   $ = `const` { null }
  ///   ----
  ///   'true' S
  ///   $ = `const` { true }
  ///   ----
  ///   'false' S
  ///   $ = `const` { false }
  ///   ----
  ///   Object
  ///   ----
  ///   Array
  ///   ----
  ///   String
  ///   ----
  ///   Number
  /// ```
  Result<Object?>? parseValue(State state) {
    final $0 = state.peek();
    if ($0 == 110 && state.startsWith('null')) {
      state.position += 4;
      parseS(state);
      const $1 = null;
      return const Ok($1);
    } else {
      state.errorExpected('null');
    }
    if ($0 == 116 && state.startsWith('true')) {
      state.position += 4;
      parseS(state);
      const $2 = true;
      return const Ok($2);
    } else {
      state.errorExpected('true');
    }
    if ($0 == 102 && state.startsWith('false')) {
      state.position += 5;
      parseS(state);
      const $3 = false;
      return const Ok($3);
    } else {
      state.errorExpected('false');
    }
    final $4 = parseObject(state);
    if ($4 != null) {
      return $4;
    }
    final $5 = parseArray(state);
    if ($5 != null) {
      return $5;
    }
    final $6 = parseString(state);
    if ($6 != null) {
      return $6;
    }
    final $7 = parseNumber(state);
    if ($7 != null) {
      return $7;
    }
    return null;
  }

  /// [void] **S**
  /// ```txt
  /// `void` S =>
  ///     [\n\r\t ]*
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
