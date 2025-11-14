class Token {
  final int end;

  final int start;

  final TokenType type;

  final Object? value;

  Token({
    required this.end,
    required this.start,
    required this.type,
    this.value,
  });

  @override
  String toString() {
    return type.toString();
  }
}

enum TokenType {
  closeBrace('}'),
  closeBracket(']'),
  colon(':'),
  comma(','),
  false$('false'),
  null$('null'),
  number('number'),
  openBrace('{'),
  openBracket('['),
  string('string'),
  true$('true');

  final String name;

  const TokenType(this.name);

  @override
  String toString() {
    return name;
  }
}
