import 'dart:io';

import 'package:smart_parser/parser_generator.dart';

void main(List<String> args) {
  const inputFileName = 'lib/src/smart_parser/smart_parser.grammar';
  const outputFileName = 'lib/src/smart_parser/smart_parser.dart';
  final source = File(inputFileName).readAsStringSync();
  final options = ParserGeneratorOptions(name: 'SmartParser');
  final parserGenerator = ParserGenerator(options: options, source: source);
  final output = parserGenerator.generate();
  File(outputFileName).writeAsStringSync(output);
}
