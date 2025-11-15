enum InputType { file, string }

/// Parser generator options.
class ParserGeneratorOptions {
  InputType inputType;

  /// Parser class name.
  String name;

  ParserGeneratorOptions({
    this.inputType = InputType.string,
    this.name = 'Parser',
  });
}
