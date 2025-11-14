import 'dart:io';

import 'package:smart_parser/parser_generator.dart';

void main(List<String> args) {
  const inputFileName = 'example/json_parser.grammar';
  const outputFileName = 'example/example.dart';
  final source = File(inputFileName).readAsStringSync();
  final options = ParserGeneratorOptions(name: 'JsonParser');
  final parserGenerator = ParserGenerator(options: options, source: source);
  final output = parserGenerator.generate();
  File(outputFileName).writeAsStringSync(output);
}
