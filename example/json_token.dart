class Token {
  final int end;

  final TokenKind kind;

  final int start;

  final Object? value;

  Token({
    required this.end,
    required this.kind,
    required this.start,
    this.value,
  });

  @override
  String toString() {
    return '$value';
  }
}

enum TokenKind {
  closeBrace('}'),
  closeBracket(']'),
  colon(':'),
  comma(','),
  eof('eof'),
  falseKeyword('false'),
  nullKeyword('null'),
  number('number'),
  openBrace('{'),
  openBracket('['),
  string('string'),
  trueKeyword('true');

  final String name;

  const TokenKind(this.name);

  @override
  String toString() {
    return name;
  }
}
