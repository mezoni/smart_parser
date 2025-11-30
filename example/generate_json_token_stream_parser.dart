import 'dart:io';

import 'package:smart_parser/parser_generator.dart';

void main(List<String> args) {
  const inputFile = 'example/json_token_stream_parser.grammar';
  const outputFile = 'example/json_token_stream_parser.dart';
  final source = File(inputFile).readAsStringSync();
  final options = ParserGeneratorOptions(
    inputType: InputType.tokens,
    name: 'JsonParser',
  );
  final parserGenerator = ParserGenerator(options: options, source: source);
  final output = parserGenerator.generate();
  File(outputFile).writeAsStringSync(output);
  Process.runSync(Platform.executable, ['format', outputFile]);
}
