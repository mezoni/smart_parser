import 'dart:io';

import 'package:smart_parser/grammar_generator.dart';
import 'package:smart_parser/parser_generator.dart';
import 'package:smart_parser/src/production_generator.dart';
import 'package:yaml/yaml.dart';

void main(List<String> args) {
  const inputFile = 'tool/README.in.md';
  const outputFile = 'README.md';
  var input = File(inputFile).readAsStringSync();
  final re = RegExp('(?<=START)(((?!END).)*)(?=END)', dotAll: true);
  for (final match in re.allMatches(input)) {
    final source = match.group(0)!.trim();
    final grammarGenerator = GrammarGenerator(source: source);
    final grammar = grammarGenerator.generate();
    final production = grammar.productions[0];
    final options = ParserGeneratorOptions();
    final productionGenerator = ProductionGenerator(
      options: options,
      production: production,
    );
    final productionCode = productionGenerator.generate();
    final from =
        '''
```dart
START
$source
END
```''';

    final replace =
        '''
Grammar code:

```txt
$source
```

Dart code:

```dart
$productionCode
```''';
    input = input.replaceAll(from, replace);
  }

  final pubspec = loadYaml(File('pubspec.yaml').readAsStringSync());
  final name = pubspec['name'];
  final description = pubspec['description'];
  final version = pubspec['version'];
  input = input.replaceAll('{{name}}', '$name');
  input = input.replaceAll('{{description}}', '$description');
  input = input.replaceAll('{{version}}', '$version');
  File(outputFile).writeAsStringSync(input);
}
