import 'dart:io';

import 'package:smart_parser/parser_generator.dart';

void main(List<String> args) {
  const inputFileName = 'example/json_tokenizer.grammar';
  const outputFileName = 'example/json_tokenizer.dart';
  final source = File(inputFileName).readAsStringSync();
  final options = ParserGeneratorOptions(name: 'JsonTokenizer');
  final parserGenerator = ParserGenerator(options: options, source: source);
  final output = parserGenerator.generate();
  File(outputFileName).writeAsStringSync(output);
}
