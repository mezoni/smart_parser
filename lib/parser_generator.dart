import 'dart:convert';

import 'grammar_generator.dart';
import 'parser_generator_options.dart';
import 'src/code_builder.dart';
import 'src/production_generator.dart';
import 'src/runtime_generator.dart';

export 'parser_generator_options.dart';

/// [Parser Generator] generates parser source code from a given grammar
/// [source] code.
class ParserGenerator {
  /// Parser generator options.
  final ParserGeneratorOptions options;

  /// Source code of the grammar.
  final String source;

  ParserGenerator({required this.options, required this.source});

  /// Generates parser source code and returns that code.
  String generate() {
    final grammarGenerator = GrammarGenerator(
      inputType: options.inputType,
      source: source,
    );
    final grammar = grammarGenerator.generate();
    final libraryCode = StringBuffer();
    final globals = grammar.globals;
    final members = grammar.members;
    if (globals != null) {
      _writeText(libraryCode, globals);
      libraryCode.writeln();
    }

    final classCode = StringBuffer();
    classCode.writeln('// dart format off');
    classCode.writeln('class ${options.name} {');
    if (members != null) {
      final lines = CodeBuilder.unindentText(members);
      _writeText(classCode, lines.join('\n'), '  ');
      classCode.writeln();
    }

    final productions = grammar.productions;
    final methods = <String>[];
    for (final production in productions) {
      final productionGenerator = ProductionGenerator(
        options: options,
        production: production,
      );
      final method = productionGenerator.generate();
      methods.add(method);
    }

    final methodsCode = CodeBuilder.indentText(
      methods.join('\n\n'),
      removeEmptyLines: false,
    );

    classCode.writeln(methodsCode);
    classCode.writeln('}');
    classCode.writeln('// dart format on');
    libraryCode.writeln(classCode);

    final runtimeGenerator = RuntimeGenerator(inputType: options.inputType);
    final runtime = runtimeGenerator.generate();
    libraryCode.writeln(runtime);
    return '$libraryCode';
  }

  void _writeText(StringSink sink, String text, [String indent = '']) {
    final lines = const LineSplitter().convert(text);
    if (lines.isEmpty) {
      return;
    }

    final first = lines.first;
    if (first.isNotEmpty) {
      sink.writeln('$indent$first');
    }

    for (var i = 1; i < lines.length; i++) {
      final line = lines[i];
      if (line.isEmpty) {
        sink.writeln(line);
      } else {
        sink.writeln('$indent$line');
      }
    }
  }
}
