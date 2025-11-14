import 'dart:convert';
import 'dart:io';

import 'package:smart_parser/parser_generator.dart';
import 'package:smart_parser/src/allocator.dart';
import 'package:smart_parser/src/code_builder.dart';
import 'package:smart_parser/src/helper.dart';

void main(List<String> args) {
  const outputFile = 'test/expressions_test.dart';
  final code = Code();
  code.stmt("import 'package:test/test.dart'");
  code.writeln();
  final tests = <Test>[
    _testAction(),
    _testAndPredicate(),
    _testAnyCharacter(),
    _testCapture(),
    _testCharacterClass(),
    _testGroup(),
    _testLiteral(),
    _testNotPredicate(),
    _testOneOrMore(),
    _testOptional(),
    _testPredicate(),
    _testSequence(),
    _testWhile(),
    _testZeroOrMore(),
    _testIdentifier(),
  ];

  final generated = _generateTests(tests);
  code.addBlock(begin: 'void main() {')((code) {
    code.add(generated.$1);
  });

  code.writeln();
  code.writeln(generated.$2);

  final lines = <String>[];
  code.build(lines, '');
  File(outputFile).writeAsStringSync(lines.join('\n'));
}

String _error(int start, int end, String message) {
  return '(end: $end, message: $message, start: $start)';
}

String _errorExpected(int pos, List<String> elements) {
  elements = elements.toList()..sort();
  final expected = elements.map(escapeString).join(', ');
  return '(end: $pos, message: Expected: $expected, start: $pos)';
}

String _errorUnexpectedData(int start, int end) {
  return '(end: $end, message: Unexpected input data, start: $start)';
}

(Code, String) _generateTests(List<Test> tests) {
  final grammar = Code();
  const parserName = '_TestParser';
  final code = Code();
  const parser = 'parser';
  code.declare('final', parser, '$parserName()');
  for (final test in tests) {
    final allocator = Allocator();
    String allocate([String name = '']) => allocator.allocate(name);
    final testName = test.name;
    final description = escapeString(test.description);
    code.addBlock(begin: 'test($description, () {', end: '});')((code) {
      var index = 0;
      for (final production in test.productions) {
        final type = production.type;
        final productionSource = production.source;
        final productionName = '$testName$index';
        final productionNameVoid = '${testName}Void$index';
        grammar.addBlock(begin: '`$type` $productionName =>', end: ';')((code) {
          for (final line in const LineSplitter().convert(productionSource)) {
            code.writeln(line);
          }
        });
        grammar.writeln();

        grammar.writeln();
        if (type != 'void') {
          grammar.addBlock(begin: '`void` $productionNameVoid =>', end: ';')((
            code,
          ) {
            for (final line in const LineSplitter().convert(productionSource)) {
              code.writeln(line);
            }
          });
          grammar.writeln();
        }

        final parse = allocate('r');
        code.declare('final', parse, '$parser.parse$productionName');
        var parseVoid = '';
        if (type != 'void') {
          parseVoid = allocate('r');
          code.declare('final', parseVoid, '$parser.parse$productionNameVoid');
        }

        String reason(String info, String text) {
          return escapeString('''
$productionSource
$text
$info
''');
        }

        for (final success in production.successes) {
          for (var i = 0; i < 2; i++) {
            if (i == 1 && type == 'void') {
              break;
            }

            final text = escapeString(success.text);
            final pos = success.pos;
            final value = success.value;
            final state = allocate('s');
            final result = allocate('r');
            code.declare('final', state, 'State($text)');
            if (i == 0) {
              code.declare('final', result, '$parse($state) as dynamic');
            } else {
              code.declare('final', result, '$parseVoid($state) as dynamic');
            }

            code.stmt(
              'expect($result, isNotNull, reason: ${reason('result != null', text)})',
            );
            code.stmt(
              'expect($state.position, $pos, reason: ${reason('state.position = $pos', text)})',
            );

            if (i == 0) {
              code.stmt(
                'expect($result.\$1, $value, reason: ${reason('result.\$1 != $value', text)})',
              );
            } else {
              code.stmt(
                'expect($result.\$1, null, reason: ${reason('result.\$1 != null', text)})',
              );
            }
          }
        }

        for (final failure in production.failures) {
          for (var i = 0; i < 2; i++) {
            if (i == 1 && type == 'void') {
              break;
            }
            String toList(List<String> errors) {
              return '[${errors.map(escapeString).join(', ')}]';
            }

            final text = escapeString(failure.text);
            final pos = failure.pos;
            final errors = failure.errors;
            final state = allocate('s');
            final result = allocate('r');
            code.declare('final', state, 'State($text)');
            if (i == 0) {
              code.declare('final', result, '$parse($state) as dynamic');
            } else {
              code.declare('final', result, '$parseVoid($state) as dynamic');
            }

            code.stmt(
              'expect($result, isNull, reason: ${reason('result == null', text)})',
            );
            code.stmt(
              'expect($state.farthestPosition, $pos, reason: ${reason('state.farthestPosition = $pos', text)})',
            );
            code.stmt(
              'expect($state.position, 0, reason: ${reason('state.position = 0', text)})',
            );
            final errorList = allocate('e');
            code.declare(
              'final',
              errorList,
              '$state.getErrors().map((e) => \'\$e\').toList()..sort()',
            );
            code.stmt(
              'expect($errorList.length, ${errors.length}, reason: ${reason('error count', text)})',
            );
            code.stmt(
              'expect($errorList, ${toList(errors)}, reason: ${reason('errors', text)})',
            );
          }
        }

        index++;
      }
    });
    code.writeln();
  }

  final grammarCode = '$grammar';
  File('test/test_expressions.grammar').writeAsStringSync(grammarCode);
  final options = ParserGeneratorOptions(name: parserName);
  final parserGenerator = ParserGenerator(
    options: options,
    source: grammarCode,
  );
  final parserCode = parserGenerator.generate();
  return (code, parserCode);
}

Test _testAction() {
  final test = Test('Action', 'Action');
  {
    final production = test.addProduction('int', r'$ = `const` { 41 }');
    {
      production.addSuccess('a', 0, '41');
      production.addSuccess('', 0, '41');
    }
  }

  {
    final production = test.addProduction('int', r'$ = `const` { 41 }');
    {
      production.addSuccess('a', 0, '41');
      production.addSuccess('', 0, '41');
    }
  }

  {
    final production = test.addProduction('int', r'$ = `const int` { 41 }');
    {
      production.addSuccess('a', 0, '41');
      production.addSuccess('', 0, '41');
    }
  }

  {
    final production = test.addProduction('int', r'''
{ const x = 41; }
$ = `const` { x }''');
    {
      production.addSuccess('a', 0, '41');
      production.addSuccess('', 0, '41');
    }
  }

  return test;
}

Test _testAndPredicate() {
  final test = Test('AndPredicate', 'AndPredicate');
  {
    final production = test.addProduction('String', r'''
& 'abc'
$ = 'abcd'
''');
    {
      production.addSuccess('abcd', 4, escapeString('abcd'));
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('z', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('abc', 0, [
        _errorExpected(0, ['abcd']),
      ]);
    }
  }

  {
    final production = test.addProduction('void', r'''
& 'abc'
''');
    {
      production.addSuccess('abc', 0, 'null');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('z', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('a', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('ab', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  return test;
}

Test _testAnyCharacter() {
  final test = Test('AnyCharacter', 'AnyCharacter');

  {
    final production = test.addProduction('int', '.');
    {
      production.addSuccess('a', 1, '97');
      production.addSuccess('z', 1, '122');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  return test;
}

Test _testCapture() {
  final test = Test('Capture', 'Capture');
  {
    final production = test.addProduction('String', '<[a]>');
    {
      production.addSuccess('a', 1, escapeString('a'));
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('z', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('void', '<[a]>');
    {
      production.addSuccess('a', 1, 'null');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('z', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('String', '''
<[a] / [b]>''');
    {
      production.addSuccess('a', 1, escapeString('a'));
      production.addSuccess('b', 1, escapeString('b'));
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('z', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('String', r'''
[a]
$ = <[b] / [c]>''');
    {
      production.addSuccess('ab', 2, escapeString('b'));
      production.addSuccess('ac', 2, escapeString('c'));
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('a', 1, [_errorUnexpectedData(1, 1)]);
    }
  }

  return test;
}

Test _testCharacterClass() {
  final test = Test('CharacterClass', 'CharacterClass');
  {
    final production = test.addProduction('int', '[a]');
    {
      production.addSuccess('a', 1, '97');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('z', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('int', '[a-z]');
    {
      production.addSuccess('a', 1, '97');
      production.addSuccess('z', 1, '122');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('!', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('int', '[^a]');
    {
      production.addSuccess('0', 1, '48');
      production.addSuccess('z', 1, '122');
      production.addFailure('a', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('int', '[^ab]');
    {
      production.addSuccess('0', 1, '48');
      production.addSuccess('z', 1, '122');
      production.addFailure('a', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('b', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('int', '[^abc]');
    {
      production.addSuccess('0', 1, '48');
      production.addSuccess('z', 1, '122');
      production.addFailure('a', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('b', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('c', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('int', '[^a-z]');
    {
      production.addSuccess('0', 1, '48');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('a', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('z', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('int', r'[\^]');
    {
      production.addSuccess('^', 1, '94');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('a', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('int', r'[\-]');
    {
      production.addSuccess('-', 1, '45');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('a', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('int', r'[\u{20}]');
    {
      production.addSuccess(' ', 1, '32');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('a', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('int', r'[\u{30}-\u{39}]');
    {
      production.addSuccess('0', 1, '48');
      production.addSuccess('9', 1, '57');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('a', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('int', r'[\u{0}]');
    {
      production.addSuccess('\u0000', 1, '0');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('a', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('int', r'[\u{0}-\u{9}]');
    {
      production.addSuccess('\u0000', 1, '0');
      production.addSuccess('\u0009', 1, '9');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('a', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('int', r'[^\u{0}]');
    {
      production.addSuccess('a', 1, '97');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('\u0000', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('int', r'[^\u{0}-\u{9}]');
    {
      production.addSuccess('a', 1, '97');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('\u0000', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('\u0009', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  return test;
}

Test _testGroup() {
  final test = Test('Group', 'Group');
  {
    final production = test.addProduction('int', '([a] / [z])');
    {
      production.addSuccess('a', 1, '97');
      production.addSuccess('z', 1, '122');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('b', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  return test;
}

Test _testIdentifier() {
  final test = Test('Identifier', 'Identifier');
  {
    final production = test.addProduction('String', r'''
!(
  (
    "foreach"
    ----
    "for"
  )
  ! [a-zA-Z0-9]
)
$ = <
  [a-zA-Z]
  [a-zA-Z0-9]*
>
''');
    {
      production.addSuccess('fo', 2, escapeString('fo'));
      production.addSuccess('fort', 4, escapeString('fort'));
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('for', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('foreach', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  return test;
}

Test _testLiteral() {
  final test = Test('Literal', 'Literal');
  {
    final production = test.addProduction('String', "'abc'");
    {
      production.addSuccess('abc', 3, escapeString('abc'));
      production.addFailure('', 0, [
        _errorExpected(0, ['abc']),
      ]);
      production.addFailure('a', 0, [
        _errorExpected(0, ['abc']),
      ]);
    }
  }

  {
    final production = test.addProduction('String', '"abc"');
    {
      production.addSuccess('abc', 3, escapeString('abc'));
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('a', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('String', '""');
    {
      production.addSuccess('', 0, escapeString(''));
      production.addSuccess('a', 0, escapeString(''));
    }
  }

  {
    final production = test.addProduction('String', "''");
    {
      production.addSuccess('', 0, escapeString(''));
      production.addSuccess('a', 0, escapeString(''));
    }
  }

  {
    final production = test.addProduction('String', '"\\r\\n"');
    {
      production.addSuccess('\r\n', 2, escapeString('\r\n'));
      production.addFailure('\r', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  return test;
}

Test _testNotPredicate() {
  final test = Test('NotPredicate', 'NotPredicate');
  {
    final production = test.addProduction('String', r'''
! 'abc'
$ = 'ab'
''');
    {
      production.addSuccess('ab', 2, escapeString('ab'));
      production.addFailure('abc', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('String', r'''
$ = 'abc'
! '=>'
''');
    {
      production.addSuccess('abc', 3, escapeString('abc'));
      production.addFailure('abc=>', 3, [_errorUnexpectedData(3, 3)]);
    }
  }

  {
    final production = test.addProduction('List<int>', r'''
! @while (2) {
  [a]
}
$ = [a]*
''');
    {
      production.addSuccess('', 0, '<int>[]');
      production.addSuccess('a', 1, '[97]');
      production.addFailure('aa', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('void', "!''");
    {
      production.addFailure('a', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('void', '![a]?');
    {
      production.addFailure('a', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('b', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('void', '!([a] / [z])?');
    {
      production.addFailure('a', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('z', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('b', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  return test;
}

Test _testOneOrMore() {
  final test = Test('OneOrMore', 'OneOrMore');
  {
    final production = test.addProduction('List<int>', '[a]+');
    {
      production.addSuccess('a', 1, '[97]');
      production.addSuccess('aa', 2, '[97, 97]');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('b', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('List<int>', '([a] / [z])+');
    {
      production.addSuccess('a', 1, '[97]');
      production.addSuccess('aa', 2, '[97, 97]');
      production.addSuccess('z', 1, '[122]');
      production.addSuccess('za', 2, '[122, 97]');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('b', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  return test;
}

Test _testOptional() {
  final test = Test('Optional', 'Optional');
  {
    final production = test.addProduction('int?', '[a]?');
    {
      production.addSuccess('a', 1, '97');
      production.addSuccess('', 0, 'null');
    }
  }

  {
    final production = test.addProduction('int?', '''
([a] / [b])?''');
    {
      production.addSuccess('a', 1, '97');
      production.addSuccess('b', 1, '98');
      production.addSuccess('', 0, 'null');
    }
  }

  {
    final production = test.addProduction('int?', r'''
([a] $ = [b])?''');
    {
      production.addSuccess('ab', 2, '98');
      production.addSuccess('', 0, 'null');
      production.addSuccess('a', 0, 'null');
    }
  }

  {
    final production = test.addProduction('int?', r'''
($ = [a] [b])?''');
    {
      production.addSuccess('ab', 2, '97');
      production.addSuccess('', 0, 'null');
      production.addSuccess('a', 0, 'null');
    }
  }

  {
    final production = test.addProduction('int?', r'''
([a] / [b])? $ = [c]''');
    {
      production.addSuccess('ac', 2, '99');
      production.addSuccess('bc', 2, '99');
      production.addSuccess('c', 1, '99');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  return test;
}

Test _testPredicate() {
  final test = Test('Predicate', 'Predicate');
  {
    final production = test.addProduction('void', '& { true }');
    {
      production.addSuccess('a', 0, 'null');
      production.addSuccess('', 0, 'null');
    }
  }

  {
    final production = test.addProduction('void', '& { false }');
    {
      production.addFailure('a', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('void', '! { true }');
    {
      production.addFailure('a', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('void', '! { false }');
    {
      production.addSuccess('a', 0, 'null');
      production.addSuccess('', 0, 'null');
    }
  }

  {
    final production = test.addProduction('void', '& (a = { false })');
    {
      production.addSuccess('a', 0, 'null');
      production.addSuccess('', 0, 'null');
    }
  }

  return test;
}

Test _testSequence() {
  final test = Test('Sequence', 'Sequence');

  {
    final production = test.addProduction('int', r'''
a = [0-9]
b = [0-9]
c = [0-9]
$ = { a -48 + b - 48 + c - 48 }''');
    {
      production.addSuccess('123', 3, '6');
      production.addFailure('12', 2, [_errorUnexpectedData(2, 2)]);
    }
  }

  {
    final production = test.addProduction('String', r'''
[a]
[b]
[c]
$ = `const` { 'abc' }
~ {
  state.errorExpected('abc');
  state.errorIncorrect('Full', true);
  state.errorIncorrect('End', false);
  state.errorIncorrect('Start', null);
}''');
    {
      production.addSuccess('abc', 3, escapeString('abc'));
      production.addFailure('', 0, [
        _errorExpected(0, ['abc']),
      ]);
      production.addFailure('a', 1, [
        _error(0, 0, 'Start'),
        _error(1, 1, 'End'),
        _error(0, 1, 'Full'),
      ]);
      production.addFailure('ab', 2, [
        _error(0, 0, 'Start'),
        _error(2, 2, 'End'),
        _error(0, 2, 'Full'),
      ]);
    }
  }

  return test;
}

Test _testWhile() {
  final test = Test('While', 'While');
  {
    final production = test.addProduction('List<int>', '''
@while (0) {
  [a]
}''');
    {
      production.addSuccess('a', 1, '[97]');
      production.addSuccess('aa', 2, '[97, 97]');
      production.addSuccess('', 0, '<int>[]');
      production.addSuccess('b', 0, '<int>[]');
    }
  }

  {
    final production = test.addProduction('List<int>', '''
@while (0) {
  [a] / [z]
}''');
    {
      production.addSuccess('a', 1, '[97]');
      production.addSuccess('aa', 2, '[97, 97]');
      production.addSuccess('z', 1, '[122]');
      production.addSuccess('za', 2, '[122, 97]');
      production.addSuccess('', 0, '<int>[]');
      production.addSuccess('b', 0, '<int>[]');
    }
  }

  {
    final production = test.addProduction('List<int>', '''
@while (1) {
  [a]
}''');
    {
      production.addSuccess('a', 1, '[97]');
      production.addSuccess('aa', 2, '[97, 97]');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('b', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('List<int>', '''
@while (1) {
  [a] / [z]
}''');
    {
      production.addSuccess('a', 1, '[97]');
      production.addSuccess('aa', 2, '[97, 97]');
      production.addSuccess('z', 1, '[122]');
      production.addSuccess('za', 2, '[122, 97]');
      production.addSuccess('zz', 2, '[122, 122]');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('b', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('List<int>', '''
@while (2) {
  [a]
}''');
    {
      production.addSuccess('aa', 2, '[97, 97]');
      production.addSuccess('aaa', 3, '[97, 97, 97]');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('a', 1, [_errorUnexpectedData(1, 1)]);
      production.addFailure('b', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('List<int>', '''
@while (2) {
  [a] / [z]
}''');
    {
      production.addSuccess('aa', 2, '[97, 97]');
      production.addSuccess('az', 2, '[97, 122]');
      production.addSuccess('za', 2, '[122, 97]');
      production.addSuccess('zz', 2, '[122, 122]');
      production.addSuccess('zzz', 3, '[122, 122, 122]');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('a', 1, [_errorUnexpectedData(1, 1)]);
      production.addFailure('b', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('List<int>', '''
@while (0, 1) {
  [a]
}''');
    {
      production.addSuccess('a', 1, '[97]');
      production.addSuccess('aa', 1, '[97]');
      production.addSuccess('', 0, '<int>[]');
      production.addSuccess('b', 0, '<int>[]');
    }
  }

  {
    final production = test.addProduction('List<int>', '''
@while (0, 2) {
  [a]
}''');
    {
      production.addSuccess('a', 1, '[97]');
      production.addSuccess('aa', 2, '[97, 97]');
      production.addSuccess('aaa', 2, '[97, 97]');
      production.addSuccess('', 0, '<int>[]');
      production.addSuccess('b', 0, '<int>[]');
    }
  }

  {
    final production = test.addProduction('List<int>', '''
@while (1, 1) {
  [a]
}''');
    {
      production.addSuccess('a', 1, '[97]');
      production.addSuccess('aa', 1, '[97]');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('b', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('List<int>', '''
@while (2, 2) {
  [a]
}''');
    {
      production.addSuccess('aa', 2, '[97, 97]');
      production.addSuccess('aaa', 2, '[97, 97]');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('a', 1, [_errorUnexpectedData(1, 1)]);
      production.addFailure('b', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('List<int>', '''
@while (2, 3) {
  [a]
}''');
    {
      production.addSuccess('aa', 2, '[97, 97]');
      production.addSuccess('aaa', 3, '[97, 97, 97]');
      production.addSuccess('aaaa', 3, '[97, 97, 97]');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('a', 1, [_errorUnexpectedData(1, 1)]);
      production.addFailure('b', 0, [_errorUnexpectedData(0, 0)]);
    }
  }

  {
    final production = test.addProduction('List<int>', r'''
([a] / [b])
$ = @while (1) {
  [c]
}''');
    {
      production.addSuccess('ac', 2, '[99]');
      production.addSuccess('bc', 2, '[99]');
      production.addSuccess('bcc', 3, '[99, 99]');
      production.addFailure('', 0, [_errorUnexpectedData(0, 0)]);
      production.addFailure('a', 1, [_errorUnexpectedData(1, 1)]);
      production.addFailure('b', 1, [_errorUnexpectedData(1, 1)]);
    }
  }

  return test;
}

Test _testZeroOrMore() {
  final test = Test('ZeroOrMore', 'ZeroOrMore');
  {
    final production = test.addProduction('List<int>', '[a]*');
    {
      production.addSuccess('a', 1, '[97]');
      production.addSuccess('aa', 2, '[97, 97]');
      production.addSuccess('', 0, '<int>[]');
      production.addSuccess('b', 0, '<int>[]');
    }
  }

  {
    final production = test.addProduction('List<int>', '([a] / [z])*');
    {
      production.addSuccess('a', 1, '[97]');
      production.addSuccess('aa', 2, '[97, 97]');
      production.addSuccess('z', 1, '[122]');
      production.addSuccess('za', 2, '[122, 97]');
      production.addSuccess('', 0, '<int>[]');
      production.addSuccess('b', 0, '<int>[]');
    }
  }

  return test;
}

class Failure {
  final List<String> errors;

  final int pos;

  final String text;

  Failure({required this.errors, required this.pos, required this.text});
}

class Production {
  final List<Failure> failures = [];

  final String source;

  final List<Success> successes = [];

  final String type;

  Production(this.type, this.source);

  Failure addFailure(String text, int pos, List<String> errors) {
    final item = Failure(errors: errors, pos: pos, text: text);
    failures.add(item);
    return item;
  }

  Success addSuccess(String text, int pos, String value) {
    final item = Success(pos: pos, value: value, text: text);
    successes.add(item);
    return item;
  }
}

class Success {
  final int pos;

  final String value;

  final String text;

  Success({required this.pos, required this.value, required this.text});
}

class Test {
  final String description;

  final String name;

  final List<Production> productions = [];

  Test(this.name, this.description);

  Production addProduction(String type, String source) {
    final production = Production(type, source);
    productions.add(production);
    return production;
  }
}
