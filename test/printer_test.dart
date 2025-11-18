import 'package:smart_parser/grammar_generator.dart';
import 'package:smart_parser/src/printer.dart';
import 'package:test/test.dart';

void main() {
  _testAction();
  _testAndPredicate();
  _testAnyCharacter();
  _testCapture();
  _testCharacterClass();
  _testGroup();
  _testLiteral();
  _testNotPredicate();
  _testOneOrMore();
  _testOptional();
  _testOrderedChoice();
  _testPosition();
  _testPredicate();
  _testProduction();
  _testSequence();
  _testValue();
  _testWhile();
  _testZeroOrMore();
}

void _testAction() {
  test('Action', () {
    {
      const input = '{ 41 }';
      _testExpression(input, input);
    }

    {
      const input = 'a = { 41 }';
      _testExpression(input, input);
    }

    {
      const input = '''
{ final x = 1; }
{
  final y = 2;
  final z = 3;
}''';
      _testExpression(input, input);
    }
  });
}

void _testAndPredicate() {
  test('AndPredicate', () {
    {
      const input = '&.';
      _testExpression(input, input);
    }

    {
      const input = '''
&(
  [a]
  [b]
)''';
      _testExpression(input, input);
    }
  });
}

void _testAnyCharacter() {
  test('AnyCharacter', () {
    {
      const input = '.';
      _testExpression(input, input);
    }
  });
}

void _testCapture() {
  test('Capture', () {
    {
      const input = '<[a-z]>';
      _testExpression(input, input);
    }

    {
      const input = '''
<
  [a]
  [b]
  n = <
    [c]
    [d]
  >
>''';
      _testExpression(input, input);
    }
  });
}

void _testCharacterClass() {
  test('CharacterClass', () {
    {
      const input = '[a]';
      _testExpression(input, input);
    }

    {
      const input = '[a-zA-Z0-9]';
      _testExpression(input, input);
    }

    {
      const input = '[a-zA-Z0-9111]';
      _testExpression(input, input);
    }

    {
      const input = '[{400}{200-300}]';
      _testExpression(input, input);
    }

    {
      const input = r'[\a\b\e\f\n\r\t\v]';
      _testExpression(input, input);
    }

    {
      const input = r'[\^\-\[\]\{\{\\]';
      _testExpression(input, input);
    }
  });
}

void _testExpression(String input, String expected) {
  const printer = Printer();
  final source = '`void` Test => $input';
  final grammarGenerator = GrammarGenerator(source: source);
  final grammar = grammarGenerator.generate();
  final productions = grammar.productions;
  final production = productions.first;
  final expression = production.expression;
  final actual = expression.accept(printer);
  expect(actual, expected, reason: input);
}

void _testGroup() {
  test('Group', () {
    {
      const input = '([a-z])';
      _testExpression(input, input);
    }

    {
      const input = '''
(
  [a]
  [b]
  n = (
    [c]
    [d]
  )
)''';
      _testExpression(input, input);
    }
  });
}

void _testLiteral() {
  test('Literal', () {
    {
      const input = '""';
      _testExpression(input, input);
    }

    {
      const input = "''";
      _testExpression(input, input);
    }

    {
      const input = '"\'"';
      _testExpression(input, input);
    }

    {
      const input = "'\"'";
      _testExpression(input, input);
    }

    {
      const input = r"'🚀'";
      _testExpression(input, input);
    }
  });
}

void _testNotPredicate() {
  test('NotPredicate', () {
    {
      const input = '!.';
      const expected = '!.';
      _testExpression(input, expected);
    }

    {
      const input = '''
!(
  [a]
  [b]
)''';
      const expected = '''
!(
  [a]
  [b]
)''';
      _testExpression(input, expected);
    }
  });
}

void _testOneOrMore() {
  test('OneOrMore', () {
    {
      const input = '[a]+';
      _testExpression(input, input);
    }

    {
      const input = '''
(
  [a]
  [b]
)+''';
      _testExpression(input, input);
    }
  });
}

void _testOptional() {
  test('Optional', () {
    {
      const input = '[a]?';
      _testExpression(input, input);
    }

    {
      const input = '''
(
  [a]
  [b]
)?''';
      _testExpression(input, input);
    }
  });
}

void _testOrderedChoice() {
  test('OrderedChoice', () {
    {
      const input = '[a] / [b]';
      _testExpression(input, input);
    }

    {
      const input = '''
[a]
[b]
/
[c]''';
      _testExpression(input, input);
    }
  });
}

void _testPosition() {
  test('Position', () {
    {
      const input = '@position({ 41 })';
      _testExpression(input, input);
    }

    {
      const input = '''
@position({
  41+
  42
})''';
      _testExpression(input, input);
    }
  });
}

void _testPredicate() {
  test('Predicate', () {
    {
      const input = '&{ true }';
      _testExpression(input, input);
    }

    {
      const input = '!{ true }';
      _testExpression(input, input);
    }

    {
      const input = '''
!{
  41 ==
  42
}''';
      _testExpression(input, input);
    }
  });
}

void _testProduction() {
  test('Production', () {
    {
      const input = 'Test';
      _testExpression(input, input);
    }
  });
}

void _testSequence() {
  test('Sequence', () {
    {
      const input = '''
[a]
[b]''';
      _testExpression(input, input);
    }

    {
      const input = '''
a = [a]
b = [b]''';
      _testExpression(input, input);
    }

    {
      const input = '''
a = [a]
b = [b]
~{ state.errorExpected('foo'); }''';
      _testExpression(input, input);
    }

    {
      const input = '''
a = [a]
b = [b]
~{
  state.errorExpected('foo');
  state.errorIncorrect('foo');
}''';
      _testExpression(input, input);
    }
  });
}

void _testValue() {
  test('Value', () {
    {
      const input = 'a = { 41 }';
      _testExpression(input, input);
    }

    {
      const input = '''
a = {
  41+
  42
}''';
      _testExpression(input, input);
    }
  });
}

void _testWhile() {
  test('While', () {
    {
      const input = '''
@while (0) {
  [a]
}''';
      _testExpression(input, input);
    }

    {
      const input = '''
@while (0, 1) {
  [a]
}''';
      _testExpression(input, input);
    }
  });
}

void _testZeroOrMore() {
  test('ZeroOrMore', () {
    {
      const input = '[a]*';
      _testExpression(input, input);
    }

    {
      const input = '''
(
  [a]
  [b]
)*''';
      _testExpression(input, input);
    }
  });
}
