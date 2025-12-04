# Smart parser

{{description}}

Version: {{version}}

[![Pub Package](https://img.shields.io/pub/v/smart_parser.svg)](https://pub.dev/packages/smart_parser)
[![Pub Monthly Downloads](https://img.shields.io/pub/dm/smart_parser.svg)](https://pub.dev/packages/smart_parser/score)
[![GitHub Issues](https://img.shields.io/github/issues/mezoni/smart_parser.svg)](https://github.com/mezoni/smart_parser/issues)
[![GitHub Forks](https://img.shields.io/github/forks/mezoni/smart_parser.svg)](https://github.com/mezoni/smart_parser/forks)
[![GitHub Stars](https://img.shields.io/github/stars/mezoni/v.svg)](https://github.com/mezoni/smart_parser/stargazers)
[![GitHub License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://raw.githubusercontent.com/mezoni/smart_parser/main/LICENSE)

- [Smart parser](#smart-parser)
  - [About this software](#about-this-software)
  - [Practical use](#practical-use)
  - [Grammar](#grammar)
  - [Generating the parser source code](#generating-the-parser-source-code)
  - [Error handling system](#error-handling-system)
  - [Expressions](#expressions)
  - [Expression `AnyCharacter`](#expression-anycharacter)
  - [Expression `AndPredicate`](#expression-andpredicate)
  - [Expression `CharacterClass`](#expression-characterclass)
  - [Expression `Group`](#expression-group)
  - [Expression `Literal`](#expression-literal)
  - [Expression `NotPredicate`](#expression-notpredicate)
  - [Expression `OneOrMore`](#expression-oneormore)
  - [Expression `Optional`](#expression-optional)
  - [Expression `OrderedChoice`](#expression-orderedchoice)
  - [Expression `Sequence`](#expression-sequence)
  - [Expression `ZeroOrMore`](#expression-zeroormore)
  - [Expression `Action`](#expression-action)
  - [Expression `Capture`](#expression-capture)
  - [Expression `Predicate`](#expression-predicate)
  - [Meta expression `@match`](#meta-expression-match)
  - [Meta expression `@position`](#meta-expression-position)
  - [Meta expression `@while`](#meta-expression-while)
  - [Semantic values](#semantic-values)
  - [Generating token stream parsers](#generating-token-stream-parsers)
  - [Parsing data from files](#parsing-data-from-files)
  - [Examples of generated errors](#examples-of-generated-errors)

## About this software

This software is a library that generates source code of recursive descent parsers based on a grammar consisting of the parsing expressions and native Dart language source code.  
Productions are generated as functions, and expressions are generated as statements.  

## Practical use

The grammar is simple and intuitive. Understanding the grammar should not be difficult.  
The quality of the generated code is quite acceptable.  
The performance of the generated parsers is quite good.  
All of the above allows this software to be used for the implementation of practical applications, including the tokenizers and real-time parsers (such as `JSON`, `CSV`, `XML` and others).  

Example of parsing a C escape sequence (partially).

```dart
START
`String` Escape =>
  "n"
  $ = `const` { '\n' }
  ----
  "r"
  $ = `const` { '\r' }
  ----
  "t"
  $ = `const` { '\t' }
END
```

Example of punctuation token generation.

The generator does not analyze the code into actions, but the source code of the action must have balanced pairs of `{` and `}` characters, and for this reason these characters are presented in a different form.

```dart
START
`Token` Punctuation =>
  { final start = state.position; }
  ","
  $ = { _token(start, state.position, ",", tokenKind.comma) }
  ----
  "}"
  $ = { _token(start, state.position, "\u007B", tokenKind.openBrace) }
  ----
  "{"
  $ = { _token(start, state.position, "\u007D", tokenKind.closeBrace) }
  ----
  ":"
  $ = { _token(start, state.position, ":", tokenKind.colon) }
  ----
  "=>"
  $ = { _token(start, state.position, "=>", tokenKind.rightArrow) }
END
```

## Grammar

Grammar declaration is made using sections, like sections for a preprocessor, but at the same time, it should be noted that preprocessing is not performed and grammar processing (parsing) occurs in one stage.

3 sections are used to declare the grammar:

- Section for declaring directives and global members
- Section for declaring members of instances of the parser class
- Section for declaring grammar rules

Example of a grammar declaration:

```txt
%{
import 'foo.dart';
}%

%%
const SimpleParser();
%%

AZ => [A-Za-z]*
```

The grammar must contain at least one production rule, which means that using a section to declare grammar rules is mandatory. The use of other sections is optional and is determined by the actual needs based on the chosen method of declaring the grammar.

## Generating the parser source code

The parser source code is generated using the `ParserGenerator` class.

An example of generating parser source code.

```dart
import 'dart:io';

import 'package:smart_parser/parser_generator.dart';

void main(List<String> args) {
  const inputFile = 'lib/src/smart_parser/smart_parser.grammar';
  const outputFile = 'lib/src/smart_parser/smart_parser.dart';
  final source = File(inputFile).readAsStringSync();
  final options = ParserGeneratorOptions(name: 'SmartParser');
  final parserGenerator = ParserGenerator(options: options, source: source);
  final output = parserGenerator.generate();
  File(outputFile).writeAsStringSync(output);
  Process.runSync(Platform.executable, ['format', outputFile]);
}
```

## Error handling system

The error handling system is very simple and flexible.  
There are two methods for generating errors:

- `error`
- `errorExpected`

The generated parsers do not generate any errors.  
All errors must be generated explicitly by assigning error handlers to expressions in the grammar.  
Each expression can be assigned its own error handler.  
The assignment of an error handler is done as follows:

`e ~ { error handler code }`

Example of the error handlers:

```dart
START
`String` EscapeUnicode =>
  { final start = state.position; }
  "u"
  { var end = 0; }
  s = <
    @while (4, 4) {
      [a-fA-F0-9]
      ~{
        end = state.position;
        state.errorExpected('hexadecimal digit');
      }
    }
  >
  ~{ state.error('Incorrect Unicode escape sequence', position: end, start: start, end: end); }
  $ = { String.fromCharCode(int.parse(s, radix: 16)) }
END
```

This grammar produces the following error messages:

```txt
FormatException: line 1, column 3: Incorrect Unicode escape sequence
  ╷
1 │ "\u000"
  │   ^^^^
  ╵
line 1, column 7: Expected: 'hexadecimal digit'
  ╷
1 │ "\u000"
  │       ^
  ╵
```

If the parsing is successful, the overhead on the parser is minimal.  
The overhead will also be minimal if there is no need to begin plunge into parsing.

## Expressions

The following parsing expressions are supported:

- AnyCharacter
- AndPredicate
- CharacterClass
- Group
- Literal
- NotPredicate
- OneOrMore
- Optional
- OrderedChoice
- Sequence
- ZeroOrMore

Detailed information about these expressions can be obtained from the following sources:

- [Parsing expression grammar](https://en.wikipedia.org/wiki/Parsing_expression_grammar)
- [Parsing Expression Grammars: A Recognition-Based Syntactic Foundation](https://bford.info/pub/lang/peg)

Further in the text, the above expressions will be described only as examples of generated code or with a description of features applicable to this software.

The following additional parsing expressions are supported:

- Action
- Capture
- Predicate

The following parsing meta-expressions are supported:

- @match
- @position
- @while

Additional features:

- Semantic values

## Expression `AnyCharacter`

The `AnyCharacter` expression `.` is a parsing expression that matches any single character.  
The `AnyCharacter` expression does not add any errors to the error buffer.

```dart
START
`int` AnyCharacter =>
  .
END
```

```dart
START
`void` AnyCharacter =>
  .
END
```

Example of the expression `eof`.

```dart
START
`void` Eof =>
  ! .
END
```

## Expression `AndPredicate`

The `AndPredicate` expression `& e` invokes the sub-expression `e`, and then succeeds if `e` succeeds and fails if `e` fails, but in either case never consumes any input.

Example with single branch.

```dart
START
`String` AndPredicate =>
  $ = <[a-zA-Z]>
  & "=>"
END
```

## Expression `CharacterClass`

The `CharacterClass` expression `[]` is a parsing expression that matches a character.  
The `CharacterClass` expression does not add any errors to the error buffer.

The following forms of character specifiers are supported:

- Single character in natural form, eg. `[a]`
- Multiple character ranges in natural form, eg. `[a-z]`, `[0-9]`
- Single character in hexadecimal form, eg. `[{20}]`, `[\u{20}]`
- Multiple character ranges in hexadecimal form, eg. `[{30-39}]`, `[\u{30}-\u{39}]`
- C-escape sequences, eg. `[\n\r\t]`
- Escaping special characters: `\`, `^`, `-`, `[`, `]`, `{`, `}` eg. `[\^]`, `[\]]`
- Matching characters with negation in all available forms, eg. `[^a-z]`, `[^{30-39}]`

Examples of single character.

```dart
START
`int` A =>
  [a]
END
```

```dart
START
`void` A =>
  [a]
END
```

Example of character range.

```dart
START
`int` Digits =>
  [0-9]
END
```

Example of negated character range.

```dart
START
`int` NotDigits =>
  [^0-9]
END
```

Example of negated character ranges.

```dart
START
`int` NotDigitsNotLetters =>
  [^0-9a-zA-Z]
END
```

Example of hexadecimal value.

```dart
START
`int` Space =>
  [{20}]
END
```

Example of hexadecimal range.

```dart
START
`int` Digits =>
  [{30-39}]
END
```

Example of Unicode code point.

```dart
START
`int` Space =>
  [\u{20}]
END
```

Examples of escaping special characters.

```dart
START
`int` Space =>
  [\^]
END
```

```dart
START
`int` Space =>
  [\{]
END
```

## Expression `Group`

The `Group` expression groups expressions into a single expression.

⚠ Important information:  
For performance reasons, the `Group` expression does not create a separate naming scope.  
Thus, conflicts of names of semantic values are possible.  
To avoid duplicate name conflicts, it is necessary to use different semantic value identifiers within a scope.

Example of a `Group` expression at the end of a `Sequence` expression.

```dart
START
`int` AB =>
  [a]
  $ = ([b] / [c])
END
```

Example of a `Group` expression not at the end of a `Sequence` expression.

```dart
START
`int` AB =>
  $ = ([b] / [c])
  [a]
END
```

## Expression `Literal`

The `Literal` expression is a parsing expression that matches a string.

The `Literal` expression can be specified in both normal and extended forms.  
A `Literal` expression in its normal form is specified using double quotes `""`, its extended form is specified using single quotes `''`.

The difference between the normal form and the extended form is that when using the extended form, an `expected` error is added to the error buffer if parsing fails.

Examples of normal form.

```dart
START
`String` For =>
  "for"
END
```

```dart
START
`void` For =>
  "for"
END
```

Examples of extended form.

```dart
START
`String` For =>
  'for'
END
```

```dart
START
`void` For =>
  'for'
END
```

The expanded form is very similar to this expression, but nevertheless they are not the same.

```dart
START
`String` For =>
  "for"
  ~ { state.errorExpected('foo'); }
END
```

Example of parsing an empty string.

```dart
START
`void` EmptyString =>
  ""
END
```

## Expression `NotPredicate`

The `NotPredicate` expression `! e` invokes the sub-expression `e`, and then succeeds if `e` fails and fails if `e` succeeds, but in either case never consumes any input.

Example with a child expression with single branch.

```dart
START
`void` NotPredicate =>
  ! [a]
END
```

Example with a child expression with multiple branches.

```dart
START
`void` NotPredicate =>
  ! ([a] / [b])
END
```

## Expression `OneOrMore`

The `OneOrMore` expression `e+` matches a sequence of one or more repetitions of a sub-expression `e`.

Examples with a child expression with single branch.

```dart
START
`List<int>` OneOrMore =>
  [a]+
END
```

```dart
START
`void` OneOrMore =>
  [a]+
END
```

Examples with a child expression with multiple branches.

```dart
START
`List<int>` OneOrMore =>
  ([a] / [b])+
END
```

```dart
START
`void` OneOrMore =>
  ([a] / [b])+
END
```

## Expression `Optional`

The `Optional` expression `e?` matches zero or one expression `e`, and then succeeds with or without result.

Example with single branch.

```dart
START
`int?` Optional =>
  [a]?
END
```

```dart
START
`void` Optional =>
  [a]?
END
```

Example with multiple branches.

```dart
START
`int?` Optional =>
  ([a] / [b])?
END
```

```dart
START
`void` Optional =>
  ([a] / [b])?
END
```

Example with `Production` expression.

```dart
START
`int?` Optional =>
  P?
END
```

```dart
START
`int?` Optional =>
  p = P?
  $ = { p ?? 41 }
END
```

```dart
START
`void` Optional =>
  P?
END
```

## Expression `OrderedChoice`

The `OrderedChoice` expression has the following syntax.

`e1 / e2`

Where `e1` and `e2` are alternative expressions.  
If the first alternative successfully parses the input, it is accepted. If it fails, the parser then attempts the next alternative, and so on, until a match is found or all alternatives have been exhausted.

Examples of the `OrderedChoice` expression.

```dart
START
`int` AOrB =>
  [a]
  /
  [b]
END
```

```dart
START
`void` AOrB =>
  [a]
  /
  [b]
END
```

Examples using alternative syntax.

```dart
START
`int` AOrB =>
  [a]
  ----
  [b]
END
```

```dart
START
`void` AOrB =>
  [a]
  ----
  [b]
END
```

## Expression `Sequence`

The `Sequence` expression `e1 e2` first invokes `e1`, and if `e1` succeeds, subsequently invokes `e2` on the remainder of the input data left unconsumed by `e1`, and returns the result. If either `e1` or `e2` fails, then the sequence expression `e1 e2` fails (consuming no input).

Examples of the `Sequence` expression.

```dart
START
`(int, int)` AB =>
  a = [a]
  b = [b]
  $ = `const` { (a, b) }
END
```

```dart
START
`void` AB =>
  [a]
  [b]
END
```

## Expression `ZeroOrMore`

The `ZeroOrMore` expression `e*` matches a sequence of zero or more repetitions of a sub-expression `e`.

Examples with a child expression with single branch.

```dart
START
`List<int>` OneOrMore =>
  [a]*
END
```

```dart
START
`void` OneOrMore =>
  [a]*
END
```

Examples with a child expression with multiple branches.

```dart
START
`List<int>` OneOrMore =>
  ([a] / [b])*
END
```

```dart
START
`void` OneOrMore =>
  ([a] / [b])*
END
```

## Expression `Action`

The `Action` expression `{ }` is a piece of code, that always succeeds, with or without a result, depending on how it is used.

The following usage methods are supported:

- List of statements
- Expression
- Sub-expression

⚠ Important information:

- Changing the parsing `position` in the action code is prohibited. This will cause the parser to malfunction. For this case, there is a meta expression `@position`
- The source code must have balanced pairs of `{` and `}` characters. Unbalanced characters should be presented in a different form, eg. '\\u007B'

Example with a list of statements.

```dart
START
`List<int>` Action =>
  {
    final list = [];
    list.add(41);
  }
  $ = { list }
END
```

The first action (without assigning semantic value) is the method used to define a `list of statements`.  
The second action (with assignment of semantic value) is the method used to define an `expression`.  

That is, if the action is used with the assignment of semantic value then it is a method used to define an expression, otherwise for defining statements.

In all cases, the expression completes parsing successfully.

Example with sub-expression.

```dart
START
`void` Action =>
  & { some_expression }
END
```

## Expression `Capture`

The `Capture` expression `<e>` invokes the expression `e`, and then succeeds if the expression `e` succeeds, and fails otherwise. If successful, the substring of the input data from the beginning to the end of the expression `e` is returned.

Examples of the `Capture` expression.

```dart
START
`String` Digits =>
  <[0-9]+>
END
```

```dart
START
`void` SkipDigits =>
  <[0-9]+>
END
```

## Expression `Predicate`

The `Predicate` expression `& { }` invokes the action `{ }`, and then succeeds if the action code evaluates to `true`, and fails otherwise, without consuming any input.

The `Predicate` expression `! { }` invokes the action `{ }`, and then succeeds if the action code evaluates to `false`, and fails otherwise, without consuming any input.

Example of positive predicate.

```dart
START
`void` Action =>
  & { some_expression }
END
```

Example of negative predicate.

```dart
START
`void` Action =>
  ! { some_expression }
END
```

## Meta expression `@match`

The `Match` meta expression `@match(s)` consumes the string in a case-insensitive manner and returns this string.

Examples of the `@match` meta expression:

```dart
START
`String` For =>
  @match('for')
END
```

```dart
START
`void` For =>
  @match('for')
END
```

## Meta expression `@position`

The `Position` meta expression `@position(n)` changes the parsing position to `n`, then succeeds and does not return any value.

Example of input data scanning.

```dart
START
`String` EndTag =>
  { final index = state.indexOf('-->'); }
  @position({ index != -1 ? index : state.length })
  $ = '-->'
END
```

## Meta expression `@while`

The `@while` meta expression is a repetition expression and works similarly to the `while` statement.  
A slight difference is that this expression takes two positional parameters, `m` and `n`.  
The first parameter `m` is required and specifies the minimum number of repetitions.  
The second parameter `n` is optional and specifies the maximum number of repetitions.  
If the `n` parameter is not specified, the number of repetitions is unlimited.  

Examples of repetitions from 0 and no limit on the maximum number of repetitions.

```dart
START
`List<int>` Letters =>
  @while (0) {
    [a-zA-Z]
  }
END
```

```dart
START
`void` Letters =>
  @while (0) {
    [a-zA-Z]
  }
END
```

Examples of repetitions of at least 1 and no limit on the maximum number of repetitions.

```dart
START
`List<int>` Letters =>
  @while (1) {
    [a-zA-Z]
  }
END
```

```dart
START
`void` Letters =>
  @while (1) {
    [a-zA-Z]
  }
END
```

Examples of repetitions of not less than 2 and not more than 3 repetitions.

```dart
START
`List<int>` Letters =>
  @while (2, 3) {
    [a-zA-Z]
  }
END
```

```dart
START
`void` Letters =>
  @while (2, 3) {
    [a-zA-Z]
  }
END
```

Examples of 4 repetitions.

```dart
START
`List<int>` Letters =>
  @while (4, 4) {
    [a-zA-Z]
  }
END
```

```dart
START
`void` Letters =>
  @while (4, 4) {
    [a-zA-Z]
  }
END
```

## Semantic values

Semantic values ​​are the values produced by parsing expressions.  
Semantic values ​​are used to forming parsing results.  
The syntax for using semantic values ​​is as follows.

```txt
v = e
```

```txt
v = `type` e
```

Where `v` is a semantic value, `e` is a parsing expression and `type` is a native type.

An example of the use of semantic value.

```dart
START
`Sting` Digit =>
  n = [0-9]
  $ = { n - 48 }
END
```

The value `$` is the resulting semantic value. This value is not accessible by name; therefore, it is only available for assignment.  
This value is used exclusively when assigning a result value if the `Sequence` expression.  

In certain cases, it may be useful to specify the type of semantic value.  
For example, if the value is a constant or if it is necessary for the code generator to automatically infer the type of the parent expression.

Example with constant value.

```dart
START
`String` For =>
  [fF][oO][rR]
  $ = `const` { 'FOR' }
  ~ { state.errorExpected('FOR'); }
END
```

Example with explicit specifications the value type.

```dart
START
`Expression` Primary =>
  # ...
  n = (
    { final pos = state.position; }
    e = SequenceElement
    { e.sourceCode = state.substring(pos, state.position).trimRight(); }
    $ = `Expression` { e }
  )+
  # ...
END
```

## Generating token stream parsers

Example of token stream parser generation:

```dart
import 'dart:io';

import 'package:smart_parser/parser_generator.dart';

void main(List<String> args) {
  const inputFile = 'example/json_token_stream_parser.grammar';
  const outputFile = 'example/json_token_stream_parser.dart';
  final source = File(inputFile).readAsStringSync();
  final options = ParserGeneratorOptions(
    inputType: InputType.tokens,
    name: 'JsonParser',
  );
  final parserGenerator = ParserGenerator(options: options, source: source);
  final output = parserGenerator.generate();
  File(outputFile).writeAsStringSync(output);
  Process.runSync(Platform.executable, ['format', outputFile]);
}
```

An example of a token stream parser grammar:

```txt
%{
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
}%

%%
Token token;

int index = 0;

final List<Token> _tokens;

JsonParser(List<Token> tokens)
  : _tokens = tokens,
    token = tokens.isEmpty
        ? throw ArgumentError('Must not be empty', 'tokens')
        : tokens.first;

void nextToken(State state) {
  if (index >= _tokens.length) {
    return;
  }

  token = _tokens[++index];
  final start = token.start;
  state.position = start;
  if (state.farthestPosition < start) {
    state.farthestPosition = start;
  }
}

void restoreToken(State state, int index) {
  this.index = index;
  token = _tokens[index];
  state.position = token.start;
}
%%

`Object?` Start =>
  $ = Value
  & { token.kind == TokenKind.eof }
  ~{ state.errorExpected('enf of file'); }

`List<Object?>` Elements =>
  v = Value
  { final l = [v]; }
  @while (0) {
    comma
    ~{ state.errorExpected(','); }
    v = Value
    { l.add(v); }
  }
  $ = { l }

`List<Object?>` Array =>
  openBracket
  e = Elements?
  closeBracket
  ~{ state.errorExpected(']'); }
  $ = { e ?? [] }

`MapEntry<String, Object?>` KeyValue =>
  k = string
  ~{ state.errorExpected('string'); }
  colon
  ~{ state.errorExpected(':'); }
  v = Value
  $ = { MapEntry(k.value as String, v) }

`Map<String, Object?>` Map =>
  v = KeyValue
  {
    final m = <String, Object?>{};
    m[v.key] = v.value;
  }
  @while (0) {
    comma
    ~{ state.errorExpected(':'); }
    v = KeyValue
    { m[v.key] = v.value; }
  }
  $ = { m }

`Map<String, Object?>` Object =>
  openBrace
  m = Map?
  closeBrace
  ~{ state.errorExpected('\u007D'); }
  $ = { m ?? {} }

`Object?` Value =>
  (
    v = string
    $ = { v.value }
    ----
    v = number
    $ = { v.value }
    ----
    null$
    $ = `const` { null }
    ----
    true$
    $ = `const` { true }
    ----
    false$
    $ = `const` { false }
    ----
    & openBrace
    $ = Object
    ----
    & openBracket
    $ = Array
  )
  ~{ state.errorExpected(const ['string', 'number', 'array', 'object', 'null', 'boolean value']); }
```

## Parsing data from files

To implement data parsing from files, it is necessary to extend the `State` class.  
The following class members must be overridden:

- `charAt`
- `charSize`
- `indexOf`
- `length`
- `startsWith`
- `strlen`
- `substring`

When generating a parser, need specify `InputType.file` as the value of the `inputType` parameter.

## Examples of generated errors

A small program in the file [example/example_json_errors.dart](https://github.com/mezoni/smart_parser/blob/main/example/example_json_errors.dart) demonstrates what errors can be generated by a fairly simple JSON parser.

```txt
----------------------------------------
Source: "string
FormatException: line 1, column 1: Unterminated string
  ╷
1 │ "string
  │ ^
  ╵
line 1, column 8: Expected: '"'
  ╷
1 │ "string
  │        ^
  ╵
----------------------------------------
Source: {"key":"value"
FormatException: line 1, column 15: Expected: ',', '}'
  ╷
1 │ {"key":"value"
  │               ^
  ╵
----------------------------------------
Source: {"key""value"
FormatException: line 1, column 7: Expected: ':'
  ╷
1 │ {"key""value"
  │       ^
  ╵
----------------------------------------
Source: {true:false}
FormatException: line 1, column 2: Expected: 'string', '}'
  ╷
1 │ {true:false}
  │  ^
  ╵
----------------------------------------
Source: [0, ]
FormatException: line 1, column 5: Expected: 'digit', 'string', 'number', 'array', 'object', 'null', 'boolean value'
  ╷
1 │ [0, ]
  │     ^
  ╵
----------------------------------------
Source: [0, 1
FormatException: line 1, column 6: Expected: ',', ']'
  ╷
1 │ [0, 1
  │      ^
  ╵
----------------------------------------
Source: -
FormatException: line 1, column 2: Expected: 'digit'
  ╷
1 │ -
  │  ^
  ╵
----------------------------------------
Source: 1.
FormatException: line 1, column 3: Fractional part is missing a number
  ╷
1 │ 1.
  │   ^
  ╵
line 1, column 1: Malformed number
  ╷
1 │ 1.
  │ ^^
  ╵
line 1, column 3: Expected: 'digit'
  ╷
1 │ 1.
  │   ^
  ╵
----------------------------------------
Source: 1E
FormatException: line 1, column 3: Exponent part is missing a number
  ╷
1 │ 1E
  │   ^
  ╵
line 1, column 1: Malformed number
  ╷
1 │ 1E
  │ ^^
  ╵
line 1, column 3: Expected: 'digit'
  ╷
1 │ 1E
  │   ^
  ╵
----------------------------------------
Source: "\
FormatException: line 1, column 3: Expected: 'escape character'
  ╷
1 │ "\
  │   ^
  ╵
----------------------------------------
Source: "\z
FormatException: line 1, column 3: Illegal escape character
  ╷
1 │ "\z
  │   ^
  ╵
----------------------------------------
Source: "\u
FormatException: line 1, column 3: Incorrect Unicode escape sequence
  ╷
1 │ "\u
  │   ^
  ╵
line 1, column 4: Expected: 'hexadecimal digit'
  ╷
1 │ "\u
  │    ^
  ╵
----------------------------------------
Source: "\u00
FormatException: line 1, column 3: Incorrect Unicode escape sequence
  ╷
1 │ "\u00
  │   ^^^
  ╵
line 1, column 6: Expected: 'hexadecimal digit'
  ╷
1 │ "\u00
  │      ^
  ╵
```
