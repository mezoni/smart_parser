enum InputType { file, string, tokens }

/// Parser generator options.
class ParserGeneratorOptions {
  /// Expression to get the value of 'nextToken(state)'.
  String getNextToken;

  /// Expression to get the value of 'restoreToken(state, index)'.
  String getRestoreToken;

  /// Expression to get the value of 'token'.
  String getToken;

  /// Expression to get the `index` value of a list of `tokens`.
  String getTokenIndex;

  /// Expression to get the value of 'token.kind'.
  String getTokenKind;

  /// Expression to get the value of 'TokenKind.value'.
  String getTokenKindValue;

  /// The input data type of the generated parser.
  InputType inputType;

  /// Parser class name.
  String name;

  ParserGeneratorOptions({
    this.getNextToken = 'nextToken(state)',
    this.getRestoreToken = 'restoreToken(state, {{0}})',
    this.getToken = 'token',
    this.getTokenIndex = 'index',
    this.getTokenKind = '{{0}}.kind',
    this.getTokenKindValue = 'TokenKind.{{0}}',
    this.inputType = InputType.string,
    this.name = 'Parser',
  });
}
