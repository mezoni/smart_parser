class Allocator {
  final Map<String, int> _indexes = {};

  String allocate([String name = '']) {
    final index = _indexes[name] ??= 0;
    _indexes[name] = index + 1;
    if (name.isNotEmpty) {
      if (index == 0) {
        return '$name\$';
      }

      return '$name\$$index';
    }

    return '\$$index';
  }
}
