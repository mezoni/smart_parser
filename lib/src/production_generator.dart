import '../parser_generator_options.dart';
import 'allocator.dart';
import 'code_builder.dart';
import 'expression_generator.dart';
import 'expressions.dart';

class ProductionGenerator {
  final ParserGeneratorOptions options;

  final Production production;

  ProductionGenerator({required this.options, required this.production});

  String generate() {
    final expression = production.expression;
    final name = production.name;
    final type = production.type;
    final allocator = Allocator();
    final isVoid = production.isVoid;
    final cache = Cache();
    final expressionGenerator = ExpressionGenerator(
      allocator: allocator,
      cache: cache,
      options: options,
    );

    final start = expressionGenerator.generate(expression);
    final isAlwaysSuccessful = expression.isAlwaysSuccessful;
    start.onPreprocess((code) {
      // TODO
      //cache.clear();
    });

    start.onAccept((event) {
      final code = event.output;
      final result = event.result;
      if (isVoid) {
        code.stmt('return Result.none');
      } else {
        code.stmt('return $result');
      }
    });

    if (!isAlwaysSuccessful) {
      start.onPostprocess((code) {
        code.stmt('return null');
      });
    }

    final source = Code();
    start.build(source);
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
      code.add(source);
    });
    productionCode.add(method);
    return '$productionCode';
  }
}
