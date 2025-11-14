enum InputType { file, string }

class ParserGeneratorOptions {
  InputType inputType;

  String name;

  ParserGeneratorOptions({
    this.inputType = InputType.string,
    this.name = 'Parser',
  });
}
