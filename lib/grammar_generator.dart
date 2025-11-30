import 'package:source_span/source_span.dart';

import 'parser_generator_options.dart';
import 'src/expression_analyzer.dart';
import 'src/expressions.dart';
import 'src/grammar.dart';
import 'src/parsers/text/text_parser.dart' as text_parser;
import 'src/parsers/text/text_parser.dart';
import 'src/parsers/token_stream/token_stream_parser.dart'
    as token_stream_parser;
import 'src/parsers/token_stream/token_stream_parser.dart';
import 'src/type_resolver.dart';

/// [GrammarGenerator] generates grammar from grammar [source] code.
class GrammarGenerator {
  /// Input type.
  final InputType inputType;

  /// Grammar source code.
  final String source;

  GrammarGenerator({this.inputType = InputType.string, required this.source});

  /// Generates a grammar and returns that grammar.
  Grammar generate() {
    final grammarGenerator = _GrammarGenerator(
      inputType: inputType,
      source: source,
    );
    final grammar = grammarGenerator.generate();
    return grammar;
  }
}

class _GrammarGenerator {
  final InputType inputType;

  final String source;

  _GrammarGenerator({this.inputType = InputType.string, required this.source});

  Grammar generate() {
    final grammar = switch (inputType) {
      InputType.file => _invokeTextParser(),
      InputType.string => _invokeTextParser(),
      InputType.tokens => _invokeTokenStreamParser(),
    };
    final productions = grammar.productions;
    final productionMap = <String, Production>{};
    for (final production in productions) {
      final name = production.name;
      if (productionMap.containsKey(name)) {
        throw StateError('Duplicate production name: $name');
      }

      productionMap[name] = production;
    }

    final processed = <String>{};
    for (final production in productions) {
      final name = production.name;
      if (!processed.add(name)) {
        throw StateError('Duplicate production name: $name');
      }

      final expression = production.expression;
      final type = production.type;
      ExpressionTypeResolver.assignType(expression, type);
      final expressionTypeResolver = ExpressionTypeResolver(
        productions: productionMap,
      );
      expressionTypeResolver.resolve(expression);
    }

    final expressionAnalyzer = ExpressionAnalyzer(productions: productionMap);
    expressionAnalyzer.analyze();
    return grammar;
  }

  Grammar _invokeTextParser() {
    const parser = TextParser();
    final state = text_parser.State(source);
    final result = parser.parseStart(state);
    if (result == null) {
      final file = SourceFile.fromString(source);
      throw FormatException(
        state
            .getErrors()
            .map((e) => file.span(e.start, e.end).message(e.message))
            .join('\n'),
      );
    }

    return result.$1;
  }

  Grammar _invokeTokenStreamParser() {
    const parser = TokenStreamParser();
    final state = token_stream_parser.State(source);
    final result = parser.parseStart(state);
    if (result == null) {
      final file = SourceFile.fromString(source);
      throw FormatException(
        state
            .getErrors()
            .map((e) => file.span(e.start, e.end).message(e.message))
            .join('\n'),
      );
    }

    return result.$1;
  }
}
