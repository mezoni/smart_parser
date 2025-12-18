class Allocator {
  final Set<String> reserved = {};

  String allocate(String name) {
    if (name.isEmpty) {
      throw ArgumentError.value('Must not be empty', 'name');
    }

    var result = name;
    for (var i = 1; ; i++) {
      if (reserved.add(result)) {
        return result;
      }

      result = '$name$i';
    }
  }
}
