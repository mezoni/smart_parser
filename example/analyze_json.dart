import 'package:source_span/source_span.dart';

import 'json_ast.dart';
import 'json_token_stream_parser.dart';

void main(List<String> args) {
  final json = parse(_data);
  if (json is! JsonObject) {
    throw StateError('Expected object but got ${json.runtimeType}');
  }

  final errors = <({int start, int end, String message})>[];
  final processed = <String>{};
  for (final element in json.elements) {
    final elementValue = element.value;
    final key = elementValue.string;
    final value = elementValue.value;
    final name = key.stringToken.value as String;
    if (!processed.add(name)) {
      errors.add((
        start: key.start,
        end: key.end,
        message: 'Duplicate name: $name',
      ));
    }

    if (value is JsonNull) {
      errors.add((
        start: value.start,
        end: value.end,
        message: 'Value must not be null: $name',
      ));
    }
  }

  if (errors.isNotEmpty) {
    final file = SourceFile.fromString(_data);
    final message = errors
        .map((e) => file.span(e.start, e.end).message(e.message))
        .join('\n');
    throw StateError('Found some errors.\n$message');
  }
}

const _data = '''
{
  "foo": 1,
  "bar": 2,
  "baz": null,
  "foo": 3
}''';
