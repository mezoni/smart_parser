import 'example.dart';

void main(List<String> args) {
  for (final source in _data) {
    _parse(source);
  }
}

const _data = [
  '"string',
  '{"key":"value"',
  '{"key""value"',
  '{true:false}',
  '[0, ]',
  '[0, 1',
  '-',
  '1.',
  '1E',
  r'"\',
  r'"\z',
  r'"\u',
  r'"\u00',
];

void _parse(String source) {
  try {
    parse(source);
  } catch (e) {
    print('-' * 40);
    print('Source: $source');
    print(e);
  }
}
