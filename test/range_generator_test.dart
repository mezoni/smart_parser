import 'package:smart_parser/src/range_generator.dart';
import 'package:test/test.dart';

void main() {
  _testRangeGenerator();
}

void _testRangeGenerator() {
  test('RangeGenerator', () {
    {
      final ranges = [(10, 10)];
      final rangeGenerator = RangeGenerator(name: 'c', ranges: ranges);
      final result = rangeGenerator.generate();
      expect(result, 'c == 10');
    }

    {
      final ranges = [(10, 11)];
      final rangeGenerator = RangeGenerator(name: 'c', ranges: ranges);
      final result = rangeGenerator.generate();
      expect(result, 'c >= 10 && c <= 11');
    }

    {
      final ranges = [(10, 11), (20, 21)];
      final rangeGenerator = RangeGenerator(name: 'c', ranges: ranges);
      final result = rangeGenerator.generate();
      expect(result, 'c <= 11 ? c >= 10 : c >= 20 && c <= 21');
    }

    {
      final ranges = [(10, 11), (20, 21), (30, 31)];
      final rangeGenerator = RangeGenerator(name: 'c', ranges: ranges);
      final result = rangeGenerator.generate();
      expect(
        result,
        'c <= 21 ? c >= 20 || c >= 10 && c <= 11 : c >= 30 && c <= 31',
      );
    }

    {
      final ranges = [(10, 11), (20, 21), (30, 31), (40, 41)];
      final rangeGenerator = RangeGenerator(name: 'c', ranges: ranges);
      final result = rangeGenerator.generate();
      expect(
        result,
        'c <= 21 ? c >= 20 || c >= 10 && c <= 11 : c <= 31 ? c >= 30 : c >= 40 && c <= 41',
      );
    }

    {
      final ranges = [(10, 11), (20, 21), (30, 31), (40, 41), (50, 51)];
      final rangeGenerator = RangeGenerator(name: 'c', ranges: ranges);
      final result = rangeGenerator.generate();
      expect(
        result,
        'c <= 31 ? c >= 30 || c <= 11 ? c >= 10 : c >= 20 && c <= 21 : c <= 41 ? c >= 40 : c >= 50 && c <= 51',
      );
    }

    {
      final ranges = [
        (10, 11),
        (20, 21),
        (30, 31),
        (40, 41),
        (50, 51),
        (60, 61),
      ];
      final rangeGenerator = RangeGenerator(name: 'c', ranges: ranges);
      final result = rangeGenerator.generate();
      expect(
        result,
        'c <= 31 ? c >= 30 || c <= 11 ? c >= 10 : c >= 20 && c <= 21 : c <= 51 ? c >= 50 || c >= 40 && c <= 41 : c >= 60 && c <= 61',
      );
    }

    {
      final ranges = [(9, 10), (13, 13), (32, 32)];
      final rangeGenerator = RangeGenerator(name: 'c', ranges: ranges);
      final result = rangeGenerator.generate();
      expect(result, 'c <= 13 ? c >= 13 || c >= 9 && c <= 10 : c == 32');
    }

    {
      final ranges = [(48, 57), (65, 90), (97, 122)];
      final rangeGenerator = RangeGenerator(name: 'c', ranges: ranges);
      final result = rangeGenerator.generate();
      expect(
        result,
        'c <= 90 ? c >= 65 || c >= 48 && c <= 57 : c >= 97 && c <= 122',
      );
    }

    {
      final ranges = [(10, 10), (20, 20)];
      final rangeGenerator = RangeGenerator(name: 'c', ranges: ranges);
      final result = rangeGenerator.generate();
      expect(result, 'c == 10 || c == 20');
    }

    {
      final ranges = [(10, 10), (20, 20), (30, 30)];
      final rangeGenerator = RangeGenerator(name: 'c', ranges: ranges);
      final result = rangeGenerator.generate();
      expect(result, 'c <= 20 ? c >= 20 || c == 10 : c == 30');
    }

    {
      final ranges = [(10, 10), (20, 20), (30, 30), (40, 40)];
      final rangeGenerator = RangeGenerator(name: 'c', ranges: ranges);
      final result = rangeGenerator.generate();
      expect(result, 'c <= 20 ? c >= 20 || c == 10 : c == 30 || c == 40');
    }

    {
      final ranges = [(10, 10), (20, 20), (30, 30), (40, 40), (50, 50)];
      final rangeGenerator = RangeGenerator(name: 'c', ranges: ranges);
      final result = rangeGenerator.generate();
      expect(
        result,
        'c <= 30 ? c >= 30 || c == 10 || c == 20 : c == 40 || c == 50',
      );
    }

    {
      final ranges = [
        (10, 10),
        (20, 20),
        (30, 30),
        (40, 40),
        (50, 50),
        (60, 60),
      ];
      final rangeGenerator = RangeGenerator(name: 'c', ranges: ranges);
      final result = rangeGenerator.generate();
      expect(
        result,
        'c <= 30 ? c >= 30 || c == 10 || c == 20 : c <= 50 ? c >= 50 || c == 40 : c == 60',
      );
    }

    {
      final ranges = [(10, 10)];
      final rangeGenerator = RangeGenerator(
        name: 'c',
        negate: true,
        ranges: ranges,
      );
      final result = rangeGenerator.generate();
      expect(result, '!(c == 10) && !(c < 0)');
    }

    {
      final ranges = [(10, 11)];
      final rangeGenerator = RangeGenerator(
        name: 'c',
        negate: true,
        ranges: ranges,
      );
      final result = rangeGenerator.generate();
      expect(result, '!(c >= 10 && c <= 11) && !(c < 0)');
    }

    {
      final ranges = [(10, 11), (20, 21)];
      final rangeGenerator = RangeGenerator(
        name: 'c',
        negate: true,
        ranges: ranges,
      );
      final result = rangeGenerator.generate();
      expect(result, '!(c <= 11 ? c >= 10 : c >= 20 && c <= 21) && !(c < 0)');
    }
  });
}
