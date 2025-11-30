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
    return kind.toString();
  }
}

enum TokenKind {
  closeBrace('}'),
  closeBracket(']'),
  colon(':'),
  comma(','),
  eof('eof'),
  false$('false'),
  null$('null'),
  number('number'),
  openBrace('{'),
  openBracket('['),
  string('string'),
  true$('true');

  final String name;

  const TokenKind(this.name);

  @override
  String toString() {
    return name;
  }
}
