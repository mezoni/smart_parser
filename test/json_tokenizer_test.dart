import 'package:smart_parser/src/helper.dart';
import 'package:test/test.dart';

import '../example/json_token.dart';
import '../example/json_tokenizer.dart';

void main() {
  _testArray();
  _testFalse();
  _testNumber();
  _testNull();
  _testString();
  _testTrue();
}

const _tokenizer = JsonTokenizer();

void __testFailure(String source, List<String> errors) {
  String reason(String text) {
    return '''
Test failed: $text
$source''';
  }

  final state = State(source);
  final result = _tokenizer.parseStart(state);
  errors = errors.toSet().toList();
  final errors2 = state.getErrors().map(_errorToString).toSet().toList();
  errors2.sort();
  errors.sort();
  expect(result, isNull, reason: reason('result == null'));
  expect(errors2, errors, reason: reason('state errors'));
}

void __testSuccess(String source, List<TokenType> types, List<Object?> values) {
  String reason(String text) {
    return '''
Test failed: $text
$source''';
  }

  final result = _tokenize(source);
  expect(result, isNotNull, reason: reason('result != null'));
  final value = result!.$1;
  expect(value, isA<List<Token>>(), reason: 'value is! List<Token>');
  expect(
    value.map((e) => e.type).toList(),
    types,
    reason: reason('token types'),
  );
  expect(
    value.map((e) => e.value).toList(),
    values,
    reason: reason('token values'),
  );
}

String _errorExpected(int pos, List<String> elements) {
  elements = elements.toSet().toList();
  elements.sort();
  return _toErrorString(
    pos,
    pos,
    'Expected: ${elements.map(escapeString).join(', ')}',
  );
}

String _errorToString(({int end, String message, int start}) error) {
  return _toErrorString(error.start, error.end, error.message);
}

String _errorUnexpected(int start, int end) {
  return _errorToString((
    start: start,
    end: end,
    message: 'Unexpected input data',
  ));
}

void _testArray() {
  test('array', () {
    {
      const source = ' [ null , true ] ';
      __testSuccess(
        source,
        [
          TokenType.openBracket,
          TokenType.null$,
          TokenType.comma,
          TokenType.true$,
          TokenType.closeBracket,
        ],
        ['[', null, ',', true, ']'],
      );
    }
  });
}

void _testFalse() {
  test('false', () {
    {
      const source = ' false  ';
      __testSuccess(source, [TokenType.false$], [false]);
    }
  });
}

void _testNull() {
  test('null', () {
    {
      const source = ' null  ';
      __testSuccess(source, [TokenType.null$], [null]);
    }
  });
}

void _testNumber() {
  test('number', () {
    {
      const source = ' 0 ';
      __testSuccess(source, [TokenType.number], [0]);
    }

    {
      const source = ' -0 ';
      __testSuccess(source, [TokenType.number], [-0]);
    }

    {
      const source = ' 1 ';
      __testSuccess(source, [TokenType.number], [1]);
    }

    {
      const source = ' 9 ';
      __testSuccess(source, [TokenType.number], [9]);
    }

    {
      const source = ' -1 ';
      __testSuccess(source, [TokenType.number], [-1]);
    }

    {
      const source = ' -99 ';
      __testSuccess(source, [TokenType.number], [-99]);
    }

    {
      const source = ' 999999999999999999 ';
      __testSuccess(source, [TokenType.number], [999999999999999999]);
    }

    {
      const source = ' -999999999999999999 ';
      __testSuccess(source, [TokenType.number], [-999999999999999999]);
    }

    {
      const source = ' 9223372036854775807 ';
      __testSuccess(source, [TokenType.number], [0x7FFFFFFFFFFFFFFF]);
    }

    {
      const source = ' -9223372036854775808 ';
      __testSuccess(source, [TokenType.number], [-0x8000000000000000]);
    }

    {
      const source = ' 0.1 ';
      __testSuccess(source, [TokenType.number], [0.1]);
    }

    {
      const source = ' -0.1 ';
      __testSuccess(source, [TokenType.number], [-0.1]);
    }

    {
      const source = ' 123.456 ';
      __testSuccess(source, [TokenType.number], [123.456]);
    }

    {
      const source = ' -123.456 ';
      __testSuccess(source, [TokenType.number], [-123.456]);
    }

    {
      const source = ' 123.456E10 ';
      __testSuccess(source, [TokenType.number], [123.456E10]);
    }

    {
      const source = ' 123.456E-10 ';
      __testSuccess(source, [TokenType.number], [123.456E-10]);
    }

    {
      const source = ' 123.456E+10 ';
      __testSuccess(source, [TokenType.number], [123.456E+10]);
    }

    {
      const source = ' 123E10 ';
      __testSuccess(source, [TokenType.number], [123E10]);
    }

    {
      const source = ' 123E-10 ';
      __testSuccess(source, [TokenType.number], [123E-10]);
    }

    {
      const source = ' 123E+10 ';
      __testSuccess(source, [TokenType.number], [123E+10]);
    }

    {
      const source = ' 123. ';
      __testFailure(source, [
        _toErrorString(5, 5, 'Unterminated fractional number'),
      ]);
    }

    {
      const source = ' 123E ';
      __testFailure(source, [
        _toErrorString(5, 5, 'Exponent part is missing a number'),
      ]);
    }

    {
      const source = ' 123E+ ';
      __testFailure(source, [
        _toErrorString(6, 6, 'Exponent part is missing a number'),
      ]);
    }
  });
}

void _testString() {
  test('string', () {
    {
      const source = ' "" ';
      __testSuccess(source, [TokenType.string], ['']);
    }

    {
      const source = ' "abc" ';
      __testSuccess(source, [TokenType.string], ['abc']);
    }

    {
      const source = r' "\u0020" ';
      __testSuccess(source, [TokenType.string], [' ']);
    }

    {
      const source = r' "\n" ';
      __testSuccess(source, [TokenType.string], ['\n']);
    }

    {
      const source = r' "\u" ';
      __testFailure(source, [
        _errorExpected(4, ['4 hexadecimal digit number']),
      ]);
    }

    {
      const source = r' "\u0" ';
      __testFailure(source, [
        _toErrorString(5, 5, 'Expected hexadecimal digit'),
        _toErrorString(4, 5, 'Incorrect 4 hexadecimal digit number'),
      ]);
    }

    {
      const source = r' "\u000" ';
      __testFailure(source, [
        _toErrorString(7, 7, 'Expected hexadecimal digit'),
        _toErrorString(4, 7, 'Incorrect 4 hexadecimal digit number'),
      ]);
    }

    {
      const source = r' "\ " ';
      __testFailure(source, [_toErrorString(3, 3, 'Illegal escape character')]);
    }

    {
      const source = r' " ';
      __testFailure(source, [
        _errorExpected(3, ['"']),
      ]);
    }
  });
}

void _testTrue() {
  test('true', () {
    {
      const source = ' true  ';
      __testSuccess(source, [TokenType.true$], [true]);
    }
  });
}

String _toErrorString(int start, int end, String message) {
  return [start, end, message].join(':');
}

Result<List<Token>>? _tokenize(String source) {
  final state = State(source);
  final result = _tokenizer.parseStart(state);
  return result;
}
