import 'dart:io';

import 'package:smart_parser/grammar_generator.dart';
import 'package:smart_parser/parser_generator.dart';
import 'package:smart_parser/src/expression_printer.dart';

void main(List<String> args) {
  const inputFile = 'tool/xxx.grammar';
  const outputFile = 'tool/xxx.dart';
  final source = File(inputFile).readAsStringSync();
  final options = ParserGeneratorOptions(
    inputType: InputType.string,
    name: 'Parser',
  );
  final parserGenerator = ParserGenerator(options: options, source: source);
  final output = parserGenerator.generate();
  File(outputFile).writeAsStringSync(output);
  Process.runSync(Platform.executable, ['format', outputFile]);
  return;
  final grammarGenerator = GrammarGenerator(source: source);
  final grammar = grammarGenerator.generate();
  for (final production in grammar.productions) {
    final expression = production.expression;
    final printer = ExpressionPrinter();
    final code = expression.accept(printer);
    print(code);
  }
}
