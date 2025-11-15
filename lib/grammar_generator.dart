import 'package:source_span/source_span.dart';

import 'src/expression_analyzer.dart';
import 'src/expressions.dart';
import 'src/grammar.dart';
import 'src/smart_parser/smart_parser.dart';
import 'src/type_resolver.dart';

/// [GrammarGenerator] generates grammar from grammar [source] code.
class GrammarGenerator {
  /// Grammar source code.
  final String source;

  GrammarGenerator({required this.source});

  /// Generates a grammar and returns that grammar.
  Grammar generate() {
    const parser = SmartParser();
    final state = State(source);
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

    final grammar = result.$1;
    final productions = grammar.productions;
    final productionMap = <String, Production>{};
    for (final production in productions) {
      final name = production.name;
      if (productionMap.containsKey(name)) {
        throw StateError('Duplicate production name: $name');
      }

      productionMap[name] = production;
    }

    for (final production in productions) {
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
}
