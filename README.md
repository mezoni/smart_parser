# Smart parser

All in one, a generator of recursive descent PEG parsers, tokenizers, and token stream parsers.

Version: 2.0.5

[![Pub Package](https://img.shields.io/pub/v/smart_parser.svg)](https://pub.dev/packages/smart_parser)
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
  - [Meta expression `@position`](#meta-expression-position)
  - [Meta expression `@match`](#meta-expression-match)
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

Grammar code:

```txt
`String` Escape =>
  "n"
  $ = `const` { '\n' }
  ----
  "r"
  $ = `const` { '\r' }
  ----
  "t"
  $ = `const` { '\t' }
```

Dart code:

```dart
/// [String] **Escape**
/// ```txt
/// `String` Escape =>
///   "n"
///   $ = `const` { '\n' }
///   ----
///   "r"
///   $ = `const` { '\r' }
///   ----
///   "t"
///   $ = `const` { '\t' }
/// ```
Result<String>? parseEscape(State state) {
  // "n"
  if (state.ch == 110) {
    state.nextChar();
    return const Ok('\n');
  }
  // "r"
  if (state.ch == 114) {
    state.nextChar();
    return const Ok('\r');
  }
  // "t"
  if (state.ch == 116) {
    state.nextChar();
    return const Ok('\t');
  }
  return null;
}
```

Example of punctuation token generation.

The generator does not analyze the code into actions, but the source code of the action must have balanced pairs of `{` and `}` characters, and for this reason these characters are presented in a different form.

Grammar code:

```txt
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
```

Dart code:

```dart
/// [Token] **Punctuation**
/// ```txt
/// `Token` Punctuation =>
///   { final start = state.position; }
///   ","
///   $ = { _token(start, state.position, ",", tokenKind.comma) }
///   ----
///   "}"
///   $ = { _token(start, state.position, "\u007B", tokenKind.openBrace) }
///   ----
///   "{"
///   $ = { _token(start, state.position, "\u007D", tokenKind.closeBrace) }
///   ----
///   ":"
///   $ = { _token(start, state.position, ":", tokenKind.colon) }
///   ----
///   "=>"
///   $ = { _token(start, state.position, "=>", tokenKind.rightArrow) }
/// ```
Result<Token>? parsePunctuation(State state) {
  final start = state.position;
  // ","
  if (state.ch == 44) {
    state.nextChar();
    return Ok(_token(start, state.position, ",", tokenKind.comma));
  }
  // "}"
  if (state.ch == 125) {
    state.nextChar();
    return Ok(_token(start, state.position, "\u007B", tokenKind.openBrace));
  }
  // "{"
  if (state.ch == 123) {
    state.nextChar();
    return Ok(_token(start, state.position, "\u007D", tokenKind.closeBrace));
  }
  // ":"
  if (state.ch == 58) {
    state.nextChar();
    return Ok(_token(start, state.position, ":", tokenKind.colon));
  }
  // "=>"
  if (state.ch == 61 && state.startsWith("=>")) {
    state.readChar(state.position + 2, true);
    return Ok(_token(start, state.position, "=>", tokenKind.rightArrow));
  }
  return null;
}
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

Grammar code:

```txt
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
```

Dart code:

```dart
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
      return Ok(String.fromCharCode(int.parse(s, radix: 16)));
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

- @position
- @match
- @while

Additional features:

- Semantic values

## Expression `AnyCharacter`

The `AnyCharacter` expression `.` is a parsing expression that matches any single character.  
The `AnyCharacter` expression does not add any errors to the error buffer.

Grammar code:

```txt
`int` AnyCharacter =>
  .
```

Dart code:

```dart
/// [int] **AnyCharacter**
/// ```txt
/// `int` AnyCharacter =>
///   .
/// ```
Result<int>? parseAnyCharacter(State state) {
  if (state.ch >= 0) {
    final $anyCharacter = state.ch;
    state.nextChar();
    return Ok($anyCharacter);
  } else {
    return null;
  }
}
```

Grammar code:

```txt
`void` AnyCharacter =>
  .
```

Dart code:

```dart
/// [void] **AnyCharacter**
/// ```txt
/// `void` AnyCharacter =>
///   .
/// ```
Result<void>? parseAnyCharacter(State state) {
  if (state.ch >= 0) {
    state.nextChar();
    return Result.none;
  } else {
    return null;
  }
}
```

Example of the expression `eof`.

Grammar code:

```txt
`void` Eof =>
  ! .
```

Dart code:

```dart
/// [void] **Eof**
/// ```txt
/// `void` Eof =>
///   ! .
/// ```
Result<void>? parseEof(State state) {
  if (state.ch >= 0) {
    return null;
  } else {
    return Result.none;
  }
}
```

## Expression `AndPredicate`

The `AndPredicate` expression `& e` invokes the sub-expression `e`, and then succeeds if `e` succeeds and fails if `e` fails, but in either case never consumes any input.

Example with single branch.

Grammar code:

```txt
`String` AndPredicate =>
  $ = <[a-zA-Z]>
  & "=>"
```

Dart code:

```dart
/// [String] **AndPredicate**
/// ```txt
/// `String` AndPredicate =>
///   $ = <[a-zA-Z]>
///   & "=>"
/// ```
Result<String>? parseAndPredicate(State state) {
  final $pos = state.position;
  final $c = state.ch;
  final $ok = $c <= 90 ? $c >= 65 : $c >= 97 && $c <= 122;
  // [a-zA-Z]
  if ($ok) {
    state.nextChar();
    final $str = state.substring($pos, state.position);
    // "=>"
    if (state.ch == 61 && state.startsWith("=>")) {
      return Ok($str);
    } else {
      state.ch = $c;
      state.position = $pos;
      return null;
    }
  } else {
    return null;
  }
}
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

Grammar code:

```txt
`int` A =>
  [a]
```

Dart code:

```dart
/// [int] **A**
/// ```txt
/// `int` A =>
///   [a]
/// ```
Result<int>? parseA(State state) {
  // [a]
  if (state.ch == 97) {
    state.nextChar();
    return const Ok(97);
  } else {
    return null;
  }
}
```

Grammar code:

```txt
`void` A =>
  [a]
```

Dart code:

```dart
/// [void] **A**
/// ```txt
/// `void` A =>
///   [a]
/// ```
Result<void>? parseA(State state) {
  // [a]
  if (state.ch == 97) {
    state.nextChar();
    return Result.none;
  } else {
    return null;
  }
}
```

Example of character range.

Grammar code:

```txt
`int` Digits =>
  [0-9]
```

Dart code:

```dart
/// [int] **Digits**
/// ```txt
/// `int` Digits =>
///   [0-9]
/// ```
Result<int>? parseDigits(State state) {
  final $c = state.ch;
  final $ok = $c >= 48 && $c <= 57;
  // [0-9]
  if ($ok) {
    state.nextChar();
    return Ok($c);
  } else {
    return null;
  }
}
```

Example of negated character range.

Grammar code:

```txt
`int` NotDigits =>
  [^0-9]
```

Dart code:

```dart
/// [int] **NotDigits**
/// ```txt
/// `int` NotDigits =>
///   [^0-9]
/// ```
Result<int>? parseNotDigits(State state) {
  final $c = state.ch;
  final $ok = !($c >= 48 && $c <= 57) && !($c < 0);
  // [^0-9]
  if ($ok) {
    state.nextChar();
    return Ok($c);
  } else {
    return null;
  }
}
```

Example of negated character ranges.

Grammar code:

```txt
`int` NotDigitsNotLetters =>
  [^0-9a-zA-Z]
```

Dart code:

```dart
/// [int] **NotDigitsNotLetters**
/// ```txt
/// `int` NotDigitsNotLetters =>
///   [^0-9a-zA-Z]
/// ```
Result<int>? parseNotDigitsNotLetters(State state) {
  final $c = state.ch;
  final $ok = !($c <= 90 ? $c >= 65 || $c >= 48 && $c <= 57 : $c >= 97 && $c <= 122) && !($c < 0);
  // [^0-9a-zA-Z]
  if ($ok) {
    state.nextChar();
    return Ok($c);
  } else {
    return null;
  }
}
```

Example of hexadecimal value.

Grammar code:

```txt
`int` Space =>
  [{20}]
```

Dart code:

```dart
/// [int] **Space**
/// ```txt
/// `int` Space =>
///   [{20}]
/// ```
Result<int>? parseSpace(State state) {
  // [ ]
  if (state.ch == 32) {
    state.nextChar();
    return const Ok(32);
  } else {
    return null;
  }
}
```

Example of hexadecimal range.

Grammar code:

```txt
`int` Digits =>
  [{30-39}]
```

Dart code:

```dart
/// [int] **Digits**
/// ```txt
/// `int` Digits =>
///   [{30-39}]
/// ```
Result<int>? parseDigits(State state) {
  final $c = state.ch;
  final $ok = $c >= 48 && $c <= 57;
  // [0-9]
  if ($ok) {
    state.nextChar();
    return Ok($c);
  } else {
    return null;
  }
}
```

Example of Unicode code point.

Grammar code:

```txt
`int` Space =>
  [\u{20}]
```

Dart code:

```dart
/// [int] **Space**
/// ```txt
/// `int` Space =>
///   [\u{20}]
/// ```
Result<int>? parseSpace(State state) {
  // [ ]
  if (state.ch == 32) {
    state.nextChar();
    return const Ok(32);
  } else {
    return null;
  }
}
```

Examples of escaping special characters.

Grammar code:

```txt
`int` Space =>
  [\^]
```

Dart code:

```dart
/// [int] **Space**
/// ```txt
/// `int` Space =>
///   [\^]
/// ```
Result<int>? parseSpace(State state) {
  // [\^]
  if (state.ch == 94) {
    state.nextChar();
    return const Ok(94);
  } else {
    return null;
  }
}
```

Grammar code:

```txt
`int` Space =>
  [\{]
```

Dart code:

```dart
/// [int] **Space**
/// ```txt
/// `int` Space =>
///   [\{]
/// ```
Result<int>? parseSpace(State state) {
  // [\{]
  if (state.ch == 123) {
    state.nextChar();
    return const Ok(123);
  } else {
    return null;
  }
}
```

## Expression `Group`

The `Group` expression groups expressions into a single expression.

⚠ Important information:  
For performance reasons, the `Group` expression does not create a separate naming scope.  
Thus, conflicts of names of semantic values are possible.  
To avoid duplicate name conflicts, it is necessary to use different semantic value identifiers within a scope.

Example of a `Group` expression at the end of a `Sequence` expression.

Grammar code:

```txt
`int` AB =>
  [a]
  $ = ([b] / [c])
```

Dart code:

```dart
/// [int] **AB**
/// ```txt
/// `int` AB =>
///   [a]
///   $ = ([b] / [c])
/// ```
Result<int>? parseAB(State state) {
  final $pos = state.position;
  final $c = state.ch;
  // [a]
  if (state.ch == 97) {
    state.nextChar();
    // [b]
    if (state.ch == 98) {
      state.nextChar();
      return const Ok(98);
    }
    // [c]
    if (state.ch == 99) {
      state.nextChar();
      return const Ok(99);
    }
    state.ch = $c;
    state.position = $pos;
    return null;
  } else {
    return null;
  }
}
```

Example of a `Group` expression not at the end of a `Sequence` expression.

Grammar code:

```txt
`int` AB =>
  $ = ([b] / [c])
  [a]
```

Dart code:

```dart
/// [int] **AB**
/// ```txt
/// `int` AB =>
///   $ = ([b] / [c])
///   [a]
/// ```
Result<int>? parseAB(State state) {
  final $pos = state.position;
  final $c = state.ch;
  Result<int>? $res;
  // [b]
  if (state.ch == 98) {
    state.nextChar();
    $res = const Ok(98);
  } else {
    // [c]
    if (state.ch == 99) {
      state.nextChar();
      $res = const Ok(99);
    }
  }
  if ($res != null) {
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      return $res;
    } else {
      state.ch = $c;
      state.position = $pos;
      return null;
    }
  } else {
    return null;
  }
}
```

## Expression `Literal`

The `Literal` expression is a parsing expression that matches a string.

The `Literal` expression can be specified in both normal and extended forms.  
A `Literal` expression in its normal form is specified using double quotes `""`, its extended form is specified using single quotes `''`.

The difference between the normal form and the extended form is that when using the extended form, an `expected` error is added to the error buffer if parsing fails.

Examples of normal form.

Grammar code:

```txt
`String` For =>
  "for"
```

Dart code:

```dart
/// [String] **For**
/// ```txt
/// `String` For =>
///   "for"
/// ```
Result<String>? parseFor(State state) {
  // "for"
  if (state.ch == 102 && state.startsWith("for")) {
    state.readChar(state.position + 3, true);
    return const Ok("for");
  } else {
    return null;
  }
}
```

Grammar code:

```txt
`void` For =>
  "for"
```

Dart code:

```dart
/// [void] **For**
/// ```txt
/// `void` For =>
///   "for"
/// ```
Result<void>? parseFor(State state) {
  // "for"
  if (state.ch == 102 && state.startsWith("for")) {
    state.readChar(state.position + 3, true);
    return Result.none;
  } else {
    return null;
  }
}
```

Examples of extended form.

Grammar code:

```txt
`String` For =>
  'for'
```

Dart code:

```dart
/// [String] **For**
/// ```txt
/// `String` For =>
///   'for'
/// ```
Result<String>? parseFor(State state) {
  // 'for'
  if (state.ch == 102 && state.startsWith('for')) {
    state.readChar(state.position + 3, true);
    return const Ok('for');
  } else {
    state.errorExpected('for');
    return null;
  }
}
```

Grammar code:

```txt
`void` For =>
  'for'
```

Dart code:

```dart
/// [void] **For**
/// ```txt
/// `void` For =>
///   'for'
/// ```
Result<void>? parseFor(State state) {
  // 'for'
  if (state.ch == 102 && state.startsWith('for')) {
    state.readChar(state.position + 3, true);
    return Result.none;
  } else {
    state.errorExpected('for');
    return null;
  }
}
```

The expanded form is very similar to this expression, but nevertheless they are not the same.

Grammar code:

```txt
`String` For =>
  "for"
  ~ { state.errorExpected('foo'); }
```

Dart code:

```dart
/// [String] **For**
/// ```txt
/// `String` For =>
///   "for"
///   ~ { state.errorExpected('foo'); }
/// ```
Result<String>? parseFor(State state) {
  // "for"
  // ~{ state.errorExpected('foo'); }
  if (state.ch == 102 && state.startsWith("for")) {
    state.readChar(state.position + 3, true);
    return const Ok("for");
  } else {
    state.errorExpected('foo');
    return null;
  }
}
```

Example of parsing an empty string.

Grammar code:

```txt
`void` EmptyString =>
  ""
```

Dart code:

```dart
/// [void] **EmptyString**
/// ```txt
/// `void` EmptyString =>
///   ""
/// ```
Result<void> parseEmptyString(State state) {
  return Result.none;
}
```

## Expression `NotPredicate`

The `NotPredicate` expression `! e` invokes the sub-expression `e`, and then succeeds if `e` fails and fails if `e` succeeds, but in either case never consumes any input.

Example with a child expression with single branch.

Grammar code:

```txt
`void` NotPredicate =>
  ! [a]
```

Dart code:

```dart
/// [void] **NotPredicate**
/// ```txt
/// `void` NotPredicate =>
///   ! [a]
/// ```
Result<void>? parseNotPredicate(State state) {
  // [a]
  if (state.ch == 97) {
    return null;
  } else {
    return Result.none;
  }
}
```

Example with a child expression with multiple branches.

Grammar code:

```txt
`void` NotPredicate =>
  ! ([a] / [b])
```

Dart code:

```dart
/// [void] **NotPredicate**
/// ```txt
/// `void` NotPredicate =>
///   ! ([a] / [b])
/// ```
Result<void>? parseNotPredicate(State state) {
  state.predicate++;
  final $pos = state.position;
  final $c = state.ch;
  // [a]
  if (state.ch == 97) {
    state.nextChar();
    state.ch = $c;
    state.position = $pos;
    state.predicate--;
    return null;
  } else {
    // [b]
    if (state.ch == 98) {
      state.nextChar();
      state.ch = $c;
      state.position = $pos;
      state.predicate--;
      return null;
    } else {
      state.predicate--;
      return Result.none;
    }
  }
}
```

## Expression `OneOrMore`

The `OneOrMore` expression `e+` matches a sequence of one or more repetitions of a sub-expression `e`.

Examples with a child expression with single branch.

Grammar code:

```txt
`List<int>` OneOrMore =>
  [a]+
```

Dart code:

```dart
/// [List<int>] **OneOrMore**
/// ```txt
/// `List<int>` OneOrMore =>
///   [a]+
/// ```
Result<List<int>>? parseOneOrMore(State state) {
  final $list = <int>[];
  // (1)
  while (true) {
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      $list.add(97);
      continue;
    } else {
      break;
    }
  }
  if ($list.isNotEmpty) {
    return Ok($list);
  } else {
    return null;
  }
}
```

Grammar code:

```txt
`void` OneOrMore =>
  [a]+
```

Dart code:

```dart
/// [void] **OneOrMore**
/// ```txt
/// `void` OneOrMore =>
///   [a]+
/// ```
Result<void>? parseOneOrMore(State state) {
  var $ok = false;
  // (1)
  while (true) {
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      $ok = true;
      continue;
    } else {
      break;
    }
  }
  if ($ok) {
    return Result.none;
  } else {
    return null;
  }
}
```

Examples with a child expression with multiple branches.

Grammar code:

```txt
`List<int>` OneOrMore =>
  ([a] / [b])+
```

Dart code:

```dart
/// [List<int>] **OneOrMore**
/// ```txt
/// `List<int>` OneOrMore =>
///   ([a] / [b])+
/// ```
Result<List<int>>? parseOneOrMore(State state) {
  final $list = <int>[];
  // (1)
  while (true) {
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      $list.add(97);
      continue;
    }
    // [b]
    if (state.ch == 98) {
      state.nextChar();
      $list.add(98);
      continue;
    }
    break;
  }
  if ($list.isNotEmpty) {
    return Ok($list);
  } else {
    return null;
  }
}
```

Grammar code:

```txt
`void` OneOrMore =>
  ([a] / [b])+
```

Dart code:

```dart
/// [void] **OneOrMore**
/// ```txt
/// `void` OneOrMore =>
///   ([a] / [b])+
/// ```
Result<void>? parseOneOrMore(State state) {
  var $ok = false;
  // (1)
  while (true) {
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      $ok = true;
      continue;
    }
    // [b]
    if (state.ch == 98) {
      state.nextChar();
      $ok = true;
      continue;
    }
    break;
  }
  if ($ok) {
    return Result.none;
  } else {
    return null;
  }
}
```

## Expression `Optional`

The `Optional` expression `e?` matches zero or one expression `e`, and then succeeds with or without result.

Example with single branch.

Grammar code:

```txt
`int?` Optional =>
  [a]?
```

Dart code:

```dart
/// [int?] **Optional**
/// ```txt
/// `int?` Optional =>
///   [a]?
/// ```
Result<int?> parseOptional(State state) {
  int? $optional;
  // [a]
  if (state.ch == 97) {
    state.nextChar();
    $optional = 97;
  }
  return Ok($optional);
}
```

Grammar code:

```txt
`void` Optional =>
  [a]?
```

Dart code:

```dart
/// [void] **Optional**
/// ```txt
/// `void` Optional =>
///   [a]?
/// ```
Result<void> parseOptional(State state) {
  // [a]
  if (state.ch == 97) {
    state.nextChar();
  }
  return Result.none;
}
```

Example with multiple branches.

Grammar code:

```txt
`int?` Optional =>
  ([a] / [b])?
```

Dart code:

```dart
/// [int?] **Optional**
/// ```txt
/// `int?` Optional =>
///   ([a] / [b])?
/// ```
Result<int?> parseOptional(State state) {
  // [a]
  if (state.ch == 97) {
    state.nextChar();
    return const Ok(97);
  } else {
    // [b]
    if (state.ch == 98) {
      state.nextChar();
      return const Ok(98);
    } else {
      return const Ok(null);
    }
  }
}
```

Grammar code:

```txt
`void` Optional =>
  ([a] / [b])?
```

Dart code:

```dart
/// [void] **Optional**
/// ```txt
/// `void` Optional =>
///   ([a] / [b])?
/// ```
Result<void> parseOptional(State state) {
  // [a]
  if (state.ch == 97) {
    state.nextChar();
    return Result.none;
  } else {
    // [b]
    if (state.ch == 98) {
      state.nextChar();
      return Result.none;
    } else {
      return Result.none;
    }
  }
}
```

Example with `Production` expression.

Grammar code:

```txt
`int?` Optional =>
  P?
```

Dart code:

```dart
/// [int?] **Optional**
/// ```txt
/// `int?` Optional =>
///   P?
/// ```
Result<int?> parseOptional(State state) {
  final $p = parseP(state);
  return Ok($p?.$1);
}
```

Grammar code:

```txt
`int?` Optional =>
  p = P?
  $ = { p ?? 41 }
```

Dart code:

```dart
/// [int?] **Optional**
/// ```txt
/// `int?` Optional =>
///   p = P?
///   $ = { p ?? 41 }
/// ```
Result<int?> parseOptional(State state) {
  final $p = parseP(state);
  final p = $p?.$1;
  return Ok(p ?? 41);
}
```

Grammar code:

```txt
`void` Optional =>
  P?
```

Dart code:

```dart
/// [void] **Optional**
/// ```txt
/// `void` Optional =>
///   P?
/// ```
Result<void> parseOptional(State state) {
  parseP(state);
  return Result.none;
}
```

## Expression `OrderedChoice`

The `OrderedChoice` expression has the following syntax.

`e1 / e2`

Where `e1` and `e2` are alternative expressions.  
If the first alternative successfully parses the input, it is accepted. If it fails, the parser then attempts the next alternative, and so on, until a match is found or all alternatives have been exhausted.

Examples of the `OrderedChoice` expression.

Grammar code:

```txt
`int` AOrB =>
  [a]
  /
  [b]
```

Dart code:

```dart
/// [int] **AOrB**
/// ```txt
/// `int` AOrB =>
///   [a]
///   /
///   [b]
/// ```
Result<int>? parseAOrB(State state) {
  // [a]
  if (state.ch == 97) {
    state.nextChar();
    return const Ok(97);
  }
  // [b]
  if (state.ch == 98) {
    state.nextChar();
    return const Ok(98);
  }
  return null;
}
```

Grammar code:

```txt
`void` AOrB =>
  [a]
  /
  [b]
```

Dart code:

```dart
/// [void] **AOrB**
/// ```txt
/// `void` AOrB =>
///   [a]
///   /
///   [b]
/// ```
Result<void>? parseAOrB(State state) {
  // [a]
  if (state.ch == 97) {
    state.nextChar();
    return Result.none;
  }
  // [b]
  if (state.ch == 98) {
    state.nextChar();
    return Result.none;
  }
  return null;
}
```

Examples using alternative syntax.

Grammar code:

```txt
`int` AOrB =>
  [a]
  ----
  [b]
```

Dart code:

```dart
/// [int] **AOrB**
/// ```txt
/// `int` AOrB =>
///   [a]
///   ----
///   [b]
/// ```
Result<int>? parseAOrB(State state) {
  // [a]
  if (state.ch == 97) {
    state.nextChar();
    return const Ok(97);
  }
  // [b]
  if (state.ch == 98) {
    state.nextChar();
    return const Ok(98);
  }
  return null;
}
```

Grammar code:

```txt
`void` AOrB =>
  [a]
  ----
  [b]
```

Dart code:

```dart
/// [void] **AOrB**
/// ```txt
/// `void` AOrB =>
///   [a]
///   ----
///   [b]
/// ```
Result<void>? parseAOrB(State state) {
  // [a]
  if (state.ch == 97) {
    state.nextChar();
    return Result.none;
  }
  // [b]
  if (state.ch == 98) {
    state.nextChar();
    return Result.none;
  }
  return null;
}
```

## Expression `Sequence`

The `Sequence` expression `e1 e2` first invokes `e1`, and if `e1` succeeds, subsequently invokes `e2` on the remainder of the input data left unconsumed by `e1`, and returns the result. If either `e1` or `e2` fails, then the sequence expression `e1 e2` fails (consuming no input).

Examples of the `Sequence` expression.

Grammar code:

```txt
`(int, int)` AB =>
  a = [a]
  b = [b]
  $ = `const` { (a, b) }
```

Dart code:

```dart
/// [(int, int)] **AB**
/// ```txt
/// `(int, int)` AB =>
///   a = [a]
///   b = [b]
///   $ = `const` { (a, b) }
/// ```
Result<(int, int)>? parseAB(State state) {
  final $pos = state.position;
  final $c = state.ch;
  // [a]
  if (state.ch == 97) {
    state.nextChar();
    const a = 97;
    // [b]
    if (state.ch == 98) {
      state.nextChar();
      const b = 98;
      return const Ok((a, b));
    } else {
      state.ch = $c;
      state.position = $pos;
      return null;
    }
  } else {
    return null;
  }
}
```

Grammar code:

```txt
`void` AB =>
  [a]
  [b]
```

Dart code:

```dart
/// [void] **AB**
/// ```txt
/// `void` AB =>
///   [a]
///   [b]
/// ```
Result<void>? parseAB(State state) {
  final $pos = state.position;
  final $c = state.ch;
  // [a]
  if (state.ch == 97) {
    state.nextChar();
    // [b]
    if (state.ch == 98) {
      state.nextChar();
      return Result.none;
    } else {
      state.ch = $c;
      state.position = $pos;
      return null;
    }
  } else {
    return null;
  }
}
```

## Expression `ZeroOrMore`

The `ZeroOrMore` expression `e*` matches a sequence of zero or more repetitions of a sub-expression `e`.

Examples with a child expression with single branch.

Grammar code:

```txt
`List<int>` OneOrMore =>
  [a]*
```

Dart code:

```dart
/// [List<int>] **OneOrMore**
/// ```txt
/// `List<int>` OneOrMore =>
///   [a]*
/// ```
Result<List<int>> parseOneOrMore(State state) {
  final $list = <int>[];
  // (0)
  while (true) {
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      $list.add(97);
      continue;
    } else {
      break;
    }
  }
  return Ok($list);
}
```

Grammar code:

```txt
`void` OneOrMore =>
  [a]*
```

Dart code:

```dart
/// [void] **OneOrMore**
/// ```txt
/// `void` OneOrMore =>
///   [a]*
/// ```
Result<void> parseOneOrMore(State state) {
  // (0)
  while (true) {
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      continue;
    } else {
      break;
    }
  }
  return Result.none;
}
```

Examples with a child expression with multiple branches.

Grammar code:

```txt
`List<int>` OneOrMore =>
  ([a] / [b])*
```

Dart code:

```dart
/// [List<int>] **OneOrMore**
/// ```txt
/// `List<int>` OneOrMore =>
///   ([a] / [b])*
/// ```
Result<List<int>> parseOneOrMore(State state) {
  final $list = <int>[];
  // (0)
  while (true) {
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      $list.add(97);
      continue;
    }
    // [b]
    if (state.ch == 98) {
      state.nextChar();
      $list.add(98);
      continue;
    }
    break;
  }
  return Ok($list);
}
```

Grammar code:

```txt
`void` OneOrMore =>
  ([a] / [b])*
```

Dart code:

```dart
/// [void] **OneOrMore**
/// ```txt
/// `void` OneOrMore =>
///   ([a] / [b])*
/// ```
Result<void> parseOneOrMore(State state) {
  // (0)
  while (true) {
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      continue;
    }
    // [b]
    if (state.ch == 98) {
      state.nextChar();
      continue;
    }
    break;
  }
  return Result.none;
}
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

Grammar code:

```txt
`List<int>` Action =>
  {
    final list = [];
    list.add(41);
  }
  $ = { list }
```

Dart code:

```dart
/// [List<int>] **Action**
/// ```txt
/// `List<int>` Action =>
///   {
///     final list = [];
///     list.add(41);
///   }
///   $ = { list }
/// ```
Result<List<int>> parseAction(State state) {
  final list = [];
  list.add(41);
  return Ok(list);
}
```

The first action (without assigning semantic value) is the method used to define a `list of statements`.  
The second action (with assignment of semantic value) is the method used to define an `expression`.  

That is, if the action is used with the assignment of semantic value then it is a method used to define an expression, otherwise for defining statements.

In all cases, the expression completes parsing successfully.

Example with sub-expression.

Grammar code:

```txt
`void` Action =>
  & { some_expression }
```

Dart code:

```dart
/// [void] **Action**
/// ```txt
/// `void` Action =>
///   & { some_expression }
/// ```
Result<void>? parseAction(State state) {
  final $ok = some_expression;
  if ($ok) {
    return Result.none;
  } else {
    return null;
  }
}
```

## Expression `Capture`

The `Capture` expression `<e>` invokes the expression `e`, and then succeeds if the expression `e` succeeds, and fails otherwise. If successful, the substring of the input data from the beginning to the end of the expression `e` is returned.

Examples of the `Capture` expression.

Grammar code:

```txt
`String` Digits =>
  <[0-9]+>
```

Dart code:

```dart
/// [String] **Digits**
/// ```txt
/// `String` Digits =>
///   <[0-9]+>
/// ```
Result<String>? parseDigits(State state) {
  final $pos = state.position;
  var $ok = false;
  // (1)
  while (true) {
    final $c = state.ch;
    final $ok1 = $c >= 48 && $c <= 57;
    // [0-9]
    if ($ok1) {
      state.nextChar();
      $ok = true;
      continue;
    } else {
      break;
    }
  }
  if ($ok) {
    final $digits = state.substring($pos, state.position);
    return Ok($digits);
  } else {
    return null;
  }
}
```

Grammar code:

```txt
`void` SkipDigits =>
  <[0-9]+>
```

Dart code:

```dart
/// [void] **SkipDigits**
/// ```txt
/// `void` SkipDigits =>
///   <[0-9]+>
/// ```
Result<void>? parseSkipDigits(State state) {
  var $ok = false;
  // (1)
  while (true) {
    final $c = state.ch;
    final $ok1 = $c >= 48 && $c <= 57;
    // [0-9]
    if ($ok1) {
      state.nextChar();
      $ok = true;
      continue;
    } else {
      break;
    }
  }
  if ($ok) {
    return Result.none;
  } else {
    return null;
  }
}
```

## Expression `Predicate`

The `Predicate` expression `& { }` invokes the action `{ }`, and then succeeds if the action code evaluates to `true`, and fails otherwise, without consuming any input.

The `Predicate` expression `! { }` invokes the action `{ }`, and then succeeds if the action code evaluates to `false`, and fails otherwise, without consuming any input.

Example of positive predicate.

Grammar code:

```txt
`void` Action =>
  & { some_expression }
```

Dart code:

```dart
/// [void] **Action**
/// ```txt
/// `void` Action =>
///   & { some_expression }
/// ```
Result<void>? parseAction(State state) {
  final $ok = some_expression;
  if ($ok) {
    return Result.none;
  } else {
    return null;
  }
}
```

Example of negative predicate.

Grammar code:

```txt
`void` Action =>
  ! { some_expression }
```

Dart code:

```dart
/// [void] **Action**
/// ```txt
/// `void` Action =>
///   ! { some_expression }
/// ```
Result<void>? parseAction(State state) {
  final $ok = some_expression;
  if (!$ok) {
    return Result.none;
  } else {
    return null;
  }
}
```

## Meta expression `@position`

The `Position` meta expression `@position(n)` changes the parsing position to `n`, then succeeds and does not return any value.

Example of input data scanning.

Grammar code:

```txt
`String` EndTag =>
  { final index = state.indexOf('-->'); }
  @position({ index != -1 ? index : state.length })
  $ = '-->'
```

Dart code:

```dart
/// [String] **EndTag**
/// ```txt
/// `String` EndTag =>
///   { final index = state.indexOf('-->'); }
///   @position({ index != -1 ? index : state.length })
///   $ = '-->'
/// ```
Result<String>? parseEndTag(State state) {
  final $pos = state.position;
  final $c = state.ch;
  final index = state.indexOf('-->');
  state.readChar(index != -1 ? index : state.length, true);
  // '-->'
  if (state.ch == 45 && state.startsWith('-->')) {
    state.readChar(state.position + 3, true);
    return const Ok('-->');
  } else {
    state.errorExpected('-->');
    state.ch = $c;
    state.position = $pos;
    return null;
  }
}
```

## Meta expression `@match`

The `Match` meta expression `@match(s)` consumes the string in a case-insensitive manner and returns this string.

Examples of the `@match` meta expression:

Grammar code:

```txt
`String` For =>
  @match('for')
```

Dart code:

```dart
/// [String] **For**
/// ```txt
/// `String` For =>
///   @match('for')
/// ```
Result<String>? parseFor(State state) {
  // @match('for')
  final $length = state.match(const [102, 111, 114], const [70, 79, 82]);
  if ($length >= 0) {
    final $start = state.position;
    state.readChar($start + $length, true);
    final $for = state.substring($start, state.position);
    return Ok($for);
  } else {
    return null;
  }
}
```

Grammar code:

```txt
`void` For =>
  @match('for')
```

Dart code:

```dart
/// [void] **For**
/// ```txt
/// `void` For =>
///   @match('for')
/// ```
Result<void>? parseFor(State state) {
  // @match('for')
  final $length = state.match(const [102, 111, 114], const [70, 79, 82]);
  if ($length >= 0) {
    state.readChar(state.position + $length, true);
    return Result.none;
  } else {
    return null;
  }
}
```

## Meta expression `@while`

The `@while` meta expression is a repetition expression and works similarly to the `while` statement.  
A slight difference is that this expression takes two positional parameters, `m` and `n`.  
The first parameter `m` is required and specifies the minimum number of repetitions.  
The second parameter `n` is optional and specifies the maximum number of repetitions.  
If the `n` parameter is not specified, the number of repetitions is unlimited.  

Examples of repetitions from 0 and no limit on the maximum number of repetitions.

Grammar code:

```txt
`List<int>` Letters =>
  @while (0) {
    [a-zA-Z]
  }
```

Dart code:

```dart
/// [List<int>] **Letters**
/// ```txt
/// `List<int>` Letters =>
///   @while (0) {
///     [a-zA-Z]
///   }
/// ```
Result<List<int>> parseLetters(State state) {
  final $list = <int>[];
  // (0)
  while (true) {
    final $c = state.ch;
    final $ok = $c <= 90 ? $c >= 65 : $c >= 97 && $c <= 122;
    // [a-zA-Z]
    if ($ok) {
      state.nextChar();
      $list.add($c);
      continue;
    } else {
      break;
    }
  }
  return Ok($list);
}
```

Grammar code:

```txt
`void` Letters =>
  @while (0) {
    [a-zA-Z]
  }
```

Dart code:

```dart
/// [void] **Letters**
/// ```txt
/// `void` Letters =>
///   @while (0) {
///     [a-zA-Z]
///   }
/// ```
Result<void> parseLetters(State state) {
  // (0)
  while (true) {
    final $c = state.ch;
    final $ok = $c <= 90 ? $c >= 65 : $c >= 97 && $c <= 122;
    // [a-zA-Z]
    if ($ok) {
      state.nextChar();
      continue;
    } else {
      break;
    }
  }
  return Result.none;
}
```

Examples of repetitions of at least 1 and no limit on the maximum number of repetitions.

Grammar code:

```txt
`List<int>` Letters =>
  @while (1) {
    [a-zA-Z]
  }
```

Dart code:

```dart
/// [List<int>] **Letters**
/// ```txt
/// `List<int>` Letters =>
///   @while (1) {
///     [a-zA-Z]
///   }
/// ```
Result<List<int>>? parseLetters(State state) {
  final $list = <int>[];
  // (1)
  while (true) {
    final $c = state.ch;
    final $ok = $c <= 90 ? $c >= 65 : $c >= 97 && $c <= 122;
    // [a-zA-Z]
    if ($ok) {
      state.nextChar();
      $list.add($c);
      continue;
    } else {
      break;
    }
  }
  if ($list.isNotEmpty) {
    return Ok($list);
  } else {
    return null;
  }
}
```

Grammar code:

```txt
`void` Letters =>
  @while (1) {
    [a-zA-Z]
  }
```

Dart code:

```dart
/// [void] **Letters**
/// ```txt
/// `void` Letters =>
///   @while (1) {
///     [a-zA-Z]
///   }
/// ```
Result<void>? parseLetters(State state) {
  var $ok = false;
  // (1)
  while (true) {
    final $c = state.ch;
    final $ok1 = $c <= 90 ? $c >= 65 : $c >= 97 && $c <= 122;
    // [a-zA-Z]
    if ($ok1) {
      state.nextChar();
      $ok = true;
      continue;
    } else {
      break;
    }
  }
  if ($ok) {
    return Result.none;
  } else {
    return null;
  }
}
```

Examples of repetitions of not less than 2 and not more than 3 repetitions.

Grammar code:

```txt
`List<int>` Letters =>
  @while (2, 3) {
    [a-zA-Z]
  }
```

Dart code:

```dart
/// [List<int>] **Letters**
/// ```txt
/// `List<int>` Letters =>
///   @while (2, 3) {
///     [a-zA-Z]
///   }
/// ```
Result<List<int>>? parseLetters(State state) {
  final $pos = state.position;
  final $c = state.ch;
  final $list = <int>[];
  // (2, 3)
  while ($list.length < 3) {
    final $c1 = state.ch;
    final $ok = $c1 <= 90 ? $c1 >= 65 : $c1 >= 97 && $c1 <= 122;
    // [a-zA-Z]
    if ($ok) {
      state.nextChar();
      $list.add($c1);
      continue;
    } else {
      break;
    }
  }
  if ($list.length >= 2) {
    return Ok($list);
  } else {
    state.ch = $c;
    state.position = $pos;
    return null;
  }
}
```

Grammar code:

```txt
`void` Letters =>
  @while (2, 3) {
    [a-zA-Z]
  }
```

Dart code:

```dart
/// [void] **Letters**
/// ```txt
/// `void` Letters =>
///   @while (2, 3) {
///     [a-zA-Z]
///   }
/// ```
Result<void>? parseLetters(State state) {
  final $pos = state.position;
  final $c = state.ch;
  var $cnt = 0;
  // (2, 3)
  while ($cnt < 3) {
    final $c1 = state.ch;
    final $ok = $c1 <= 90 ? $c1 >= 65 : $c1 >= 97 && $c1 <= 122;
    // [a-zA-Z]
    if ($ok) {
      state.nextChar();
      $cnt++;
      continue;
    } else {
      break;
    }
  }
  if ($cnt >= 2) {
    return Result.none;
  } else {
    state.ch = $c;
    state.position = $pos;
    return null;
  }
}
```

Examples of 4 repetitions.

Grammar code:

```txt
`List<int>` Letters =>
  @while (4, 4) {
    [a-zA-Z]
  }
```

Dart code:

```dart
/// [List<int>] **Letters**
/// ```txt
/// `List<int>` Letters =>
///   @while (4, 4) {
///     [a-zA-Z]
///   }
/// ```
Result<List<int>>? parseLetters(State state) {
  final $pos = state.position;
  final $c = state.ch;
  final $list = <int>[];
  // (4, 4)
  while ($list.length < 4) {
    final $c1 = state.ch;
    final $ok = $c1 <= 90 ? $c1 >= 65 : $c1 >= 97 && $c1 <= 122;
    // [a-zA-Z]
    if ($ok) {
      state.nextChar();
      $list.add($c1);
      continue;
    } else {
      break;
    }
  }
  if ($list.length >= 4) {
    return Ok($list);
  } else {
    state.ch = $c;
    state.position = $pos;
    return null;
  }
}
```

Grammar code:

```txt
`void` Letters =>
  @while (4, 4) {
    [a-zA-Z]
  }
```

Dart code:

```dart
/// [void] **Letters**
/// ```txt
/// `void` Letters =>
///   @while (4, 4) {
///     [a-zA-Z]
///   }
/// ```
Result<void>? parseLetters(State state) {
  final $pos = state.position;
  final $c = state.ch;
  var $cnt = 0;
  // (4, 4)
  while ($cnt < 4) {
    final $c1 = state.ch;
    final $ok = $c1 <= 90 ? $c1 >= 65 : $c1 >= 97 && $c1 <= 122;
    // [a-zA-Z]
    if ($ok) {
      state.nextChar();
      $cnt++;
      continue;
    } else {
      break;
    }
  }
  if ($cnt >= 4) {
    return Result.none;
  } else {
    state.ch = $c;
    state.position = $pos;
    return null;
  }
}
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

Grammar code:

```txt
`Sting` Digit =>
  n = [0-9]
  $ = { n - 48 }
```

Dart code:

```dart
/// [Sting] **Digit**
/// ```txt
/// `Sting` Digit =>
///   n = [0-9]
///   $ = { n - 48 }
/// ```
Result<Sting>? parseDigit(State state) {
  final $c = state.ch;
  final $ok = $c >= 48 && $c <= 57;
  // [0-9]
  if ($ok) {
    state.nextChar();
    final n = $c;
    return Ok(n - 48);
  } else {
    return null;
  }
}
```

The value `$` is the resulting semantic value. This value is not accessible by name; therefore, it is only available for assignment.  
This value is used exclusively when assigning a result value if the `Sequence` expression.  

In certain cases, it may be useful to specify the type of semantic value.  
For example, if the value is a constant or if it is necessary for the code generator to automatically infer the type of the parent expression.

Example with constant value.

Grammar code:

```txt
`String` For =>
  [fF][oO][rR]
  $ = `const` { 'FOR' }
  ~ { state.errorExpected('FOR'); }
```

Dart code:

```dart
/// [String] **For**
/// ```txt
/// `String` For =>
///   [fF][oO][rR]
///   $ = `const` { 'FOR' }
///   ~ { state.errorExpected('FOR'); }
/// ```
Result<String>? parseFor(State state) {
  final $pos = state.position;
  final $c = state.ch;
  final $ok = $c == 70 || $c == 102;
  // [fF]
  if ($ok) {
    state.nextChar();
    final $c1 = state.ch;
    final $ok1 = $c1 == 79 || $c1 == 111;
    // [oO]
    if ($ok1) {
      state.nextChar();
      final $c2 = state.ch;
      final $ok2 = $c2 == 82 || $c2 == 114;
      // [rR]
      if ($ok2) {
        state.nextChar();
        return const Ok('FOR');
      } else {
        state.ch = $c;
        state.position = $pos;
        return null;
      }
    } else {
      state.ch = $c;
      state.position = $pos;
      return null;
    }
  } else {
    return null;
  }
}
```

Example with explicit specifications the value type.

Grammar code:

```txt
`Expression` Primary =>
  # ...
  n = (
    { final pos = state.position; }
    e = SequenceElement
    { e.sourceCode = state.substring(pos, state.position).trimRight(); }
    $ = `Expression` { e }
  )+
  # ...
```

Dart code:

```dart
/// [Expression] **Primary**
/// ```txt
/// `Expression` Primary =>
///   # ...
///   n = (
///     { final pos = state.position; }
///     e = SequenceElement
///     { e.sourceCode = state.substring(pos, state.position).trimRight(); }
///     $ = `Expression` { e }
///   )+
///   # ...
/// ```
Result<Expression>? parsePrimary(State state) {
  final $list = <Expression>[];
  // (1)
  while (true) {
    final pos = state.position;
    final $sequenceElement = parseSequenceElement(state);
    if ($sequenceElement != null) {
      final e = $sequenceElement.$1;
      e.sourceCode = state.substring(pos, state.position).trimRight();
      $list.add(e);
      continue;
    } else {
      break;
    }
  }
  if ($list.isNotEmpty) {
    return Ok($list);
  } else {
    return null;
  }
}
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

- `charSize`
- `indexOf`
- `length`
- `nextChar`
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
