import 'package:simple_sparse_list/ranges_helper.dart';

class RangeGenerator {
  final String name;

  final bool negate;

  List<(int, int)> ranges;

  RangeGenerator({
    required this.name,
    this.negate = false,
    required this.ranges,
  });

  String generate() {
    final ranges = normalizeRanges(this.ranges);
    final result = _generate(ranges, 0, ranges.length - 1);
    if (negate) {
      return '!($result) && !($name < 0)';
    }

    return result;
  }

  String _generate(List<(int, int)> ranges, int left, int right) {
    final middle = left == right ? left : (left + right) >> 1;
    final hasLeft = middle != left;
    final hasRight = middle != right;
    final range = ranges[middle];
    final min = range.$1;
    final max = range.$2;
    if (!hasLeft && !hasRight) {
      if (min == max) {
        final result = '$name == $min';
        return result;
      }

      final result = '$name >= $min && $name <= $max';
      return result;
    }

    if (hasLeft && !hasRight) {
      final testLeft = _generate(ranges, left, middle - 1);
      final result = '$name >= $min ? $name <= $max : $testLeft';
      return result;
    }

    if (hasRight && !hasLeft) {
      final testRight = _generate(ranges, middle + 1, right);
      if (min == max) {
        final result = '$name == $min || $testRight';
        return result;
      } else {
        final result = '$name <= $max ? $name >= $min : $testRight';
        return result;
      }
    }

    final testLeft = _generate(ranges, left, middle - 1);
    final testRight = _generate(ranges, middle + 1, right);
    final result = '$name <= $max ? $name >= $min || $testLeft : $testRight';
    return result;
  }
}
