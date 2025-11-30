import '../parser_generator_options.dart';
import 'allocator.dart';
import 'code_builder.dart';
import 'expression_generator.dart';
import 'expressions.dart';
import 'helper.dart';

class ProductionGenerator {
  final ParserGeneratorOptions options;

  final Production production;

  ProductionGenerator({required this.options, required this.production});

  String generate() {
    final expression = production.expression;
    final name = production.name;
    final type = production.type;
    final allocator = Allocator();
    final cache = Cache();
    final suggestedName = camelize(name);
    final expressionGenerator = ExpressionGenerator(
      allocator: allocator,
      cache: cache,
      options: options,
      productionName: name,
      suggestedName: suggestedName,
    );

    final res = expressionGenerator.generate(expression);
    for (final success in res.successes) {
      success.succeeds((code) {
        final result = success.result;
        code.stmt('return $result');
      });
    }

    for (final failure in res.failures) {
      failure((code) {
        code.stmt('return null');
      });
    }

    final productionCode = Code();
    productionCode.writeln('/// [$type] **$name**');
    final sourceCode = production.sourceCode;
    if (sourceCode != null) {
      productionCode.writeln('/// ```txt');
      final lines = CodeBuilder.unindentText(sourceCode);
      for (final line in lines) {
        productionCode.writeln('/// $line');
      }
      productionCode.writeln('/// ```');
    }

    final returnType = expression.isAlwaysSuccessful
        ? 'Result<$type>'
        : 'Result<$type>?';
    final method = Code(
      begin: '$returnType parse$name(State state) {',
      end: '}',
      hideEmpty: false,
    );
    method((code) {
      code.add(res.code);
    });
    productionCode.add(method);
    return '$productionCode';
  }
}
