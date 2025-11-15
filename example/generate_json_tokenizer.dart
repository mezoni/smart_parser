import 'dart:io';

import 'package:smart_parser/parser_generator.dart';

void main(List<String> args) {
  const inputFile = 'example/json_tokenizer.grammar';
  const outputFile = 'example/json_tokenizer.dart';
  final source = File(inputFile).readAsStringSync();
  final options = ParserGeneratorOptions(name: 'JsonTokenizer');
  final parserGenerator = ParserGenerator(options: options, source: source);
  final output = parserGenerator.generate();
  File(outputFile).writeAsStringSync(output);
  Process.runSync(Platform.executable, ['format', outputFile]);
}
