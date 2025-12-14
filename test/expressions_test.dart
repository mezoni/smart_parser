import 'package:test/test.dart';

void main() {
  final parser = _TestParser();
  test('Action', () {
    final r$ = parser.parseAction0;
    final r$1 = parser.parseActionVoid0;
    final s$ = State('a');
    final r$2 = r$(s$) as dynamic;
    expect(
      r$2,
      isNotNull,
      reason: '\$ = `const` { 41 }\n\'a\'\nresult != null',
    );
    expect(
      s$.position,
      0,
      reason: '\$ = `const` { 41 }\n\'a\'\nstate.position = 0',
    );
    expect(r$2.$1, 41, reason: '\$ = `const` { 41 }\n\'a\'\nresult.\$1 != 41');
    final s$1 = State('a');
    final r$3 = r$1(s$1) as dynamic;
    expect(
      r$3,
      isNotNull,
      reason: '\$ = `const` { 41 }\n\'a\'\nresult != null',
    );
    expect(
      s$1.position,
      0,
      reason: '\$ = `const` { 41 }\n\'a\'\nstate.position = 0',
    );
    expect(
      r$3.$1,
      null,
      reason: '\$ = `const` { 41 }\n\'a\'\nresult.\$1 != null',
    );
    final s$2 = State('');
    final r$4 = r$(s$2) as dynamic;
    expect(r$4, isNotNull, reason: '\$ = `const` { 41 }\n\'\'\nresult != null');
    expect(
      s$2.position,
      0,
      reason: '\$ = `const` { 41 }\n\'\'\nstate.position = 0',
    );
    expect(r$4.$1, 41, reason: '\$ = `const` { 41 }\n\'\'\nresult.\$1 != 41');
    final s$3 = State('');
    final r$5 = r$1(s$3) as dynamic;
    expect(r$5, isNotNull, reason: '\$ = `const` { 41 }\n\'\'\nresult != null');
    expect(
      s$3.position,
      0,
      reason: '\$ = `const` { 41 }\n\'\'\nstate.position = 0',
    );
    expect(
      r$5.$1,
      null,
      reason: '\$ = `const` { 41 }\n\'\'\nresult.\$1 != null',
    );
    final r$6 = parser.parseAction1;
    final r$7 = parser.parseActionVoid1;
    final s$4 = State('a');
    final r$8 = r$6(s$4) as dynamic;
    expect(
      r$8,
      isNotNull,
      reason: '\$ = `const int` { 41 }\n\'a\'\nresult != null',
    );
    expect(
      s$4.position,
      0,
      reason: '\$ = `const int` { 41 }\n\'a\'\nstate.position = 0',
    );
    expect(
      r$8.$1,
      41,
      reason: '\$ = `const int` { 41 }\n\'a\'\nresult.\$1 != 41',
    );
    final s$5 = State('a');
    final r$9 = r$7(s$5) as dynamic;
    expect(
      r$9,
      isNotNull,
      reason: '\$ = `const int` { 41 }\n\'a\'\nresult != null',
    );
    expect(
      s$5.position,
      0,
      reason: '\$ = `const int` { 41 }\n\'a\'\nstate.position = 0',
    );
    expect(
      r$9.$1,
      null,
      reason: '\$ = `const int` { 41 }\n\'a\'\nresult.\$1 != null',
    );
    final s$6 = State('');
    final r$10 = r$6(s$6) as dynamic;
    expect(
      r$10,
      isNotNull,
      reason: '\$ = `const int` { 41 }\n\'\'\nresult != null',
    );
    expect(
      s$6.position,
      0,
      reason: '\$ = `const int` { 41 }\n\'\'\nstate.position = 0',
    );
    expect(
      r$10.$1,
      41,
      reason: '\$ = `const int` { 41 }\n\'\'\nresult.\$1 != 41',
    );
    final s$7 = State('');
    final r$11 = r$7(s$7) as dynamic;
    expect(
      r$11,
      isNotNull,
      reason: '\$ = `const int` { 41 }\n\'\'\nresult != null',
    );
    expect(
      s$7.position,
      0,
      reason: '\$ = `const int` { 41 }\n\'\'\nstate.position = 0',
    );
    expect(
      r$11.$1,
      null,
      reason: '\$ = `const int` { 41 }\n\'\'\nresult.\$1 != null',
    );
    final r$12 = parser.parseAction2;
    final r$13 = parser.parseActionVoid2;
    final s$8 = State('a');
    final r$14 = r$12(s$8) as dynamic;
    expect(
      r$14,
      isNotNull,
      reason: '{ const x = 41; }\n\$ = `const` { x }\n\'a\'\nresult != null',
    );
    expect(
      s$8.position,
      0,
      reason:
          '{ const x = 41; }\n\$ = `const` { x }\n\'a\'\nstate.position = 0',
    );
    expect(
      r$14.$1,
      41,
      reason: '{ const x = 41; }\n\$ = `const` { x }\n\'a\'\nresult.\$1 != 41',
    );
    final s$9 = State('a');
    final r$15 = r$13(s$9) as dynamic;
    expect(
      r$15,
      isNotNull,
      reason: '{ const x = 41; }\n\$ = `const` { x }\n\'a\'\nresult != null',
    );
    expect(
      s$9.position,
      0,
      reason:
          '{ const x = 41; }\n\$ = `const` { x }\n\'a\'\nstate.position = 0',
    );
    expect(
      r$15.$1,
      null,
      reason:
          '{ const x = 41; }\n\$ = `const` { x }\n\'a\'\nresult.\$1 != null',
    );
    final s$10 = State('');
    final r$16 = r$12(s$10) as dynamic;
    expect(
      r$16,
      isNotNull,
      reason: '{ const x = 41; }\n\$ = `const` { x }\n\'\'\nresult != null',
    );
    expect(
      s$10.position,
      0,
      reason: '{ const x = 41; }\n\$ = `const` { x }\n\'\'\nstate.position = 0',
    );
    expect(
      r$16.$1,
      41,
      reason: '{ const x = 41; }\n\$ = `const` { x }\n\'\'\nresult.\$1 != 41',
    );
    final s$11 = State('');
    final r$17 = r$13(s$11) as dynamic;
    expect(
      r$17,
      isNotNull,
      reason: '{ const x = 41; }\n\$ = `const` { x }\n\'\'\nresult != null',
    );
    expect(
      s$11.position,
      0,
      reason: '{ const x = 41; }\n\$ = `const` { x }\n\'\'\nstate.position = 0',
    );
    expect(
      r$17.$1,
      null,
      reason: '{ const x = 41; }\n\$ = `const` { x }\n\'\'\nresult.\$1 != null',
    );
  });

  test('AndPredicate', () {
    final r$ = parser.parseAndPredicate0;
    final r$1 = parser.parseAndPredicateVoid0;
    final s$ = State('abcd');
    final r$2 = r$(s$) as dynamic;
    expect(
      r$2,
      isNotNull,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'abcd\'\nresult != null',
    );
    expect(
      s$.position,
      4,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'abcd\'\nstate.position = 4',
    );
    expect(
      r$2.$1,
      'abcd',
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'abcd\'\nresult.\$1 != \'abcd\'',
    );
    final s$1 = State('abcd');
    final r$3 = r$1(s$1) as dynamic;
    expect(
      r$3,
      isNotNull,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'abcd\'\nresult != null',
    );
    expect(
      s$1.position,
      4,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'abcd\'\nstate.position = 4',
    );
    expect(
      r$3.$1,
      null,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'abcd\'\nresult.\$1 != null',
    );
    final s$2 = State('');
    final r$4 = r$(s$2) as dynamic;
    expect(
      r$4,
      isNull,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'\'\nresult == null',
    );
    expect(
      s$2.farthestPosition,
      0,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$2.position,
      0,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'\'\nstate.position = 0',
    );
    final e$ = s$2.getErrors().map((e) => '$e').toList()..sort();
    expect(e$.length, 1, reason: '&"abc"\n\$ = \'abcd\'\n\n\'\'\nerror count');
    expect(e$, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '&"abc"\n\$ = \'abcd\'\n\n\'\'\nerrors');
    final s$3 = State('');
    final r$5 = r$1(s$3) as dynamic;
    expect(
      r$5,
      isNull,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'\'\nresult == null',
    );
    expect(
      s$3.farthestPosition,
      0,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$3.position,
      0,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'\'\nstate.position = 0',
    );
    final e$1 = s$3.getErrors().map((e) => '$e').toList()..sort();
    expect(e$1.length, 1, reason: '&"abc"\n\$ = \'abcd\'\n\n\'\'\nerror count');
    expect(e$1, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '&"abc"\n\$ = \'abcd\'\n\n\'\'\nerrors');
    final s$4 = State('z');
    final r$6 = r$(s$4) as dynamic;
    expect(
      r$6,
      isNull,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'z\'\nresult == null',
    );
    expect(
      s$4.farthestPosition,
      0,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'z\'\nstate.farthestPosition = 0',
    );
    expect(
      s$4.position,
      0,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'z\'\nstate.position = 0',
    );
    final e$2 = s$4.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$2.length,
      1,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'z\'\nerror count',
    );
    expect(e$2, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '&"abc"\n\$ = \'abcd\'\n\n\'z\'\nerrors');
    final s$5 = State('z');
    final r$7 = r$1(s$5) as dynamic;
    expect(
      r$7,
      isNull,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'z\'\nresult == null',
    );
    expect(
      s$5.farthestPosition,
      0,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'z\'\nstate.farthestPosition = 0',
    );
    expect(
      s$5.position,
      0,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'z\'\nstate.position = 0',
    );
    final e$3 = s$5.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$3.length,
      1,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'z\'\nerror count',
    );
    expect(e$3, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '&"abc"\n\$ = \'abcd\'\n\n\'z\'\nerrors');
    final s$6 = State('abc');
    final r$8 = r$(s$6) as dynamic;
    expect(
      r$8,
      isNull,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'abc\'\nresult == null',
    );
    expect(
      s$6.farthestPosition,
      0,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'abc\'\nstate.farthestPosition = 0',
    );
    expect(
      s$6.position,
      0,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'abc\'\nstate.position = 0',
    );
    final e$4 = s$6.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$4.length,
      1,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'abc\'\nerror count',
    );
    expect(e$4, [
      '(end: 0, message: Expected: \'abcd\', start: 0)',
    ], reason: '&"abc"\n\$ = \'abcd\'\n\n\'abc\'\nerrors');
    final s$7 = State('abc');
    final r$9 = r$1(s$7) as dynamic;
    expect(
      r$9,
      isNull,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'abc\'\nresult == null',
    );
    expect(
      s$7.farthestPosition,
      0,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'abc\'\nstate.farthestPosition = 0',
    );
    expect(
      s$7.position,
      0,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'abc\'\nstate.position = 0',
    );
    final e$5 = s$7.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$5.length,
      1,
      reason: '&"abc"\n\$ = \'abcd\'\n\n\'abc\'\nerror count',
    );
    expect(e$5, [
      '(end: 0, message: Expected: \'abcd\', start: 0)',
    ], reason: '&"abc"\n\$ = \'abcd\'\n\n\'abc\'\nerrors');
    final r$10 = parser.parseAndPredicate1;
    final s$8 = State('abc');
    final r$11 = r$10(s$8) as dynamic;
    expect(r$11, isNotNull, reason: '&"abc"\n\n\'abc\'\nresult != null');
    expect(s$8.position, 0, reason: '&"abc"\n\n\'abc\'\nstate.position = 0');
    expect(r$11.$1, null, reason: '&"abc"\n\n\'abc\'\nresult.\$1 != null');
    final s$9 = State('');
    final r$12 = r$10(s$9) as dynamic;
    expect(r$12, isNull, reason: '&"abc"\n\n\'\'\nresult == null');
    expect(
      s$9.farthestPosition,
      0,
      reason: '&"abc"\n\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$9.position, 0, reason: '&"abc"\n\n\'\'\nstate.position = 0');
    final e$6 = s$9.getErrors().map((e) => '$e').toList()..sort();
    expect(e$6.length, 1, reason: '&"abc"\n\n\'\'\nerror count');
    expect(e$6, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '&"abc"\n\n\'\'\nerrors');
    final s$10 = State('z');
    final r$13 = r$10(s$10) as dynamic;
    expect(r$13, isNull, reason: '&"abc"\n\n\'z\'\nresult == null');
    expect(
      s$10.farthestPosition,
      0,
      reason: '&"abc"\n\n\'z\'\nstate.farthestPosition = 0',
    );
    expect(s$10.position, 0, reason: '&"abc"\n\n\'z\'\nstate.position = 0');
    final e$7 = s$10.getErrors().map((e) => '$e').toList()..sort();
    expect(e$7.length, 1, reason: '&"abc"\n\n\'z\'\nerror count');
    expect(e$7, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '&"abc"\n\n\'z\'\nerrors');
    final s$11 = State('a');
    final r$14 = r$10(s$11) as dynamic;
    expect(r$14, isNull, reason: '&"abc"\n\n\'a\'\nresult == null');
    expect(
      s$11.farthestPosition,
      0,
      reason: '&"abc"\n\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(s$11.position, 0, reason: '&"abc"\n\n\'a\'\nstate.position = 0');
    final e$8 = s$11.getErrors().map((e) => '$e').toList()..sort();
    expect(e$8.length, 1, reason: '&"abc"\n\n\'a\'\nerror count');
    expect(e$8, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '&"abc"\n\n\'a\'\nerrors');
    final s$12 = State('ab');
    final r$15 = r$10(s$12) as dynamic;
    expect(r$15, isNull, reason: '&"abc"\n\n\'ab\'\nresult == null');
    expect(
      s$12.farthestPosition,
      0,
      reason: '&"abc"\n\n\'ab\'\nstate.farthestPosition = 0',
    );
    expect(s$12.position, 0, reason: '&"abc"\n\n\'ab\'\nstate.position = 0');
    final e$9 = s$12.getErrors().map((e) => '$e').toList()..sort();
    expect(e$9.length, 1, reason: '&"abc"\n\n\'ab\'\nerror count');
    expect(e$9, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '&"abc"\n\n\'ab\'\nerrors');
  });

  test('AnyCharacter', () {
    final r$ = parser.parseAnyCharacter0;
    final r$1 = parser.parseAnyCharacterVoid0;
    final s$ = State('a');
    final r$2 = r$(s$) as dynamic;
    expect(r$2, isNotNull, reason: '.\n\'a\'\nresult != null');
    expect(s$.position, 1, reason: '.\n\'a\'\nstate.position = 1');
    expect(r$2.$1, 97, reason: '.\n\'a\'\nresult.\$1 != 97');
    final s$1 = State('a');
    final r$3 = r$1(s$1) as dynamic;
    expect(r$3, isNotNull, reason: '.\n\'a\'\nresult != null');
    expect(s$1.position, 1, reason: '.\n\'a\'\nstate.position = 1');
    expect(r$3.$1, null, reason: '.\n\'a\'\nresult.\$1 != null');
    final s$2 = State('z');
    final r$4 = r$(s$2) as dynamic;
    expect(r$4, isNotNull, reason: '.\n\'z\'\nresult != null');
    expect(s$2.position, 1, reason: '.\n\'z\'\nstate.position = 1');
    expect(r$4.$1, 122, reason: '.\n\'z\'\nresult.\$1 != 122');
    final s$3 = State('z');
    final r$5 = r$1(s$3) as dynamic;
    expect(r$5, isNotNull, reason: '.\n\'z\'\nresult != null');
    expect(s$3.position, 1, reason: '.\n\'z\'\nstate.position = 1');
    expect(r$5.$1, null, reason: '.\n\'z\'\nresult.\$1 != null');
    final s$4 = State('');
    final r$6 = r$(s$4) as dynamic;
    expect(r$6, isNull, reason: '.\n\'\'\nresult == null');
    expect(
      s$4.farthestPosition,
      0,
      reason: '.\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$4.position, 0, reason: '.\n\'\'\nstate.position = 0');
    final e$ = s$4.getErrors().map((e) => '$e').toList()..sort();
    expect(e$.length, 1, reason: '.\n\'\'\nerror count');
    expect(e$, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '.\n\'\'\nerrors');
    final s$5 = State('');
    final r$7 = r$1(s$5) as dynamic;
    expect(r$7, isNull, reason: '.\n\'\'\nresult == null');
    expect(
      s$5.farthestPosition,
      0,
      reason: '.\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$5.position, 0, reason: '.\n\'\'\nstate.position = 0');
    final e$1 = s$5.getErrors().map((e) => '$e').toList()..sort();
    expect(e$1.length, 1, reason: '.\n\'\'\nerror count');
    expect(e$1, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '.\n\'\'\nerrors');
  });

  test('Capture', () {
    final r$ = parser.parseCapture0;
    final r$1 = parser.parseCaptureVoid0;
    final s$ = State('a');
    final r$2 = r$(s$) as dynamic;
    expect(r$2, isNotNull, reason: '<[a]>\n\'a\'\nresult != null');
    expect(s$.position, 1, reason: '<[a]>\n\'a\'\nstate.position = 1');
    expect(r$2.$1, 'a', reason: '<[a]>\n\'a\'\nresult.\$1 != \'a\'');
    final s$1 = State('a');
    final r$3 = r$1(s$1) as dynamic;
    expect(r$3, isNotNull, reason: '<[a]>\n\'a\'\nresult != null');
    expect(s$1.position, 1, reason: '<[a]>\n\'a\'\nstate.position = 1');
    expect(r$3.$1, null, reason: '<[a]>\n\'a\'\nresult.\$1 != null');
    final s$2 = State('');
    final r$4 = r$(s$2) as dynamic;
    expect(r$4, isNull, reason: '<[a]>\n\'\'\nresult == null');
    expect(
      s$2.farthestPosition,
      0,
      reason: '<[a]>\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$2.position, 0, reason: '<[a]>\n\'\'\nstate.position = 0');
    final e$ = s$2.getErrors().map((e) => '$e').toList()..sort();
    expect(e$.length, 1, reason: '<[a]>\n\'\'\nerror count');
    expect(e$, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '<[a]>\n\'\'\nerrors');
    final s$3 = State('');
    final r$5 = r$1(s$3) as dynamic;
    expect(r$5, isNull, reason: '<[a]>\n\'\'\nresult == null');
    expect(
      s$3.farthestPosition,
      0,
      reason: '<[a]>\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$3.position, 0, reason: '<[a]>\n\'\'\nstate.position = 0');
    final e$1 = s$3.getErrors().map((e) => '$e').toList()..sort();
    expect(e$1.length, 1, reason: '<[a]>\n\'\'\nerror count');
    expect(e$1, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '<[a]>\n\'\'\nerrors');
    final s$4 = State('z');
    final r$6 = r$(s$4) as dynamic;
    expect(r$6, isNull, reason: '<[a]>\n\'z\'\nresult == null');
    expect(
      s$4.farthestPosition,
      0,
      reason: '<[a]>\n\'z\'\nstate.farthestPosition = 0',
    );
    expect(s$4.position, 0, reason: '<[a]>\n\'z\'\nstate.position = 0');
    final e$2 = s$4.getErrors().map((e) => '$e').toList()..sort();
    expect(e$2.length, 1, reason: '<[a]>\n\'z\'\nerror count');
    expect(e$2, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '<[a]>\n\'z\'\nerrors');
    final s$5 = State('z');
    final r$7 = r$1(s$5) as dynamic;
    expect(r$7, isNull, reason: '<[a]>\n\'z\'\nresult == null');
    expect(
      s$5.farthestPosition,
      0,
      reason: '<[a]>\n\'z\'\nstate.farthestPosition = 0',
    );
    expect(s$5.position, 0, reason: '<[a]>\n\'z\'\nstate.position = 0');
    final e$3 = s$5.getErrors().map((e) => '$e').toList()..sort();
    expect(e$3.length, 1, reason: '<[a]>\n\'z\'\nerror count');
    expect(e$3, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '<[a]>\n\'z\'\nerrors');
    final r$8 = parser.parseCapture1;
    final s$6 = State('a');
    final r$9 = r$8(s$6) as dynamic;
    expect(r$9, isNotNull, reason: '<[a]>\n\'a\'\nresult != null');
    expect(s$6.position, 1, reason: '<[a]>\n\'a\'\nstate.position = 1');
    expect(r$9.$1, null, reason: '<[a]>\n\'a\'\nresult.\$1 != null');
    final s$7 = State('');
    final r$10 = r$8(s$7) as dynamic;
    expect(r$10, isNull, reason: '<[a]>\n\'\'\nresult == null');
    expect(
      s$7.farthestPosition,
      0,
      reason: '<[a]>\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$7.position, 0, reason: '<[a]>\n\'\'\nstate.position = 0');
    final e$4 = s$7.getErrors().map((e) => '$e').toList()..sort();
    expect(e$4.length, 1, reason: '<[a]>\n\'\'\nerror count');
    expect(e$4, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '<[a]>\n\'\'\nerrors');
    final s$8 = State('z');
    final r$11 = r$8(s$8) as dynamic;
    expect(r$11, isNull, reason: '<[a]>\n\'z\'\nresult == null');
    expect(
      s$8.farthestPosition,
      0,
      reason: '<[a]>\n\'z\'\nstate.farthestPosition = 0',
    );
    expect(s$8.position, 0, reason: '<[a]>\n\'z\'\nstate.position = 0');
    final e$5 = s$8.getErrors().map((e) => '$e').toList()..sort();
    expect(e$5.length, 1, reason: '<[a]>\n\'z\'\nerror count');
    expect(e$5, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '<[a]>\n\'z\'\nerrors');
    final r$12 = parser.parseCapture2;
    final r$13 = parser.parseCaptureVoid2;
    final s$9 = State('a');
    final r$14 = r$12(s$9) as dynamic;
    expect(r$14, isNotNull, reason: '<[a] / [b]>\n\'a\'\nresult != null');
    expect(s$9.position, 1, reason: '<[a] / [b]>\n\'a\'\nstate.position = 1');
    expect(r$14.$1, 'a', reason: '<[a] / [b]>\n\'a\'\nresult.\$1 != \'a\'');
    final s$10 = State('a');
    final r$15 = r$13(s$10) as dynamic;
    expect(r$15, isNotNull, reason: '<[a] / [b]>\n\'a\'\nresult != null');
    expect(s$10.position, 1, reason: '<[a] / [b]>\n\'a\'\nstate.position = 1');
    expect(r$15.$1, null, reason: '<[a] / [b]>\n\'a\'\nresult.\$1 != null');
    final s$11 = State('b');
    final r$16 = r$12(s$11) as dynamic;
    expect(r$16, isNotNull, reason: '<[a] / [b]>\n\'b\'\nresult != null');
    expect(s$11.position, 1, reason: '<[a] / [b]>\n\'b\'\nstate.position = 1');
    expect(r$16.$1, 'b', reason: '<[a] / [b]>\n\'b\'\nresult.\$1 != \'b\'');
    final s$12 = State('b');
    final r$17 = r$13(s$12) as dynamic;
    expect(r$17, isNotNull, reason: '<[a] / [b]>\n\'b\'\nresult != null');
    expect(s$12.position, 1, reason: '<[a] / [b]>\n\'b\'\nstate.position = 1');
    expect(r$17.$1, null, reason: '<[a] / [b]>\n\'b\'\nresult.\$1 != null');
    final s$13 = State('');
    final r$18 = r$12(s$13) as dynamic;
    expect(r$18, isNull, reason: '<[a] / [b]>\n\'\'\nresult == null');
    expect(
      s$13.farthestPosition,
      0,
      reason: '<[a] / [b]>\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$13.position, 0, reason: '<[a] / [b]>\n\'\'\nstate.position = 0');
    final e$6 = s$13.getErrors().map((e) => '$e').toList()..sort();
    expect(e$6.length, 1, reason: '<[a] / [b]>\n\'\'\nerror count');
    expect(e$6, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '<[a] / [b]>\n\'\'\nerrors');
    final s$14 = State('');
    final r$19 = r$13(s$14) as dynamic;
    expect(r$19, isNull, reason: '<[a] / [b]>\n\'\'\nresult == null');
    expect(
      s$14.farthestPosition,
      0,
      reason: '<[a] / [b]>\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$14.position, 0, reason: '<[a] / [b]>\n\'\'\nstate.position = 0');
    final e$7 = s$14.getErrors().map((e) => '$e').toList()..sort();
    expect(e$7.length, 1, reason: '<[a] / [b]>\n\'\'\nerror count');
    expect(e$7, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '<[a] / [b]>\n\'\'\nerrors');
    final s$15 = State('z');
    final r$20 = r$12(s$15) as dynamic;
    expect(r$20, isNull, reason: '<[a] / [b]>\n\'z\'\nresult == null');
    expect(
      s$15.farthestPosition,
      0,
      reason: '<[a] / [b]>\n\'z\'\nstate.farthestPosition = 0',
    );
    expect(s$15.position, 0, reason: '<[a] / [b]>\n\'z\'\nstate.position = 0');
    final e$8 = s$15.getErrors().map((e) => '$e').toList()..sort();
    expect(e$8.length, 1, reason: '<[a] / [b]>\n\'z\'\nerror count');
    expect(e$8, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '<[a] / [b]>\n\'z\'\nerrors');
    final s$16 = State('z');
    final r$21 = r$13(s$16) as dynamic;
    expect(r$21, isNull, reason: '<[a] / [b]>\n\'z\'\nresult == null');
    expect(
      s$16.farthestPosition,
      0,
      reason: '<[a] / [b]>\n\'z\'\nstate.farthestPosition = 0',
    );
    expect(s$16.position, 0, reason: '<[a] / [b]>\n\'z\'\nstate.position = 0');
    final e$9 = s$16.getErrors().map((e) => '$e').toList()..sort();
    expect(e$9.length, 1, reason: '<[a] / [b]>\n\'z\'\nerror count');
    expect(e$9, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '<[a] / [b]>\n\'z\'\nerrors');
    final r$22 = parser.parseCapture3;
    final r$23 = parser.parseCaptureVoid3;
    final s$17 = State('ab');
    final r$24 = r$22(s$17) as dynamic;
    expect(
      r$24,
      isNotNull,
      reason: '[a]\n\$ = <[b] / [c]>\n\'ab\'\nresult != null',
    );
    expect(
      s$17.position,
      2,
      reason: '[a]\n\$ = <[b] / [c]>\n\'ab\'\nstate.position = 2',
    );
    expect(
      r$24.$1,
      'b',
      reason: '[a]\n\$ = <[b] / [c]>\n\'ab\'\nresult.\$1 != \'b\'',
    );
    final s$18 = State('ab');
    final r$25 = r$23(s$18) as dynamic;
    expect(
      r$25,
      isNotNull,
      reason: '[a]\n\$ = <[b] / [c]>\n\'ab\'\nresult != null',
    );
    expect(
      s$18.position,
      2,
      reason: '[a]\n\$ = <[b] / [c]>\n\'ab\'\nstate.position = 2',
    );
    expect(
      r$25.$1,
      null,
      reason: '[a]\n\$ = <[b] / [c]>\n\'ab\'\nresult.\$1 != null',
    );
    final s$19 = State('ac');
    final r$26 = r$22(s$19) as dynamic;
    expect(
      r$26,
      isNotNull,
      reason: '[a]\n\$ = <[b] / [c]>\n\'ac\'\nresult != null',
    );
    expect(
      s$19.position,
      2,
      reason: '[a]\n\$ = <[b] / [c]>\n\'ac\'\nstate.position = 2',
    );
    expect(
      r$26.$1,
      'c',
      reason: '[a]\n\$ = <[b] / [c]>\n\'ac\'\nresult.\$1 != \'c\'',
    );
    final s$20 = State('ac');
    final r$27 = r$23(s$20) as dynamic;
    expect(
      r$27,
      isNotNull,
      reason: '[a]\n\$ = <[b] / [c]>\n\'ac\'\nresult != null',
    );
    expect(
      s$20.position,
      2,
      reason: '[a]\n\$ = <[b] / [c]>\n\'ac\'\nstate.position = 2',
    );
    expect(
      r$27.$1,
      null,
      reason: '[a]\n\$ = <[b] / [c]>\n\'ac\'\nresult.\$1 != null',
    );
    final s$21 = State('');
    final r$28 = r$22(s$21) as dynamic;
    expect(r$28, isNull, reason: '[a]\n\$ = <[b] / [c]>\n\'\'\nresult == null');
    expect(
      s$21.farthestPosition,
      0,
      reason: '[a]\n\$ = <[b] / [c]>\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$21.position,
      0,
      reason: '[a]\n\$ = <[b] / [c]>\n\'\'\nstate.position = 0',
    );
    final e$10 = s$21.getErrors().map((e) => '$e').toList()..sort();
    expect(e$10.length, 1, reason: '[a]\n\$ = <[b] / [c]>\n\'\'\nerror count');
    expect(e$10, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[a]\n\$ = <[b] / [c]>\n\'\'\nerrors');
    final s$22 = State('');
    final r$29 = r$23(s$22) as dynamic;
    expect(r$29, isNull, reason: '[a]\n\$ = <[b] / [c]>\n\'\'\nresult == null');
    expect(
      s$22.farthestPosition,
      0,
      reason: '[a]\n\$ = <[b] / [c]>\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$22.position,
      0,
      reason: '[a]\n\$ = <[b] / [c]>\n\'\'\nstate.position = 0',
    );
    final e$11 = s$22.getErrors().map((e) => '$e').toList()..sort();
    expect(e$11.length, 1, reason: '[a]\n\$ = <[b] / [c]>\n\'\'\nerror count');
    expect(e$11, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[a]\n\$ = <[b] / [c]>\n\'\'\nerrors');
    final s$23 = State('a');
    final r$30 = r$22(s$23) as dynamic;
    expect(
      r$30,
      isNull,
      reason: '[a]\n\$ = <[b] / [c]>\n\'a\'\nresult == null',
    );
    expect(
      s$23.farthestPosition,
      1,
      reason: '[a]\n\$ = <[b] / [c]>\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      s$23.position,
      0,
      reason: '[a]\n\$ = <[b] / [c]>\n\'a\'\nstate.position = 0',
    );
    final e$12 = s$23.getErrors().map((e) => '$e').toList()..sort();
    expect(e$12.length, 1, reason: '[a]\n\$ = <[b] / [c]>\n\'a\'\nerror count');
    expect(e$12, [
      '(end: 1, message: Syntax error, start: 1)',
    ], reason: '[a]\n\$ = <[b] / [c]>\n\'a\'\nerrors');
    final s$24 = State('a');
    final r$31 = r$23(s$24) as dynamic;
    expect(
      r$31,
      isNull,
      reason: '[a]\n\$ = <[b] / [c]>\n\'a\'\nresult == null',
    );
    expect(
      s$24.farthestPosition,
      1,
      reason: '[a]\n\$ = <[b] / [c]>\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      s$24.position,
      0,
      reason: '[a]\n\$ = <[b] / [c]>\n\'a\'\nstate.position = 0',
    );
    final e$13 = s$24.getErrors().map((e) => '$e').toList()..sort();
    expect(e$13.length, 1, reason: '[a]\n\$ = <[b] / [c]>\n\'a\'\nerror count');
    expect(e$13, [
      '(end: 1, message: Syntax error, start: 1)',
    ], reason: '[a]\n\$ = <[b] / [c]>\n\'a\'\nerrors');
  });

  test('CharacterClass', () {
    final r$ = parser.parseCharacterClass0;
    final r$1 = parser.parseCharacterClassVoid0;
    final s$ = State('a');
    final r$2 = r$(s$) as dynamic;
    expect(r$2, isNotNull, reason: '[a]\n\'a\'\nresult != null');
    expect(s$.position, 1, reason: '[a]\n\'a\'\nstate.position = 1');
    expect(r$2.$1, 97, reason: '[a]\n\'a\'\nresult.\$1 != 97');
    final s$1 = State('a');
    final r$3 = r$1(s$1) as dynamic;
    expect(r$3, isNotNull, reason: '[a]\n\'a\'\nresult != null');
    expect(s$1.position, 1, reason: '[a]\n\'a\'\nstate.position = 1');
    expect(r$3.$1, null, reason: '[a]\n\'a\'\nresult.\$1 != null');
    final s$2 = State('');
    final r$4 = r$(s$2) as dynamic;
    expect(r$4, isNull, reason: '[a]\n\'\'\nresult == null');
    expect(
      s$2.farthestPosition,
      0,
      reason: '[a]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$2.position, 0, reason: '[a]\n\'\'\nstate.position = 0');
    final e$ = s$2.getErrors().map((e) => '$e').toList()..sort();
    expect(e$.length, 1, reason: '[a]\n\'\'\nerror count');
    expect(e$, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[a]\n\'\'\nerrors');
    final s$3 = State('');
    final r$5 = r$1(s$3) as dynamic;
    expect(r$5, isNull, reason: '[a]\n\'\'\nresult == null');
    expect(
      s$3.farthestPosition,
      0,
      reason: '[a]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$3.position, 0, reason: '[a]\n\'\'\nstate.position = 0');
    final e$1 = s$3.getErrors().map((e) => '$e').toList()..sort();
    expect(e$1.length, 1, reason: '[a]\n\'\'\nerror count');
    expect(e$1, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[a]\n\'\'\nerrors');
    final s$4 = State('z');
    final r$6 = r$(s$4) as dynamic;
    expect(r$6, isNull, reason: '[a]\n\'z\'\nresult == null');
    expect(
      s$4.farthestPosition,
      0,
      reason: '[a]\n\'z\'\nstate.farthestPosition = 0',
    );
    expect(s$4.position, 0, reason: '[a]\n\'z\'\nstate.position = 0');
    final e$2 = s$4.getErrors().map((e) => '$e').toList()..sort();
    expect(e$2.length, 1, reason: '[a]\n\'z\'\nerror count');
    expect(e$2, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[a]\n\'z\'\nerrors');
    final s$5 = State('z');
    final r$7 = r$1(s$5) as dynamic;
    expect(r$7, isNull, reason: '[a]\n\'z\'\nresult == null');
    expect(
      s$5.farthestPosition,
      0,
      reason: '[a]\n\'z\'\nstate.farthestPosition = 0',
    );
    expect(s$5.position, 0, reason: '[a]\n\'z\'\nstate.position = 0');
    final e$3 = s$5.getErrors().map((e) => '$e').toList()..sort();
    expect(e$3.length, 1, reason: '[a]\n\'z\'\nerror count');
    expect(e$3, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[a]\n\'z\'\nerrors');
    final r$8 = parser.parseCharacterClass1;
    final r$9 = parser.parseCharacterClassVoid1;
    final s$6 = State('a');
    final r$10 = r$8(s$6) as dynamic;
    expect(r$10, isNotNull, reason: '[a-z]\n\'a\'\nresult != null');
    expect(s$6.position, 1, reason: '[a-z]\n\'a\'\nstate.position = 1');
    expect(r$10.$1, 97, reason: '[a-z]\n\'a\'\nresult.\$1 != 97');
    final s$7 = State('a');
    final r$11 = r$9(s$7) as dynamic;
    expect(r$11, isNotNull, reason: '[a-z]\n\'a\'\nresult != null');
    expect(s$7.position, 1, reason: '[a-z]\n\'a\'\nstate.position = 1');
    expect(r$11.$1, null, reason: '[a-z]\n\'a\'\nresult.\$1 != null');
    final s$8 = State('z');
    final r$12 = r$8(s$8) as dynamic;
    expect(r$12, isNotNull, reason: '[a-z]\n\'z\'\nresult != null');
    expect(s$8.position, 1, reason: '[a-z]\n\'z\'\nstate.position = 1');
    expect(r$12.$1, 122, reason: '[a-z]\n\'z\'\nresult.\$1 != 122');
    final s$9 = State('z');
    final r$13 = r$9(s$9) as dynamic;
    expect(r$13, isNotNull, reason: '[a-z]\n\'z\'\nresult != null');
    expect(s$9.position, 1, reason: '[a-z]\n\'z\'\nstate.position = 1');
    expect(r$13.$1, null, reason: '[a-z]\n\'z\'\nresult.\$1 != null');
    final s$10 = State('');
    final r$14 = r$8(s$10) as dynamic;
    expect(r$14, isNull, reason: '[a-z]\n\'\'\nresult == null');
    expect(
      s$10.farthestPosition,
      0,
      reason: '[a-z]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$10.position, 0, reason: '[a-z]\n\'\'\nstate.position = 0');
    final e$4 = s$10.getErrors().map((e) => '$e').toList()..sort();
    expect(e$4.length, 1, reason: '[a-z]\n\'\'\nerror count');
    expect(e$4, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[a-z]\n\'\'\nerrors');
    final s$11 = State('');
    final r$15 = r$9(s$11) as dynamic;
    expect(r$15, isNull, reason: '[a-z]\n\'\'\nresult == null');
    expect(
      s$11.farthestPosition,
      0,
      reason: '[a-z]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$11.position, 0, reason: '[a-z]\n\'\'\nstate.position = 0');
    final e$5 = s$11.getErrors().map((e) => '$e').toList()..sort();
    expect(e$5.length, 1, reason: '[a-z]\n\'\'\nerror count');
    expect(e$5, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[a-z]\n\'\'\nerrors');
    final s$12 = State('!');
    final r$16 = r$8(s$12) as dynamic;
    expect(r$16, isNull, reason: '[a-z]\n\'!\'\nresult == null');
    expect(
      s$12.farthestPosition,
      0,
      reason: '[a-z]\n\'!\'\nstate.farthestPosition = 0',
    );
    expect(s$12.position, 0, reason: '[a-z]\n\'!\'\nstate.position = 0');
    final e$6 = s$12.getErrors().map((e) => '$e').toList()..sort();
    expect(e$6.length, 1, reason: '[a-z]\n\'!\'\nerror count');
    expect(e$6, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[a-z]\n\'!\'\nerrors');
    final s$13 = State('!');
    final r$17 = r$9(s$13) as dynamic;
    expect(r$17, isNull, reason: '[a-z]\n\'!\'\nresult == null');
    expect(
      s$13.farthestPosition,
      0,
      reason: '[a-z]\n\'!\'\nstate.farthestPosition = 0',
    );
    expect(s$13.position, 0, reason: '[a-z]\n\'!\'\nstate.position = 0');
    final e$7 = s$13.getErrors().map((e) => '$e').toList()..sort();
    expect(e$7.length, 1, reason: '[a-z]\n\'!\'\nerror count');
    expect(e$7, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[a-z]\n\'!\'\nerrors');
    final r$18 = parser.parseCharacterClass2;
    final r$19 = parser.parseCharacterClassVoid2;
    final s$14 = State('0');
    final r$20 = r$18(s$14) as dynamic;
    expect(r$20, isNotNull, reason: '[^a]\n\'0\'\nresult != null');
    expect(s$14.position, 1, reason: '[^a]\n\'0\'\nstate.position = 1');
    expect(r$20.$1, 48, reason: '[^a]\n\'0\'\nresult.\$1 != 48');
    final s$15 = State('0');
    final r$21 = r$19(s$15) as dynamic;
    expect(r$21, isNotNull, reason: '[^a]\n\'0\'\nresult != null');
    expect(s$15.position, 1, reason: '[^a]\n\'0\'\nstate.position = 1');
    expect(r$21.$1, null, reason: '[^a]\n\'0\'\nresult.\$1 != null');
    final s$16 = State('z');
    final r$22 = r$18(s$16) as dynamic;
    expect(r$22, isNotNull, reason: '[^a]\n\'z\'\nresult != null');
    expect(s$16.position, 1, reason: '[^a]\n\'z\'\nstate.position = 1');
    expect(r$22.$1, 122, reason: '[^a]\n\'z\'\nresult.\$1 != 122');
    final s$17 = State('z');
    final r$23 = r$19(s$17) as dynamic;
    expect(r$23, isNotNull, reason: '[^a]\n\'z\'\nresult != null');
    expect(s$17.position, 1, reason: '[^a]\n\'z\'\nstate.position = 1');
    expect(r$23.$1, null, reason: '[^a]\n\'z\'\nresult.\$1 != null');
    final s$18 = State('a');
    final r$24 = r$18(s$18) as dynamic;
    expect(r$24, isNull, reason: '[^a]\n\'a\'\nresult == null');
    expect(
      s$18.farthestPosition,
      0,
      reason: '[^a]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(s$18.position, 0, reason: '[^a]\n\'a\'\nstate.position = 0');
    final e$8 = s$18.getErrors().map((e) => '$e').toList()..sort();
    expect(e$8.length, 1, reason: '[^a]\n\'a\'\nerror count');
    expect(e$8, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^a]\n\'a\'\nerrors');
    final s$19 = State('a');
    final r$25 = r$19(s$19) as dynamic;
    expect(r$25, isNull, reason: '[^a]\n\'a\'\nresult == null');
    expect(
      s$19.farthestPosition,
      0,
      reason: '[^a]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(s$19.position, 0, reason: '[^a]\n\'a\'\nstate.position = 0');
    final e$9 = s$19.getErrors().map((e) => '$e').toList()..sort();
    expect(e$9.length, 1, reason: '[^a]\n\'a\'\nerror count');
    expect(e$9, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^a]\n\'a\'\nerrors');
    final s$20 = State('');
    final r$26 = r$18(s$20) as dynamic;
    expect(r$26, isNull, reason: '[^a]\n\'\'\nresult == null');
    expect(
      s$20.farthestPosition,
      0,
      reason: '[^a]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$20.position, 0, reason: '[^a]\n\'\'\nstate.position = 0');
    final e$10 = s$20.getErrors().map((e) => '$e').toList()..sort();
    expect(e$10.length, 1, reason: '[^a]\n\'\'\nerror count');
    expect(e$10, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^a]\n\'\'\nerrors');
    final s$21 = State('');
    final r$27 = r$19(s$21) as dynamic;
    expect(r$27, isNull, reason: '[^a]\n\'\'\nresult == null');
    expect(
      s$21.farthestPosition,
      0,
      reason: '[^a]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$21.position, 0, reason: '[^a]\n\'\'\nstate.position = 0');
    final e$11 = s$21.getErrors().map((e) => '$e').toList()..sort();
    expect(e$11.length, 1, reason: '[^a]\n\'\'\nerror count');
    expect(e$11, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^a]\n\'\'\nerrors');
    final r$28 = parser.parseCharacterClass3;
    final r$29 = parser.parseCharacterClassVoid3;
    final s$22 = State('0');
    final r$30 = r$28(s$22) as dynamic;
    expect(r$30, isNotNull, reason: '[^ab]\n\'0\'\nresult != null');
    expect(s$22.position, 1, reason: '[^ab]\n\'0\'\nstate.position = 1');
    expect(r$30.$1, 48, reason: '[^ab]\n\'0\'\nresult.\$1 != 48');
    final s$23 = State('0');
    final r$31 = r$29(s$23) as dynamic;
    expect(r$31, isNotNull, reason: '[^ab]\n\'0\'\nresult != null');
    expect(s$23.position, 1, reason: '[^ab]\n\'0\'\nstate.position = 1');
    expect(r$31.$1, null, reason: '[^ab]\n\'0\'\nresult.\$1 != null');
    final s$24 = State('z');
    final r$32 = r$28(s$24) as dynamic;
    expect(r$32, isNotNull, reason: '[^ab]\n\'z\'\nresult != null');
    expect(s$24.position, 1, reason: '[^ab]\n\'z\'\nstate.position = 1');
    expect(r$32.$1, 122, reason: '[^ab]\n\'z\'\nresult.\$1 != 122');
    final s$25 = State('z');
    final r$33 = r$29(s$25) as dynamic;
    expect(r$33, isNotNull, reason: '[^ab]\n\'z\'\nresult != null');
    expect(s$25.position, 1, reason: '[^ab]\n\'z\'\nstate.position = 1');
    expect(r$33.$1, null, reason: '[^ab]\n\'z\'\nresult.\$1 != null');
    final s$26 = State('a');
    final r$34 = r$28(s$26) as dynamic;
    expect(r$34, isNull, reason: '[^ab]\n\'a\'\nresult == null');
    expect(
      s$26.farthestPosition,
      0,
      reason: '[^ab]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(s$26.position, 0, reason: '[^ab]\n\'a\'\nstate.position = 0');
    final e$12 = s$26.getErrors().map((e) => '$e').toList()..sort();
    expect(e$12.length, 1, reason: '[^ab]\n\'a\'\nerror count');
    expect(e$12, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^ab]\n\'a\'\nerrors');
    final s$27 = State('a');
    final r$35 = r$29(s$27) as dynamic;
    expect(r$35, isNull, reason: '[^ab]\n\'a\'\nresult == null');
    expect(
      s$27.farthestPosition,
      0,
      reason: '[^ab]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(s$27.position, 0, reason: '[^ab]\n\'a\'\nstate.position = 0');
    final e$13 = s$27.getErrors().map((e) => '$e').toList()..sort();
    expect(e$13.length, 1, reason: '[^ab]\n\'a\'\nerror count');
    expect(e$13, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^ab]\n\'a\'\nerrors');
    final s$28 = State('b');
    final r$36 = r$28(s$28) as dynamic;
    expect(r$36, isNull, reason: '[^ab]\n\'b\'\nresult == null');
    expect(
      s$28.farthestPosition,
      0,
      reason: '[^ab]\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(s$28.position, 0, reason: '[^ab]\n\'b\'\nstate.position = 0');
    final e$14 = s$28.getErrors().map((e) => '$e').toList()..sort();
    expect(e$14.length, 1, reason: '[^ab]\n\'b\'\nerror count');
    expect(e$14, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^ab]\n\'b\'\nerrors');
    final s$29 = State('b');
    final r$37 = r$29(s$29) as dynamic;
    expect(r$37, isNull, reason: '[^ab]\n\'b\'\nresult == null');
    expect(
      s$29.farthestPosition,
      0,
      reason: '[^ab]\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(s$29.position, 0, reason: '[^ab]\n\'b\'\nstate.position = 0');
    final e$15 = s$29.getErrors().map((e) => '$e').toList()..sort();
    expect(e$15.length, 1, reason: '[^ab]\n\'b\'\nerror count');
    expect(e$15, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^ab]\n\'b\'\nerrors');
    final s$30 = State('');
    final r$38 = r$28(s$30) as dynamic;
    expect(r$38, isNull, reason: '[^ab]\n\'\'\nresult == null');
    expect(
      s$30.farthestPosition,
      0,
      reason: '[^ab]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$30.position, 0, reason: '[^ab]\n\'\'\nstate.position = 0');
    final e$16 = s$30.getErrors().map((e) => '$e').toList()..sort();
    expect(e$16.length, 1, reason: '[^ab]\n\'\'\nerror count');
    expect(e$16, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^ab]\n\'\'\nerrors');
    final s$31 = State('');
    final r$39 = r$29(s$31) as dynamic;
    expect(r$39, isNull, reason: '[^ab]\n\'\'\nresult == null');
    expect(
      s$31.farthestPosition,
      0,
      reason: '[^ab]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$31.position, 0, reason: '[^ab]\n\'\'\nstate.position = 0');
    final e$17 = s$31.getErrors().map((e) => '$e').toList()..sort();
    expect(e$17.length, 1, reason: '[^ab]\n\'\'\nerror count');
    expect(e$17, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^ab]\n\'\'\nerrors');
    final r$40 = parser.parseCharacterClass4;
    final r$41 = parser.parseCharacterClassVoid4;
    final s$32 = State('0');
    final r$42 = r$40(s$32) as dynamic;
    expect(r$42, isNotNull, reason: '[^abc]\n\'0\'\nresult != null');
    expect(s$32.position, 1, reason: '[^abc]\n\'0\'\nstate.position = 1');
    expect(r$42.$1, 48, reason: '[^abc]\n\'0\'\nresult.\$1 != 48');
    final s$33 = State('0');
    final r$43 = r$41(s$33) as dynamic;
    expect(r$43, isNotNull, reason: '[^abc]\n\'0\'\nresult != null');
    expect(s$33.position, 1, reason: '[^abc]\n\'0\'\nstate.position = 1');
    expect(r$43.$1, null, reason: '[^abc]\n\'0\'\nresult.\$1 != null');
    final s$34 = State('z');
    final r$44 = r$40(s$34) as dynamic;
    expect(r$44, isNotNull, reason: '[^abc]\n\'z\'\nresult != null');
    expect(s$34.position, 1, reason: '[^abc]\n\'z\'\nstate.position = 1');
    expect(r$44.$1, 122, reason: '[^abc]\n\'z\'\nresult.\$1 != 122');
    final s$35 = State('z');
    final r$45 = r$41(s$35) as dynamic;
    expect(r$45, isNotNull, reason: '[^abc]\n\'z\'\nresult != null');
    expect(s$35.position, 1, reason: '[^abc]\n\'z\'\nstate.position = 1');
    expect(r$45.$1, null, reason: '[^abc]\n\'z\'\nresult.\$1 != null');
    final s$36 = State('a');
    final r$46 = r$40(s$36) as dynamic;
    expect(r$46, isNull, reason: '[^abc]\n\'a\'\nresult == null');
    expect(
      s$36.farthestPosition,
      0,
      reason: '[^abc]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(s$36.position, 0, reason: '[^abc]\n\'a\'\nstate.position = 0');
    final e$18 = s$36.getErrors().map((e) => '$e').toList()..sort();
    expect(e$18.length, 1, reason: '[^abc]\n\'a\'\nerror count');
    expect(e$18, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^abc]\n\'a\'\nerrors');
    final s$37 = State('a');
    final r$47 = r$41(s$37) as dynamic;
    expect(r$47, isNull, reason: '[^abc]\n\'a\'\nresult == null');
    expect(
      s$37.farthestPosition,
      0,
      reason: '[^abc]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(s$37.position, 0, reason: '[^abc]\n\'a\'\nstate.position = 0');
    final e$19 = s$37.getErrors().map((e) => '$e').toList()..sort();
    expect(e$19.length, 1, reason: '[^abc]\n\'a\'\nerror count');
    expect(e$19, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^abc]\n\'a\'\nerrors');
    final s$38 = State('b');
    final r$48 = r$40(s$38) as dynamic;
    expect(r$48, isNull, reason: '[^abc]\n\'b\'\nresult == null');
    expect(
      s$38.farthestPosition,
      0,
      reason: '[^abc]\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(s$38.position, 0, reason: '[^abc]\n\'b\'\nstate.position = 0');
    final e$20 = s$38.getErrors().map((e) => '$e').toList()..sort();
    expect(e$20.length, 1, reason: '[^abc]\n\'b\'\nerror count');
    expect(e$20, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^abc]\n\'b\'\nerrors');
    final s$39 = State('b');
    final r$49 = r$41(s$39) as dynamic;
    expect(r$49, isNull, reason: '[^abc]\n\'b\'\nresult == null');
    expect(
      s$39.farthestPosition,
      0,
      reason: '[^abc]\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(s$39.position, 0, reason: '[^abc]\n\'b\'\nstate.position = 0');
    final e$21 = s$39.getErrors().map((e) => '$e').toList()..sort();
    expect(e$21.length, 1, reason: '[^abc]\n\'b\'\nerror count');
    expect(e$21, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^abc]\n\'b\'\nerrors');
    final s$40 = State('c');
    final r$50 = r$40(s$40) as dynamic;
    expect(r$50, isNull, reason: '[^abc]\n\'c\'\nresult == null');
    expect(
      s$40.farthestPosition,
      0,
      reason: '[^abc]\n\'c\'\nstate.farthestPosition = 0',
    );
    expect(s$40.position, 0, reason: '[^abc]\n\'c\'\nstate.position = 0');
    final e$22 = s$40.getErrors().map((e) => '$e').toList()..sort();
    expect(e$22.length, 1, reason: '[^abc]\n\'c\'\nerror count');
    expect(e$22, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^abc]\n\'c\'\nerrors');
    final s$41 = State('c');
    final r$51 = r$41(s$41) as dynamic;
    expect(r$51, isNull, reason: '[^abc]\n\'c\'\nresult == null');
    expect(
      s$41.farthestPosition,
      0,
      reason: '[^abc]\n\'c\'\nstate.farthestPosition = 0',
    );
    expect(s$41.position, 0, reason: '[^abc]\n\'c\'\nstate.position = 0');
    final e$23 = s$41.getErrors().map((e) => '$e').toList()..sort();
    expect(e$23.length, 1, reason: '[^abc]\n\'c\'\nerror count');
    expect(e$23, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^abc]\n\'c\'\nerrors');
    final s$42 = State('');
    final r$52 = r$40(s$42) as dynamic;
    expect(r$52, isNull, reason: '[^abc]\n\'\'\nresult == null');
    expect(
      s$42.farthestPosition,
      0,
      reason: '[^abc]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$42.position, 0, reason: '[^abc]\n\'\'\nstate.position = 0');
    final e$24 = s$42.getErrors().map((e) => '$e').toList()..sort();
    expect(e$24.length, 1, reason: '[^abc]\n\'\'\nerror count');
    expect(e$24, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^abc]\n\'\'\nerrors');
    final s$43 = State('');
    final r$53 = r$41(s$43) as dynamic;
    expect(r$53, isNull, reason: '[^abc]\n\'\'\nresult == null');
    expect(
      s$43.farthestPosition,
      0,
      reason: '[^abc]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$43.position, 0, reason: '[^abc]\n\'\'\nstate.position = 0');
    final e$25 = s$43.getErrors().map((e) => '$e').toList()..sort();
    expect(e$25.length, 1, reason: '[^abc]\n\'\'\nerror count');
    expect(e$25, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^abc]\n\'\'\nerrors');
    final r$54 = parser.parseCharacterClass5;
    final r$55 = parser.parseCharacterClassVoid5;
    final s$44 = State('0');
    final r$56 = r$54(s$44) as dynamic;
    expect(r$56, isNotNull, reason: '[^a-z]\n\'0\'\nresult != null');
    expect(s$44.position, 1, reason: '[^a-z]\n\'0\'\nstate.position = 1');
    expect(r$56.$1, 48, reason: '[^a-z]\n\'0\'\nresult.\$1 != 48');
    final s$45 = State('0');
    final r$57 = r$55(s$45) as dynamic;
    expect(r$57, isNotNull, reason: '[^a-z]\n\'0\'\nresult != null');
    expect(s$45.position, 1, reason: '[^a-z]\n\'0\'\nstate.position = 1');
    expect(r$57.$1, null, reason: '[^a-z]\n\'0\'\nresult.\$1 != null');
    final s$46 = State('');
    final r$58 = r$54(s$46) as dynamic;
    expect(r$58, isNull, reason: '[^a-z]\n\'\'\nresult == null');
    expect(
      s$46.farthestPosition,
      0,
      reason: '[^a-z]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$46.position, 0, reason: '[^a-z]\n\'\'\nstate.position = 0');
    final e$26 = s$46.getErrors().map((e) => '$e').toList()..sort();
    expect(e$26.length, 1, reason: '[^a-z]\n\'\'\nerror count');
    expect(e$26, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^a-z]\n\'\'\nerrors');
    final s$47 = State('');
    final r$59 = r$55(s$47) as dynamic;
    expect(r$59, isNull, reason: '[^a-z]\n\'\'\nresult == null');
    expect(
      s$47.farthestPosition,
      0,
      reason: '[^a-z]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$47.position, 0, reason: '[^a-z]\n\'\'\nstate.position = 0');
    final e$27 = s$47.getErrors().map((e) => '$e').toList()..sort();
    expect(e$27.length, 1, reason: '[^a-z]\n\'\'\nerror count');
    expect(e$27, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^a-z]\n\'\'\nerrors');
    final s$48 = State('a');
    final r$60 = r$54(s$48) as dynamic;
    expect(r$60, isNull, reason: '[^a-z]\n\'a\'\nresult == null');
    expect(
      s$48.farthestPosition,
      0,
      reason: '[^a-z]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(s$48.position, 0, reason: '[^a-z]\n\'a\'\nstate.position = 0');
    final e$28 = s$48.getErrors().map((e) => '$e').toList()..sort();
    expect(e$28.length, 1, reason: '[^a-z]\n\'a\'\nerror count');
    expect(e$28, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^a-z]\n\'a\'\nerrors');
    final s$49 = State('a');
    final r$61 = r$55(s$49) as dynamic;
    expect(r$61, isNull, reason: '[^a-z]\n\'a\'\nresult == null');
    expect(
      s$49.farthestPosition,
      0,
      reason: '[^a-z]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(s$49.position, 0, reason: '[^a-z]\n\'a\'\nstate.position = 0');
    final e$29 = s$49.getErrors().map((e) => '$e').toList()..sort();
    expect(e$29.length, 1, reason: '[^a-z]\n\'a\'\nerror count');
    expect(e$29, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^a-z]\n\'a\'\nerrors');
    final s$50 = State('z');
    final r$62 = r$54(s$50) as dynamic;
    expect(r$62, isNull, reason: '[^a-z]\n\'z\'\nresult == null');
    expect(
      s$50.farthestPosition,
      0,
      reason: '[^a-z]\n\'z\'\nstate.farthestPosition = 0',
    );
    expect(s$50.position, 0, reason: '[^a-z]\n\'z\'\nstate.position = 0');
    final e$30 = s$50.getErrors().map((e) => '$e').toList()..sort();
    expect(e$30.length, 1, reason: '[^a-z]\n\'z\'\nerror count');
    expect(e$30, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^a-z]\n\'z\'\nerrors');
    final s$51 = State('z');
    final r$63 = r$55(s$51) as dynamic;
    expect(r$63, isNull, reason: '[^a-z]\n\'z\'\nresult == null');
    expect(
      s$51.farthestPosition,
      0,
      reason: '[^a-z]\n\'z\'\nstate.farthestPosition = 0',
    );
    expect(s$51.position, 0, reason: '[^a-z]\n\'z\'\nstate.position = 0');
    final e$31 = s$51.getErrors().map((e) => '$e').toList()..sort();
    expect(e$31.length, 1, reason: '[^a-z]\n\'z\'\nerror count');
    expect(e$31, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^a-z]\n\'z\'\nerrors');
    final r$64 = parser.parseCharacterClass6;
    final r$65 = parser.parseCharacterClassVoid6;
    final s$52 = State('^');
    final r$66 = r$64(s$52) as dynamic;
    expect(r$66, isNotNull, reason: '[\\^]\n\'^\'\nresult != null');
    expect(s$52.position, 1, reason: '[\\^]\n\'^\'\nstate.position = 1');
    expect(r$66.$1, 94, reason: '[\\^]\n\'^\'\nresult.\$1 != 94');
    final s$53 = State('^');
    final r$67 = r$65(s$53) as dynamic;
    expect(r$67, isNotNull, reason: '[\\^]\n\'^\'\nresult != null');
    expect(s$53.position, 1, reason: '[\\^]\n\'^\'\nstate.position = 1');
    expect(r$67.$1, null, reason: '[\\^]\n\'^\'\nresult.\$1 != null');
    final s$54 = State('');
    final r$68 = r$64(s$54) as dynamic;
    expect(r$68, isNull, reason: '[\\^]\n\'\'\nresult == null');
    expect(
      s$54.farthestPosition,
      0,
      reason: '[\\^]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$54.position, 0, reason: '[\\^]\n\'\'\nstate.position = 0');
    final e$32 = s$54.getErrors().map((e) => '$e').toList()..sort();
    expect(e$32.length, 1, reason: '[\\^]\n\'\'\nerror count');
    expect(e$32, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[\\^]\n\'\'\nerrors');
    final s$55 = State('');
    final r$69 = r$65(s$55) as dynamic;
    expect(r$69, isNull, reason: '[\\^]\n\'\'\nresult == null');
    expect(
      s$55.farthestPosition,
      0,
      reason: '[\\^]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$55.position, 0, reason: '[\\^]\n\'\'\nstate.position = 0');
    final e$33 = s$55.getErrors().map((e) => '$e').toList()..sort();
    expect(e$33.length, 1, reason: '[\\^]\n\'\'\nerror count');
    expect(e$33, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[\\^]\n\'\'\nerrors');
    final s$56 = State('a');
    final r$70 = r$64(s$56) as dynamic;
    expect(r$70, isNull, reason: '[\\^]\n\'a\'\nresult == null');
    expect(
      s$56.farthestPosition,
      0,
      reason: '[\\^]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(s$56.position, 0, reason: '[\\^]\n\'a\'\nstate.position = 0');
    final e$34 = s$56.getErrors().map((e) => '$e').toList()..sort();
    expect(e$34.length, 1, reason: '[\\^]\n\'a\'\nerror count');
    expect(e$34, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[\\^]\n\'a\'\nerrors');
    final s$57 = State('a');
    final r$71 = r$65(s$57) as dynamic;
    expect(r$71, isNull, reason: '[\\^]\n\'a\'\nresult == null');
    expect(
      s$57.farthestPosition,
      0,
      reason: '[\\^]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(s$57.position, 0, reason: '[\\^]\n\'a\'\nstate.position = 0');
    final e$35 = s$57.getErrors().map((e) => '$e').toList()..sort();
    expect(e$35.length, 1, reason: '[\\^]\n\'a\'\nerror count');
    expect(e$35, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[\\^]\n\'a\'\nerrors');
    final r$72 = parser.parseCharacterClass7;
    final r$73 = parser.parseCharacterClassVoid7;
    final s$58 = State('-');
    final r$74 = r$72(s$58) as dynamic;
    expect(r$74, isNotNull, reason: '[\\-]\n\'-\'\nresult != null');
    expect(s$58.position, 1, reason: '[\\-]\n\'-\'\nstate.position = 1');
    expect(r$74.$1, 45, reason: '[\\-]\n\'-\'\nresult.\$1 != 45');
    final s$59 = State('-');
    final r$75 = r$73(s$59) as dynamic;
    expect(r$75, isNotNull, reason: '[\\-]\n\'-\'\nresult != null');
    expect(s$59.position, 1, reason: '[\\-]\n\'-\'\nstate.position = 1');
    expect(r$75.$1, null, reason: '[\\-]\n\'-\'\nresult.\$1 != null');
    final s$60 = State('');
    final r$76 = r$72(s$60) as dynamic;
    expect(r$76, isNull, reason: '[\\-]\n\'\'\nresult == null');
    expect(
      s$60.farthestPosition,
      0,
      reason: '[\\-]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$60.position, 0, reason: '[\\-]\n\'\'\nstate.position = 0');
    final e$36 = s$60.getErrors().map((e) => '$e').toList()..sort();
    expect(e$36.length, 1, reason: '[\\-]\n\'\'\nerror count');
    expect(e$36, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[\\-]\n\'\'\nerrors');
    final s$61 = State('');
    final r$77 = r$73(s$61) as dynamic;
    expect(r$77, isNull, reason: '[\\-]\n\'\'\nresult == null');
    expect(
      s$61.farthestPosition,
      0,
      reason: '[\\-]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$61.position, 0, reason: '[\\-]\n\'\'\nstate.position = 0');
    final e$37 = s$61.getErrors().map((e) => '$e').toList()..sort();
    expect(e$37.length, 1, reason: '[\\-]\n\'\'\nerror count');
    expect(e$37, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[\\-]\n\'\'\nerrors');
    final s$62 = State('a');
    final r$78 = r$72(s$62) as dynamic;
    expect(r$78, isNull, reason: '[\\-]\n\'a\'\nresult == null');
    expect(
      s$62.farthestPosition,
      0,
      reason: '[\\-]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(s$62.position, 0, reason: '[\\-]\n\'a\'\nstate.position = 0');
    final e$38 = s$62.getErrors().map((e) => '$e').toList()..sort();
    expect(e$38.length, 1, reason: '[\\-]\n\'a\'\nerror count');
    expect(e$38, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[\\-]\n\'a\'\nerrors');
    final s$63 = State('a');
    final r$79 = r$73(s$63) as dynamic;
    expect(r$79, isNull, reason: '[\\-]\n\'a\'\nresult == null');
    expect(
      s$63.farthestPosition,
      0,
      reason: '[\\-]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(s$63.position, 0, reason: '[\\-]\n\'a\'\nstate.position = 0');
    final e$39 = s$63.getErrors().map((e) => '$e').toList()..sort();
    expect(e$39.length, 1, reason: '[\\-]\n\'a\'\nerror count');
    expect(e$39, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[\\-]\n\'a\'\nerrors');
    final r$80 = parser.parseCharacterClass8;
    final r$81 = parser.parseCharacterClassVoid8;
    final s$64 = State(' ');
    final r$82 = r$80(s$64) as dynamic;
    expect(r$82, isNotNull, reason: '[\\u{20}]\n\' \'\nresult != null');
    expect(s$64.position, 1, reason: '[\\u{20}]\n\' \'\nstate.position = 1');
    expect(r$82.$1, 32, reason: '[\\u{20}]\n\' \'\nresult.\$1 != 32');
    final s$65 = State(' ');
    final r$83 = r$81(s$65) as dynamic;
    expect(r$83, isNotNull, reason: '[\\u{20}]\n\' \'\nresult != null');
    expect(s$65.position, 1, reason: '[\\u{20}]\n\' \'\nstate.position = 1');
    expect(r$83.$1, null, reason: '[\\u{20}]\n\' \'\nresult.\$1 != null');
    final s$66 = State('');
    final r$84 = r$80(s$66) as dynamic;
    expect(r$84, isNull, reason: '[\\u{20}]\n\'\'\nresult == null');
    expect(
      s$66.farthestPosition,
      0,
      reason: '[\\u{20}]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$66.position, 0, reason: '[\\u{20}]\n\'\'\nstate.position = 0');
    final e$40 = s$66.getErrors().map((e) => '$e').toList()..sort();
    expect(e$40.length, 1, reason: '[\\u{20}]\n\'\'\nerror count');
    expect(e$40, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[\\u{20}]\n\'\'\nerrors');
    final s$67 = State('');
    final r$85 = r$81(s$67) as dynamic;
    expect(r$85, isNull, reason: '[\\u{20}]\n\'\'\nresult == null');
    expect(
      s$67.farthestPosition,
      0,
      reason: '[\\u{20}]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$67.position, 0, reason: '[\\u{20}]\n\'\'\nstate.position = 0');
    final e$41 = s$67.getErrors().map((e) => '$e').toList()..sort();
    expect(e$41.length, 1, reason: '[\\u{20}]\n\'\'\nerror count');
    expect(e$41, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[\\u{20}]\n\'\'\nerrors');
    final s$68 = State('a');
    final r$86 = r$80(s$68) as dynamic;
    expect(r$86, isNull, reason: '[\\u{20}]\n\'a\'\nresult == null');
    expect(
      s$68.farthestPosition,
      0,
      reason: '[\\u{20}]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(s$68.position, 0, reason: '[\\u{20}]\n\'a\'\nstate.position = 0');
    final e$42 = s$68.getErrors().map((e) => '$e').toList()..sort();
    expect(e$42.length, 1, reason: '[\\u{20}]\n\'a\'\nerror count');
    expect(e$42, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[\\u{20}]\n\'a\'\nerrors');
    final s$69 = State('a');
    final r$87 = r$81(s$69) as dynamic;
    expect(r$87, isNull, reason: '[\\u{20}]\n\'a\'\nresult == null');
    expect(
      s$69.farthestPosition,
      0,
      reason: '[\\u{20}]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(s$69.position, 0, reason: '[\\u{20}]\n\'a\'\nstate.position = 0');
    final e$43 = s$69.getErrors().map((e) => '$e').toList()..sort();
    expect(e$43.length, 1, reason: '[\\u{20}]\n\'a\'\nerror count');
    expect(e$43, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[\\u{20}]\n\'a\'\nerrors');
    final r$88 = parser.parseCharacterClass9;
    final r$89 = parser.parseCharacterClassVoid9;
    final s$70 = State('0');
    final r$90 = r$88(s$70) as dynamic;
    expect(r$90, isNotNull, reason: '[\\u{30}-\\u{39}]\n\'0\'\nresult != null');
    expect(
      s$70.position,
      1,
      reason: '[\\u{30}-\\u{39}]\n\'0\'\nstate.position = 1',
    );
    expect(r$90.$1, 48, reason: '[\\u{30}-\\u{39}]\n\'0\'\nresult.\$1 != 48');
    final s$71 = State('0');
    final r$91 = r$89(s$71) as dynamic;
    expect(r$91, isNotNull, reason: '[\\u{30}-\\u{39}]\n\'0\'\nresult != null');
    expect(
      s$71.position,
      1,
      reason: '[\\u{30}-\\u{39}]\n\'0\'\nstate.position = 1',
    );
    expect(
      r$91.$1,
      null,
      reason: '[\\u{30}-\\u{39}]\n\'0\'\nresult.\$1 != null',
    );
    final s$72 = State('9');
    final r$92 = r$88(s$72) as dynamic;
    expect(r$92, isNotNull, reason: '[\\u{30}-\\u{39}]\n\'9\'\nresult != null');
    expect(
      s$72.position,
      1,
      reason: '[\\u{30}-\\u{39}]\n\'9\'\nstate.position = 1',
    );
    expect(r$92.$1, 57, reason: '[\\u{30}-\\u{39}]\n\'9\'\nresult.\$1 != 57');
    final s$73 = State('9');
    final r$93 = r$89(s$73) as dynamic;
    expect(r$93, isNotNull, reason: '[\\u{30}-\\u{39}]\n\'9\'\nresult != null');
    expect(
      s$73.position,
      1,
      reason: '[\\u{30}-\\u{39}]\n\'9\'\nstate.position = 1',
    );
    expect(
      r$93.$1,
      null,
      reason: '[\\u{30}-\\u{39}]\n\'9\'\nresult.\$1 != null',
    );
    final s$74 = State('');
    final r$94 = r$88(s$74) as dynamic;
    expect(r$94, isNull, reason: '[\\u{30}-\\u{39}]\n\'\'\nresult == null');
    expect(
      s$74.farthestPosition,
      0,
      reason: '[\\u{30}-\\u{39}]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$74.position,
      0,
      reason: '[\\u{30}-\\u{39}]\n\'\'\nstate.position = 0',
    );
    final e$44 = s$74.getErrors().map((e) => '$e').toList()..sort();
    expect(e$44.length, 1, reason: '[\\u{30}-\\u{39}]\n\'\'\nerror count');
    expect(e$44, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[\\u{30}-\\u{39}]\n\'\'\nerrors');
    final s$75 = State('');
    final r$95 = r$89(s$75) as dynamic;
    expect(r$95, isNull, reason: '[\\u{30}-\\u{39}]\n\'\'\nresult == null');
    expect(
      s$75.farthestPosition,
      0,
      reason: '[\\u{30}-\\u{39}]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$75.position,
      0,
      reason: '[\\u{30}-\\u{39}]\n\'\'\nstate.position = 0',
    );
    final e$45 = s$75.getErrors().map((e) => '$e').toList()..sort();
    expect(e$45.length, 1, reason: '[\\u{30}-\\u{39}]\n\'\'\nerror count');
    expect(e$45, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[\\u{30}-\\u{39}]\n\'\'\nerrors');
    final s$76 = State('a');
    final r$96 = r$88(s$76) as dynamic;
    expect(r$96, isNull, reason: '[\\u{30}-\\u{39}]\n\'a\'\nresult == null');
    expect(
      s$76.farthestPosition,
      0,
      reason: '[\\u{30}-\\u{39}]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(
      s$76.position,
      0,
      reason: '[\\u{30}-\\u{39}]\n\'a\'\nstate.position = 0',
    );
    final e$46 = s$76.getErrors().map((e) => '$e').toList()..sort();
    expect(e$46.length, 1, reason: '[\\u{30}-\\u{39}]\n\'a\'\nerror count');
    expect(e$46, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[\\u{30}-\\u{39}]\n\'a\'\nerrors');
    final s$77 = State('a');
    final r$97 = r$89(s$77) as dynamic;
    expect(r$97, isNull, reason: '[\\u{30}-\\u{39}]\n\'a\'\nresult == null');
    expect(
      s$77.farthestPosition,
      0,
      reason: '[\\u{30}-\\u{39}]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(
      s$77.position,
      0,
      reason: '[\\u{30}-\\u{39}]\n\'a\'\nstate.position = 0',
    );
    final e$47 = s$77.getErrors().map((e) => '$e').toList()..sort();
    expect(e$47.length, 1, reason: '[\\u{30}-\\u{39}]\n\'a\'\nerror count');
    expect(e$47, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[\\u{30}-\\u{39}]\n\'a\'\nerrors');
    final r$98 = parser.parseCharacterClass10;
    final r$99 = parser.parseCharacterClassVoid10;
    final s$78 = State(' ');
    final r$100 = r$98(s$78) as dynamic;
    expect(r$100, isNotNull, reason: '[\\u{0}]\n\' \'\nresult != null');
    expect(s$78.position, 1, reason: '[\\u{0}]\n\' \'\nstate.position = 1');
    expect(r$100.$1, 0, reason: '[\\u{0}]\n\' \'\nresult.\$1 != 0');
    final s$79 = State(' ');
    final r$101 = r$99(s$79) as dynamic;
    expect(r$101, isNotNull, reason: '[\\u{0}]\n\' \'\nresult != null');
    expect(s$79.position, 1, reason: '[\\u{0}]\n\' \'\nstate.position = 1');
    expect(r$101.$1, null, reason: '[\\u{0}]\n\' \'\nresult.\$1 != null');
    final s$80 = State('');
    final r$102 = r$98(s$80) as dynamic;
    expect(r$102, isNull, reason: '[\\u{0}]\n\'\'\nresult == null');
    expect(
      s$80.farthestPosition,
      0,
      reason: '[\\u{0}]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$80.position, 0, reason: '[\\u{0}]\n\'\'\nstate.position = 0');
    final e$48 = s$80.getErrors().map((e) => '$e').toList()..sort();
    expect(e$48.length, 1, reason: '[\\u{0}]\n\'\'\nerror count');
    expect(e$48, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[\\u{0}]\n\'\'\nerrors');
    final s$81 = State('');
    final r$103 = r$99(s$81) as dynamic;
    expect(r$103, isNull, reason: '[\\u{0}]\n\'\'\nresult == null');
    expect(
      s$81.farthestPosition,
      0,
      reason: '[\\u{0}]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$81.position, 0, reason: '[\\u{0}]\n\'\'\nstate.position = 0');
    final e$49 = s$81.getErrors().map((e) => '$e').toList()..sort();
    expect(e$49.length, 1, reason: '[\\u{0}]\n\'\'\nerror count');
    expect(e$49, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[\\u{0}]\n\'\'\nerrors');
    final s$82 = State('a');
    final r$104 = r$98(s$82) as dynamic;
    expect(r$104, isNull, reason: '[\\u{0}]\n\'a\'\nresult == null');
    expect(
      s$82.farthestPosition,
      0,
      reason: '[\\u{0}]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(s$82.position, 0, reason: '[\\u{0}]\n\'a\'\nstate.position = 0');
    final e$50 = s$82.getErrors().map((e) => '$e').toList()..sort();
    expect(e$50.length, 1, reason: '[\\u{0}]\n\'a\'\nerror count');
    expect(e$50, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[\\u{0}]\n\'a\'\nerrors');
    final s$83 = State('a');
    final r$105 = r$99(s$83) as dynamic;
    expect(r$105, isNull, reason: '[\\u{0}]\n\'a\'\nresult == null');
    expect(
      s$83.farthestPosition,
      0,
      reason: '[\\u{0}]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(s$83.position, 0, reason: '[\\u{0}]\n\'a\'\nstate.position = 0');
    final e$51 = s$83.getErrors().map((e) => '$e').toList()..sort();
    expect(e$51.length, 1, reason: '[\\u{0}]\n\'a\'\nerror count');
    expect(e$51, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[\\u{0}]\n\'a\'\nerrors');
    final r$106 = parser.parseCharacterClass11;
    final r$107 = parser.parseCharacterClassVoid11;
    final s$84 = State(' ');
    final r$108 = r$106(s$84) as dynamic;
    expect(r$108, isNotNull, reason: '[\\u{0}-\\u{9}]\n\' \'\nresult != null');
    expect(
      s$84.position,
      1,
      reason: '[\\u{0}-\\u{9}]\n\' \'\nstate.position = 1',
    );
    expect(r$108.$1, 0, reason: '[\\u{0}-\\u{9}]\n\' \'\nresult.\$1 != 0');
    final s$85 = State(' ');
    final r$109 = r$107(s$85) as dynamic;
    expect(r$109, isNotNull, reason: '[\\u{0}-\\u{9}]\n\' \'\nresult != null');
    expect(
      s$85.position,
      1,
      reason: '[\\u{0}-\\u{9}]\n\' \'\nstate.position = 1',
    );
    expect(
      r$109.$1,
      null,
      reason: '[\\u{0}-\\u{9}]\n\' \'\nresult.\$1 != null',
    );
    final s$86 = State('\t');
    final r$110 = r$106(s$86) as dynamic;
    expect(
      r$110,
      isNotNull,
      reason: '[\\u{0}-\\u{9}]\n\'\\t\'\nresult != null',
    );
    expect(
      s$86.position,
      1,
      reason: '[\\u{0}-\\u{9}]\n\'\\t\'\nstate.position = 1',
    );
    expect(r$110.$1, 9, reason: '[\\u{0}-\\u{9}]\n\'\\t\'\nresult.\$1 != 9');
    final s$87 = State('\t');
    final r$111 = r$107(s$87) as dynamic;
    expect(
      r$111,
      isNotNull,
      reason: '[\\u{0}-\\u{9}]\n\'\\t\'\nresult != null',
    );
    expect(
      s$87.position,
      1,
      reason: '[\\u{0}-\\u{9}]\n\'\\t\'\nstate.position = 1',
    );
    expect(
      r$111.$1,
      null,
      reason: '[\\u{0}-\\u{9}]\n\'\\t\'\nresult.\$1 != null',
    );
    final s$88 = State('');
    final r$112 = r$106(s$88) as dynamic;
    expect(r$112, isNull, reason: '[\\u{0}-\\u{9}]\n\'\'\nresult == null');
    expect(
      s$88.farthestPosition,
      0,
      reason: '[\\u{0}-\\u{9}]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$88.position,
      0,
      reason: '[\\u{0}-\\u{9}]\n\'\'\nstate.position = 0',
    );
    final e$52 = s$88.getErrors().map((e) => '$e').toList()..sort();
    expect(e$52.length, 1, reason: '[\\u{0}-\\u{9}]\n\'\'\nerror count');
    expect(e$52, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[\\u{0}-\\u{9}]\n\'\'\nerrors');
    final s$89 = State('');
    final r$113 = r$107(s$89) as dynamic;
    expect(r$113, isNull, reason: '[\\u{0}-\\u{9}]\n\'\'\nresult == null');
    expect(
      s$89.farthestPosition,
      0,
      reason: '[\\u{0}-\\u{9}]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$89.position,
      0,
      reason: '[\\u{0}-\\u{9}]\n\'\'\nstate.position = 0',
    );
    final e$53 = s$89.getErrors().map((e) => '$e').toList()..sort();
    expect(e$53.length, 1, reason: '[\\u{0}-\\u{9}]\n\'\'\nerror count');
    expect(e$53, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[\\u{0}-\\u{9}]\n\'\'\nerrors');
    final s$90 = State('a');
    final r$114 = r$106(s$90) as dynamic;
    expect(r$114, isNull, reason: '[\\u{0}-\\u{9}]\n\'a\'\nresult == null');
    expect(
      s$90.farthestPosition,
      0,
      reason: '[\\u{0}-\\u{9}]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(
      s$90.position,
      0,
      reason: '[\\u{0}-\\u{9}]\n\'a\'\nstate.position = 0',
    );
    final e$54 = s$90.getErrors().map((e) => '$e').toList()..sort();
    expect(e$54.length, 1, reason: '[\\u{0}-\\u{9}]\n\'a\'\nerror count');
    expect(e$54, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[\\u{0}-\\u{9}]\n\'a\'\nerrors');
    final s$91 = State('a');
    final r$115 = r$107(s$91) as dynamic;
    expect(r$115, isNull, reason: '[\\u{0}-\\u{9}]\n\'a\'\nresult == null');
    expect(
      s$91.farthestPosition,
      0,
      reason: '[\\u{0}-\\u{9}]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(
      s$91.position,
      0,
      reason: '[\\u{0}-\\u{9}]\n\'a\'\nstate.position = 0',
    );
    final e$55 = s$91.getErrors().map((e) => '$e').toList()..sort();
    expect(e$55.length, 1, reason: '[\\u{0}-\\u{9}]\n\'a\'\nerror count');
    expect(e$55, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[\\u{0}-\\u{9}]\n\'a\'\nerrors');
    final r$116 = parser.parseCharacterClass12;
    final r$117 = parser.parseCharacterClassVoid12;
    final s$92 = State('a');
    final r$118 = r$116(s$92) as dynamic;
    expect(r$118, isNotNull, reason: '[^\\u{0}]\n\'a\'\nresult != null');
    expect(s$92.position, 1, reason: '[^\\u{0}]\n\'a\'\nstate.position = 1');
    expect(r$118.$1, 97, reason: '[^\\u{0}]\n\'a\'\nresult.\$1 != 97');
    final s$93 = State('a');
    final r$119 = r$117(s$93) as dynamic;
    expect(r$119, isNotNull, reason: '[^\\u{0}]\n\'a\'\nresult != null');
    expect(s$93.position, 1, reason: '[^\\u{0}]\n\'a\'\nstate.position = 1');
    expect(r$119.$1, null, reason: '[^\\u{0}]\n\'a\'\nresult.\$1 != null');
    final s$94 = State('');
    final r$120 = r$116(s$94) as dynamic;
    expect(r$120, isNull, reason: '[^\\u{0}]\n\'\'\nresult == null');
    expect(
      s$94.farthestPosition,
      0,
      reason: '[^\\u{0}]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$94.position, 0, reason: '[^\\u{0}]\n\'\'\nstate.position = 0');
    final e$56 = s$94.getErrors().map((e) => '$e').toList()..sort();
    expect(e$56.length, 1, reason: '[^\\u{0}]\n\'\'\nerror count');
    expect(e$56, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^\\u{0}]\n\'\'\nerrors');
    final s$95 = State('');
    final r$121 = r$117(s$95) as dynamic;
    expect(r$121, isNull, reason: '[^\\u{0}]\n\'\'\nresult == null');
    expect(
      s$95.farthestPosition,
      0,
      reason: '[^\\u{0}]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$95.position, 0, reason: '[^\\u{0}]\n\'\'\nstate.position = 0');
    final e$57 = s$95.getErrors().map((e) => '$e').toList()..sort();
    expect(e$57.length, 1, reason: '[^\\u{0}]\n\'\'\nerror count');
    expect(e$57, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^\\u{0}]\n\'\'\nerrors');
    final s$96 = State(' ');
    final r$122 = r$116(s$96) as dynamic;
    expect(r$122, isNull, reason: '[^\\u{0}]\n\' \'\nresult == null');
    expect(
      s$96.farthestPosition,
      0,
      reason: '[^\\u{0}]\n\' \'\nstate.farthestPosition = 0',
    );
    expect(s$96.position, 0, reason: '[^\\u{0}]\n\' \'\nstate.position = 0');
    final e$58 = s$96.getErrors().map((e) => '$e').toList()..sort();
    expect(e$58.length, 1, reason: '[^\\u{0}]\n\' \'\nerror count');
    expect(e$58, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^\\u{0}]\n\' \'\nerrors');
    final s$97 = State(' ');
    final r$123 = r$117(s$97) as dynamic;
    expect(r$123, isNull, reason: '[^\\u{0}]\n\' \'\nresult == null');
    expect(
      s$97.farthestPosition,
      0,
      reason: '[^\\u{0}]\n\' \'\nstate.farthestPosition = 0',
    );
    expect(s$97.position, 0, reason: '[^\\u{0}]\n\' \'\nstate.position = 0');
    final e$59 = s$97.getErrors().map((e) => '$e').toList()..sort();
    expect(e$59.length, 1, reason: '[^\\u{0}]\n\' \'\nerror count');
    expect(e$59, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^\\u{0}]\n\' \'\nerrors');
    final r$124 = parser.parseCharacterClass13;
    final r$125 = parser.parseCharacterClassVoid13;
    final s$98 = State('a');
    final r$126 = r$124(s$98) as dynamic;
    expect(r$126, isNotNull, reason: '[^\\u{0}-\\u{9}]\n\'a\'\nresult != null');
    expect(
      s$98.position,
      1,
      reason: '[^\\u{0}-\\u{9}]\n\'a\'\nstate.position = 1',
    );
    expect(r$126.$1, 97, reason: '[^\\u{0}-\\u{9}]\n\'a\'\nresult.\$1 != 97');
    final s$99 = State('a');
    final r$127 = r$125(s$99) as dynamic;
    expect(r$127, isNotNull, reason: '[^\\u{0}-\\u{9}]\n\'a\'\nresult != null');
    expect(
      s$99.position,
      1,
      reason: '[^\\u{0}-\\u{9}]\n\'a\'\nstate.position = 1',
    );
    expect(
      r$127.$1,
      null,
      reason: '[^\\u{0}-\\u{9}]\n\'a\'\nresult.\$1 != null',
    );
    final s$100 = State('');
    final r$128 = r$124(s$100) as dynamic;
    expect(r$128, isNull, reason: '[^\\u{0}-\\u{9}]\n\'\'\nresult == null');
    expect(
      s$100.farthestPosition,
      0,
      reason: '[^\\u{0}-\\u{9}]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$100.position,
      0,
      reason: '[^\\u{0}-\\u{9}]\n\'\'\nstate.position = 0',
    );
    final e$60 = s$100.getErrors().map((e) => '$e').toList()..sort();
    expect(e$60.length, 1, reason: '[^\\u{0}-\\u{9}]\n\'\'\nerror count');
    expect(e$60, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^\\u{0}-\\u{9}]\n\'\'\nerrors');
    final s$101 = State('');
    final r$129 = r$125(s$101) as dynamic;
    expect(r$129, isNull, reason: '[^\\u{0}-\\u{9}]\n\'\'\nresult == null');
    expect(
      s$101.farthestPosition,
      0,
      reason: '[^\\u{0}-\\u{9}]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$101.position,
      0,
      reason: '[^\\u{0}-\\u{9}]\n\'\'\nstate.position = 0',
    );
    final e$61 = s$101.getErrors().map((e) => '$e').toList()..sort();
    expect(e$61.length, 1, reason: '[^\\u{0}-\\u{9}]\n\'\'\nerror count');
    expect(e$61, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^\\u{0}-\\u{9}]\n\'\'\nerrors');
    final s$102 = State(' ');
    final r$130 = r$124(s$102) as dynamic;
    expect(r$130, isNull, reason: '[^\\u{0}-\\u{9}]\n\' \'\nresult == null');
    expect(
      s$102.farthestPosition,
      0,
      reason: '[^\\u{0}-\\u{9}]\n\' \'\nstate.farthestPosition = 0',
    );
    expect(
      s$102.position,
      0,
      reason: '[^\\u{0}-\\u{9}]\n\' \'\nstate.position = 0',
    );
    final e$62 = s$102.getErrors().map((e) => '$e').toList()..sort();
    expect(e$62.length, 1, reason: '[^\\u{0}-\\u{9}]\n\' \'\nerror count');
    expect(e$62, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^\\u{0}-\\u{9}]\n\' \'\nerrors');
    final s$103 = State(' ');
    final r$131 = r$125(s$103) as dynamic;
    expect(r$131, isNull, reason: '[^\\u{0}-\\u{9}]\n\' \'\nresult == null');
    expect(
      s$103.farthestPosition,
      0,
      reason: '[^\\u{0}-\\u{9}]\n\' \'\nstate.farthestPosition = 0',
    );
    expect(
      s$103.position,
      0,
      reason: '[^\\u{0}-\\u{9}]\n\' \'\nstate.position = 0',
    );
    final e$63 = s$103.getErrors().map((e) => '$e').toList()..sort();
    expect(e$63.length, 1, reason: '[^\\u{0}-\\u{9}]\n\' \'\nerror count');
    expect(e$63, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^\\u{0}-\\u{9}]\n\' \'\nerrors');
    final s$104 = State('\t');
    final r$132 = r$124(s$104) as dynamic;
    expect(r$132, isNull, reason: '[^\\u{0}-\\u{9}]\n\'\\t\'\nresult == null');
    expect(
      s$104.farthestPosition,
      0,
      reason: '[^\\u{0}-\\u{9}]\n\'\\t\'\nstate.farthestPosition = 0',
    );
    expect(
      s$104.position,
      0,
      reason: '[^\\u{0}-\\u{9}]\n\'\\t\'\nstate.position = 0',
    );
    final e$64 = s$104.getErrors().map((e) => '$e').toList()..sort();
    expect(e$64.length, 1, reason: '[^\\u{0}-\\u{9}]\n\'\\t\'\nerror count');
    expect(e$64, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^\\u{0}-\\u{9}]\n\'\\t\'\nerrors');
    final s$105 = State('\t');
    final r$133 = r$125(s$105) as dynamic;
    expect(r$133, isNull, reason: '[^\\u{0}-\\u{9}]\n\'\\t\'\nresult == null');
    expect(
      s$105.farthestPosition,
      0,
      reason: '[^\\u{0}-\\u{9}]\n\'\\t\'\nstate.farthestPosition = 0',
    );
    expect(
      s$105.position,
      0,
      reason: '[^\\u{0}-\\u{9}]\n\'\\t\'\nstate.position = 0',
    );
    final e$65 = s$105.getErrors().map((e) => '$e').toList()..sort();
    expect(e$65.length, 1, reason: '[^\\u{0}-\\u{9}]\n\'\\t\'\nerror count');
    expect(e$65, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[^\\u{0}-\\u{9}]\n\'\\t\'\nerrors');
    final r$134 = parser.parseCharacterClass14;
    final r$135 = parser.parseCharacterClassVoid14;
    final s$106 = State('a');
    final r$136 = r$134(s$106) as dynamic;
    expect(r$136, isNotNull, reason: '[a]\n---\n[b]\n\'a\'\nresult != null');
    expect(
      s$106.position,
      1,
      reason: '[a]\n---\n[b]\n\'a\'\nstate.position = 1',
    );
    expect(r$136.$1, 97, reason: '[a]\n---\n[b]\n\'a\'\nresult.\$1 != 97');
    final s$107 = State('a');
    final r$137 = r$135(s$107) as dynamic;
    expect(r$137, isNotNull, reason: '[a]\n---\n[b]\n\'a\'\nresult != null');
    expect(
      s$107.position,
      1,
      reason: '[a]\n---\n[b]\n\'a\'\nstate.position = 1',
    );
    expect(r$137.$1, null, reason: '[a]\n---\n[b]\n\'a\'\nresult.\$1 != null');
    final s$108 = State('b');
    final r$138 = r$134(s$108) as dynamic;
    expect(r$138, isNotNull, reason: '[a]\n---\n[b]\n\'b\'\nresult != null');
    expect(
      s$108.position,
      1,
      reason: '[a]\n---\n[b]\n\'b\'\nstate.position = 1',
    );
    expect(r$138.$1, 98, reason: '[a]\n---\n[b]\n\'b\'\nresult.\$1 != 98');
    final s$109 = State('b');
    final r$139 = r$135(s$109) as dynamic;
    expect(r$139, isNotNull, reason: '[a]\n---\n[b]\n\'b\'\nresult != null');
    expect(
      s$109.position,
      1,
      reason: '[a]\n---\n[b]\n\'b\'\nstate.position = 1',
    );
    expect(r$139.$1, null, reason: '[a]\n---\n[b]\n\'b\'\nresult.\$1 != null');
    final s$110 = State('');
    final r$140 = r$134(s$110) as dynamic;
    expect(r$140, isNull, reason: '[a]\n---\n[b]\n\'\'\nresult == null');
    expect(
      s$110.farthestPosition,
      0,
      reason: '[a]\n---\n[b]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$110.position,
      0,
      reason: '[a]\n---\n[b]\n\'\'\nstate.position = 0',
    );
    final e$66 = s$110.getErrors().map((e) => '$e').toList()..sort();
    expect(e$66.length, 1, reason: '[a]\n---\n[b]\n\'\'\nerror count');
    expect(e$66, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[a]\n---\n[b]\n\'\'\nerrors');
    final s$111 = State('');
    final r$141 = r$135(s$111) as dynamic;
    expect(r$141, isNull, reason: '[a]\n---\n[b]\n\'\'\nresult == null');
    expect(
      s$111.farthestPosition,
      0,
      reason: '[a]\n---\n[b]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$111.position,
      0,
      reason: '[a]\n---\n[b]\n\'\'\nstate.position = 0',
    );
    final e$67 = s$111.getErrors().map((e) => '$e').toList()..sort();
    expect(e$67.length, 1, reason: '[a]\n---\n[b]\n\'\'\nerror count');
    expect(e$67, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[a]\n---\n[b]\n\'\'\nerrors');
    final s$112 = State('z');
    final r$142 = r$134(s$112) as dynamic;
    expect(r$142, isNull, reason: '[a]\n---\n[b]\n\'z\'\nresult == null');
    expect(
      s$112.farthestPosition,
      0,
      reason: '[a]\n---\n[b]\n\'z\'\nstate.farthestPosition = 0',
    );
    expect(
      s$112.position,
      0,
      reason: '[a]\n---\n[b]\n\'z\'\nstate.position = 0',
    );
    final e$68 = s$112.getErrors().map((e) => '$e').toList()..sort();
    expect(e$68.length, 1, reason: '[a]\n---\n[b]\n\'z\'\nerror count');
    expect(e$68, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[a]\n---\n[b]\n\'z\'\nerrors');
    final s$113 = State('z');
    final r$143 = r$135(s$113) as dynamic;
    expect(r$143, isNull, reason: '[a]\n---\n[b]\n\'z\'\nresult == null');
    expect(
      s$113.farthestPosition,
      0,
      reason: '[a]\n---\n[b]\n\'z\'\nstate.farthestPosition = 0',
    );
    expect(
      s$113.position,
      0,
      reason: '[a]\n---\n[b]\n\'z\'\nstate.position = 0',
    );
    final e$69 = s$113.getErrors().map((e) => '$e').toList()..sort();
    expect(e$69.length, 1, reason: '[a]\n---\n[b]\n\'z\'\nerror count');
    expect(e$69, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[a]\n---\n[b]\n\'z\'\nerrors');
    final r$144 = parser.parseCharacterClass15;
    final r$145 = parser.parseCharacterClassVoid15;
    final s$114 = State('a ');
    final r$146 = r$144(s$114) as dynamic;
    expect(
      r$146,
      isNotNull,
      reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'a \'\nresult != null',
    );
    expect(
      s$114.position,
      2,
      reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'a \'\nstate.position = 2',
    );
    expect(
      r$146.$1,
      97,
      reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'a \'\nresult.\$1 != 97',
    );
    final s$115 = State('a ');
    final r$147 = r$145(s$115) as dynamic;
    expect(
      r$147,
      isNotNull,
      reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'a \'\nresult != null',
    );
    expect(
      s$115.position,
      2,
      reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'a \'\nstate.position = 2',
    );
    expect(
      r$147.$1,
      null,
      reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'a \'\nresult.\$1 != null',
    );
    final s$116 = State('b ');
    final r$148 = r$144(s$116) as dynamic;
    expect(
      r$148,
      isNotNull,
      reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'b \'\nresult != null',
    );
    expect(
      s$116.position,
      2,
      reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'b \'\nstate.position = 2',
    );
    expect(
      r$148.$1,
      98,
      reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'b \'\nresult.\$1 != 98',
    );
    final s$117 = State('b ');
    final r$149 = r$145(s$117) as dynamic;
    expect(
      r$149,
      isNotNull,
      reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'b \'\nresult != null',
    );
    expect(
      s$117.position,
      2,
      reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'b \'\nstate.position = 2',
    );
    expect(
      r$149.$1,
      null,
      reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'b \'\nresult.\$1 != null',
    );
    final s$118 = State('');
    final r$150 = r$144(s$118) as dynamic;
    expect(
      r$150,
      isNull,
      reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'\'\nresult == null',
    );
    expect(
      s$118.farthestPosition,
      0,
      reason:
          '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$118.position,
      0,
      reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'\'\nstate.position = 0',
    );
    final e$70 = s$118.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$70.length,
      1,
      reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'\'\nerror count',
    );
    expect(e$70, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'\'\nerrors');
    final s$119 = State('');
    final r$151 = r$145(s$119) as dynamic;
    expect(
      r$151,
      isNull,
      reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'\'\nresult == null',
    );
    expect(
      s$119.farthestPosition,
      0,
      reason:
          '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$119.position,
      0,
      reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'\'\nstate.position = 0',
    );
    final e$71 = s$119.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$71.length,
      1,
      reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'\'\nerror count',
    );
    expect(e$71, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'\'\nerrors');
    final s$120 = State('z');
    final r$152 = r$144(s$120) as dynamic;
    expect(
      r$152,
      isNull,
      reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'z\'\nresult == null',
    );
    expect(
      s$120.farthestPosition,
      0,
      reason:
          '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'z\'\nstate.farthestPosition = 0',
    );
    expect(
      s$120.position,
      0,
      reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'z\'\nstate.position = 0',
    );
    final e$72 = s$120.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$72.length,
      1,
      reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'z\'\nerror count',
    );
    expect(e$72, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'z\'\nerrors');
    final s$121 = State('z');
    final r$153 = r$145(s$121) as dynamic;
    expect(
      r$153,
      isNull,
      reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'z\'\nresult == null',
    );
    expect(
      s$121.farthestPosition,
      0,
      reason:
          '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'z\'\nstate.farthestPosition = 0',
    );
    expect(
      s$121.position,
      0,
      reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'z\'\nstate.position = 0',
    );
    final e$73 = s$121.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$73.length,
      1,
      reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'z\'\nerror count',
    );
    expect(e$73, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '\$ = (\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'z\'\nerrors');
    final r$154 = parser.parseCharacterClass16;
    final s$122 = State('a ');
    final r$155 = r$154(s$122) as dynamic;
    expect(
      r$155,
      isNotNull,
      reason: '(\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'a \'\nresult != null',
    );
    expect(
      s$122.position,
      2,
      reason: '(\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'a \'\nstate.position = 2',
    );
    expect(
      r$155.$1,
      null,
      reason: '(\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'a \'\nresult.\$1 != null',
    );
    final s$123 = State('b ');
    final r$156 = r$154(s$123) as dynamic;
    expect(
      r$156,
      isNotNull,
      reason: '(\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'b \'\nresult != null',
    );
    expect(
      s$123.position,
      2,
      reason: '(\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'b \'\nstate.position = 2',
    );
    expect(
      r$156.$1,
      null,
      reason: '(\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'b \'\nresult.\$1 != null',
    );
    final s$124 = State('');
    final r$157 = r$154(s$124) as dynamic;
    expect(
      r$157,
      isNull,
      reason: '(\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'\'\nresult == null',
    );
    expect(
      s$124.farthestPosition,
      0,
      reason:
          '(\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$124.position,
      0,
      reason: '(\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'\'\nstate.position = 0',
    );
    final e$74 = s$124.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$74.length,
      1,
      reason: '(\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'\'\nerror count',
    );
    expect(e$74, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '(\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'\'\nerrors');
    final s$125 = State('z');
    final r$158 = r$154(s$125) as dynamic;
    expect(
      r$158,
      isNull,
      reason: '(\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'z\'\nresult == null',
    );
    expect(
      s$125.farthestPosition,
      0,
      reason:
          '(\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'z\'\nstate.farthestPosition = 0',
    );
    expect(
      s$125.position,
      0,
      reason: '(\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'z\'\nstate.position = 0',
    );
    final e$75 = s$125.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$75.length,
      1,
      reason: '(\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'z\'\nerror count',
    );
    expect(e$75, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '(\n  [a]\n  ---\n  [b]\n)\n[ ]\n\'z\'\nerrors');
  });

  test('Group', () {
    final r$ = parser.parseGroup0;
    final r$1 = parser.parseGroupVoid0;
    final s$ = State('a');
    final r$2 = r$(s$) as dynamic;
    expect(r$2, isNotNull, reason: '([a] / [z])\n\'a\'\nresult != null');
    expect(s$.position, 1, reason: '([a] / [z])\n\'a\'\nstate.position = 1');
    expect(r$2.$1, 97, reason: '([a] / [z])\n\'a\'\nresult.\$1 != 97');
    final s$1 = State('a');
    final r$3 = r$1(s$1) as dynamic;
    expect(r$3, isNotNull, reason: '([a] / [z])\n\'a\'\nresult != null');
    expect(s$1.position, 1, reason: '([a] / [z])\n\'a\'\nstate.position = 1');
    expect(r$3.$1, null, reason: '([a] / [z])\n\'a\'\nresult.\$1 != null');
    final s$2 = State('z');
    final r$4 = r$(s$2) as dynamic;
    expect(r$4, isNotNull, reason: '([a] / [z])\n\'z\'\nresult != null');
    expect(s$2.position, 1, reason: '([a] / [z])\n\'z\'\nstate.position = 1');
    expect(r$4.$1, 122, reason: '([a] / [z])\n\'z\'\nresult.\$1 != 122');
    final s$3 = State('z');
    final r$5 = r$1(s$3) as dynamic;
    expect(r$5, isNotNull, reason: '([a] / [z])\n\'z\'\nresult != null');
    expect(s$3.position, 1, reason: '([a] / [z])\n\'z\'\nstate.position = 1');
    expect(r$5.$1, null, reason: '([a] / [z])\n\'z\'\nresult.\$1 != null');
    final s$4 = State('');
    final r$6 = r$(s$4) as dynamic;
    expect(r$6, isNull, reason: '([a] / [z])\n\'\'\nresult == null');
    expect(
      s$4.farthestPosition,
      0,
      reason: '([a] / [z])\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$4.position, 0, reason: '([a] / [z])\n\'\'\nstate.position = 0');
    final e$ = s$4.getErrors().map((e) => '$e').toList()..sort();
    expect(e$.length, 1, reason: '([a] / [z])\n\'\'\nerror count');
    expect(e$, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '([a] / [z])\n\'\'\nerrors');
    final s$5 = State('');
    final r$7 = r$1(s$5) as dynamic;
    expect(r$7, isNull, reason: '([a] / [z])\n\'\'\nresult == null');
    expect(
      s$5.farthestPosition,
      0,
      reason: '([a] / [z])\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$5.position, 0, reason: '([a] / [z])\n\'\'\nstate.position = 0');
    final e$1 = s$5.getErrors().map((e) => '$e').toList()..sort();
    expect(e$1.length, 1, reason: '([a] / [z])\n\'\'\nerror count');
    expect(e$1, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '([a] / [z])\n\'\'\nerrors');
    final s$6 = State('b');
    final r$8 = r$(s$6) as dynamic;
    expect(r$8, isNull, reason: '([a] / [z])\n\'b\'\nresult == null');
    expect(
      s$6.farthestPosition,
      0,
      reason: '([a] / [z])\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(s$6.position, 0, reason: '([a] / [z])\n\'b\'\nstate.position = 0');
    final e$2 = s$6.getErrors().map((e) => '$e').toList()..sort();
    expect(e$2.length, 1, reason: '([a] / [z])\n\'b\'\nerror count');
    expect(e$2, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '([a] / [z])\n\'b\'\nerrors');
    final s$7 = State('b');
    final r$9 = r$1(s$7) as dynamic;
    expect(r$9, isNull, reason: '([a] / [z])\n\'b\'\nresult == null');
    expect(
      s$7.farthestPosition,
      0,
      reason: '([a] / [z])\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(s$7.position, 0, reason: '([a] / [z])\n\'b\'\nstate.position = 0');
    final e$3 = s$7.getErrors().map((e) => '$e').toList()..sort();
    expect(e$3.length, 1, reason: '([a] / [z])\n\'b\'\nerror count');
    expect(e$3, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '([a] / [z])\n\'b\'\nerrors');
  });

  test('Literal', () {
    final r$ = parser.parseLiteral0;
    final r$1 = parser.parseLiteralVoid0;
    final s$ = State('abc');
    final r$2 = r$(s$) as dynamic;
    expect(r$2, isNotNull, reason: '\'abc\'\n\'abc\'\nresult != null');
    expect(s$.position, 3, reason: '\'abc\'\n\'abc\'\nstate.position = 3');
    expect(r$2.$1, 'abc', reason: '\'abc\'\n\'abc\'\nresult.\$1 != \'abc\'');
    final s$1 = State('abc');
    final r$3 = r$1(s$1) as dynamic;
    expect(r$3, isNotNull, reason: '\'abc\'\n\'abc\'\nresult != null');
    expect(s$1.position, 3, reason: '\'abc\'\n\'abc\'\nstate.position = 3');
    expect(r$3.$1, null, reason: '\'abc\'\n\'abc\'\nresult.\$1 != null');
    final s$2 = State('');
    final r$4 = r$(s$2) as dynamic;
    expect(r$4, isNull, reason: '\'abc\'\n\'\'\nresult == null');
    expect(
      s$2.farthestPosition,
      0,
      reason: '\'abc\'\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$2.position, 0, reason: '\'abc\'\n\'\'\nstate.position = 0');
    final e$ = s$2.getErrors().map((e) => '$e').toList()..sort();
    expect(e$.length, 1, reason: '\'abc\'\n\'\'\nerror count');
    expect(e$, [
      '(end: 0, message: Expected: \'abc\', start: 0)',
    ], reason: '\'abc\'\n\'\'\nerrors');
    final s$3 = State('');
    final r$5 = r$1(s$3) as dynamic;
    expect(r$5, isNull, reason: '\'abc\'\n\'\'\nresult == null');
    expect(
      s$3.farthestPosition,
      0,
      reason: '\'abc\'\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$3.position, 0, reason: '\'abc\'\n\'\'\nstate.position = 0');
    final e$1 = s$3.getErrors().map((e) => '$e').toList()..sort();
    expect(e$1.length, 1, reason: '\'abc\'\n\'\'\nerror count');
    expect(e$1, [
      '(end: 0, message: Expected: \'abc\', start: 0)',
    ], reason: '\'abc\'\n\'\'\nerrors');
    final s$4 = State('a');
    final r$6 = r$(s$4) as dynamic;
    expect(r$6, isNull, reason: '\'abc\'\n\'a\'\nresult == null');
    expect(
      s$4.farthestPosition,
      0,
      reason: '\'abc\'\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(s$4.position, 0, reason: '\'abc\'\n\'a\'\nstate.position = 0');
    final e$2 = s$4.getErrors().map((e) => '$e').toList()..sort();
    expect(e$2.length, 1, reason: '\'abc\'\n\'a\'\nerror count');
    expect(e$2, [
      '(end: 0, message: Expected: \'abc\', start: 0)',
    ], reason: '\'abc\'\n\'a\'\nerrors');
    final s$5 = State('a');
    final r$7 = r$1(s$5) as dynamic;
    expect(r$7, isNull, reason: '\'abc\'\n\'a\'\nresult == null');
    expect(
      s$5.farthestPosition,
      0,
      reason: '\'abc\'\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(s$5.position, 0, reason: '\'abc\'\n\'a\'\nstate.position = 0');
    final e$3 = s$5.getErrors().map((e) => '$e').toList()..sort();
    expect(e$3.length, 1, reason: '\'abc\'\n\'a\'\nerror count');
    expect(e$3, [
      '(end: 0, message: Expected: \'abc\', start: 0)',
    ], reason: '\'abc\'\n\'a\'\nerrors');
    final r$8 = parser.parseLiteral1;
    final r$9 = parser.parseLiteralVoid1;
    final s$6 = State('abc');
    final r$10 = r$8(s$6) as dynamic;
    expect(r$10, isNotNull, reason: '"abc"\n\'abc\'\nresult != null');
    expect(s$6.position, 3, reason: '"abc"\n\'abc\'\nstate.position = 3');
    expect(r$10.$1, 'abc', reason: '"abc"\n\'abc\'\nresult.\$1 != \'abc\'');
    final s$7 = State('abc');
    final r$11 = r$9(s$7) as dynamic;
    expect(r$11, isNotNull, reason: '"abc"\n\'abc\'\nresult != null');
    expect(s$7.position, 3, reason: '"abc"\n\'abc\'\nstate.position = 3');
    expect(r$11.$1, null, reason: '"abc"\n\'abc\'\nresult.\$1 != null');
    final s$8 = State('');
    final r$12 = r$8(s$8) as dynamic;
    expect(r$12, isNull, reason: '"abc"\n\'\'\nresult == null');
    expect(
      s$8.farthestPosition,
      0,
      reason: '"abc"\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$8.position, 0, reason: '"abc"\n\'\'\nstate.position = 0');
    final e$4 = s$8.getErrors().map((e) => '$e').toList()..sort();
    expect(e$4.length, 1, reason: '"abc"\n\'\'\nerror count');
    expect(e$4, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '"abc"\n\'\'\nerrors');
    final s$9 = State('');
    final r$13 = r$9(s$9) as dynamic;
    expect(r$13, isNull, reason: '"abc"\n\'\'\nresult == null');
    expect(
      s$9.farthestPosition,
      0,
      reason: '"abc"\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$9.position, 0, reason: '"abc"\n\'\'\nstate.position = 0');
    final e$5 = s$9.getErrors().map((e) => '$e').toList()..sort();
    expect(e$5.length, 1, reason: '"abc"\n\'\'\nerror count');
    expect(e$5, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '"abc"\n\'\'\nerrors');
    final s$10 = State('a');
    final r$14 = r$8(s$10) as dynamic;
    expect(r$14, isNull, reason: '"abc"\n\'a\'\nresult == null');
    expect(
      s$10.farthestPosition,
      0,
      reason: '"abc"\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(s$10.position, 0, reason: '"abc"\n\'a\'\nstate.position = 0');
    final e$6 = s$10.getErrors().map((e) => '$e').toList()..sort();
    expect(e$6.length, 1, reason: '"abc"\n\'a\'\nerror count');
    expect(e$6, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '"abc"\n\'a\'\nerrors');
    final s$11 = State('a');
    final r$15 = r$9(s$11) as dynamic;
    expect(r$15, isNull, reason: '"abc"\n\'a\'\nresult == null');
    expect(
      s$11.farthestPosition,
      0,
      reason: '"abc"\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(s$11.position, 0, reason: '"abc"\n\'a\'\nstate.position = 0');
    final e$7 = s$11.getErrors().map((e) => '$e').toList()..sort();
    expect(e$7.length, 1, reason: '"abc"\n\'a\'\nerror count');
    expect(e$7, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '"abc"\n\'a\'\nerrors');
    final r$16 = parser.parseLiteral2;
    final r$17 = parser.parseLiteralVoid2;
    final s$12 = State('');
    final r$18 = r$16(s$12) as dynamic;
    expect(r$18, isNotNull, reason: '""\n\'\'\nresult != null');
    expect(s$12.position, 0, reason: '""\n\'\'\nstate.position = 0');
    expect(r$18.$1, '', reason: '""\n\'\'\nresult.\$1 != \'\'');
    final s$13 = State('');
    final r$19 = r$17(s$13) as dynamic;
    expect(r$19, isNotNull, reason: '""\n\'\'\nresult != null');
    expect(s$13.position, 0, reason: '""\n\'\'\nstate.position = 0');
    expect(r$19.$1, null, reason: '""\n\'\'\nresult.\$1 != null');
    final s$14 = State('a');
    final r$20 = r$16(s$14) as dynamic;
    expect(r$20, isNotNull, reason: '""\n\'a\'\nresult != null');
    expect(s$14.position, 0, reason: '""\n\'a\'\nstate.position = 0');
    expect(r$20.$1, '', reason: '""\n\'a\'\nresult.\$1 != \'\'');
    final s$15 = State('a');
    final r$21 = r$17(s$15) as dynamic;
    expect(r$21, isNotNull, reason: '""\n\'a\'\nresult != null');
    expect(s$15.position, 0, reason: '""\n\'a\'\nstate.position = 0');
    expect(r$21.$1, null, reason: '""\n\'a\'\nresult.\$1 != null');
    final r$22 = parser.parseLiteral3;
    final r$23 = parser.parseLiteralVoid3;
    final s$16 = State('');
    final r$24 = r$22(s$16) as dynamic;
    expect(r$24, isNotNull, reason: '\'\'\n\'\'\nresult != null');
    expect(s$16.position, 0, reason: '\'\'\n\'\'\nstate.position = 0');
    expect(r$24.$1, '', reason: '\'\'\n\'\'\nresult.\$1 != \'\'');
    final s$17 = State('');
    final r$25 = r$23(s$17) as dynamic;
    expect(r$25, isNotNull, reason: '\'\'\n\'\'\nresult != null');
    expect(s$17.position, 0, reason: '\'\'\n\'\'\nstate.position = 0');
    expect(r$25.$1, null, reason: '\'\'\n\'\'\nresult.\$1 != null');
    final s$18 = State('a');
    final r$26 = r$22(s$18) as dynamic;
    expect(r$26, isNotNull, reason: '\'\'\n\'a\'\nresult != null');
    expect(s$18.position, 0, reason: '\'\'\n\'a\'\nstate.position = 0');
    expect(r$26.$1, '', reason: '\'\'\n\'a\'\nresult.\$1 != \'\'');
    final s$19 = State('a');
    final r$27 = r$23(s$19) as dynamic;
    expect(r$27, isNotNull, reason: '\'\'\n\'a\'\nresult != null');
    expect(s$19.position, 0, reason: '\'\'\n\'a\'\nstate.position = 0');
    expect(r$27.$1, null, reason: '\'\'\n\'a\'\nresult.\$1 != null');
    final r$28 = parser.parseLiteral4;
    final r$29 = parser.parseLiteralVoid4;
    final s$20 = State('\r\n');
    final r$30 = r$28(s$20) as dynamic;
    expect(r$30, isNotNull, reason: '"\\r\\n"\n\'\\r\\n\'\nresult != null');
    expect(
      s$20.position,
      2,
      reason: '"\\r\\n"\n\'\\r\\n\'\nstate.position = 2',
    );
    expect(
      r$30.$1,
      '\r\n',
      reason: '"\\r\\n"\n\'\\r\\n\'\nresult.\$1 != \'\\r\\n\'',
    );
    final s$21 = State('\r\n');
    final r$31 = r$29(s$21) as dynamic;
    expect(r$31, isNotNull, reason: '"\\r\\n"\n\'\\r\\n\'\nresult != null');
    expect(
      s$21.position,
      2,
      reason: '"\\r\\n"\n\'\\r\\n\'\nstate.position = 2',
    );
    expect(r$31.$1, null, reason: '"\\r\\n"\n\'\\r\\n\'\nresult.\$1 != null');
    final s$22 = State('\r');
    final r$32 = r$28(s$22) as dynamic;
    expect(r$32, isNull, reason: '"\\r\\n"\n\'\\r\'\nresult == null');
    expect(
      s$22.farthestPosition,
      0,
      reason: '"\\r\\n"\n\'\\r\'\nstate.farthestPosition = 0',
    );
    expect(s$22.position, 0, reason: '"\\r\\n"\n\'\\r\'\nstate.position = 0');
    final e$8 = s$22.getErrors().map((e) => '$e').toList()..sort();
    expect(e$8.length, 1, reason: '"\\r\\n"\n\'\\r\'\nerror count');
    expect(e$8, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '"\\r\\n"\n\'\\r\'\nerrors');
    final s$23 = State('\r');
    final r$33 = r$29(s$23) as dynamic;
    expect(r$33, isNull, reason: '"\\r\\n"\n\'\\r\'\nresult == null');
    expect(
      s$23.farthestPosition,
      0,
      reason: '"\\r\\n"\n\'\\r\'\nstate.farthestPosition = 0',
    );
    expect(s$23.position, 0, reason: '"\\r\\n"\n\'\\r\'\nstate.position = 0');
    final e$9 = s$23.getErrors().map((e) => '$e').toList()..sort();
    expect(e$9.length, 1, reason: '"\\r\\n"\n\'\\r\'\nerror count');
    expect(e$9, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '"\\r\\n"\n\'\\r\'\nerrors');
    final r$34 = parser.parseLiteral5;
    final r$35 = parser.parseLiteralVoid5;
    final s$24 = State('abc');
    final r$36 = r$34(s$24) as dynamic;
    expect(
      r$36,
      isNotNull,
      reason: '"abc"\n---\n"def"\n\'abc\'\nresult != null',
    );
    expect(
      s$24.position,
      3,
      reason: '"abc"\n---\n"def"\n\'abc\'\nstate.position = 3',
    );
    expect(
      r$36.$1,
      'abc',
      reason: '"abc"\n---\n"def"\n\'abc\'\nresult.\$1 != \'abc\'',
    );
    final s$25 = State('abc');
    final r$37 = r$35(s$25) as dynamic;
    expect(
      r$37,
      isNotNull,
      reason: '"abc"\n---\n"def"\n\'abc\'\nresult != null',
    );
    expect(
      s$25.position,
      3,
      reason: '"abc"\n---\n"def"\n\'abc\'\nstate.position = 3',
    );
    expect(
      r$37.$1,
      null,
      reason: '"abc"\n---\n"def"\n\'abc\'\nresult.\$1 != null',
    );
    final s$26 = State('def');
    final r$38 = r$34(s$26) as dynamic;
    expect(
      r$38,
      isNotNull,
      reason: '"abc"\n---\n"def"\n\'def\'\nresult != null',
    );
    expect(
      s$26.position,
      3,
      reason: '"abc"\n---\n"def"\n\'def\'\nstate.position = 3',
    );
    expect(
      r$38.$1,
      'def',
      reason: '"abc"\n---\n"def"\n\'def\'\nresult.\$1 != \'def\'',
    );
    final s$27 = State('def');
    final r$39 = r$35(s$27) as dynamic;
    expect(
      r$39,
      isNotNull,
      reason: '"abc"\n---\n"def"\n\'def\'\nresult != null',
    );
    expect(
      s$27.position,
      3,
      reason: '"abc"\n---\n"def"\n\'def\'\nstate.position = 3',
    );
    expect(
      r$39.$1,
      null,
      reason: '"abc"\n---\n"def"\n\'def\'\nresult.\$1 != null',
    );
    final s$28 = State('');
    final r$40 = r$34(s$28) as dynamic;
    expect(r$40, isNull, reason: '"abc"\n---\n"def"\n\'\'\nresult == null');
    expect(
      s$28.farthestPosition,
      0,
      reason: '"abc"\n---\n"def"\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$28.position,
      0,
      reason: '"abc"\n---\n"def"\n\'\'\nstate.position = 0',
    );
    final e$10 = s$28.getErrors().map((e) => '$e').toList()..sort();
    expect(e$10.length, 1, reason: '"abc"\n---\n"def"\n\'\'\nerror count');
    expect(e$10, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '"abc"\n---\n"def"\n\'\'\nerrors');
    final s$29 = State('');
    final r$41 = r$35(s$29) as dynamic;
    expect(r$41, isNull, reason: '"abc"\n---\n"def"\n\'\'\nresult == null');
    expect(
      s$29.farthestPosition,
      0,
      reason: '"abc"\n---\n"def"\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$29.position,
      0,
      reason: '"abc"\n---\n"def"\n\'\'\nstate.position = 0',
    );
    final e$11 = s$29.getErrors().map((e) => '$e').toList()..sort();
    expect(e$11.length, 1, reason: '"abc"\n---\n"def"\n\'\'\nerror count');
    expect(e$11, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '"abc"\n---\n"def"\n\'\'\nerrors');
    final s$30 = State('a');
    final r$42 = r$34(s$30) as dynamic;
    expect(r$42, isNull, reason: '"abc"\n---\n"def"\n\'a\'\nresult == null');
    expect(
      s$30.farthestPosition,
      0,
      reason: '"abc"\n---\n"def"\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(
      s$30.position,
      0,
      reason: '"abc"\n---\n"def"\n\'a\'\nstate.position = 0',
    );
    final e$12 = s$30.getErrors().map((e) => '$e').toList()..sort();
    expect(e$12.length, 1, reason: '"abc"\n---\n"def"\n\'a\'\nerror count');
    expect(e$12, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '"abc"\n---\n"def"\n\'a\'\nerrors');
    final s$31 = State('a');
    final r$43 = r$35(s$31) as dynamic;
    expect(r$43, isNull, reason: '"abc"\n---\n"def"\n\'a\'\nresult == null');
    expect(
      s$31.farthestPosition,
      0,
      reason: '"abc"\n---\n"def"\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(
      s$31.position,
      0,
      reason: '"abc"\n---\n"def"\n\'a\'\nstate.position = 0',
    );
    final e$13 = s$31.getErrors().map((e) => '$e').toList()..sort();
    expect(e$13.length, 1, reason: '"abc"\n---\n"def"\n\'a\'\nerror count');
    expect(e$13, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '"abc"\n---\n"def"\n\'a\'\nerrors');
    final r$44 = parser.parseLiteral6;
    final r$45 = parser.parseLiteralVoid6;
    final s$32 = State('abc ');
    final r$46 = r$44(s$32) as dynamic;
    expect(
      r$46,
      isNotNull,
      reason:
          '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'abc \'\nresult != null',
    );
    expect(
      s$32.position,
      4,
      reason:
          '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'abc \'\nstate.position = 4',
    );
    expect(
      r$46.$1,
      'abc',
      reason:
          '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'abc \'\nresult.\$1 != \'abc\'',
    );
    final s$33 = State('abc ');
    final r$47 = r$45(s$33) as dynamic;
    expect(
      r$47,
      isNotNull,
      reason:
          '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'abc \'\nresult != null',
    );
    expect(
      s$33.position,
      4,
      reason:
          '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'abc \'\nstate.position = 4',
    );
    expect(
      r$47.$1,
      null,
      reason:
          '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'abc \'\nresult.\$1 != null',
    );
    final s$34 = State('def ');
    final r$48 = r$44(s$34) as dynamic;
    expect(
      r$48,
      isNotNull,
      reason:
          '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'def \'\nresult != null',
    );
    expect(
      s$34.position,
      4,
      reason:
          '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'def \'\nstate.position = 4',
    );
    expect(
      r$48.$1,
      'def',
      reason:
          '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'def \'\nresult.\$1 != \'def\'',
    );
    final s$35 = State('def ');
    final r$49 = r$45(s$35) as dynamic;
    expect(
      r$49,
      isNotNull,
      reason:
          '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'def \'\nresult != null',
    );
    expect(
      s$35.position,
      4,
      reason:
          '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'def \'\nstate.position = 4',
    );
    expect(
      r$49.$1,
      null,
      reason:
          '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'def \'\nresult.\$1 != null',
    );
    final s$36 = State('');
    final r$50 = r$44(s$36) as dynamic;
    expect(
      r$50,
      isNull,
      reason: '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'\'\nresult == null',
    );
    expect(
      s$36.farthestPosition,
      0,
      reason:
          '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$36.position,
      0,
      reason:
          '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'\'\nstate.position = 0',
    );
    final e$14 = s$36.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$14.length,
      1,
      reason: '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'\'\nerror count',
    );
    expect(e$14, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'\'\nerrors');
    final s$37 = State('');
    final r$51 = r$45(s$37) as dynamic;
    expect(
      r$51,
      isNull,
      reason: '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'\'\nresult == null',
    );
    expect(
      s$37.farthestPosition,
      0,
      reason:
          '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$37.position,
      0,
      reason:
          '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'\'\nstate.position = 0',
    );
    final e$15 = s$37.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$15.length,
      1,
      reason: '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'\'\nerror count',
    );
    expect(e$15, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'\'\nerrors');
    final s$38 = State('a');
    final r$52 = r$44(s$38) as dynamic;
    expect(
      r$52,
      isNull,
      reason: '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'a\'\nresult == null',
    );
    expect(
      s$38.farthestPosition,
      0,
      reason:
          '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(
      s$38.position,
      0,
      reason:
          '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'a\'\nstate.position = 0',
    );
    final e$16 = s$38.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$16.length,
      1,
      reason: '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'a\'\nerror count',
    );
    expect(e$16, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'a\'\nerrors');
    final s$39 = State('a');
    final r$53 = r$45(s$39) as dynamic;
    expect(
      r$53,
      isNull,
      reason: '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'a\'\nresult == null',
    );
    expect(
      s$39.farthestPosition,
      0,
      reason:
          '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(
      s$39.position,
      0,
      reason:
          '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'a\'\nstate.position = 0',
    );
    final e$17 = s$39.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$17.length,
      1,
      reason: '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'a\'\nerror count',
    );
    expect(e$17, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '\$ = (\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'a\'\nerrors');
    final r$54 = parser.parseLiteral7;
    final s$40 = State('abc ');
    final r$55 = r$54(s$40) as dynamic;
    expect(
      r$55,
      isNotNull,
      reason: '(\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'abc \'\nresult != null',
    );
    expect(
      s$40.position,
      4,
      reason:
          '(\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'abc \'\nstate.position = 4',
    );
    expect(
      r$55.$1,
      null,
      reason:
          '(\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'abc \'\nresult.\$1 != null',
    );
    final s$41 = State('def ');
    final r$56 = r$54(s$41) as dynamic;
    expect(
      r$56,
      isNotNull,
      reason: '(\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'def \'\nresult != null',
    );
    expect(
      s$41.position,
      4,
      reason:
          '(\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'def \'\nstate.position = 4',
    );
    expect(
      r$56.$1,
      null,
      reason:
          '(\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'def \'\nresult.\$1 != null',
    );
    final s$42 = State('');
    final r$57 = r$54(s$42) as dynamic;
    expect(
      r$57,
      isNull,
      reason: '(\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'\'\nresult == null',
    );
    expect(
      s$42.farthestPosition,
      0,
      reason:
          '(\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$42.position,
      0,
      reason: '(\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'\'\nstate.position = 0',
    );
    final e$18 = s$42.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$18.length,
      1,
      reason: '(\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'\'\nerror count',
    );
    expect(e$18, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '(\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'\'\nerrors');
    final s$43 = State('a');
    final r$58 = r$54(s$43) as dynamic;
    expect(
      r$58,
      isNull,
      reason: '(\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'a\'\nresult == null',
    );
    expect(
      s$43.farthestPosition,
      0,
      reason:
          '(\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(
      s$43.position,
      0,
      reason: '(\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'a\'\nstate.position = 0',
    );
    final e$19 = s$43.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$19.length,
      1,
      reason: '(\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'a\'\nerror count',
    );
    expect(e$19, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '(\n  "abc"\n  ---\n  "def"\n)\n[ ]\n\'a\'\nerrors');
    final r$59 = parser.parseLiteral8;
    final r$60 = parser.parseLiteralVoid8;
    final s$44 = State('abc');
    final r$61 = r$59(s$44) as dynamic;
    expect(
      r$61,
      isNotNull,
      reason: '\'abc\'\n---\n\'def\'\n\'abc\'\nresult != null',
    );
    expect(
      s$44.position,
      3,
      reason: '\'abc\'\n---\n\'def\'\n\'abc\'\nstate.position = 3',
    );
    expect(
      r$61.$1,
      'abc',
      reason: '\'abc\'\n---\n\'def\'\n\'abc\'\nresult.\$1 != \'abc\'',
    );
    final s$45 = State('abc');
    final r$62 = r$60(s$45) as dynamic;
    expect(
      r$62,
      isNotNull,
      reason: '\'abc\'\n---\n\'def\'\n\'abc\'\nresult != null',
    );
    expect(
      s$45.position,
      3,
      reason: '\'abc\'\n---\n\'def\'\n\'abc\'\nstate.position = 3',
    );
    expect(
      r$62.$1,
      null,
      reason: '\'abc\'\n---\n\'def\'\n\'abc\'\nresult.\$1 != null',
    );
    final s$46 = State('def');
    final r$63 = r$59(s$46) as dynamic;
    expect(
      r$63,
      isNotNull,
      reason: '\'abc\'\n---\n\'def\'\n\'def\'\nresult != null',
    );
    expect(
      s$46.position,
      3,
      reason: '\'abc\'\n---\n\'def\'\n\'def\'\nstate.position = 3',
    );
    expect(
      r$63.$1,
      'def',
      reason: '\'abc\'\n---\n\'def\'\n\'def\'\nresult.\$1 != \'def\'',
    );
    final s$47 = State('def');
    final r$64 = r$60(s$47) as dynamic;
    expect(
      r$64,
      isNotNull,
      reason: '\'abc\'\n---\n\'def\'\n\'def\'\nresult != null',
    );
    expect(
      s$47.position,
      3,
      reason: '\'abc\'\n---\n\'def\'\n\'def\'\nstate.position = 3',
    );
    expect(
      r$64.$1,
      null,
      reason: '\'abc\'\n---\n\'def\'\n\'def\'\nresult.\$1 != null',
    );
    final s$48 = State('');
    final r$65 = r$59(s$48) as dynamic;
    expect(r$65, isNull, reason: '\'abc\'\n---\n\'def\'\n\'\'\nresult == null');
    expect(
      s$48.farthestPosition,
      0,
      reason: '\'abc\'\n---\n\'def\'\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$48.position,
      0,
      reason: '\'abc\'\n---\n\'def\'\n\'\'\nstate.position = 0',
    );
    final e$20 = s$48.getErrors().map((e) => '$e').toList()..sort();
    expect(e$20.length, 1, reason: '\'abc\'\n---\n\'def\'\n\'\'\nerror count');
    expect(e$20, [
      '(end: 0, message: Expected: \'abc\', \'def\', start: 0)',
    ], reason: '\'abc\'\n---\n\'def\'\n\'\'\nerrors');
    final s$49 = State('');
    final r$66 = r$60(s$49) as dynamic;
    expect(r$66, isNull, reason: '\'abc\'\n---\n\'def\'\n\'\'\nresult == null');
    expect(
      s$49.farthestPosition,
      0,
      reason: '\'abc\'\n---\n\'def\'\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$49.position,
      0,
      reason: '\'abc\'\n---\n\'def\'\n\'\'\nstate.position = 0',
    );
    final e$21 = s$49.getErrors().map((e) => '$e').toList()..sort();
    expect(e$21.length, 1, reason: '\'abc\'\n---\n\'def\'\n\'\'\nerror count');
    expect(e$21, [
      '(end: 0, message: Expected: \'abc\', \'def\', start: 0)',
    ], reason: '\'abc\'\n---\n\'def\'\n\'\'\nerrors');
    final s$50 = State('a');
    final r$67 = r$59(s$50) as dynamic;
    expect(
      r$67,
      isNull,
      reason: '\'abc\'\n---\n\'def\'\n\'a\'\nresult == null',
    );
    expect(
      s$50.farthestPosition,
      0,
      reason: '\'abc\'\n---\n\'def\'\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(
      s$50.position,
      0,
      reason: '\'abc\'\n---\n\'def\'\n\'a\'\nstate.position = 0',
    );
    final e$22 = s$50.getErrors().map((e) => '$e').toList()..sort();
    expect(e$22.length, 1, reason: '\'abc\'\n---\n\'def\'\n\'a\'\nerror count');
    expect(e$22, [
      '(end: 0, message: Expected: \'abc\', \'def\', start: 0)',
    ], reason: '\'abc\'\n---\n\'def\'\n\'a\'\nerrors');
    final s$51 = State('a');
    final r$68 = r$60(s$51) as dynamic;
    expect(
      r$68,
      isNull,
      reason: '\'abc\'\n---\n\'def\'\n\'a\'\nresult == null',
    );
    expect(
      s$51.farthestPosition,
      0,
      reason: '\'abc\'\n---\n\'def\'\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(
      s$51.position,
      0,
      reason: '\'abc\'\n---\n\'def\'\n\'a\'\nstate.position = 0',
    );
    final e$23 = s$51.getErrors().map((e) => '$e').toList()..sort();
    expect(e$23.length, 1, reason: '\'abc\'\n---\n\'def\'\n\'a\'\nerror count');
    expect(e$23, [
      '(end: 0, message: Expected: \'abc\', \'def\', start: 0)',
    ], reason: '\'abc\'\n---\n\'def\'\n\'a\'\nerrors');
    final r$69 = parser.parseLiteral9;
    final r$70 = parser.parseLiteralVoid9;
    final s$52 = State('abc ');
    final r$71 = r$69(s$52) as dynamic;
    expect(
      r$71,
      isNotNull,
      reason:
          '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'abc \'\nresult != null',
    );
    expect(
      s$52.position,
      4,
      reason:
          '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'abc \'\nstate.position = 4',
    );
    expect(
      r$71.$1,
      'abc',
      reason:
          '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'abc \'\nresult.\$1 != \'abc\'',
    );
    final s$53 = State('abc ');
    final r$72 = r$70(s$53) as dynamic;
    expect(
      r$72,
      isNotNull,
      reason:
          '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'abc \'\nresult != null',
    );
    expect(
      s$53.position,
      4,
      reason:
          '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'abc \'\nstate.position = 4',
    );
    expect(
      r$72.$1,
      null,
      reason:
          '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'abc \'\nresult.\$1 != null',
    );
    final s$54 = State('def ');
    final r$73 = r$69(s$54) as dynamic;
    expect(
      r$73,
      isNotNull,
      reason:
          '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'def \'\nresult != null',
    );
    expect(
      s$54.position,
      4,
      reason:
          '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'def \'\nstate.position = 4',
    );
    expect(
      r$73.$1,
      'def',
      reason:
          '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'def \'\nresult.\$1 != \'def\'',
    );
    final s$55 = State('def ');
    final r$74 = r$70(s$55) as dynamic;
    expect(
      r$74,
      isNotNull,
      reason:
          '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'def \'\nresult != null',
    );
    expect(
      s$55.position,
      4,
      reason:
          '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'def \'\nstate.position = 4',
    );
    expect(
      r$74.$1,
      null,
      reason:
          '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'def \'\nresult.\$1 != null',
    );
    final s$56 = State('');
    final r$75 = r$69(s$56) as dynamic;
    expect(
      r$75,
      isNull,
      reason:
          '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'\'\nresult == null',
    );
    expect(
      s$56.farthestPosition,
      0,
      reason:
          '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$56.position,
      0,
      reason:
          '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'\'\nstate.position = 0',
    );
    final e$24 = s$56.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$24.length,
      1,
      reason: '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'\'\nerror count',
    );
    expect(e$24, [
      '(end: 0, message: Expected: \'abc\', \'def\', start: 0)',
    ], reason: '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'\'\nerrors');
    final s$57 = State('');
    final r$76 = r$70(s$57) as dynamic;
    expect(
      r$76,
      isNull,
      reason:
          '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'\'\nresult == null',
    );
    expect(
      s$57.farthestPosition,
      0,
      reason:
          '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$57.position,
      0,
      reason:
          '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'\'\nstate.position = 0',
    );
    final e$25 = s$57.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$25.length,
      1,
      reason: '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'\'\nerror count',
    );
    expect(e$25, [
      '(end: 0, message: Expected: \'abc\', \'def\', start: 0)',
    ], reason: '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'\'\nerrors');
    final s$58 = State('a');
    final r$77 = r$69(s$58) as dynamic;
    expect(
      r$77,
      isNull,
      reason:
          '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'a\'\nresult == null',
    );
    expect(
      s$58.farthestPosition,
      0,
      reason:
          '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(
      s$58.position,
      0,
      reason:
          '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'a\'\nstate.position = 0',
    );
    final e$26 = s$58.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$26.length,
      1,
      reason: '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'a\'\nerror count',
    );
    expect(e$26, [
      '(end: 0, message: Expected: \'abc\', \'def\', start: 0)',
    ], reason: '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'a\'\nerrors');
    final s$59 = State('a');
    final r$78 = r$70(s$59) as dynamic;
    expect(
      r$78,
      isNull,
      reason:
          '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'a\'\nresult == null',
    );
    expect(
      s$59.farthestPosition,
      0,
      reason:
          '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(
      s$59.position,
      0,
      reason:
          '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'a\'\nstate.position = 0',
    );
    final e$27 = s$59.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$27.length,
      1,
      reason: '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'a\'\nerror count',
    );
    expect(e$27, [
      '(end: 0, message: Expected: \'abc\', \'def\', start: 0)',
    ], reason: '\$ = (\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'a\'\nerrors');
    final r$79 = parser.parseLiteral10;
    final s$60 = State('abc ');
    final r$80 = r$79(s$60) as dynamic;
    expect(
      r$80,
      isNotNull,
      reason:
          '(\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'abc \'\nresult != null',
    );
    expect(
      s$60.position,
      4,
      reason:
          '(\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'abc \'\nstate.position = 4',
    );
    expect(
      r$80.$1,
      null,
      reason:
          '(\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'abc \'\nresult.\$1 != null',
    );
    final s$61 = State('def ');
    final r$81 = r$79(s$61) as dynamic;
    expect(
      r$81,
      isNotNull,
      reason:
          '(\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'def \'\nresult != null',
    );
    expect(
      s$61.position,
      4,
      reason:
          '(\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'def \'\nstate.position = 4',
    );
    expect(
      r$81.$1,
      null,
      reason:
          '(\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'def \'\nresult.\$1 != null',
    );
    final s$62 = State('');
    final r$82 = r$79(s$62) as dynamic;
    expect(
      r$82,
      isNull,
      reason: '(\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'\'\nresult == null',
    );
    expect(
      s$62.farthestPosition,
      0,
      reason:
          '(\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$62.position,
      0,
      reason:
          '(\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'\'\nstate.position = 0',
    );
    final e$28 = s$62.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$28.length,
      1,
      reason: '(\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'\'\nerror count',
    );
    expect(e$28, [
      '(end: 0, message: Expected: \'abc\', \'def\', start: 0)',
    ], reason: '(\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'\'\nerrors');
    final s$63 = State('a');
    final r$83 = r$79(s$63) as dynamic;
    expect(
      r$83,
      isNull,
      reason: '(\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'a\'\nresult == null',
    );
    expect(
      s$63.farthestPosition,
      0,
      reason:
          '(\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(
      s$63.position,
      0,
      reason:
          '(\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'a\'\nstate.position = 0',
    );
    final e$29 = s$63.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$29.length,
      1,
      reason: '(\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'a\'\nerror count',
    );
    expect(e$29, [
      '(end: 0, message: Expected: \'abc\', \'def\', start: 0)',
    ], reason: '(\n  \'abc\'\n  ---\n  \'def\'\n)\n[ ]\n\'a\'\nerrors');
  });

  test('Match', () {
    final r$ = parser.parseMatch0;
    final r$1 = parser.parseMatchVoid0;
    final s$ = State('for');
    final r$2 = r$(s$) as dynamic;
    expect(r$2, isNotNull, reason: '@match(\'for\')\n\'for\'\nresult != null');
    expect(
      s$.position,
      3,
      reason: '@match(\'for\')\n\'for\'\nstate.position = 3',
    );
    expect(
      r$2.$1,
      'for',
      reason: '@match(\'for\')\n\'for\'\nresult.\$1 != \'for\'',
    );
    final s$1 = State('for');
    final r$3 = r$1(s$1) as dynamic;
    expect(r$3, isNotNull, reason: '@match(\'for\')\n\'for\'\nresult != null');
    expect(
      s$1.position,
      3,
      reason: '@match(\'for\')\n\'for\'\nstate.position = 3',
    );
    expect(
      r$3.$1,
      null,
      reason: '@match(\'for\')\n\'for\'\nresult.\$1 != null',
    );
    final s$2 = State('FOR');
    final r$4 = r$(s$2) as dynamic;
    expect(r$4, isNotNull, reason: '@match(\'for\')\n\'FOR\'\nresult != null');
    expect(
      s$2.position,
      3,
      reason: '@match(\'for\')\n\'FOR\'\nstate.position = 3',
    );
    expect(
      r$4.$1,
      'FOR',
      reason: '@match(\'for\')\n\'FOR\'\nresult.\$1 != \'FOR\'',
    );
    final s$3 = State('FOR');
    final r$5 = r$1(s$3) as dynamic;
    expect(r$5, isNotNull, reason: '@match(\'for\')\n\'FOR\'\nresult != null');
    expect(
      s$3.position,
      3,
      reason: '@match(\'for\')\n\'FOR\'\nstate.position = 3',
    );
    expect(
      r$5.$1,
      null,
      reason: '@match(\'for\')\n\'FOR\'\nresult.\$1 != null',
    );
    final s$4 = State('For');
    final r$6 = r$(s$4) as dynamic;
    expect(r$6, isNotNull, reason: '@match(\'for\')\n\'For\'\nresult != null');
    expect(
      s$4.position,
      3,
      reason: '@match(\'for\')\n\'For\'\nstate.position = 3',
    );
    expect(
      r$6.$1,
      'For',
      reason: '@match(\'for\')\n\'For\'\nresult.\$1 != \'For\'',
    );
    final s$5 = State('For');
    final r$7 = r$1(s$5) as dynamic;
    expect(r$7, isNotNull, reason: '@match(\'for\')\n\'For\'\nresult != null');
    expect(
      s$5.position,
      3,
      reason: '@match(\'for\')\n\'For\'\nstate.position = 3',
    );
    expect(
      r$7.$1,
      null,
      reason: '@match(\'for\')\n\'For\'\nresult.\$1 != null',
    );
    final s$6 = State('fOr');
    final r$8 = r$(s$6) as dynamic;
    expect(r$8, isNotNull, reason: '@match(\'for\')\n\'fOr\'\nresult != null');
    expect(
      s$6.position,
      3,
      reason: '@match(\'for\')\n\'fOr\'\nstate.position = 3',
    );
    expect(
      r$8.$1,
      'fOr',
      reason: '@match(\'for\')\n\'fOr\'\nresult.\$1 != \'fOr\'',
    );
    final s$7 = State('fOr');
    final r$9 = r$1(s$7) as dynamic;
    expect(r$9, isNotNull, reason: '@match(\'for\')\n\'fOr\'\nresult != null');
    expect(
      s$7.position,
      3,
      reason: '@match(\'for\')\n\'fOr\'\nstate.position = 3',
    );
    expect(
      r$9.$1,
      null,
      reason: '@match(\'for\')\n\'fOr\'\nresult.\$1 != null',
    );
    final s$8 = State('foR');
    final r$10 = r$(s$8) as dynamic;
    expect(r$10, isNotNull, reason: '@match(\'for\')\n\'foR\'\nresult != null');
    expect(
      s$8.position,
      3,
      reason: '@match(\'for\')\n\'foR\'\nstate.position = 3',
    );
    expect(
      r$10.$1,
      'foR',
      reason: '@match(\'for\')\n\'foR\'\nresult.\$1 != \'foR\'',
    );
    final s$9 = State('foR');
    final r$11 = r$1(s$9) as dynamic;
    expect(r$11, isNotNull, reason: '@match(\'for\')\n\'foR\'\nresult != null');
    expect(
      s$9.position,
      3,
      reason: '@match(\'for\')\n\'foR\'\nstate.position = 3',
    );
    expect(
      r$11.$1,
      null,
      reason: '@match(\'for\')\n\'foR\'\nresult.\$1 != null',
    );
    final s$10 = State('');
    final r$12 = r$(s$10) as dynamic;
    expect(r$12, isNull, reason: '@match(\'for\')\n\'\'\nresult == null');
    expect(
      s$10.farthestPosition,
      0,
      reason: '@match(\'for\')\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$10.position,
      0,
      reason: '@match(\'for\')\n\'\'\nstate.position = 0',
    );
    final e$ = s$10.getErrors().map((e) => '$e').toList()..sort();
    expect(e$.length, 1, reason: '@match(\'for\')\n\'\'\nerror count');
    expect(e$, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@match(\'for\')\n\'\'\nerrors');
    final s$11 = State('');
    final r$13 = r$1(s$11) as dynamic;
    expect(r$13, isNull, reason: '@match(\'for\')\n\'\'\nresult == null');
    expect(
      s$11.farthestPosition,
      0,
      reason: '@match(\'for\')\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$11.position,
      0,
      reason: '@match(\'for\')\n\'\'\nstate.position = 0',
    );
    final e$1 = s$11.getErrors().map((e) => '$e').toList()..sort();
    expect(e$1.length, 1, reason: '@match(\'for\')\n\'\'\nerror count');
    expect(e$1, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@match(\'for\')\n\'\'\nerrors');
    final s$12 = State('fo');
    final r$14 = r$(s$12) as dynamic;
    expect(r$14, isNull, reason: '@match(\'for\')\n\'fo\'\nresult == null');
    expect(
      s$12.farthestPosition,
      0,
      reason: '@match(\'for\')\n\'fo\'\nstate.farthestPosition = 0',
    );
    expect(
      s$12.position,
      0,
      reason: '@match(\'for\')\n\'fo\'\nstate.position = 0',
    );
    final e$2 = s$12.getErrors().map((e) => '$e').toList()..sort();
    expect(e$2.length, 1, reason: '@match(\'for\')\n\'fo\'\nerror count');
    expect(e$2, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@match(\'for\')\n\'fo\'\nerrors');
    final s$13 = State('fo');
    final r$15 = r$1(s$13) as dynamic;
    expect(r$15, isNull, reason: '@match(\'for\')\n\'fo\'\nresult == null');
    expect(
      s$13.farthestPosition,
      0,
      reason: '@match(\'for\')\n\'fo\'\nstate.farthestPosition = 0',
    );
    expect(
      s$13.position,
      0,
      reason: '@match(\'for\')\n\'fo\'\nstate.position = 0',
    );
    final e$3 = s$13.getErrors().map((e) => '$e').toList()..sort();
    expect(e$3.length, 1, reason: '@match(\'for\')\n\'fo\'\nerror count');
    expect(e$3, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@match(\'for\')\n\'fo\'\nerrors');
    final r$16 = parser.parseMatch1;
    final r$17 = parser.parseMatchVoid1;
    final s$14 = State('for');
    final r$18 = r$16(s$14) as dynamic;
    expect(r$18, isNotNull, reason: '@match(\'FOR\')\n\'for\'\nresult != null');
    expect(
      s$14.position,
      3,
      reason: '@match(\'FOR\')\n\'for\'\nstate.position = 3',
    );
    expect(
      r$18.$1,
      'for',
      reason: '@match(\'FOR\')\n\'for\'\nresult.\$1 != \'for\'',
    );
    final s$15 = State('for');
    final r$19 = r$17(s$15) as dynamic;
    expect(r$19, isNotNull, reason: '@match(\'FOR\')\n\'for\'\nresult != null');
    expect(
      s$15.position,
      3,
      reason: '@match(\'FOR\')\n\'for\'\nstate.position = 3',
    );
    expect(
      r$19.$1,
      null,
      reason: '@match(\'FOR\')\n\'for\'\nresult.\$1 != null',
    );
    final s$16 = State('FOR');
    final r$20 = r$16(s$16) as dynamic;
    expect(r$20, isNotNull, reason: '@match(\'FOR\')\n\'FOR\'\nresult != null');
    expect(
      s$16.position,
      3,
      reason: '@match(\'FOR\')\n\'FOR\'\nstate.position = 3',
    );
    expect(
      r$20.$1,
      'FOR',
      reason: '@match(\'FOR\')\n\'FOR\'\nresult.\$1 != \'FOR\'',
    );
    final s$17 = State('FOR');
    final r$21 = r$17(s$17) as dynamic;
    expect(r$21, isNotNull, reason: '@match(\'FOR\')\n\'FOR\'\nresult != null');
    expect(
      s$17.position,
      3,
      reason: '@match(\'FOR\')\n\'FOR\'\nstate.position = 3',
    );
    expect(
      r$21.$1,
      null,
      reason: '@match(\'FOR\')\n\'FOR\'\nresult.\$1 != null',
    );
    final s$18 = State('For');
    final r$22 = r$16(s$18) as dynamic;
    expect(r$22, isNotNull, reason: '@match(\'FOR\')\n\'For\'\nresult != null');
    expect(
      s$18.position,
      3,
      reason: '@match(\'FOR\')\n\'For\'\nstate.position = 3',
    );
    expect(
      r$22.$1,
      'For',
      reason: '@match(\'FOR\')\n\'For\'\nresult.\$1 != \'For\'',
    );
    final s$19 = State('For');
    final r$23 = r$17(s$19) as dynamic;
    expect(r$23, isNotNull, reason: '@match(\'FOR\')\n\'For\'\nresult != null');
    expect(
      s$19.position,
      3,
      reason: '@match(\'FOR\')\n\'For\'\nstate.position = 3',
    );
    expect(
      r$23.$1,
      null,
      reason: '@match(\'FOR\')\n\'For\'\nresult.\$1 != null',
    );
    final s$20 = State('fOr');
    final r$24 = r$16(s$20) as dynamic;
    expect(r$24, isNotNull, reason: '@match(\'FOR\')\n\'fOr\'\nresult != null');
    expect(
      s$20.position,
      3,
      reason: '@match(\'FOR\')\n\'fOr\'\nstate.position = 3',
    );
    expect(
      r$24.$1,
      'fOr',
      reason: '@match(\'FOR\')\n\'fOr\'\nresult.\$1 != \'fOr\'',
    );
    final s$21 = State('fOr');
    final r$25 = r$17(s$21) as dynamic;
    expect(r$25, isNotNull, reason: '@match(\'FOR\')\n\'fOr\'\nresult != null');
    expect(
      s$21.position,
      3,
      reason: '@match(\'FOR\')\n\'fOr\'\nstate.position = 3',
    );
    expect(
      r$25.$1,
      null,
      reason: '@match(\'FOR\')\n\'fOr\'\nresult.\$1 != null',
    );
    final s$22 = State('foR');
    final r$26 = r$16(s$22) as dynamic;
    expect(r$26, isNotNull, reason: '@match(\'FOR\')\n\'foR\'\nresult != null');
    expect(
      s$22.position,
      3,
      reason: '@match(\'FOR\')\n\'foR\'\nstate.position = 3',
    );
    expect(
      r$26.$1,
      'foR',
      reason: '@match(\'FOR\')\n\'foR\'\nresult.\$1 != \'foR\'',
    );
    final s$23 = State('foR');
    final r$27 = r$17(s$23) as dynamic;
    expect(r$27, isNotNull, reason: '@match(\'FOR\')\n\'foR\'\nresult != null');
    expect(
      s$23.position,
      3,
      reason: '@match(\'FOR\')\n\'foR\'\nstate.position = 3',
    );
    expect(
      r$27.$1,
      null,
      reason: '@match(\'FOR\')\n\'foR\'\nresult.\$1 != null',
    );
    final s$24 = State('');
    final r$28 = r$16(s$24) as dynamic;
    expect(r$28, isNull, reason: '@match(\'FOR\')\n\'\'\nresult == null');
    expect(
      s$24.farthestPosition,
      0,
      reason: '@match(\'FOR\')\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$24.position,
      0,
      reason: '@match(\'FOR\')\n\'\'\nstate.position = 0',
    );
    final e$4 = s$24.getErrors().map((e) => '$e').toList()..sort();
    expect(e$4.length, 1, reason: '@match(\'FOR\')\n\'\'\nerror count');
    expect(e$4, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@match(\'FOR\')\n\'\'\nerrors');
    final s$25 = State('');
    final r$29 = r$17(s$25) as dynamic;
    expect(r$29, isNull, reason: '@match(\'FOR\')\n\'\'\nresult == null');
    expect(
      s$25.farthestPosition,
      0,
      reason: '@match(\'FOR\')\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$25.position,
      0,
      reason: '@match(\'FOR\')\n\'\'\nstate.position = 0',
    );
    final e$5 = s$25.getErrors().map((e) => '$e').toList()..sort();
    expect(e$5.length, 1, reason: '@match(\'FOR\')\n\'\'\nerror count');
    expect(e$5, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@match(\'FOR\')\n\'\'\nerrors');
    final s$26 = State('fo');
    final r$30 = r$16(s$26) as dynamic;
    expect(r$30, isNull, reason: '@match(\'FOR\')\n\'fo\'\nresult == null');
    expect(
      s$26.farthestPosition,
      0,
      reason: '@match(\'FOR\')\n\'fo\'\nstate.farthestPosition = 0',
    );
    expect(
      s$26.position,
      0,
      reason: '@match(\'FOR\')\n\'fo\'\nstate.position = 0',
    );
    final e$6 = s$26.getErrors().map((e) => '$e').toList()..sort();
    expect(e$6.length, 1, reason: '@match(\'FOR\')\n\'fo\'\nerror count');
    expect(e$6, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@match(\'FOR\')\n\'fo\'\nerrors');
    final s$27 = State('fo');
    final r$31 = r$17(s$27) as dynamic;
    expect(r$31, isNull, reason: '@match(\'FOR\')\n\'fo\'\nresult == null');
    expect(
      s$27.farthestPosition,
      0,
      reason: '@match(\'FOR\')\n\'fo\'\nstate.farthestPosition = 0',
    );
    expect(
      s$27.position,
      0,
      reason: '@match(\'FOR\')\n\'fo\'\nstate.position = 0',
    );
    final e$7 = s$27.getErrors().map((e) => '$e').toList()..sort();
    expect(e$7.length, 1, reason: '@match(\'FOR\')\n\'fo\'\nerror count');
    expect(e$7, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@match(\'FOR\')\n\'fo\'\nerrors');
    final r$32 = parser.parseMatch2;
    final r$33 = parser.parseMatchVoid2;
    final s$28 = State('FOR');
    final r$34 = r$32(s$28) as dynamic;
    expect(
      r$34,
      isNotNull,
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'FOR\'\nresult != null',
    );
    expect(
      s$28.position,
      3,
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'FOR\'\nstate.position = 3',
    );
    expect(
      r$34.$1,
      'FOR',
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'FOR\'\nresult.\$1 != \'FOR\'',
    );
    final s$29 = State('FOR');
    final r$35 = r$33(s$29) as dynamic;
    expect(
      r$35,
      isNotNull,
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'FOR\'\nresult != null',
    );
    expect(
      s$29.position,
      3,
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'FOR\'\nstate.position = 3',
    );
    expect(
      r$35.$1,
      null,
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'FOR\'\nresult.\$1 != null',
    );
    final s$30 = State('');
    final r$36 = r$32(s$30) as dynamic;
    expect(
      r$36,
      isNull,
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'\'\nresult == null',
    );
    expect(
      s$30.farthestPosition,
      0,
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$30.position,
      0,
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'\'\nstate.position = 0',
    );
    final e$8 = s$30.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$8.length,
      1,
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'\'\nerror count',
    );
    expect(
      e$8,
      ['(end: 0, message: Expected: \'for\', start: 0)'],
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'\'\nerrors',
    );
    final s$31 = State('');
    final r$37 = r$33(s$31) as dynamic;
    expect(
      r$37,
      isNull,
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'\'\nresult == null',
    );
    expect(
      s$31.farthestPosition,
      0,
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$31.position,
      0,
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'\'\nstate.position = 0',
    );
    final e$9 = s$31.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$9.length,
      1,
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'\'\nerror count',
    );
    expect(
      e$9,
      ['(end: 0, message: Expected: \'for\', start: 0)'],
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'\'\nerrors',
    );
    final s$32 = State('fo');
    final r$38 = r$32(s$32) as dynamic;
    expect(
      r$38,
      isNull,
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'fo\'\nresult == null',
    );
    expect(
      s$32.farthestPosition,
      0,
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'fo\'\nstate.farthestPosition = 0',
    );
    expect(
      s$32.position,
      0,
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'fo\'\nstate.position = 0',
    );
    final e$10 = s$32.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$10.length,
      1,
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'fo\'\nerror count',
    );
    expect(
      e$10,
      ['(end: 0, message: Expected: \'for\', start: 0)'],
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'fo\'\nerrors',
    );
    final s$33 = State('fo');
    final r$39 = r$33(s$33) as dynamic;
    expect(
      r$39,
      isNull,
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'fo\'\nresult == null',
    );
    expect(
      s$33.farthestPosition,
      0,
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'fo\'\nstate.farthestPosition = 0',
    );
    expect(
      s$33.position,
      0,
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'fo\'\nstate.position = 0',
    );
    final e$11 = s$33.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$11.length,
      1,
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'fo\'\nerror count',
    );
    expect(
      e$11,
      ['(end: 0, message: Expected: \'for\', start: 0)'],
      reason:
          '@match(\'for\')\n~{ state.errorExpected(\'for\'); }\n\'fo\'\nerrors',
    );
    final r$40 = parser.parseMatch3;
    final s$34 = State('for');
    final r$41 = r$40(s$34) as dynamic;
    expect(
      r$41,
      isNotNull,
      reason: '& @match(\'for\')\n\'for\'\nresult != null',
    );
    expect(
      s$34.position,
      0,
      reason: '& @match(\'for\')\n\'for\'\nstate.position = 0',
    );
    expect(
      r$41.$1,
      null,
      reason: '& @match(\'for\')\n\'for\'\nresult.\$1 != null',
    );
    final s$35 = State('');
    final r$42 = r$40(s$35) as dynamic;
    expect(r$42, isNull, reason: '& @match(\'for\')\n\'\'\nresult == null');
    expect(
      s$35.farthestPosition,
      0,
      reason: '& @match(\'for\')\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$35.position,
      0,
      reason: '& @match(\'for\')\n\'\'\nstate.position = 0',
    );
    final e$12 = s$35.getErrors().map((e) => '$e').toList()..sort();
    expect(e$12.length, 1, reason: '& @match(\'for\')\n\'\'\nerror count');
    expect(e$12, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '& @match(\'for\')\n\'\'\nerrors');
    final s$36 = State('fo');
    final r$43 = r$40(s$36) as dynamic;
    expect(r$43, isNull, reason: '& @match(\'for\')\n\'fo\'\nresult == null');
    expect(
      s$36.farthestPosition,
      0,
      reason: '& @match(\'for\')\n\'fo\'\nstate.farthestPosition = 0',
    );
    expect(
      s$36.position,
      0,
      reason: '& @match(\'for\')\n\'fo\'\nstate.position = 0',
    );
    final e$13 = s$36.getErrors().map((e) => '$e').toList()..sort();
    expect(e$13.length, 1, reason: '& @match(\'for\')\n\'fo\'\nerror count');
    expect(e$13, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '& @match(\'for\')\n\'fo\'\nerrors');
    final r$44 = parser.parseMatch4;
    final s$37 = State('');
    final r$45 = r$44(s$37) as dynamic;
    expect(r$45, isNotNull, reason: '! @match(\'for\')\n\'\'\nresult != null');
    expect(
      s$37.position,
      0,
      reason: '! @match(\'for\')\n\'\'\nstate.position = 0',
    );
    expect(
      r$45.$1,
      null,
      reason: '! @match(\'for\')\n\'\'\nresult.\$1 != null',
    );
    final s$38 = State('fo');
    final r$46 = r$44(s$38) as dynamic;
    expect(
      r$46,
      isNotNull,
      reason: '! @match(\'for\')\n\'fo\'\nresult != null',
    );
    expect(
      s$38.position,
      0,
      reason: '! @match(\'for\')\n\'fo\'\nstate.position = 0',
    );
    expect(
      r$46.$1,
      null,
      reason: '! @match(\'for\')\n\'fo\'\nresult.\$1 != null',
    );
    final s$39 = State('for');
    final r$47 = r$44(s$39) as dynamic;
    expect(r$47, isNull, reason: '! @match(\'for\')\n\'for\'\nresult == null');
    expect(
      s$39.farthestPosition,
      0,
      reason: '! @match(\'for\')\n\'for\'\nstate.farthestPosition = 0',
    );
    expect(
      s$39.position,
      0,
      reason: '! @match(\'for\')\n\'for\'\nstate.position = 0',
    );
    final e$14 = s$39.getErrors().map((e) => '$e').toList()..sort();
    expect(e$14.length, 1, reason: '! @match(\'for\')\n\'for\'\nerror count');
    expect(e$14, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '! @match(\'for\')\n\'for\'\nerrors');
    final r$48 = parser.parseMatch5;
    final r$49 = parser.parseMatchVoid5;
    final s$40 = State('FOR');
    final r$50 = r$48(s$40) as dynamic;
    expect(
      r$50,
      isNotNull,
      reason:
          '@match(\'for\')\n---\n@match(\'while\')\n\'FOR\'\nresult != null',
    );
    expect(
      s$40.position,
      3,
      reason:
          '@match(\'for\')\n---\n@match(\'while\')\n\'FOR\'\nstate.position = 3',
    );
    expect(
      r$50.$1,
      'FOR',
      reason:
          '@match(\'for\')\n---\n@match(\'while\')\n\'FOR\'\nresult.\$1 != \'FOR\'',
    );
    final s$41 = State('FOR');
    final r$51 = r$49(s$41) as dynamic;
    expect(
      r$51,
      isNotNull,
      reason:
          '@match(\'for\')\n---\n@match(\'while\')\n\'FOR\'\nresult != null',
    );
    expect(
      s$41.position,
      3,
      reason:
          '@match(\'for\')\n---\n@match(\'while\')\n\'FOR\'\nstate.position = 3',
    );
    expect(
      r$51.$1,
      null,
      reason:
          '@match(\'for\')\n---\n@match(\'while\')\n\'FOR\'\nresult.\$1 != null',
    );
    final s$42 = State('WHILE');
    final r$52 = r$48(s$42) as dynamic;
    expect(
      r$52,
      isNotNull,
      reason:
          '@match(\'for\')\n---\n@match(\'while\')\n\'WHILE\'\nresult != null',
    );
    expect(
      s$42.position,
      5,
      reason:
          '@match(\'for\')\n---\n@match(\'while\')\n\'WHILE\'\nstate.position = 5',
    );
    expect(
      r$52.$1,
      'WHILE',
      reason:
          '@match(\'for\')\n---\n@match(\'while\')\n\'WHILE\'\nresult.\$1 != \'WHILE\'',
    );
    final s$43 = State('WHILE');
    final r$53 = r$49(s$43) as dynamic;
    expect(
      r$53,
      isNotNull,
      reason:
          '@match(\'for\')\n---\n@match(\'while\')\n\'WHILE\'\nresult != null',
    );
    expect(
      s$43.position,
      5,
      reason:
          '@match(\'for\')\n---\n@match(\'while\')\n\'WHILE\'\nstate.position = 5',
    );
    expect(
      r$53.$1,
      null,
      reason:
          '@match(\'for\')\n---\n@match(\'while\')\n\'WHILE\'\nresult.\$1 != null',
    );
    final s$44 = State('');
    final r$54 = r$48(s$44) as dynamic;
    expect(
      r$54,
      isNull,
      reason: '@match(\'for\')\n---\n@match(\'while\')\n\'\'\nresult == null',
    );
    expect(
      s$44.farthestPosition,
      0,
      reason:
          '@match(\'for\')\n---\n@match(\'while\')\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$44.position,
      0,
      reason:
          '@match(\'for\')\n---\n@match(\'while\')\n\'\'\nstate.position = 0',
    );
    final e$15 = s$44.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$15.length,
      1,
      reason: '@match(\'for\')\n---\n@match(\'while\')\n\'\'\nerror count',
    );
    expect(e$15, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@match(\'for\')\n---\n@match(\'while\')\n\'\'\nerrors');
    final s$45 = State('');
    final r$55 = r$49(s$45) as dynamic;
    expect(
      r$55,
      isNull,
      reason: '@match(\'for\')\n---\n@match(\'while\')\n\'\'\nresult == null',
    );
    expect(
      s$45.farthestPosition,
      0,
      reason:
          '@match(\'for\')\n---\n@match(\'while\')\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$45.position,
      0,
      reason:
          '@match(\'for\')\n---\n@match(\'while\')\n\'\'\nstate.position = 0',
    );
    final e$16 = s$45.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$16.length,
      1,
      reason: '@match(\'for\')\n---\n@match(\'while\')\n\'\'\nerror count',
    );
    expect(e$16, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@match(\'for\')\n---\n@match(\'while\')\n\'\'\nerrors');
    final r$56 = parser.parseMatch6;
    final r$57 = parser.parseMatchVoid6;
    final s$46 = State('FOR ');
    final r$58 = r$56(s$46) as dynamic;
    expect(
      r$58,
      isNotNull,
      reason:
          '\$ = (\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'FOR \'\nresult != null',
    );
    expect(
      s$46.position,
      4,
      reason:
          '\$ = (\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'FOR \'\nstate.position = 4',
    );
    expect(
      r$58.$1,
      'FOR',
      reason:
          '\$ = (\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'FOR \'\nresult.\$1 != \'FOR\'',
    );
    final s$47 = State('FOR ');
    final r$59 = r$57(s$47) as dynamic;
    expect(
      r$59,
      isNotNull,
      reason:
          '\$ = (\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'FOR \'\nresult != null',
    );
    expect(
      s$47.position,
      4,
      reason:
          '\$ = (\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'FOR \'\nstate.position = 4',
    );
    expect(
      r$59.$1,
      null,
      reason:
          '\$ = (\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'FOR \'\nresult.\$1 != null',
    );
    final s$48 = State('WHILE ');
    final r$60 = r$56(s$48) as dynamic;
    expect(
      r$60,
      isNotNull,
      reason:
          '\$ = (\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'WHILE \'\nresult != null',
    );
    expect(
      s$48.position,
      6,
      reason:
          '\$ = (\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'WHILE \'\nstate.position = 6',
    );
    expect(
      r$60.$1,
      'WHILE',
      reason:
          '\$ = (\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'WHILE \'\nresult.\$1 != \'WHILE\'',
    );
    final s$49 = State('WHILE ');
    final r$61 = r$57(s$49) as dynamic;
    expect(
      r$61,
      isNotNull,
      reason:
          '\$ = (\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'WHILE \'\nresult != null',
    );
    expect(
      s$49.position,
      6,
      reason:
          '\$ = (\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'WHILE \'\nstate.position = 6',
    );
    expect(
      r$61.$1,
      null,
      reason:
          '\$ = (\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'WHILE \'\nresult.\$1 != null',
    );
    final s$50 = State('');
    final r$62 = r$56(s$50) as dynamic;
    expect(
      r$62,
      isNull,
      reason:
          '\$ = (\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'\'\nresult == null',
    );
    expect(
      s$50.farthestPosition,
      0,
      reason:
          '\$ = (\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$50.position,
      0,
      reason:
          '\$ = (\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'\'\nstate.position = 0',
    );
    final e$17 = s$50.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$17.length,
      1,
      reason:
          '\$ = (\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'\'\nerror count',
    );
    expect(
      e$17,
      ['(end: 0, message: Syntax error, start: 0)'],
      reason:
          '\$ = (\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'\'\nerrors',
    );
    final s$51 = State('');
    final r$63 = r$57(s$51) as dynamic;
    expect(
      r$63,
      isNull,
      reason:
          '\$ = (\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'\'\nresult == null',
    );
    expect(
      s$51.farthestPosition,
      0,
      reason:
          '\$ = (\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$51.position,
      0,
      reason:
          '\$ = (\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'\'\nstate.position = 0',
    );
    final e$18 = s$51.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$18.length,
      1,
      reason:
          '\$ = (\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'\'\nerror count',
    );
    expect(
      e$18,
      ['(end: 0, message: Syntax error, start: 0)'],
      reason:
          '\$ = (\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'\'\nerrors',
    );
    final r$64 = parser.parseMatch7;
    final s$52 = State('FOR ');
    final r$65 = r$64(s$52) as dynamic;
    expect(
      r$65,
      isNotNull,
      reason:
          '(\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'FOR \'\nresult != null',
    );
    expect(
      s$52.position,
      4,
      reason:
          '(\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'FOR \'\nstate.position = 4',
    );
    expect(
      r$65.$1,
      null,
      reason:
          '(\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'FOR \'\nresult.\$1 != null',
    );
    final s$53 = State('WHILE ');
    final r$66 = r$64(s$53) as dynamic;
    expect(
      r$66,
      isNotNull,
      reason:
          '(\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'WHILE \'\nresult != null',
    );
    expect(
      s$53.position,
      6,
      reason:
          '(\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'WHILE \'\nstate.position = 6',
    );
    expect(
      r$66.$1,
      null,
      reason:
          '(\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'WHILE \'\nresult.\$1 != null',
    );
    final s$54 = State('');
    final r$67 = r$64(s$54) as dynamic;
    expect(
      r$67,
      isNull,
      reason:
          '(\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'\'\nresult == null',
    );
    expect(
      s$54.farthestPosition,
      0,
      reason:
          '(\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$54.position,
      0,
      reason:
          '(\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'\'\nstate.position = 0',
    );
    final e$19 = s$54.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$19.length,
      1,
      reason:
          '(\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'\'\nerror count',
    );
    expect(
      e$19,
      ['(end: 0, message: Syntax error, start: 0)'],
      reason:
          '(\n  @match(\'for\')\n  ---\n  @match(\'while\')\n)\n[ ]\n\'\'\nerrors',
    );
  });

  test('NotPredicate', () {
    final r$ = parser.parseNotPredicate0;
    final r$1 = parser.parseNotPredicateVoid0;
    final s$ = State('ab');
    final r$2 = r$(s$) as dynamic;
    expect(
      r$2,
      isNotNull,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'ab\'\nresult != null',
    );
    expect(
      s$.position,
      2,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'ab\'\nstate.position = 2',
    );
    expect(
      r$2.$1,
      'ab',
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'ab\'\nresult.\$1 != \'ab\'',
    );
    final s$1 = State('ab');
    final r$3 = r$1(s$1) as dynamic;
    expect(
      r$3,
      isNotNull,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'ab\'\nresult != null',
    );
    expect(
      s$1.position,
      2,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'ab\'\nstate.position = 2',
    );
    expect(
      r$3.$1,
      null,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'ab\'\nresult.\$1 != null',
    );
    final s$2 = State('abc');
    final r$4 = r$(s$2) as dynamic;
    expect(
      r$4,
      isNull,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'abc\'\nresult == null',
    );
    expect(
      s$2.farthestPosition,
      0,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'abc\'\nstate.farthestPosition = 0',
    );
    expect(
      s$2.position,
      0,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'abc\'\nstate.position = 0',
    );
    final e$ = s$2.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$.length,
      1,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'abc\'\nerror count',
    );
    expect(e$, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '! \'abc\'\n\$ = \'ab\'\n\n\'abc\'\nerrors');
    final s$3 = State('abc');
    final r$5 = r$1(s$3) as dynamic;
    expect(
      r$5,
      isNull,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'abc\'\nresult == null',
    );
    expect(
      s$3.farthestPosition,
      0,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'abc\'\nstate.farthestPosition = 0',
    );
    expect(
      s$3.position,
      0,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'abc\'\nstate.position = 0',
    );
    final e$1 = s$3.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$1.length,
      1,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'abc\'\nerror count',
    );
    expect(e$1, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '! \'abc\'\n\$ = \'ab\'\n\n\'abc\'\nerrors');
    final r$6 = parser.parseNotPredicate1;
    final r$7 = parser.parseNotPredicateVoid1;
    final s$4 = State('abc');
    final r$8 = r$6(s$4) as dynamic;
    expect(
      r$8,
      isNotNull,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc\'\nresult != null',
    );
    expect(
      s$4.position,
      3,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc\'\nstate.position = 3',
    );
    expect(
      r$8.$1,
      'abc',
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc\'\nresult.\$1 != \'abc\'',
    );
    final s$5 = State('abc');
    final r$9 = r$7(s$5) as dynamic;
    expect(
      r$9,
      isNotNull,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc\'\nresult != null',
    );
    expect(
      s$5.position,
      3,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc\'\nstate.position = 3',
    );
    expect(
      r$9.$1,
      null,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc\'\nresult.\$1 != null',
    );
    final s$6 = State('abc=>');
    final r$10 = r$6(s$6) as dynamic;
    expect(
      r$10,
      isNull,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc=>\'\nresult == null',
    );
    expect(
      s$6.farthestPosition,
      3,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc=>\'\nstate.farthestPosition = 3',
    );
    expect(
      s$6.position,
      0,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc=>\'\nstate.position = 0',
    );
    final e$2 = s$6.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$2.length,
      1,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc=>\'\nerror count',
    );
    expect(e$2, [
      '(end: 3, message: Syntax error, start: 3)',
    ], reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc=>\'\nerrors');
    final s$7 = State('abc=>');
    final r$11 = r$7(s$7) as dynamic;
    expect(
      r$11,
      isNull,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc=>\'\nresult == null',
    );
    expect(
      s$7.farthestPosition,
      3,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc=>\'\nstate.farthestPosition = 3',
    );
    expect(
      s$7.position,
      0,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc=>\'\nstate.position = 0',
    );
    final e$3 = s$7.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$3.length,
      1,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc=>\'\nerror count',
    );
    expect(e$3, [
      '(end: 3, message: Syntax error, start: 3)',
    ], reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc=>\'\nerrors');
    final r$12 = parser.parseNotPredicate2;
    final r$13 = parser.parseNotPredicateVoid2;
    final s$8 = State('');
    final r$14 = r$12(s$8) as dynamic;
    expect(
      r$14,
      isNotNull,
      reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'\'\nresult != null',
    );
    expect(
      s$8.position,
      0,
      reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'\'\nstate.position = 0',
    );
    expect(
      r$14.$1,
      <int>[],
      reason:
          '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'\'\nresult.\$1 != <int>[]',
    );
    final s$9 = State('');
    final r$15 = r$13(s$9) as dynamic;
    expect(
      r$15,
      isNotNull,
      reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'\'\nresult != null',
    );
    expect(
      s$9.position,
      0,
      reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'\'\nstate.position = 0',
    );
    expect(
      r$15.$1,
      null,
      reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'\'\nresult.\$1 != null',
    );
    final s$10 = State('a');
    final r$16 = r$12(s$10) as dynamic;
    expect(
      r$16,
      isNotNull,
      reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'a\'\nresult != null',
    );
    expect(
      s$10.position,
      1,
      reason:
          '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'a\'\nstate.position = 1',
    );
    expect(
      r$16.$1,
      [97],
      reason:
          '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'a\'\nresult.\$1 != [97]',
    );
    final s$11 = State('a');
    final r$17 = r$13(s$11) as dynamic;
    expect(
      r$17,
      isNotNull,
      reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'a\'\nresult != null',
    );
    expect(
      s$11.position,
      1,
      reason:
          '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'a\'\nstate.position = 1',
    );
    expect(
      r$17.$1,
      null,
      reason:
          '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'a\'\nresult.\$1 != null',
    );
    final s$12 = State('aa');
    final r$18 = r$12(s$12) as dynamic;
    expect(
      r$18,
      isNull,
      reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'aa\'\nresult == null',
    );
    expect(
      s$12.farthestPosition,
      0,
      reason:
          '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'aa\'\nstate.farthestPosition = 0',
    );
    expect(
      s$12.position,
      0,
      reason:
          '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'aa\'\nstate.position = 0',
    );
    final e$4 = s$12.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$4.length,
      1,
      reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'aa\'\nerror count',
    );
    expect(e$4, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'aa\'\nerrors');
    final s$13 = State('aa');
    final r$19 = r$13(s$13) as dynamic;
    expect(
      r$19,
      isNull,
      reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'aa\'\nresult == null',
    );
    expect(
      s$13.farthestPosition,
      0,
      reason:
          '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'aa\'\nstate.farthestPosition = 0',
    );
    expect(
      s$13.position,
      0,
      reason:
          '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'aa\'\nstate.position = 0',
    );
    final e$5 = s$13.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$5.length,
      1,
      reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'aa\'\nerror count',
    );
    expect(e$5, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'aa\'\nerrors');
  });

  test('OneOrMore', () {
    final r$ = parser.parseOneOrMore0;
    final r$1 = parser.parseOneOrMoreVoid0;
    final s$ = State('a');
    final r$2 = r$(s$) as dynamic;
    expect(r$2, isNotNull, reason: '[a]+\n\'a\'\nresult != null');
    expect(s$.position, 1, reason: '[a]+\n\'a\'\nstate.position = 1');
    expect(r$2.$1, [97], reason: '[a]+\n\'a\'\nresult.\$1 != [97]');
    final s$1 = State('a');
    final r$3 = r$1(s$1) as dynamic;
    expect(r$3, isNotNull, reason: '[a]+\n\'a\'\nresult != null');
    expect(s$1.position, 1, reason: '[a]+\n\'a\'\nstate.position = 1');
    expect(r$3.$1, null, reason: '[a]+\n\'a\'\nresult.\$1 != null');
    final s$2 = State('aa');
    final r$4 = r$(s$2) as dynamic;
    expect(r$4, isNotNull, reason: '[a]+\n\'aa\'\nresult != null');
    expect(s$2.position, 2, reason: '[a]+\n\'aa\'\nstate.position = 2');
    expect(r$4.$1, [97, 97], reason: '[a]+\n\'aa\'\nresult.\$1 != [97, 97]');
    final s$3 = State('aa');
    final r$5 = r$1(s$3) as dynamic;
    expect(r$5, isNotNull, reason: '[a]+\n\'aa\'\nresult != null');
    expect(s$3.position, 2, reason: '[a]+\n\'aa\'\nstate.position = 2');
    expect(r$5.$1, null, reason: '[a]+\n\'aa\'\nresult.\$1 != null');
    final s$4 = State('');
    final r$6 = r$(s$4) as dynamic;
    expect(r$6, isNull, reason: '[a]+\n\'\'\nresult == null');
    expect(
      s$4.farthestPosition,
      0,
      reason: '[a]+\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$4.position, 0, reason: '[a]+\n\'\'\nstate.position = 0');
    final e$ = s$4.getErrors().map((e) => '$e').toList()..sort();
    expect(e$.length, 1, reason: '[a]+\n\'\'\nerror count');
    expect(e$, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[a]+\n\'\'\nerrors');
    final s$5 = State('');
    final r$7 = r$1(s$5) as dynamic;
    expect(r$7, isNull, reason: '[a]+\n\'\'\nresult == null');
    expect(
      s$5.farthestPosition,
      0,
      reason: '[a]+\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$5.position, 0, reason: '[a]+\n\'\'\nstate.position = 0');
    final e$1 = s$5.getErrors().map((e) => '$e').toList()..sort();
    expect(e$1.length, 1, reason: '[a]+\n\'\'\nerror count');
    expect(e$1, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[a]+\n\'\'\nerrors');
    final s$6 = State('b');
    final r$8 = r$(s$6) as dynamic;
    expect(r$8, isNull, reason: '[a]+\n\'b\'\nresult == null');
    expect(
      s$6.farthestPosition,
      0,
      reason: '[a]+\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(s$6.position, 0, reason: '[a]+\n\'b\'\nstate.position = 0');
    final e$2 = s$6.getErrors().map((e) => '$e').toList()..sort();
    expect(e$2.length, 1, reason: '[a]+\n\'b\'\nerror count');
    expect(e$2, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[a]+\n\'b\'\nerrors');
    final s$7 = State('b');
    final r$9 = r$1(s$7) as dynamic;
    expect(r$9, isNull, reason: '[a]+\n\'b\'\nresult == null');
    expect(
      s$7.farthestPosition,
      0,
      reason: '[a]+\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(s$7.position, 0, reason: '[a]+\n\'b\'\nstate.position = 0');
    final e$3 = s$7.getErrors().map((e) => '$e').toList()..sort();
    expect(e$3.length, 1, reason: '[a]+\n\'b\'\nerror count');
    expect(e$3, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[a]+\n\'b\'\nerrors');
    final r$10 = parser.parseOneOrMore1;
    final r$11 = parser.parseOneOrMoreVoid1;
    final s$8 = State('a');
    final r$12 = r$10(s$8) as dynamic;
    expect(r$12, isNotNull, reason: '([a] / [z])+\n\'a\'\nresult != null');
    expect(s$8.position, 1, reason: '([a] / [z])+\n\'a\'\nstate.position = 1');
    expect(r$12.$1, [97], reason: '([a] / [z])+\n\'a\'\nresult.\$1 != [97]');
    final s$9 = State('a');
    final r$13 = r$11(s$9) as dynamic;
    expect(r$13, isNotNull, reason: '([a] / [z])+\n\'a\'\nresult != null');
    expect(s$9.position, 1, reason: '([a] / [z])+\n\'a\'\nstate.position = 1');
    expect(r$13.$1, null, reason: '([a] / [z])+\n\'a\'\nresult.\$1 != null');
    final s$10 = State('aa');
    final r$14 = r$10(s$10) as dynamic;
    expect(r$14, isNotNull, reason: '([a] / [z])+\n\'aa\'\nresult != null');
    expect(
      s$10.position,
      2,
      reason: '([a] / [z])+\n\'aa\'\nstate.position = 2',
    );
    expect(r$14.$1, [
      97,
      97,
    ], reason: '([a] / [z])+\n\'aa\'\nresult.\$1 != [97, 97]');
    final s$11 = State('aa');
    final r$15 = r$11(s$11) as dynamic;
    expect(r$15, isNotNull, reason: '([a] / [z])+\n\'aa\'\nresult != null');
    expect(
      s$11.position,
      2,
      reason: '([a] / [z])+\n\'aa\'\nstate.position = 2',
    );
    expect(r$15.$1, null, reason: '([a] / [z])+\n\'aa\'\nresult.\$1 != null');
    final s$12 = State('z');
    final r$16 = r$10(s$12) as dynamic;
    expect(r$16, isNotNull, reason: '([a] / [z])+\n\'z\'\nresult != null');
    expect(s$12.position, 1, reason: '([a] / [z])+\n\'z\'\nstate.position = 1');
    expect(r$16.$1, [122], reason: '([a] / [z])+\n\'z\'\nresult.\$1 != [122]');
    final s$13 = State('z');
    final r$17 = r$11(s$13) as dynamic;
    expect(r$17, isNotNull, reason: '([a] / [z])+\n\'z\'\nresult != null');
    expect(s$13.position, 1, reason: '([a] / [z])+\n\'z\'\nstate.position = 1');
    expect(r$17.$1, null, reason: '([a] / [z])+\n\'z\'\nresult.\$1 != null');
    final s$14 = State('za');
    final r$18 = r$10(s$14) as dynamic;
    expect(r$18, isNotNull, reason: '([a] / [z])+\n\'za\'\nresult != null');
    expect(
      s$14.position,
      2,
      reason: '([a] / [z])+\n\'za\'\nstate.position = 2',
    );
    expect(r$18.$1, [
      122,
      97,
    ], reason: '([a] / [z])+\n\'za\'\nresult.\$1 != [122, 97]');
    final s$15 = State('za');
    final r$19 = r$11(s$15) as dynamic;
    expect(r$19, isNotNull, reason: '([a] / [z])+\n\'za\'\nresult != null');
    expect(
      s$15.position,
      2,
      reason: '([a] / [z])+\n\'za\'\nstate.position = 2',
    );
    expect(r$19.$1, null, reason: '([a] / [z])+\n\'za\'\nresult.\$1 != null');
    final s$16 = State('');
    final r$20 = r$10(s$16) as dynamic;
    expect(r$20, isNull, reason: '([a] / [z])+\n\'\'\nresult == null');
    expect(
      s$16.farthestPosition,
      0,
      reason: '([a] / [z])+\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$16.position, 0, reason: '([a] / [z])+\n\'\'\nstate.position = 0');
    final e$4 = s$16.getErrors().map((e) => '$e').toList()..sort();
    expect(e$4.length, 1, reason: '([a] / [z])+\n\'\'\nerror count');
    expect(e$4, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '([a] / [z])+\n\'\'\nerrors');
    final s$17 = State('');
    final r$21 = r$11(s$17) as dynamic;
    expect(r$21, isNull, reason: '([a] / [z])+\n\'\'\nresult == null');
    expect(
      s$17.farthestPosition,
      0,
      reason: '([a] / [z])+\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$17.position, 0, reason: '([a] / [z])+\n\'\'\nstate.position = 0');
    final e$5 = s$17.getErrors().map((e) => '$e').toList()..sort();
    expect(e$5.length, 1, reason: '([a] / [z])+\n\'\'\nerror count');
    expect(e$5, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '([a] / [z])+\n\'\'\nerrors');
    final s$18 = State('b');
    final r$22 = r$10(s$18) as dynamic;
    expect(r$22, isNull, reason: '([a] / [z])+\n\'b\'\nresult == null');
    expect(
      s$18.farthestPosition,
      0,
      reason: '([a] / [z])+\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(s$18.position, 0, reason: '([a] / [z])+\n\'b\'\nstate.position = 0');
    final e$6 = s$18.getErrors().map((e) => '$e').toList()..sort();
    expect(e$6.length, 1, reason: '([a] / [z])+\n\'b\'\nerror count');
    expect(e$6, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '([a] / [z])+\n\'b\'\nerrors');
    final s$19 = State('b');
    final r$23 = r$11(s$19) as dynamic;
    expect(r$23, isNull, reason: '([a] / [z])+\n\'b\'\nresult == null');
    expect(
      s$19.farthestPosition,
      0,
      reason: '([a] / [z])+\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(s$19.position, 0, reason: '([a] / [z])+\n\'b\'\nstate.position = 0');
    final e$7 = s$19.getErrors().map((e) => '$e').toList()..sort();
    expect(e$7.length, 1, reason: '([a] / [z])+\n\'b\'\nerror count');
    expect(e$7, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '([a] / [z])+\n\'b\'\nerrors');
  });

  test('Optional', () {
    final r$ = parser.parseOptional0;
    final r$1 = parser.parseOptionalVoid0;
    final s$ = State('a');
    final r$2 = r$(s$) as dynamic;
    expect(r$2, isNotNull, reason: '[a]?\n\'a\'\nresult != null');
    expect(s$.position, 1, reason: '[a]?\n\'a\'\nstate.position = 1');
    expect(r$2.$1, 97, reason: '[a]?\n\'a\'\nresult.\$1 != 97');
    final s$1 = State('a');
    final r$3 = r$1(s$1) as dynamic;
    expect(r$3, isNotNull, reason: '[a]?\n\'a\'\nresult != null');
    expect(s$1.position, 1, reason: '[a]?\n\'a\'\nstate.position = 1');
    expect(r$3.$1, null, reason: '[a]?\n\'a\'\nresult.\$1 != null');
    final s$2 = State('');
    final r$4 = r$(s$2) as dynamic;
    expect(r$4, isNotNull, reason: '[a]?\n\'\'\nresult != null');
    expect(s$2.position, 0, reason: '[a]?\n\'\'\nstate.position = 0');
    expect(r$4.$1, null, reason: '[a]?\n\'\'\nresult.\$1 != null');
    final s$3 = State('');
    final r$5 = r$1(s$3) as dynamic;
    expect(r$5, isNotNull, reason: '[a]?\n\'\'\nresult != null');
    expect(s$3.position, 0, reason: '[a]?\n\'\'\nstate.position = 0');
    expect(r$5.$1, null, reason: '[a]?\n\'\'\nresult.\$1 != null');
    final r$6 = parser.parseOptional1;
    final r$7 = parser.parseOptionalVoid1;
    final s$4 = State('a');
    final r$8 = r$6(s$4) as dynamic;
    expect(r$8, isNotNull, reason: '([a] / [b])?\n\'a\'\nresult != null');
    expect(s$4.position, 1, reason: '([a] / [b])?\n\'a\'\nstate.position = 1');
    expect(r$8.$1, 97, reason: '([a] / [b])?\n\'a\'\nresult.\$1 != 97');
    final s$5 = State('a');
    final r$9 = r$7(s$5) as dynamic;
    expect(r$9, isNotNull, reason: '([a] / [b])?\n\'a\'\nresult != null');
    expect(s$5.position, 1, reason: '([a] / [b])?\n\'a\'\nstate.position = 1');
    expect(r$9.$1, null, reason: '([a] / [b])?\n\'a\'\nresult.\$1 != null');
    final s$6 = State('b');
    final r$10 = r$6(s$6) as dynamic;
    expect(r$10, isNotNull, reason: '([a] / [b])?\n\'b\'\nresult != null');
    expect(s$6.position, 1, reason: '([a] / [b])?\n\'b\'\nstate.position = 1');
    expect(r$10.$1, 98, reason: '([a] / [b])?\n\'b\'\nresult.\$1 != 98');
    final s$7 = State('b');
    final r$11 = r$7(s$7) as dynamic;
    expect(r$11, isNotNull, reason: '([a] / [b])?\n\'b\'\nresult != null');
    expect(s$7.position, 1, reason: '([a] / [b])?\n\'b\'\nstate.position = 1');
    expect(r$11.$1, null, reason: '([a] / [b])?\n\'b\'\nresult.\$1 != null');
    final s$8 = State('');
    final r$12 = r$6(s$8) as dynamic;
    expect(r$12, isNotNull, reason: '([a] / [b])?\n\'\'\nresult != null');
    expect(s$8.position, 0, reason: '([a] / [b])?\n\'\'\nstate.position = 0');
    expect(r$12.$1, null, reason: '([a] / [b])?\n\'\'\nresult.\$1 != null');
    final s$9 = State('');
    final r$13 = r$7(s$9) as dynamic;
    expect(r$13, isNotNull, reason: '([a] / [b])?\n\'\'\nresult != null');
    expect(s$9.position, 0, reason: '([a] / [b])?\n\'\'\nstate.position = 0');
    expect(r$13.$1, null, reason: '([a] / [b])?\n\'\'\nresult.\$1 != null');
    final r$14 = parser.parseOptional2;
    final r$15 = parser.parseOptionalVoid2;
    final s$10 = State('ab');
    final r$16 = r$14(s$10) as dynamic;
    expect(r$16, isNotNull, reason: '([a] \$ = [b])?\n\'ab\'\nresult != null');
    expect(
      s$10.position,
      2,
      reason: '([a] \$ = [b])?\n\'ab\'\nstate.position = 2',
    );
    expect(r$16.$1, 98, reason: '([a] \$ = [b])?\n\'ab\'\nresult.\$1 != 98');
    final s$11 = State('ab');
    final r$17 = r$15(s$11) as dynamic;
    expect(r$17, isNotNull, reason: '([a] \$ = [b])?\n\'ab\'\nresult != null');
    expect(
      s$11.position,
      2,
      reason: '([a] \$ = [b])?\n\'ab\'\nstate.position = 2',
    );
    expect(
      r$17.$1,
      null,
      reason: '([a] \$ = [b])?\n\'ab\'\nresult.\$1 != null',
    );
    final s$12 = State('');
    final r$18 = r$14(s$12) as dynamic;
    expect(r$18, isNotNull, reason: '([a] \$ = [b])?\n\'\'\nresult != null');
    expect(
      s$12.position,
      0,
      reason: '([a] \$ = [b])?\n\'\'\nstate.position = 0',
    );
    expect(r$18.$1, null, reason: '([a] \$ = [b])?\n\'\'\nresult.\$1 != null');
    final s$13 = State('');
    final r$19 = r$15(s$13) as dynamic;
    expect(r$19, isNotNull, reason: '([a] \$ = [b])?\n\'\'\nresult != null');
    expect(
      s$13.position,
      0,
      reason: '([a] \$ = [b])?\n\'\'\nstate.position = 0',
    );
    expect(r$19.$1, null, reason: '([a] \$ = [b])?\n\'\'\nresult.\$1 != null');
    final s$14 = State('a');
    final r$20 = r$14(s$14) as dynamic;
    expect(r$20, isNotNull, reason: '([a] \$ = [b])?\n\'a\'\nresult != null');
    expect(
      s$14.position,
      0,
      reason: '([a] \$ = [b])?\n\'a\'\nstate.position = 0',
    );
    expect(r$20.$1, null, reason: '([a] \$ = [b])?\n\'a\'\nresult.\$1 != null');
    final s$15 = State('a');
    final r$21 = r$15(s$15) as dynamic;
    expect(r$21, isNotNull, reason: '([a] \$ = [b])?\n\'a\'\nresult != null');
    expect(
      s$15.position,
      0,
      reason: '([a] \$ = [b])?\n\'a\'\nstate.position = 0',
    );
    expect(r$21.$1, null, reason: '([a] \$ = [b])?\n\'a\'\nresult.\$1 != null');
    final r$22 = parser.parseOptional3;
    final r$23 = parser.parseOptionalVoid3;
    final s$16 = State('ab');
    final r$24 = r$22(s$16) as dynamic;
    expect(r$24, isNotNull, reason: '(\$ = [a] [b])?\n\'ab\'\nresult != null');
    expect(
      s$16.position,
      2,
      reason: '(\$ = [a] [b])?\n\'ab\'\nstate.position = 2',
    );
    expect(r$24.$1, 97, reason: '(\$ = [a] [b])?\n\'ab\'\nresult.\$1 != 97');
    final s$17 = State('ab');
    final r$25 = r$23(s$17) as dynamic;
    expect(r$25, isNotNull, reason: '(\$ = [a] [b])?\n\'ab\'\nresult != null');
    expect(
      s$17.position,
      2,
      reason: '(\$ = [a] [b])?\n\'ab\'\nstate.position = 2',
    );
    expect(
      r$25.$1,
      null,
      reason: '(\$ = [a] [b])?\n\'ab\'\nresult.\$1 != null',
    );
    final s$18 = State('');
    final r$26 = r$22(s$18) as dynamic;
    expect(r$26, isNotNull, reason: '(\$ = [a] [b])?\n\'\'\nresult != null');
    expect(
      s$18.position,
      0,
      reason: '(\$ = [a] [b])?\n\'\'\nstate.position = 0',
    );
    expect(r$26.$1, null, reason: '(\$ = [a] [b])?\n\'\'\nresult.\$1 != null');
    final s$19 = State('');
    final r$27 = r$23(s$19) as dynamic;
    expect(r$27, isNotNull, reason: '(\$ = [a] [b])?\n\'\'\nresult != null');
    expect(
      s$19.position,
      0,
      reason: '(\$ = [a] [b])?\n\'\'\nstate.position = 0',
    );
    expect(r$27.$1, null, reason: '(\$ = [a] [b])?\n\'\'\nresult.\$1 != null');
    final s$20 = State('a');
    final r$28 = r$22(s$20) as dynamic;
    expect(r$28, isNotNull, reason: '(\$ = [a] [b])?\n\'a\'\nresult != null');
    expect(
      s$20.position,
      0,
      reason: '(\$ = [a] [b])?\n\'a\'\nstate.position = 0',
    );
    expect(r$28.$1, null, reason: '(\$ = [a] [b])?\n\'a\'\nresult.\$1 != null');
    final s$21 = State('a');
    final r$29 = r$23(s$21) as dynamic;
    expect(r$29, isNotNull, reason: '(\$ = [a] [b])?\n\'a\'\nresult != null');
    expect(
      s$21.position,
      0,
      reason: '(\$ = [a] [b])?\n\'a\'\nstate.position = 0',
    );
    expect(r$29.$1, null, reason: '(\$ = [a] [b])?\n\'a\'\nresult.\$1 != null');
    final r$30 = parser.parseOptional4;
    final r$31 = parser.parseOptionalVoid4;
    final s$22 = State('ac');
    final r$32 = r$30(s$22) as dynamic;
    expect(
      r$32,
      isNotNull,
      reason: '([a] / [b])?\n\$ = [c]\n\'ac\'\nresult != null',
    );
    expect(
      s$22.position,
      2,
      reason: '([a] / [b])?\n\$ = [c]\n\'ac\'\nstate.position = 2',
    );
    expect(
      r$32.$1,
      99,
      reason: '([a] / [b])?\n\$ = [c]\n\'ac\'\nresult.\$1 != 99',
    );
    final s$23 = State('ac');
    final r$33 = r$31(s$23) as dynamic;
    expect(
      r$33,
      isNotNull,
      reason: '([a] / [b])?\n\$ = [c]\n\'ac\'\nresult != null',
    );
    expect(
      s$23.position,
      2,
      reason: '([a] / [b])?\n\$ = [c]\n\'ac\'\nstate.position = 2',
    );
    expect(
      r$33.$1,
      null,
      reason: '([a] / [b])?\n\$ = [c]\n\'ac\'\nresult.\$1 != null',
    );
    final s$24 = State('bc');
    final r$34 = r$30(s$24) as dynamic;
    expect(
      r$34,
      isNotNull,
      reason: '([a] / [b])?\n\$ = [c]\n\'bc\'\nresult != null',
    );
    expect(
      s$24.position,
      2,
      reason: '([a] / [b])?\n\$ = [c]\n\'bc\'\nstate.position = 2',
    );
    expect(
      r$34.$1,
      99,
      reason: '([a] / [b])?\n\$ = [c]\n\'bc\'\nresult.\$1 != 99',
    );
    final s$25 = State('bc');
    final r$35 = r$31(s$25) as dynamic;
    expect(
      r$35,
      isNotNull,
      reason: '([a] / [b])?\n\$ = [c]\n\'bc\'\nresult != null',
    );
    expect(
      s$25.position,
      2,
      reason: '([a] / [b])?\n\$ = [c]\n\'bc\'\nstate.position = 2',
    );
    expect(
      r$35.$1,
      null,
      reason: '([a] / [b])?\n\$ = [c]\n\'bc\'\nresult.\$1 != null',
    );
    final s$26 = State('c');
    final r$36 = r$30(s$26) as dynamic;
    expect(
      r$36,
      isNotNull,
      reason: '([a] / [b])?\n\$ = [c]\n\'c\'\nresult != null',
    );
    expect(
      s$26.position,
      1,
      reason: '([a] / [b])?\n\$ = [c]\n\'c\'\nstate.position = 1',
    );
    expect(
      r$36.$1,
      99,
      reason: '([a] / [b])?\n\$ = [c]\n\'c\'\nresult.\$1 != 99',
    );
    final s$27 = State('c');
    final r$37 = r$31(s$27) as dynamic;
    expect(
      r$37,
      isNotNull,
      reason: '([a] / [b])?\n\$ = [c]\n\'c\'\nresult != null',
    );
    expect(
      s$27.position,
      1,
      reason: '([a] / [b])?\n\$ = [c]\n\'c\'\nstate.position = 1',
    );
    expect(
      r$37.$1,
      null,
      reason: '([a] / [b])?\n\$ = [c]\n\'c\'\nresult.\$1 != null',
    );
    final s$28 = State('');
    final r$38 = r$30(s$28) as dynamic;
    expect(
      r$38,
      isNull,
      reason: '([a] / [b])?\n\$ = [c]\n\'\'\nresult == null',
    );
    expect(
      s$28.farthestPosition,
      0,
      reason: '([a] / [b])?\n\$ = [c]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$28.position,
      0,
      reason: '([a] / [b])?\n\$ = [c]\n\'\'\nstate.position = 0',
    );
    final e$ = s$28.getErrors().map((e) => '$e').toList()..sort();
    expect(e$.length, 1, reason: '([a] / [b])?\n\$ = [c]\n\'\'\nerror count');
    expect(e$, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '([a] / [b])?\n\$ = [c]\n\'\'\nerrors');
    final s$29 = State('');
    final r$39 = r$31(s$29) as dynamic;
    expect(
      r$39,
      isNull,
      reason: '([a] / [b])?\n\$ = [c]\n\'\'\nresult == null',
    );
    expect(
      s$29.farthestPosition,
      0,
      reason: '([a] / [b])?\n\$ = [c]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$29.position,
      0,
      reason: '([a] / [b])?\n\$ = [c]\n\'\'\nstate.position = 0',
    );
    final e$1 = s$29.getErrors().map((e) => '$e').toList()..sort();
    expect(e$1.length, 1, reason: '([a] / [b])?\n\$ = [c]\n\'\'\nerror count');
    expect(e$1, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '([a] / [b])?\n\$ = [c]\n\'\'\nerrors');
  });

  test('Predicate', () {
    final r$ = parser.parsePredicate0;
    final s$ = State('a');
    final r$1 = r$(s$) as dynamic;
    expect(r$1, isNotNull, reason: '& { true }\n\'a\'\nresult != null');
    expect(s$.position, 0, reason: '& { true }\n\'a\'\nstate.position = 0');
    expect(r$1.$1, null, reason: '& { true }\n\'a\'\nresult.\$1 != null');
    final s$1 = State('');
    final r$2 = r$(s$1) as dynamic;
    expect(r$2, isNotNull, reason: '& { true }\n\'\'\nresult != null');
    expect(s$1.position, 0, reason: '& { true }\n\'\'\nstate.position = 0');
    expect(r$2.$1, null, reason: '& { true }\n\'\'\nresult.\$1 != null');
    final r$3 = parser.parsePredicate1;
    final s$2 = State('a');
    final r$4 = r$3(s$2) as dynamic;
    expect(r$4, isNull, reason: '& { false }\n\'a\'\nresult == null');
    expect(
      s$2.farthestPosition,
      0,
      reason: '& { false }\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(s$2.position, 0, reason: '& { false }\n\'a\'\nstate.position = 0');
    final e$ = s$2.getErrors().map((e) => '$e').toList()..sort();
    expect(e$.length, 1, reason: '& { false }\n\'a\'\nerror count');
    expect(e$, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '& { false }\n\'a\'\nerrors');
    final s$3 = State('');
    final r$5 = r$3(s$3) as dynamic;
    expect(r$5, isNull, reason: '& { false }\n\'\'\nresult == null');
    expect(
      s$3.farthestPosition,
      0,
      reason: '& { false }\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$3.position, 0, reason: '& { false }\n\'\'\nstate.position = 0');
    final e$1 = s$3.getErrors().map((e) => '$e').toList()..sort();
    expect(e$1.length, 1, reason: '& { false }\n\'\'\nerror count');
    expect(e$1, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '& { false }\n\'\'\nerrors');
    final r$6 = parser.parsePredicate2;
    final s$4 = State('a');
    final r$7 = r$6(s$4) as dynamic;
    expect(r$7, isNull, reason: '! { true }\n\'a\'\nresult == null');
    expect(
      s$4.farthestPosition,
      0,
      reason: '! { true }\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(s$4.position, 0, reason: '! { true }\n\'a\'\nstate.position = 0');
    final e$2 = s$4.getErrors().map((e) => '$e').toList()..sort();
    expect(e$2.length, 1, reason: '! { true }\n\'a\'\nerror count');
    expect(e$2, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '! { true }\n\'a\'\nerrors');
    final s$5 = State('');
    final r$8 = r$6(s$5) as dynamic;
    expect(r$8, isNull, reason: '! { true }\n\'\'\nresult == null');
    expect(
      s$5.farthestPosition,
      0,
      reason: '! { true }\n\'\'\nstate.farthestPosition = 0',
    );
    expect(s$5.position, 0, reason: '! { true }\n\'\'\nstate.position = 0');
    final e$3 = s$5.getErrors().map((e) => '$e').toList()..sort();
    expect(e$3.length, 1, reason: '! { true }\n\'\'\nerror count');
    expect(e$3, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '! { true }\n\'\'\nerrors');
    final r$9 = parser.parsePredicate3;
    final s$6 = State('a');
    final r$10 = r$9(s$6) as dynamic;
    expect(r$10, isNotNull, reason: '! { false }\n\'a\'\nresult != null');
    expect(s$6.position, 0, reason: '! { false }\n\'a\'\nstate.position = 0');
    expect(r$10.$1, null, reason: '! { false }\n\'a\'\nresult.\$1 != null');
    final s$7 = State('');
    final r$11 = r$9(s$7) as dynamic;
    expect(r$11, isNotNull, reason: '! { false }\n\'\'\nresult != null');
    expect(s$7.position, 0, reason: '! { false }\n\'\'\nstate.position = 0');
    expect(r$11.$1, null, reason: '! { false }\n\'\'\nresult.\$1 != null');
    final r$12 = parser.parsePredicate4;
    final s$8 = State(' ');
    final r$13 = r$12(s$8) as dynamic;
    expect(r$13, isNotNull, reason: '! { false }\n[ ]\n\' \'\nresult != null');
    expect(
      s$8.position,
      1,
      reason: '! { false }\n[ ]\n\' \'\nstate.position = 1',
    );
    expect(
      r$13.$1,
      null,
      reason: '! { false }\n[ ]\n\' \'\nresult.\$1 != null',
    );
    final s$9 = State('');
    final r$14 = r$12(s$9) as dynamic;
    expect(r$14, isNull, reason: '! { false }\n[ ]\n\'\'\nresult == null');
    expect(
      s$9.farthestPosition,
      0,
      reason: '! { false }\n[ ]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$9.position,
      0,
      reason: '! { false }\n[ ]\n\'\'\nstate.position = 0',
    );
    final e$4 = s$9.getErrors().map((e) => '$e').toList()..sort();
    expect(e$4.length, 1, reason: '! { false }\n[ ]\n\'\'\nerror count');
    expect(e$4, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '! { false }\n[ ]\n\'\'\nerrors');
    final r$15 = parser.parsePredicate5;
    final s$10 = State('a');
    final r$16 = r$15(s$10) as dynamic;
    expect(
      r$16,
      isNotNull,
      reason: '! { true }\n---\n! { false }\n\'a\'\nresult != null',
    );
    expect(
      s$10.position,
      0,
      reason: '! { true }\n---\n! { false }\n\'a\'\nstate.position = 0',
    );
    expect(
      r$16.$1,
      null,
      reason: '! { true }\n---\n! { false }\n\'a\'\nresult.\$1 != null',
    );
    final s$11 = State('');
    final r$17 = r$15(s$11) as dynamic;
    expect(
      r$17,
      isNotNull,
      reason: '! { true }\n---\n! { false }\n\'\'\nresult != null',
    );
    expect(
      s$11.position,
      0,
      reason: '! { true }\n---\n! { false }\n\'\'\nstate.position = 0',
    );
    expect(
      r$17.$1,
      null,
      reason: '! { true }\n---\n! { false }\n\'\'\nresult.\$1 != null',
    );
  });

  test('Sequence', () {
    final r$ = parser.parseSequence0;
    final r$1 = parser.parseSequenceVoid0;
    final s$ = State('123');
    final r$2 = r$(s$) as dynamic;
    expect(
      r$2,
      isNotNull,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'123\'\nresult != null',
    );
    expect(
      s$.position,
      3,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'123\'\nstate.position = 3',
    );
    expect(
      r$2.$1,
      6,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'123\'\nresult.\$1 != 6',
    );
    final s$1 = State('123');
    final r$3 = r$1(s$1) as dynamic;
    expect(
      r$3,
      isNotNull,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'123\'\nresult != null',
    );
    expect(
      s$1.position,
      3,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'123\'\nstate.position = 3',
    );
    expect(
      r$3.$1,
      null,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'123\'\nresult.\$1 != null',
    );
    final s$2 = State('12');
    final r$4 = r$(s$2) as dynamic;
    expect(
      r$4,
      isNull,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'12\'\nresult == null',
    );
    expect(
      s$2.farthestPosition,
      2,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'12\'\nstate.farthestPosition = 2',
    );
    expect(
      s$2.position,
      0,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'12\'\nstate.position = 0',
    );
    final e$ = s$2.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$.length,
      1,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'12\'\nerror count',
    );
    expect(
      e$,
      ['(end: 2, message: Syntax error, start: 2)'],
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'12\'\nerrors',
    );
    final s$3 = State('12');
    final r$5 = r$1(s$3) as dynamic;
    expect(
      r$5,
      isNull,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'12\'\nresult == null',
    );
    expect(
      s$3.farthestPosition,
      2,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'12\'\nstate.farthestPosition = 2',
    );
    expect(
      s$3.position,
      0,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'12\'\nstate.position = 0',
    );
    final e$1 = s$3.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$1.length,
      1,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'12\'\nerror count',
    );
    expect(
      e$1,
      ['(end: 2, message: Syntax error, start: 2)'],
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'12\'\nerrors',
    );
    final r$6 = parser.parseSequence1;
    final r$7 = parser.parseSequenceVoid1;
    final s$4 = State('abc');
    final r$8 = r$6(s$4) as dynamic;
    expect(
      r$8,
      isNotNull,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'abc\'\nresult != null',
    );
    expect(
      s$4.position,
      3,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'abc\'\nstate.position = 3',
    );
    expect(
      r$8.$1,
      'abc',
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'abc\'\nresult.\$1 != \'abc\'',
    );
    final s$5 = State('abc');
    final r$9 = r$7(s$5) as dynamic;
    expect(
      r$9,
      isNotNull,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'abc\'\nresult != null',
    );
    expect(
      s$5.position,
      3,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'abc\'\nstate.position = 3',
    );
    expect(
      r$9.$1,
      null,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'abc\'\nresult.\$1 != null',
    );
    final s$6 = State('');
    final r$10 = r$6(s$6) as dynamic;
    expect(
      r$10,
      isNull,
      reason: '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'\'\nresult == null',
    );
    expect(
      s$6.farthestPosition,
      0,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$6.position,
      0,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'\'\nstate.position = 0',
    );
    final e$2 = s$6.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$2.length,
      1,
      reason: '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'\'\nerror count',
    );
    expect(e$2, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'\'\nerrors');
    final s$7 = State('');
    final r$11 = r$7(s$7) as dynamic;
    expect(
      r$11,
      isNull,
      reason: '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'\'\nresult == null',
    );
    expect(
      s$7.farthestPosition,
      0,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$7.position,
      0,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'\'\nstate.position = 0',
    );
    final e$3 = s$7.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$3.length,
      1,
      reason: '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'\'\nerror count',
    );
    expect(e$3, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'\'\nerrors');
    final s$8 = State('a');
    final r$12 = r$6(s$8) as dynamic;
    expect(
      r$12,
      isNull,
      reason: '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'a\'\nresult == null',
    );
    expect(
      s$8.farthestPosition,
      1,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      s$8.position,
      0,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'a\'\nstate.position = 0',
    );
    final e$4 = s$8.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$4.length,
      1,
      reason: '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'a\'\nerror count',
    );
    expect(e$4, [
      '(end: 1, message: Syntax error, start: 1)',
    ], reason: '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'a\'\nerrors');
    final s$9 = State('a');
    final r$13 = r$7(s$9) as dynamic;
    expect(
      r$13,
      isNull,
      reason: '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'a\'\nresult == null',
    );
    expect(
      s$9.farthestPosition,
      1,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      s$9.position,
      0,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'a\'\nstate.position = 0',
    );
    final e$5 = s$9.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$5.length,
      1,
      reason: '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'a\'\nerror count',
    );
    expect(e$5, [
      '(end: 1, message: Syntax error, start: 1)',
    ], reason: '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'a\'\nerrors');
    final s$10 = State('ab');
    final r$14 = r$6(s$10) as dynamic;
    expect(
      r$14,
      isNull,
      reason: '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'ab\'\nresult == null',
    );
    expect(
      s$10.farthestPosition,
      2,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'ab\'\nstate.farthestPosition = 2',
    );
    expect(
      s$10.position,
      0,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'ab\'\nstate.position = 0',
    );
    final e$6 = s$10.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$6.length,
      1,
      reason: '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'ab\'\nerror count',
    );
    expect(e$6, [
      '(end: 2, message: Syntax error, start: 2)',
    ], reason: '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'ab\'\nerrors');
    final s$11 = State('ab');
    final r$15 = r$7(s$11) as dynamic;
    expect(
      r$15,
      isNull,
      reason: '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'ab\'\nresult == null',
    );
    expect(
      s$11.farthestPosition,
      2,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'ab\'\nstate.farthestPosition = 2',
    );
    expect(
      s$11.position,
      0,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'ab\'\nstate.position = 0',
    );
    final e$7 = s$11.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$7.length,
      1,
      reason: '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'ab\'\nerror count',
    );
    expect(e$7, [
      '(end: 2, message: Syntax error, start: 2)',
    ], reason: '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n\'ab\'\nerrors');
    final r$16 = parser.parseSequence2;
    final r$17 = parser.parseSequenceVoid2;
    final s$12 = State('foo');
    final r$18 = r$16(s$12) as dynamic;
    expect(
      r$18,
      isNotNull,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'foo\'\nresult != null',
    );
    expect(
      s$12.position,
      3,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'foo\'\nstate.position = 3',
    );
    expect(
      r$18.$1,
      'foo',
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'foo\'\nresult.\$1 != \'foo\'',
    );
    final s$13 = State('foo');
    final r$19 = r$17(s$13) as dynamic;
    expect(
      r$19,
      isNotNull,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'foo\'\nresult != null',
    );
    expect(
      s$13.position,
      3,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'foo\'\nstate.position = 3',
    );
    expect(
      r$19.$1,
      null,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'foo\'\nresult.\$1 != null',
    );
    final s$14 = State('');
    final r$20 = r$16(s$14) as dynamic;
    expect(
      r$20,
      isNull,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'\'\nresult == null',
    );
    expect(
      s$14.farthestPosition,
      0,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$14.position,
      0,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'\'\nstate.position = 0',
    );
    final e$8 = s$14.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$8.length,
      1,
      reason: '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'\'\nerror count',
    );
    expect(e$8, [
      '(end: 0, message: Expected: \'foo\', start: 0)',
    ], reason: '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'\'\nerrors');
    final s$15 = State('');
    final r$21 = r$17(s$15) as dynamic;
    expect(
      r$21,
      isNull,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'\'\nresult == null',
    );
    expect(
      s$15.farthestPosition,
      0,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$15.position,
      0,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'\'\nstate.position = 0',
    );
    final e$9 = s$15.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$9.length,
      1,
      reason: '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'\'\nerror count',
    );
    expect(e$9, [
      '(end: 0, message: Expected: \'foo\', start: 0)',
    ], reason: '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'\'\nerrors');
    final s$16 = State('abc');
    final r$22 = r$16(s$16) as dynamic;
    expect(
      r$22,
      isNull,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'abc\'\nresult == null',
    );
    expect(
      s$16.farthestPosition,
      0,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'abc\'\nstate.farthestPosition = 0',
    );
    expect(
      s$16.position,
      0,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'abc\'\nstate.position = 0',
    );
    final e$10 = s$16.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$10.length,
      1,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'abc\'\nerror count',
    );
    expect(e$10, [
      '(end: 0, message: Expected: \'foo\', start: 0)',
    ], reason: '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'abc\'\nerrors');
    final s$17 = State('abc');
    final r$23 = r$17(s$17) as dynamic;
    expect(
      r$23,
      isNull,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'abc\'\nresult == null',
    );
    expect(
      s$17.farthestPosition,
      0,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'abc\'\nstate.farthestPosition = 0',
    );
    expect(
      s$17.position,
      0,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'abc\'\nstate.position = 0',
    );
    final e$11 = s$17.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$11.length,
      1,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'abc\'\nerror count',
    );
    expect(e$11, [
      '(end: 0, message: Expected: \'foo\', start: 0)',
    ], reason: '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'abc\'\nerrors');
  });

  test('While', () {
    final r$ = parser.parseWhile0;
    final r$1 = parser.parseWhileVoid0;
    final s$ = State('a');
    final r$2 = r$(s$) as dynamic;
    expect(
      r$2,
      isNotNull,
      reason: '@while (0) {\n  [a]\n}\n\'a\'\nresult != null',
    );
    expect(
      s$.position,
      1,
      reason: '@while (0) {\n  [a]\n}\n\'a\'\nstate.position = 1',
    );
    expect(r$2.$1, [
      97,
    ], reason: '@while (0) {\n  [a]\n}\n\'a\'\nresult.\$1 != [97]');
    final s$1 = State('a');
    final r$3 = r$1(s$1) as dynamic;
    expect(
      r$3,
      isNotNull,
      reason: '@while (0) {\n  [a]\n}\n\'a\'\nresult != null',
    );
    expect(
      s$1.position,
      1,
      reason: '@while (0) {\n  [a]\n}\n\'a\'\nstate.position = 1',
    );
    expect(
      r$3.$1,
      null,
      reason: '@while (0) {\n  [a]\n}\n\'a\'\nresult.\$1 != null',
    );
    final s$2 = State('aa');
    final r$4 = r$(s$2) as dynamic;
    expect(
      r$4,
      isNotNull,
      reason: '@while (0) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      s$2.position,
      2,
      reason: '@while (0) {\n  [a]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(r$4.$1, [
      97,
      97,
    ], reason: '@while (0) {\n  [a]\n}\n\'aa\'\nresult.\$1 != [97, 97]');
    final s$3 = State('aa');
    final r$5 = r$1(s$3) as dynamic;
    expect(
      r$5,
      isNotNull,
      reason: '@while (0) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      s$3.position,
      2,
      reason: '@while (0) {\n  [a]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      r$5.$1,
      null,
      reason: '@while (0) {\n  [a]\n}\n\'aa\'\nresult.\$1 != null',
    );
    final s$4 = State('');
    final r$6 = r$(s$4) as dynamic;
    expect(
      r$6,
      isNotNull,
      reason: '@while (0) {\n  [a]\n}\n\'\'\nresult != null',
    );
    expect(
      s$4.position,
      0,
      reason: '@while (0) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    expect(
      r$6.$1,
      <int>[],
      reason: '@while (0) {\n  [a]\n}\n\'\'\nresult.\$1 != <int>[]',
    );
    final s$5 = State('');
    final r$7 = r$1(s$5) as dynamic;
    expect(
      r$7,
      isNotNull,
      reason: '@while (0) {\n  [a]\n}\n\'\'\nresult != null',
    );
    expect(
      s$5.position,
      0,
      reason: '@while (0) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    expect(
      r$7.$1,
      null,
      reason: '@while (0) {\n  [a]\n}\n\'\'\nresult.\$1 != null',
    );
    final s$6 = State('b');
    final r$8 = r$(s$6) as dynamic;
    expect(
      r$8,
      isNotNull,
      reason: '@while (0) {\n  [a]\n}\n\'b\'\nresult != null',
    );
    expect(
      s$6.position,
      0,
      reason: '@while (0) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    expect(
      r$8.$1,
      <int>[],
      reason: '@while (0) {\n  [a]\n}\n\'b\'\nresult.\$1 != <int>[]',
    );
    final s$7 = State('b');
    final r$9 = r$1(s$7) as dynamic;
    expect(
      r$9,
      isNotNull,
      reason: '@while (0) {\n  [a]\n}\n\'b\'\nresult != null',
    );
    expect(
      s$7.position,
      0,
      reason: '@while (0) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    expect(
      r$9.$1,
      null,
      reason: '@while (0) {\n  [a]\n}\n\'b\'\nresult.\$1 != null',
    );
    final r$10 = parser.parseWhile1;
    final r$11 = parser.parseWhileVoid1;
    final s$8 = State('a');
    final r$12 = r$10(s$8) as dynamic;
    expect(
      r$12,
      isNotNull,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'a\'\nresult != null',
    );
    expect(
      s$8.position,
      1,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'a\'\nstate.position = 1',
    );
    expect(r$12.$1, [
      97,
    ], reason: '@while (0) {\n  [a] / [z]\n}\n\'a\'\nresult.\$1 != [97]');
    final s$9 = State('a');
    final r$13 = r$11(s$9) as dynamic;
    expect(
      r$13,
      isNotNull,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'a\'\nresult != null',
    );
    expect(
      s$9.position,
      1,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'a\'\nstate.position = 1',
    );
    expect(
      r$13.$1,
      null,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'a\'\nresult.\$1 != null',
    );
    final s$10 = State('aa');
    final r$14 = r$10(s$10) as dynamic;
    expect(
      r$14,
      isNotNull,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'aa\'\nresult != null',
    );
    expect(
      s$10.position,
      2,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      r$14.$1,
      [97, 97],
      reason: '@while (0) {\n  [a] / [z]\n}\n\'aa\'\nresult.\$1 != [97, 97]',
    );
    final s$11 = State('aa');
    final r$15 = r$11(s$11) as dynamic;
    expect(
      r$15,
      isNotNull,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'aa\'\nresult != null',
    );
    expect(
      s$11.position,
      2,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      r$15.$1,
      null,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'aa\'\nresult.\$1 != null',
    );
    final s$12 = State('z');
    final r$16 = r$10(s$12) as dynamic;
    expect(
      r$16,
      isNotNull,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'z\'\nresult != null',
    );
    expect(
      s$12.position,
      1,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'z\'\nstate.position = 1',
    );
    expect(r$16.$1, [
      122,
    ], reason: '@while (0) {\n  [a] / [z]\n}\n\'z\'\nresult.\$1 != [122]');
    final s$13 = State('z');
    final r$17 = r$11(s$13) as dynamic;
    expect(
      r$17,
      isNotNull,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'z\'\nresult != null',
    );
    expect(
      s$13.position,
      1,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'z\'\nstate.position = 1',
    );
    expect(
      r$17.$1,
      null,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'z\'\nresult.\$1 != null',
    );
    final s$14 = State('za');
    final r$18 = r$10(s$14) as dynamic;
    expect(
      r$18,
      isNotNull,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'za\'\nresult != null',
    );
    expect(
      s$14.position,
      2,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'za\'\nstate.position = 2',
    );
    expect(
      r$18.$1,
      [122, 97],
      reason: '@while (0) {\n  [a] / [z]\n}\n\'za\'\nresult.\$1 != [122, 97]',
    );
    final s$15 = State('za');
    final r$19 = r$11(s$15) as dynamic;
    expect(
      r$19,
      isNotNull,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'za\'\nresult != null',
    );
    expect(
      s$15.position,
      2,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'za\'\nstate.position = 2',
    );
    expect(
      r$19.$1,
      null,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'za\'\nresult.\$1 != null',
    );
    final s$16 = State('');
    final r$20 = r$10(s$16) as dynamic;
    expect(
      r$20,
      isNotNull,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'\'\nresult != null',
    );
    expect(
      s$16.position,
      0,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'\'\nstate.position = 0',
    );
    expect(
      r$20.$1,
      <int>[],
      reason: '@while (0) {\n  [a] / [z]\n}\n\'\'\nresult.\$1 != <int>[]',
    );
    final s$17 = State('');
    final r$21 = r$11(s$17) as dynamic;
    expect(
      r$21,
      isNotNull,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'\'\nresult != null',
    );
    expect(
      s$17.position,
      0,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'\'\nstate.position = 0',
    );
    expect(
      r$21.$1,
      null,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'\'\nresult.\$1 != null',
    );
    final s$18 = State('b');
    final r$22 = r$10(s$18) as dynamic;
    expect(
      r$22,
      isNotNull,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'b\'\nresult != null',
    );
    expect(
      s$18.position,
      0,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'b\'\nstate.position = 0',
    );
    expect(
      r$22.$1,
      <int>[],
      reason: '@while (0) {\n  [a] / [z]\n}\n\'b\'\nresult.\$1 != <int>[]',
    );
    final s$19 = State('b');
    final r$23 = r$11(s$19) as dynamic;
    expect(
      r$23,
      isNotNull,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'b\'\nresult != null',
    );
    expect(
      s$19.position,
      0,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'b\'\nstate.position = 0',
    );
    expect(
      r$23.$1,
      null,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'b\'\nresult.\$1 != null',
    );
    final r$24 = parser.parseWhile2;
    final r$25 = parser.parseWhileVoid2;
    final s$20 = State('a');
    final r$26 = r$24(s$20) as dynamic;
    expect(
      r$26,
      isNotNull,
      reason: '@while (1) {\n  [a]\n}\n\'a\'\nresult != null',
    );
    expect(
      s$20.position,
      1,
      reason: '@while (1) {\n  [a]\n}\n\'a\'\nstate.position = 1',
    );
    expect(r$26.$1, [
      97,
    ], reason: '@while (1) {\n  [a]\n}\n\'a\'\nresult.\$1 != [97]');
    final s$21 = State('a');
    final r$27 = r$25(s$21) as dynamic;
    expect(
      r$27,
      isNotNull,
      reason: '@while (1) {\n  [a]\n}\n\'a\'\nresult != null',
    );
    expect(
      s$21.position,
      1,
      reason: '@while (1) {\n  [a]\n}\n\'a\'\nstate.position = 1',
    );
    expect(
      r$27.$1,
      null,
      reason: '@while (1) {\n  [a]\n}\n\'a\'\nresult.\$1 != null',
    );
    final s$22 = State('aa');
    final r$28 = r$24(s$22) as dynamic;
    expect(
      r$28,
      isNotNull,
      reason: '@while (1) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      s$22.position,
      2,
      reason: '@while (1) {\n  [a]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(r$28.$1, [
      97,
      97,
    ], reason: '@while (1) {\n  [a]\n}\n\'aa\'\nresult.\$1 != [97, 97]');
    final s$23 = State('aa');
    final r$29 = r$25(s$23) as dynamic;
    expect(
      r$29,
      isNotNull,
      reason: '@while (1) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      s$23.position,
      2,
      reason: '@while (1) {\n  [a]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      r$29.$1,
      null,
      reason: '@while (1) {\n  [a]\n}\n\'aa\'\nresult.\$1 != null',
    );
    final s$24 = State('');
    final r$30 = r$24(s$24) as dynamic;
    expect(
      r$30,
      isNull,
      reason: '@while (1) {\n  [a]\n}\n\'\'\nresult == null',
    );
    expect(
      s$24.farthestPosition,
      0,
      reason: '@while (1) {\n  [a]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$24.position,
      0,
      reason: '@while (1) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    final e$ = s$24.getErrors().map((e) => '$e').toList()..sort();
    expect(e$.length, 1, reason: '@while (1) {\n  [a]\n}\n\'\'\nerror count');
    expect(e$, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (1) {\n  [a]\n}\n\'\'\nerrors');
    final s$25 = State('');
    final r$31 = r$25(s$25) as dynamic;
    expect(
      r$31,
      isNull,
      reason: '@while (1) {\n  [a]\n}\n\'\'\nresult == null',
    );
    expect(
      s$25.farthestPosition,
      0,
      reason: '@while (1) {\n  [a]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$25.position,
      0,
      reason: '@while (1) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    final e$1 = s$25.getErrors().map((e) => '$e').toList()..sort();
    expect(e$1.length, 1, reason: '@while (1) {\n  [a]\n}\n\'\'\nerror count');
    expect(e$1, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (1) {\n  [a]\n}\n\'\'\nerrors');
    final s$26 = State('b');
    final r$32 = r$24(s$26) as dynamic;
    expect(
      r$32,
      isNull,
      reason: '@while (1) {\n  [a]\n}\n\'b\'\nresult == null',
    );
    expect(
      s$26.farthestPosition,
      0,
      reason: '@while (1) {\n  [a]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      s$26.position,
      0,
      reason: '@while (1) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    final e$2 = s$26.getErrors().map((e) => '$e').toList()..sort();
    expect(e$2.length, 1, reason: '@while (1) {\n  [a]\n}\n\'b\'\nerror count');
    expect(e$2, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (1) {\n  [a]\n}\n\'b\'\nerrors');
    final s$27 = State('b');
    final r$33 = r$25(s$27) as dynamic;
    expect(
      r$33,
      isNull,
      reason: '@while (1) {\n  [a]\n}\n\'b\'\nresult == null',
    );
    expect(
      s$27.farthestPosition,
      0,
      reason: '@while (1) {\n  [a]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      s$27.position,
      0,
      reason: '@while (1) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    final e$3 = s$27.getErrors().map((e) => '$e').toList()..sort();
    expect(e$3.length, 1, reason: '@while (1) {\n  [a]\n}\n\'b\'\nerror count');
    expect(e$3, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (1) {\n  [a]\n}\n\'b\'\nerrors');
    final r$34 = parser.parseWhile3;
    final r$35 = parser.parseWhileVoid3;
    final s$28 = State('a');
    final r$36 = r$34(s$28) as dynamic;
    expect(
      r$36,
      isNotNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'a\'\nresult != null',
    );
    expect(
      s$28.position,
      1,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'a\'\nstate.position = 1',
    );
    expect(r$36.$1, [
      97,
    ], reason: '@while (1) {\n  [a] / [z]\n}\n\'a\'\nresult.\$1 != [97]');
    final s$29 = State('a');
    final r$37 = r$35(s$29) as dynamic;
    expect(
      r$37,
      isNotNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'a\'\nresult != null',
    );
    expect(
      s$29.position,
      1,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'a\'\nstate.position = 1',
    );
    expect(
      r$37.$1,
      null,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'a\'\nresult.\$1 != null',
    );
    final s$30 = State('aa');
    final r$38 = r$34(s$30) as dynamic;
    expect(
      r$38,
      isNotNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'aa\'\nresult != null',
    );
    expect(
      s$30.position,
      2,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      r$38.$1,
      [97, 97],
      reason: '@while (1) {\n  [a] / [z]\n}\n\'aa\'\nresult.\$1 != [97, 97]',
    );
    final s$31 = State('aa');
    final r$39 = r$35(s$31) as dynamic;
    expect(
      r$39,
      isNotNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'aa\'\nresult != null',
    );
    expect(
      s$31.position,
      2,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      r$39.$1,
      null,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'aa\'\nresult.\$1 != null',
    );
    final s$32 = State('z');
    final r$40 = r$34(s$32) as dynamic;
    expect(
      r$40,
      isNotNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'z\'\nresult != null',
    );
    expect(
      s$32.position,
      1,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'z\'\nstate.position = 1',
    );
    expect(r$40.$1, [
      122,
    ], reason: '@while (1) {\n  [a] / [z]\n}\n\'z\'\nresult.\$1 != [122]');
    final s$33 = State('z');
    final r$41 = r$35(s$33) as dynamic;
    expect(
      r$41,
      isNotNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'z\'\nresult != null',
    );
    expect(
      s$33.position,
      1,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'z\'\nstate.position = 1',
    );
    expect(
      r$41.$1,
      null,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'z\'\nresult.\$1 != null',
    );
    final s$34 = State('za');
    final r$42 = r$34(s$34) as dynamic;
    expect(
      r$42,
      isNotNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'za\'\nresult != null',
    );
    expect(
      s$34.position,
      2,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'za\'\nstate.position = 2',
    );
    expect(
      r$42.$1,
      [122, 97],
      reason: '@while (1) {\n  [a] / [z]\n}\n\'za\'\nresult.\$1 != [122, 97]',
    );
    final s$35 = State('za');
    final r$43 = r$35(s$35) as dynamic;
    expect(
      r$43,
      isNotNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'za\'\nresult != null',
    );
    expect(
      s$35.position,
      2,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'za\'\nstate.position = 2',
    );
    expect(
      r$43.$1,
      null,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'za\'\nresult.\$1 != null',
    );
    final s$36 = State('zz');
    final r$44 = r$34(s$36) as dynamic;
    expect(
      r$44,
      isNotNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'zz\'\nresult != null',
    );
    expect(
      s$36.position,
      2,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'zz\'\nstate.position = 2',
    );
    expect(
      r$44.$1,
      [122, 122],
      reason: '@while (1) {\n  [a] / [z]\n}\n\'zz\'\nresult.\$1 != [122, 122]',
    );
    final s$37 = State('zz');
    final r$45 = r$35(s$37) as dynamic;
    expect(
      r$45,
      isNotNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'zz\'\nresult != null',
    );
    expect(
      s$37.position,
      2,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'zz\'\nstate.position = 2',
    );
    expect(
      r$45.$1,
      null,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'zz\'\nresult.\$1 != null',
    );
    final s$38 = State('');
    final r$46 = r$34(s$38) as dynamic;
    expect(
      r$46,
      isNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'\'\nresult == null',
    );
    expect(
      s$38.farthestPosition,
      0,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$38.position,
      0,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'\'\nstate.position = 0',
    );
    final e$4 = s$38.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$4.length,
      1,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'\'\nerror count',
    );
    expect(e$4, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (1) {\n  [a] / [z]\n}\n\'\'\nerrors');
    final s$39 = State('');
    final r$47 = r$35(s$39) as dynamic;
    expect(
      r$47,
      isNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'\'\nresult == null',
    );
    expect(
      s$39.farthestPosition,
      0,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$39.position,
      0,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'\'\nstate.position = 0',
    );
    final e$5 = s$39.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$5.length,
      1,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'\'\nerror count',
    );
    expect(e$5, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (1) {\n  [a] / [z]\n}\n\'\'\nerrors');
    final s$40 = State('b');
    final r$48 = r$34(s$40) as dynamic;
    expect(
      r$48,
      isNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'b\'\nresult == null',
    );
    expect(
      s$40.farthestPosition,
      0,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      s$40.position,
      0,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'b\'\nstate.position = 0',
    );
    final e$6 = s$40.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$6.length,
      1,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'b\'\nerror count',
    );
    expect(e$6, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (1) {\n  [a] / [z]\n}\n\'b\'\nerrors');
    final s$41 = State('b');
    final r$49 = r$35(s$41) as dynamic;
    expect(
      r$49,
      isNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'b\'\nresult == null',
    );
    expect(
      s$41.farthestPosition,
      0,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      s$41.position,
      0,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'b\'\nstate.position = 0',
    );
    final e$7 = s$41.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$7.length,
      1,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'b\'\nerror count',
    );
    expect(e$7, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (1) {\n  [a] / [z]\n}\n\'b\'\nerrors');
    final r$50 = parser.parseWhile4;
    final r$51 = parser.parseWhileVoid4;
    final s$42 = State('aa');
    final r$52 = r$50(s$42) as dynamic;
    expect(
      r$52,
      isNotNull,
      reason: '@while (2) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      s$42.position,
      2,
      reason: '@while (2) {\n  [a]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(r$52.$1, [
      97,
      97,
    ], reason: '@while (2) {\n  [a]\n}\n\'aa\'\nresult.\$1 != [97, 97]');
    final s$43 = State('aa');
    final r$53 = r$51(s$43) as dynamic;
    expect(
      r$53,
      isNotNull,
      reason: '@while (2) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      s$43.position,
      2,
      reason: '@while (2) {\n  [a]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      r$53.$1,
      null,
      reason: '@while (2) {\n  [a]\n}\n\'aa\'\nresult.\$1 != null',
    );
    final s$44 = State('aaa');
    final r$54 = r$50(s$44) as dynamic;
    expect(
      r$54,
      isNotNull,
      reason: '@while (2) {\n  [a]\n}\n\'aaa\'\nresult != null',
    );
    expect(
      s$44.position,
      3,
      reason: '@while (2) {\n  [a]\n}\n\'aaa\'\nstate.position = 3',
    );
    expect(
      r$54.$1,
      [97, 97, 97],
      reason: '@while (2) {\n  [a]\n}\n\'aaa\'\nresult.\$1 != [97, 97, 97]',
    );
    final s$45 = State('aaa');
    final r$55 = r$51(s$45) as dynamic;
    expect(
      r$55,
      isNotNull,
      reason: '@while (2) {\n  [a]\n}\n\'aaa\'\nresult != null',
    );
    expect(
      s$45.position,
      3,
      reason: '@while (2) {\n  [a]\n}\n\'aaa\'\nstate.position = 3',
    );
    expect(
      r$55.$1,
      null,
      reason: '@while (2) {\n  [a]\n}\n\'aaa\'\nresult.\$1 != null',
    );
    final s$46 = State('');
    final r$56 = r$50(s$46) as dynamic;
    expect(
      r$56,
      isNull,
      reason: '@while (2) {\n  [a]\n}\n\'\'\nresult == null',
    );
    expect(
      s$46.farthestPosition,
      0,
      reason: '@while (2) {\n  [a]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$46.position,
      0,
      reason: '@while (2) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    final e$8 = s$46.getErrors().map((e) => '$e').toList()..sort();
    expect(e$8.length, 1, reason: '@while (2) {\n  [a]\n}\n\'\'\nerror count');
    expect(e$8, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (2) {\n  [a]\n}\n\'\'\nerrors');
    final s$47 = State('');
    final r$57 = r$51(s$47) as dynamic;
    expect(
      r$57,
      isNull,
      reason: '@while (2) {\n  [a]\n}\n\'\'\nresult == null',
    );
    expect(
      s$47.farthestPosition,
      0,
      reason: '@while (2) {\n  [a]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$47.position,
      0,
      reason: '@while (2) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    final e$9 = s$47.getErrors().map((e) => '$e').toList()..sort();
    expect(e$9.length, 1, reason: '@while (2) {\n  [a]\n}\n\'\'\nerror count');
    expect(e$9, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (2) {\n  [a]\n}\n\'\'\nerrors');
    final s$48 = State('a');
    final r$58 = r$50(s$48) as dynamic;
    expect(
      r$58,
      isNull,
      reason: '@while (2) {\n  [a]\n}\n\'a\'\nresult == null',
    );
    expect(
      s$48.farthestPosition,
      1,
      reason: '@while (2) {\n  [a]\n}\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      s$48.position,
      0,
      reason: '@while (2) {\n  [a]\n}\n\'a\'\nstate.position = 0',
    );
    final e$10 = s$48.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$10.length,
      1,
      reason: '@while (2) {\n  [a]\n}\n\'a\'\nerror count',
    );
    expect(e$10, [
      '(end: 1, message: Syntax error, start: 1)',
    ], reason: '@while (2) {\n  [a]\n}\n\'a\'\nerrors');
    final s$49 = State('a');
    final r$59 = r$51(s$49) as dynamic;
    expect(
      r$59,
      isNull,
      reason: '@while (2) {\n  [a]\n}\n\'a\'\nresult == null',
    );
    expect(
      s$49.farthestPosition,
      1,
      reason: '@while (2) {\n  [a]\n}\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      s$49.position,
      0,
      reason: '@while (2) {\n  [a]\n}\n\'a\'\nstate.position = 0',
    );
    final e$11 = s$49.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$11.length,
      1,
      reason: '@while (2) {\n  [a]\n}\n\'a\'\nerror count',
    );
    expect(e$11, [
      '(end: 1, message: Syntax error, start: 1)',
    ], reason: '@while (2) {\n  [a]\n}\n\'a\'\nerrors');
    final s$50 = State('b');
    final r$60 = r$50(s$50) as dynamic;
    expect(
      r$60,
      isNull,
      reason: '@while (2) {\n  [a]\n}\n\'b\'\nresult == null',
    );
    expect(
      s$50.farthestPosition,
      0,
      reason: '@while (2) {\n  [a]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      s$50.position,
      0,
      reason: '@while (2) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    final e$12 = s$50.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$12.length,
      1,
      reason: '@while (2) {\n  [a]\n}\n\'b\'\nerror count',
    );
    expect(e$12, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (2) {\n  [a]\n}\n\'b\'\nerrors');
    final s$51 = State('b');
    final r$61 = r$51(s$51) as dynamic;
    expect(
      r$61,
      isNull,
      reason: '@while (2) {\n  [a]\n}\n\'b\'\nresult == null',
    );
    expect(
      s$51.farthestPosition,
      0,
      reason: '@while (2) {\n  [a]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      s$51.position,
      0,
      reason: '@while (2) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    final e$13 = s$51.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$13.length,
      1,
      reason: '@while (2) {\n  [a]\n}\n\'b\'\nerror count',
    );
    expect(e$13, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (2) {\n  [a]\n}\n\'b\'\nerrors');
    final r$62 = parser.parseWhile5;
    final r$63 = parser.parseWhileVoid5;
    final s$52 = State('aa');
    final r$64 = r$62(s$52) as dynamic;
    expect(
      r$64,
      isNotNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'aa\'\nresult != null',
    );
    expect(
      s$52.position,
      2,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      r$64.$1,
      [97, 97],
      reason: '@while (2) {\n  [a] / [z]\n}\n\'aa\'\nresult.\$1 != [97, 97]',
    );
    final s$53 = State('aa');
    final r$65 = r$63(s$53) as dynamic;
    expect(
      r$65,
      isNotNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'aa\'\nresult != null',
    );
    expect(
      s$53.position,
      2,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      r$65.$1,
      null,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'aa\'\nresult.\$1 != null',
    );
    final s$54 = State('az');
    final r$66 = r$62(s$54) as dynamic;
    expect(
      r$66,
      isNotNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'az\'\nresult != null',
    );
    expect(
      s$54.position,
      2,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'az\'\nstate.position = 2',
    );
    expect(
      r$66.$1,
      [97, 122],
      reason: '@while (2) {\n  [a] / [z]\n}\n\'az\'\nresult.\$1 != [97, 122]',
    );
    final s$55 = State('az');
    final r$67 = r$63(s$55) as dynamic;
    expect(
      r$67,
      isNotNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'az\'\nresult != null',
    );
    expect(
      s$55.position,
      2,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'az\'\nstate.position = 2',
    );
    expect(
      r$67.$1,
      null,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'az\'\nresult.\$1 != null',
    );
    final s$56 = State('za');
    final r$68 = r$62(s$56) as dynamic;
    expect(
      r$68,
      isNotNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'za\'\nresult != null',
    );
    expect(
      s$56.position,
      2,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'za\'\nstate.position = 2',
    );
    expect(
      r$68.$1,
      [122, 97],
      reason: '@while (2) {\n  [a] / [z]\n}\n\'za\'\nresult.\$1 != [122, 97]',
    );
    final s$57 = State('za');
    final r$69 = r$63(s$57) as dynamic;
    expect(
      r$69,
      isNotNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'za\'\nresult != null',
    );
    expect(
      s$57.position,
      2,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'za\'\nstate.position = 2',
    );
    expect(
      r$69.$1,
      null,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'za\'\nresult.\$1 != null',
    );
    final s$58 = State('zz');
    final r$70 = r$62(s$58) as dynamic;
    expect(
      r$70,
      isNotNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'zz\'\nresult != null',
    );
    expect(
      s$58.position,
      2,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'zz\'\nstate.position = 2',
    );
    expect(
      r$70.$1,
      [122, 122],
      reason: '@while (2) {\n  [a] / [z]\n}\n\'zz\'\nresult.\$1 != [122, 122]',
    );
    final s$59 = State('zz');
    final r$71 = r$63(s$59) as dynamic;
    expect(
      r$71,
      isNotNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'zz\'\nresult != null',
    );
    expect(
      s$59.position,
      2,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'zz\'\nstate.position = 2',
    );
    expect(
      r$71.$1,
      null,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'zz\'\nresult.\$1 != null',
    );
    final s$60 = State('zzz');
    final r$72 = r$62(s$60) as dynamic;
    expect(
      r$72,
      isNotNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'zzz\'\nresult != null',
    );
    expect(
      s$60.position,
      3,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'zzz\'\nstate.position = 3',
    );
    expect(
      r$72.$1,
      [122, 122, 122],
      reason:
          '@while (2) {\n  [a] / [z]\n}\n\'zzz\'\nresult.\$1 != [122, 122, 122]',
    );
    final s$61 = State('zzz');
    final r$73 = r$63(s$61) as dynamic;
    expect(
      r$73,
      isNotNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'zzz\'\nresult != null',
    );
    expect(
      s$61.position,
      3,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'zzz\'\nstate.position = 3',
    );
    expect(
      r$73.$1,
      null,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'zzz\'\nresult.\$1 != null',
    );
    final s$62 = State('');
    final r$74 = r$62(s$62) as dynamic;
    expect(
      r$74,
      isNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'\'\nresult == null',
    );
    expect(
      s$62.farthestPosition,
      0,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$62.position,
      0,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'\'\nstate.position = 0',
    );
    final e$14 = s$62.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$14.length,
      1,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'\'\nerror count',
    );
    expect(e$14, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (2) {\n  [a] / [z]\n}\n\'\'\nerrors');
    final s$63 = State('');
    final r$75 = r$63(s$63) as dynamic;
    expect(
      r$75,
      isNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'\'\nresult == null',
    );
    expect(
      s$63.farthestPosition,
      0,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$63.position,
      0,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'\'\nstate.position = 0',
    );
    final e$15 = s$63.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$15.length,
      1,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'\'\nerror count',
    );
    expect(e$15, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (2) {\n  [a] / [z]\n}\n\'\'\nerrors');
    final s$64 = State('a');
    final r$76 = r$62(s$64) as dynamic;
    expect(
      r$76,
      isNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'a\'\nresult == null',
    );
    expect(
      s$64.farthestPosition,
      1,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      s$64.position,
      0,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'a\'\nstate.position = 0',
    );
    final e$16 = s$64.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$16.length,
      1,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'a\'\nerror count',
    );
    expect(e$16, [
      '(end: 1, message: Syntax error, start: 1)',
    ], reason: '@while (2) {\n  [a] / [z]\n}\n\'a\'\nerrors');
    final s$65 = State('a');
    final r$77 = r$63(s$65) as dynamic;
    expect(
      r$77,
      isNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'a\'\nresult == null',
    );
    expect(
      s$65.farthestPosition,
      1,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      s$65.position,
      0,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'a\'\nstate.position = 0',
    );
    final e$17 = s$65.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$17.length,
      1,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'a\'\nerror count',
    );
    expect(e$17, [
      '(end: 1, message: Syntax error, start: 1)',
    ], reason: '@while (2) {\n  [a] / [z]\n}\n\'a\'\nerrors');
    final s$66 = State('b');
    final r$78 = r$62(s$66) as dynamic;
    expect(
      r$78,
      isNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'b\'\nresult == null',
    );
    expect(
      s$66.farthestPosition,
      0,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      s$66.position,
      0,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'b\'\nstate.position = 0',
    );
    final e$18 = s$66.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$18.length,
      1,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'b\'\nerror count',
    );
    expect(e$18, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (2) {\n  [a] / [z]\n}\n\'b\'\nerrors');
    final s$67 = State('b');
    final r$79 = r$63(s$67) as dynamic;
    expect(
      r$79,
      isNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'b\'\nresult == null',
    );
    expect(
      s$67.farthestPosition,
      0,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      s$67.position,
      0,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'b\'\nstate.position = 0',
    );
    final e$19 = s$67.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$19.length,
      1,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'b\'\nerror count',
    );
    expect(e$19, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (2) {\n  [a] / [z]\n}\n\'b\'\nerrors');
    final r$80 = parser.parseWhile6;
    final r$81 = parser.parseWhileVoid6;
    final s$68 = State('a');
    final r$82 = r$80(s$68) as dynamic;
    expect(
      r$82,
      isNotNull,
      reason: '@while (0, 1) {\n  [a]\n}\n\'a\'\nresult != null',
    );
    expect(
      s$68.position,
      1,
      reason: '@while (0, 1) {\n  [a]\n}\n\'a\'\nstate.position = 1',
    );
    expect(r$82.$1, [
      97,
    ], reason: '@while (0, 1) {\n  [a]\n}\n\'a\'\nresult.\$1 != [97]');
    final s$69 = State('a');
    final r$83 = r$81(s$69) as dynamic;
    expect(
      r$83,
      isNotNull,
      reason: '@while (0, 1) {\n  [a]\n}\n\'a\'\nresult != null',
    );
    expect(
      s$69.position,
      1,
      reason: '@while (0, 1) {\n  [a]\n}\n\'a\'\nstate.position = 1',
    );
    expect(
      r$83.$1,
      null,
      reason: '@while (0, 1) {\n  [a]\n}\n\'a\'\nresult.\$1 != null',
    );
    final s$70 = State('aa');
    final r$84 = r$80(s$70) as dynamic;
    expect(
      r$84,
      isNotNull,
      reason: '@while (0, 1) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      s$70.position,
      1,
      reason: '@while (0, 1) {\n  [a]\n}\n\'aa\'\nstate.position = 1',
    );
    expect(r$84.$1, [
      97,
    ], reason: '@while (0, 1) {\n  [a]\n}\n\'aa\'\nresult.\$1 != [97]');
    final s$71 = State('aa');
    final r$85 = r$81(s$71) as dynamic;
    expect(
      r$85,
      isNotNull,
      reason: '@while (0, 1) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      s$71.position,
      1,
      reason: '@while (0, 1) {\n  [a]\n}\n\'aa\'\nstate.position = 1',
    );
    expect(
      r$85.$1,
      null,
      reason: '@while (0, 1) {\n  [a]\n}\n\'aa\'\nresult.\$1 != null',
    );
    final s$72 = State('');
    final r$86 = r$80(s$72) as dynamic;
    expect(
      r$86,
      isNotNull,
      reason: '@while (0, 1) {\n  [a]\n}\n\'\'\nresult != null',
    );
    expect(
      s$72.position,
      0,
      reason: '@while (0, 1) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    expect(
      r$86.$1,
      <int>[],
      reason: '@while (0, 1) {\n  [a]\n}\n\'\'\nresult.\$1 != <int>[]',
    );
    final s$73 = State('');
    final r$87 = r$81(s$73) as dynamic;
    expect(
      r$87,
      isNotNull,
      reason: '@while (0, 1) {\n  [a]\n}\n\'\'\nresult != null',
    );
    expect(
      s$73.position,
      0,
      reason: '@while (0, 1) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    expect(
      r$87.$1,
      null,
      reason: '@while (0, 1) {\n  [a]\n}\n\'\'\nresult.\$1 != null',
    );
    final s$74 = State('b');
    final r$88 = r$80(s$74) as dynamic;
    expect(
      r$88,
      isNotNull,
      reason: '@while (0, 1) {\n  [a]\n}\n\'b\'\nresult != null',
    );
    expect(
      s$74.position,
      0,
      reason: '@while (0, 1) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    expect(
      r$88.$1,
      <int>[],
      reason: '@while (0, 1) {\n  [a]\n}\n\'b\'\nresult.\$1 != <int>[]',
    );
    final s$75 = State('b');
    final r$89 = r$81(s$75) as dynamic;
    expect(
      r$89,
      isNotNull,
      reason: '@while (0, 1) {\n  [a]\n}\n\'b\'\nresult != null',
    );
    expect(
      s$75.position,
      0,
      reason: '@while (0, 1) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    expect(
      r$89.$1,
      null,
      reason: '@while (0, 1) {\n  [a]\n}\n\'b\'\nresult.\$1 != null',
    );
    final r$90 = parser.parseWhile7;
    final r$91 = parser.parseWhileVoid7;
    final s$76 = State('a');
    final r$92 = r$90(s$76) as dynamic;
    expect(
      r$92,
      isNotNull,
      reason: '@while (0, 2) {\n  [a]\n}\n\'a\'\nresult != null',
    );
    expect(
      s$76.position,
      1,
      reason: '@while (0, 2) {\n  [a]\n}\n\'a\'\nstate.position = 1',
    );
    expect(r$92.$1, [
      97,
    ], reason: '@while (0, 2) {\n  [a]\n}\n\'a\'\nresult.\$1 != [97]');
    final s$77 = State('a');
    final r$93 = r$91(s$77) as dynamic;
    expect(
      r$93,
      isNotNull,
      reason: '@while (0, 2) {\n  [a]\n}\n\'a\'\nresult != null',
    );
    expect(
      s$77.position,
      1,
      reason: '@while (0, 2) {\n  [a]\n}\n\'a\'\nstate.position = 1',
    );
    expect(
      r$93.$1,
      null,
      reason: '@while (0, 2) {\n  [a]\n}\n\'a\'\nresult.\$1 != null',
    );
    final s$78 = State('aa');
    final r$94 = r$90(s$78) as dynamic;
    expect(
      r$94,
      isNotNull,
      reason: '@while (0, 2) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      s$78.position,
      2,
      reason: '@while (0, 2) {\n  [a]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(r$94.$1, [
      97,
      97,
    ], reason: '@while (0, 2) {\n  [a]\n}\n\'aa\'\nresult.\$1 != [97, 97]');
    final s$79 = State('aa');
    final r$95 = r$91(s$79) as dynamic;
    expect(
      r$95,
      isNotNull,
      reason: '@while (0, 2) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      s$79.position,
      2,
      reason: '@while (0, 2) {\n  [a]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      r$95.$1,
      null,
      reason: '@while (0, 2) {\n  [a]\n}\n\'aa\'\nresult.\$1 != null',
    );
    final s$80 = State('aaa');
    final r$96 = r$90(s$80) as dynamic;
    expect(
      r$96,
      isNotNull,
      reason: '@while (0, 2) {\n  [a]\n}\n\'aaa\'\nresult != null',
    );
    expect(
      s$80.position,
      2,
      reason: '@while (0, 2) {\n  [a]\n}\n\'aaa\'\nstate.position = 2',
    );
    expect(
      r$96.$1,
      [97, 97],
      reason: '@while (0, 2) {\n  [a]\n}\n\'aaa\'\nresult.\$1 != [97, 97]',
    );
    final s$81 = State('aaa');
    final r$97 = r$91(s$81) as dynamic;
    expect(
      r$97,
      isNotNull,
      reason: '@while (0, 2) {\n  [a]\n}\n\'aaa\'\nresult != null',
    );
    expect(
      s$81.position,
      2,
      reason: '@while (0, 2) {\n  [a]\n}\n\'aaa\'\nstate.position = 2',
    );
    expect(
      r$97.$1,
      null,
      reason: '@while (0, 2) {\n  [a]\n}\n\'aaa\'\nresult.\$1 != null',
    );
    final s$82 = State('');
    final r$98 = r$90(s$82) as dynamic;
    expect(
      r$98,
      isNotNull,
      reason: '@while (0, 2) {\n  [a]\n}\n\'\'\nresult != null',
    );
    expect(
      s$82.position,
      0,
      reason: '@while (0, 2) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    expect(
      r$98.$1,
      <int>[],
      reason: '@while (0, 2) {\n  [a]\n}\n\'\'\nresult.\$1 != <int>[]',
    );
    final s$83 = State('');
    final r$99 = r$91(s$83) as dynamic;
    expect(
      r$99,
      isNotNull,
      reason: '@while (0, 2) {\n  [a]\n}\n\'\'\nresult != null',
    );
    expect(
      s$83.position,
      0,
      reason: '@while (0, 2) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    expect(
      r$99.$1,
      null,
      reason: '@while (0, 2) {\n  [a]\n}\n\'\'\nresult.\$1 != null',
    );
    final s$84 = State('b');
    final r$100 = r$90(s$84) as dynamic;
    expect(
      r$100,
      isNotNull,
      reason: '@while (0, 2) {\n  [a]\n}\n\'b\'\nresult != null',
    );
    expect(
      s$84.position,
      0,
      reason: '@while (0, 2) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    expect(
      r$100.$1,
      <int>[],
      reason: '@while (0, 2) {\n  [a]\n}\n\'b\'\nresult.\$1 != <int>[]',
    );
    final s$85 = State('b');
    final r$101 = r$91(s$85) as dynamic;
    expect(
      r$101,
      isNotNull,
      reason: '@while (0, 2) {\n  [a]\n}\n\'b\'\nresult != null',
    );
    expect(
      s$85.position,
      0,
      reason: '@while (0, 2) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    expect(
      r$101.$1,
      null,
      reason: '@while (0, 2) {\n  [a]\n}\n\'b\'\nresult.\$1 != null',
    );
    final r$102 = parser.parseWhile8;
    final r$103 = parser.parseWhileVoid8;
    final s$86 = State('a');
    final r$104 = r$102(s$86) as dynamic;
    expect(
      r$104,
      isNotNull,
      reason: '@while (1, 1) {\n  [a]\n}\n\'a\'\nresult != null',
    );
    expect(
      s$86.position,
      1,
      reason: '@while (1, 1) {\n  [a]\n}\n\'a\'\nstate.position = 1',
    );
    expect(r$104.$1, [
      97,
    ], reason: '@while (1, 1) {\n  [a]\n}\n\'a\'\nresult.\$1 != [97]');
    final s$87 = State('a');
    final r$105 = r$103(s$87) as dynamic;
    expect(
      r$105,
      isNotNull,
      reason: '@while (1, 1) {\n  [a]\n}\n\'a\'\nresult != null',
    );
    expect(
      s$87.position,
      1,
      reason: '@while (1, 1) {\n  [a]\n}\n\'a\'\nstate.position = 1',
    );
    expect(
      r$105.$1,
      null,
      reason: '@while (1, 1) {\n  [a]\n}\n\'a\'\nresult.\$1 != null',
    );
    final s$88 = State('aa');
    final r$106 = r$102(s$88) as dynamic;
    expect(
      r$106,
      isNotNull,
      reason: '@while (1, 1) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      s$88.position,
      1,
      reason: '@while (1, 1) {\n  [a]\n}\n\'aa\'\nstate.position = 1',
    );
    expect(r$106.$1, [
      97,
    ], reason: '@while (1, 1) {\n  [a]\n}\n\'aa\'\nresult.\$1 != [97]');
    final s$89 = State('aa');
    final r$107 = r$103(s$89) as dynamic;
    expect(
      r$107,
      isNotNull,
      reason: '@while (1, 1) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      s$89.position,
      1,
      reason: '@while (1, 1) {\n  [a]\n}\n\'aa\'\nstate.position = 1',
    );
    expect(
      r$107.$1,
      null,
      reason: '@while (1, 1) {\n  [a]\n}\n\'aa\'\nresult.\$1 != null',
    );
    final s$90 = State('');
    final r$108 = r$102(s$90) as dynamic;
    expect(
      r$108,
      isNull,
      reason: '@while (1, 1) {\n  [a]\n}\n\'\'\nresult == null',
    );
    expect(
      s$90.farthestPosition,
      0,
      reason: '@while (1, 1) {\n  [a]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$90.position,
      0,
      reason: '@while (1, 1) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    final e$20 = s$90.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$20.length,
      1,
      reason: '@while (1, 1) {\n  [a]\n}\n\'\'\nerror count',
    );
    expect(e$20, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (1, 1) {\n  [a]\n}\n\'\'\nerrors');
    final s$91 = State('');
    final r$109 = r$103(s$91) as dynamic;
    expect(
      r$109,
      isNull,
      reason: '@while (1, 1) {\n  [a]\n}\n\'\'\nresult == null',
    );
    expect(
      s$91.farthestPosition,
      0,
      reason: '@while (1, 1) {\n  [a]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$91.position,
      0,
      reason: '@while (1, 1) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    final e$21 = s$91.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$21.length,
      1,
      reason: '@while (1, 1) {\n  [a]\n}\n\'\'\nerror count',
    );
    expect(e$21, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (1, 1) {\n  [a]\n}\n\'\'\nerrors');
    final s$92 = State('b');
    final r$110 = r$102(s$92) as dynamic;
    expect(
      r$110,
      isNull,
      reason: '@while (1, 1) {\n  [a]\n}\n\'b\'\nresult == null',
    );
    expect(
      s$92.farthestPosition,
      0,
      reason: '@while (1, 1) {\n  [a]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      s$92.position,
      0,
      reason: '@while (1, 1) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    final e$22 = s$92.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$22.length,
      1,
      reason: '@while (1, 1) {\n  [a]\n}\n\'b\'\nerror count',
    );
    expect(e$22, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (1, 1) {\n  [a]\n}\n\'b\'\nerrors');
    final s$93 = State('b');
    final r$111 = r$103(s$93) as dynamic;
    expect(
      r$111,
      isNull,
      reason: '@while (1, 1) {\n  [a]\n}\n\'b\'\nresult == null',
    );
    expect(
      s$93.farthestPosition,
      0,
      reason: '@while (1, 1) {\n  [a]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      s$93.position,
      0,
      reason: '@while (1, 1) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    final e$23 = s$93.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$23.length,
      1,
      reason: '@while (1, 1) {\n  [a]\n}\n\'b\'\nerror count',
    );
    expect(e$23, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (1, 1) {\n  [a]\n}\n\'b\'\nerrors');
    final r$112 = parser.parseWhile9;
    final r$113 = parser.parseWhileVoid9;
    final s$94 = State('aa');
    final r$114 = r$112(s$94) as dynamic;
    expect(
      r$114,
      isNotNull,
      reason: '@while (2, 2) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      s$94.position,
      2,
      reason: '@while (2, 2) {\n  [a]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      r$114.$1,
      [97, 97],
      reason: '@while (2, 2) {\n  [a]\n}\n\'aa\'\nresult.\$1 != [97, 97]',
    );
    final s$95 = State('aa');
    final r$115 = r$113(s$95) as dynamic;
    expect(
      r$115,
      isNotNull,
      reason: '@while (2, 2) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      s$95.position,
      2,
      reason: '@while (2, 2) {\n  [a]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      r$115.$1,
      null,
      reason: '@while (2, 2) {\n  [a]\n}\n\'aa\'\nresult.\$1 != null',
    );
    final s$96 = State('aaa');
    final r$116 = r$112(s$96) as dynamic;
    expect(
      r$116,
      isNotNull,
      reason: '@while (2, 2) {\n  [a]\n}\n\'aaa\'\nresult != null',
    );
    expect(
      s$96.position,
      2,
      reason: '@while (2, 2) {\n  [a]\n}\n\'aaa\'\nstate.position = 2',
    );
    expect(
      r$116.$1,
      [97, 97],
      reason: '@while (2, 2) {\n  [a]\n}\n\'aaa\'\nresult.\$1 != [97, 97]',
    );
    final s$97 = State('aaa');
    final r$117 = r$113(s$97) as dynamic;
    expect(
      r$117,
      isNotNull,
      reason: '@while (2, 2) {\n  [a]\n}\n\'aaa\'\nresult != null',
    );
    expect(
      s$97.position,
      2,
      reason: '@while (2, 2) {\n  [a]\n}\n\'aaa\'\nstate.position = 2',
    );
    expect(
      r$117.$1,
      null,
      reason: '@while (2, 2) {\n  [a]\n}\n\'aaa\'\nresult.\$1 != null',
    );
    final s$98 = State('');
    final r$118 = r$112(s$98) as dynamic;
    expect(
      r$118,
      isNull,
      reason: '@while (2, 2) {\n  [a]\n}\n\'\'\nresult == null',
    );
    expect(
      s$98.farthestPosition,
      0,
      reason: '@while (2, 2) {\n  [a]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$98.position,
      0,
      reason: '@while (2, 2) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    final e$24 = s$98.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$24.length,
      1,
      reason: '@while (2, 2) {\n  [a]\n}\n\'\'\nerror count',
    );
    expect(e$24, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (2, 2) {\n  [a]\n}\n\'\'\nerrors');
    final s$99 = State('');
    final r$119 = r$113(s$99) as dynamic;
    expect(
      r$119,
      isNull,
      reason: '@while (2, 2) {\n  [a]\n}\n\'\'\nresult == null',
    );
    expect(
      s$99.farthestPosition,
      0,
      reason: '@while (2, 2) {\n  [a]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$99.position,
      0,
      reason: '@while (2, 2) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    final e$25 = s$99.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$25.length,
      1,
      reason: '@while (2, 2) {\n  [a]\n}\n\'\'\nerror count',
    );
    expect(e$25, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (2, 2) {\n  [a]\n}\n\'\'\nerrors');
    final s$100 = State('a');
    final r$120 = r$112(s$100) as dynamic;
    expect(
      r$120,
      isNull,
      reason: '@while (2, 2) {\n  [a]\n}\n\'a\'\nresult == null',
    );
    expect(
      s$100.farthestPosition,
      1,
      reason: '@while (2, 2) {\n  [a]\n}\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      s$100.position,
      0,
      reason: '@while (2, 2) {\n  [a]\n}\n\'a\'\nstate.position = 0',
    );
    final e$26 = s$100.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$26.length,
      1,
      reason: '@while (2, 2) {\n  [a]\n}\n\'a\'\nerror count',
    );
    expect(e$26, [
      '(end: 1, message: Syntax error, start: 1)',
    ], reason: '@while (2, 2) {\n  [a]\n}\n\'a\'\nerrors');
    final s$101 = State('a');
    final r$121 = r$113(s$101) as dynamic;
    expect(
      r$121,
      isNull,
      reason: '@while (2, 2) {\n  [a]\n}\n\'a\'\nresult == null',
    );
    expect(
      s$101.farthestPosition,
      1,
      reason: '@while (2, 2) {\n  [a]\n}\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      s$101.position,
      0,
      reason: '@while (2, 2) {\n  [a]\n}\n\'a\'\nstate.position = 0',
    );
    final e$27 = s$101.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$27.length,
      1,
      reason: '@while (2, 2) {\n  [a]\n}\n\'a\'\nerror count',
    );
    expect(e$27, [
      '(end: 1, message: Syntax error, start: 1)',
    ], reason: '@while (2, 2) {\n  [a]\n}\n\'a\'\nerrors');
    final s$102 = State('b');
    final r$122 = r$112(s$102) as dynamic;
    expect(
      r$122,
      isNull,
      reason: '@while (2, 2) {\n  [a]\n}\n\'b\'\nresult == null',
    );
    expect(
      s$102.farthestPosition,
      0,
      reason: '@while (2, 2) {\n  [a]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      s$102.position,
      0,
      reason: '@while (2, 2) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    final e$28 = s$102.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$28.length,
      1,
      reason: '@while (2, 2) {\n  [a]\n}\n\'b\'\nerror count',
    );
    expect(e$28, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (2, 2) {\n  [a]\n}\n\'b\'\nerrors');
    final s$103 = State('b');
    final r$123 = r$113(s$103) as dynamic;
    expect(
      r$123,
      isNull,
      reason: '@while (2, 2) {\n  [a]\n}\n\'b\'\nresult == null',
    );
    expect(
      s$103.farthestPosition,
      0,
      reason: '@while (2, 2) {\n  [a]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      s$103.position,
      0,
      reason: '@while (2, 2) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    final e$29 = s$103.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$29.length,
      1,
      reason: '@while (2, 2) {\n  [a]\n}\n\'b\'\nerror count',
    );
    expect(e$29, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (2, 2) {\n  [a]\n}\n\'b\'\nerrors');
    final r$124 = parser.parseWhile10;
    final r$125 = parser.parseWhileVoid10;
    final s$104 = State('aa');
    final r$126 = r$124(s$104) as dynamic;
    expect(
      r$126,
      isNotNull,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      s$104.position,
      2,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      r$126.$1,
      [97, 97],
      reason: '@while (2, 3) {\n  [a]\n}\n\'aa\'\nresult.\$1 != [97, 97]',
    );
    final s$105 = State('aa');
    final r$127 = r$125(s$105) as dynamic;
    expect(
      r$127,
      isNotNull,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      s$105.position,
      2,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      r$127.$1,
      null,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aa\'\nresult.\$1 != null',
    );
    final s$106 = State('aaa');
    final r$128 = r$124(s$106) as dynamic;
    expect(
      r$128,
      isNotNull,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aaa\'\nresult != null',
    );
    expect(
      s$106.position,
      3,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aaa\'\nstate.position = 3',
    );
    expect(
      r$128.$1,
      [97, 97, 97],
      reason: '@while (2, 3) {\n  [a]\n}\n\'aaa\'\nresult.\$1 != [97, 97, 97]',
    );
    final s$107 = State('aaa');
    final r$129 = r$125(s$107) as dynamic;
    expect(
      r$129,
      isNotNull,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aaa\'\nresult != null',
    );
    expect(
      s$107.position,
      3,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aaa\'\nstate.position = 3',
    );
    expect(
      r$129.$1,
      null,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aaa\'\nresult.\$1 != null',
    );
    final s$108 = State('aaaa');
    final r$130 = r$124(s$108) as dynamic;
    expect(
      r$130,
      isNotNull,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aaaa\'\nresult != null',
    );
    expect(
      s$108.position,
      3,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aaaa\'\nstate.position = 3',
    );
    expect(
      r$130.$1,
      [97, 97, 97],
      reason: '@while (2, 3) {\n  [a]\n}\n\'aaaa\'\nresult.\$1 != [97, 97, 97]',
    );
    final s$109 = State('aaaa');
    final r$131 = r$125(s$109) as dynamic;
    expect(
      r$131,
      isNotNull,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aaaa\'\nresult != null',
    );
    expect(
      s$109.position,
      3,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aaaa\'\nstate.position = 3',
    );
    expect(
      r$131.$1,
      null,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aaaa\'\nresult.\$1 != null',
    );
    final s$110 = State('');
    final r$132 = r$124(s$110) as dynamic;
    expect(
      r$132,
      isNull,
      reason: '@while (2, 3) {\n  [a]\n}\n\'\'\nresult == null',
    );
    expect(
      s$110.farthestPosition,
      0,
      reason: '@while (2, 3) {\n  [a]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$110.position,
      0,
      reason: '@while (2, 3) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    final e$30 = s$110.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$30.length,
      1,
      reason: '@while (2, 3) {\n  [a]\n}\n\'\'\nerror count',
    );
    expect(e$30, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (2, 3) {\n  [a]\n}\n\'\'\nerrors');
    final s$111 = State('');
    final r$133 = r$125(s$111) as dynamic;
    expect(
      r$133,
      isNull,
      reason: '@while (2, 3) {\n  [a]\n}\n\'\'\nresult == null',
    );
    expect(
      s$111.farthestPosition,
      0,
      reason: '@while (2, 3) {\n  [a]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$111.position,
      0,
      reason: '@while (2, 3) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    final e$31 = s$111.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$31.length,
      1,
      reason: '@while (2, 3) {\n  [a]\n}\n\'\'\nerror count',
    );
    expect(e$31, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (2, 3) {\n  [a]\n}\n\'\'\nerrors');
    final s$112 = State('a');
    final r$134 = r$124(s$112) as dynamic;
    expect(
      r$134,
      isNull,
      reason: '@while (2, 3) {\n  [a]\n}\n\'a\'\nresult == null',
    );
    expect(
      s$112.farthestPosition,
      1,
      reason: '@while (2, 3) {\n  [a]\n}\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      s$112.position,
      0,
      reason: '@while (2, 3) {\n  [a]\n}\n\'a\'\nstate.position = 0',
    );
    final e$32 = s$112.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$32.length,
      1,
      reason: '@while (2, 3) {\n  [a]\n}\n\'a\'\nerror count',
    );
    expect(e$32, [
      '(end: 1, message: Syntax error, start: 1)',
    ], reason: '@while (2, 3) {\n  [a]\n}\n\'a\'\nerrors');
    final s$113 = State('a');
    final r$135 = r$125(s$113) as dynamic;
    expect(
      r$135,
      isNull,
      reason: '@while (2, 3) {\n  [a]\n}\n\'a\'\nresult == null',
    );
    expect(
      s$113.farthestPosition,
      1,
      reason: '@while (2, 3) {\n  [a]\n}\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      s$113.position,
      0,
      reason: '@while (2, 3) {\n  [a]\n}\n\'a\'\nstate.position = 0',
    );
    final e$33 = s$113.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$33.length,
      1,
      reason: '@while (2, 3) {\n  [a]\n}\n\'a\'\nerror count',
    );
    expect(e$33, [
      '(end: 1, message: Syntax error, start: 1)',
    ], reason: '@while (2, 3) {\n  [a]\n}\n\'a\'\nerrors');
    final s$114 = State('b');
    final r$136 = r$124(s$114) as dynamic;
    expect(
      r$136,
      isNull,
      reason: '@while (2, 3) {\n  [a]\n}\n\'b\'\nresult == null',
    );
    expect(
      s$114.farthestPosition,
      0,
      reason: '@while (2, 3) {\n  [a]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      s$114.position,
      0,
      reason: '@while (2, 3) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    final e$34 = s$114.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$34.length,
      1,
      reason: '@while (2, 3) {\n  [a]\n}\n\'b\'\nerror count',
    );
    expect(e$34, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (2, 3) {\n  [a]\n}\n\'b\'\nerrors');
    final s$115 = State('b');
    final r$137 = r$125(s$115) as dynamic;
    expect(
      r$137,
      isNull,
      reason: '@while (2, 3) {\n  [a]\n}\n\'b\'\nresult == null',
    );
    expect(
      s$115.farthestPosition,
      0,
      reason: '@while (2, 3) {\n  [a]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      s$115.position,
      0,
      reason: '@while (2, 3) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    final e$35 = s$115.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$35.length,
      1,
      reason: '@while (2, 3) {\n  [a]\n}\n\'b\'\nerror count',
    );
    expect(e$35, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '@while (2, 3) {\n  [a]\n}\n\'b\'\nerrors');
    final r$138 = parser.parseWhile11;
    final r$139 = parser.parseWhileVoid11;
    final s$116 = State('ac');
    final r$140 = r$138(s$116) as dynamic;
    expect(
      r$140,
      isNotNull,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'ac\'\nresult != null',
    );
    expect(
      s$116.position,
      2,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'ac\'\nstate.position = 2',
    );
    expect(
      r$140.$1,
      [99],
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'ac\'\nresult.\$1 != [99]',
    );
    final s$117 = State('ac');
    final r$141 = r$139(s$117) as dynamic;
    expect(
      r$141,
      isNotNull,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'ac\'\nresult != null',
    );
    expect(
      s$117.position,
      2,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'ac\'\nstate.position = 2',
    );
    expect(
      r$141.$1,
      null,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'ac\'\nresult.\$1 != null',
    );
    final s$118 = State('bc');
    final r$142 = r$138(s$118) as dynamic;
    expect(
      r$142,
      isNotNull,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'bc\'\nresult != null',
    );
    expect(
      s$118.position,
      2,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'bc\'\nstate.position = 2',
    );
    expect(
      r$142.$1,
      [99],
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'bc\'\nresult.\$1 != [99]',
    );
    final s$119 = State('bc');
    final r$143 = r$139(s$119) as dynamic;
    expect(
      r$143,
      isNotNull,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'bc\'\nresult != null',
    );
    expect(
      s$119.position,
      2,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'bc\'\nstate.position = 2',
    );
    expect(
      r$143.$1,
      null,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'bc\'\nresult.\$1 != null',
    );
    final s$120 = State('bcc');
    final r$144 = r$138(s$120) as dynamic;
    expect(
      r$144,
      isNotNull,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'bcc\'\nresult != null',
    );
    expect(
      s$120.position,
      3,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'bcc\'\nstate.position = 3',
    );
    expect(
      r$144.$1,
      [99, 99],
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'bcc\'\nresult.\$1 != [99, 99]',
    );
    final s$121 = State('bcc');
    final r$145 = r$139(s$121) as dynamic;
    expect(
      r$145,
      isNotNull,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'bcc\'\nresult != null',
    );
    expect(
      s$121.position,
      3,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'bcc\'\nstate.position = 3',
    );
    expect(
      r$145.$1,
      null,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'bcc\'\nresult.\$1 != null',
    );
    final s$122 = State('');
    final r$146 = r$138(s$122) as dynamic;
    expect(
      r$146,
      isNull,
      reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'\'\nresult == null',
    );
    expect(
      s$122.farthestPosition,
      0,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$122.position,
      0,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'\'\nstate.position = 0',
    );
    final e$36 = s$122.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$36.length,
      1,
      reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'\'\nerror count',
    );
    expect(e$36, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'\'\nerrors');
    final s$123 = State('');
    final r$147 = r$139(s$123) as dynamic;
    expect(
      r$147,
      isNull,
      reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'\'\nresult == null',
    );
    expect(
      s$123.farthestPosition,
      0,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$123.position,
      0,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'\'\nstate.position = 0',
    );
    final e$37 = s$123.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$37.length,
      1,
      reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'\'\nerror count',
    );
    expect(e$37, [
      '(end: 0, message: Syntax error, start: 0)',
    ], reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'\'\nerrors');
    final s$124 = State('a');
    final r$148 = r$138(s$124) as dynamic;
    expect(
      r$148,
      isNull,
      reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'a\'\nresult == null',
    );
    expect(
      s$124.farthestPosition,
      1,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      s$124.position,
      0,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'a\'\nstate.position = 0',
    );
    final e$38 = s$124.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$38.length,
      1,
      reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'a\'\nerror count',
    );
    expect(e$38, [
      '(end: 1, message: Syntax error, start: 1)',
    ], reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'a\'\nerrors');
    final s$125 = State('a');
    final r$149 = r$139(s$125) as dynamic;
    expect(
      r$149,
      isNull,
      reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'a\'\nresult == null',
    );
    expect(
      s$125.farthestPosition,
      1,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      s$125.position,
      0,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'a\'\nstate.position = 0',
    );
    final e$39 = s$125.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$39.length,
      1,
      reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'a\'\nerror count',
    );
    expect(e$39, [
      '(end: 1, message: Syntax error, start: 1)',
    ], reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'a\'\nerrors');
    final s$126 = State('b');
    final r$150 = r$138(s$126) as dynamic;
    expect(
      r$150,
      isNull,
      reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'b\'\nresult == null',
    );
    expect(
      s$126.farthestPosition,
      1,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'b\'\nstate.farthestPosition = 1',
    );
    expect(
      s$126.position,
      0,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'b\'\nstate.position = 0',
    );
    final e$40 = s$126.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$40.length,
      1,
      reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'b\'\nerror count',
    );
    expect(e$40, [
      '(end: 1, message: Syntax error, start: 1)',
    ], reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'b\'\nerrors');
    final s$127 = State('b');
    final r$151 = r$139(s$127) as dynamic;
    expect(
      r$151,
      isNull,
      reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'b\'\nresult == null',
    );
    expect(
      s$127.farthestPosition,
      1,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'b\'\nstate.farthestPosition = 1',
    );
    expect(
      s$127.position,
      0,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'b\'\nstate.position = 0',
    );
    final e$41 = s$127.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$41.length,
      1,
      reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'b\'\nerror count',
    );
    expect(e$41, [
      '(end: 1, message: Syntax error, start: 1)',
    ], reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'b\'\nerrors');
  });

  test('ZeroOrMore', () {
    final r$ = parser.parseZeroOrMore0;
    final r$1 = parser.parseZeroOrMoreVoid0;
    final s$ = State('a');
    final r$2 = r$(s$) as dynamic;
    expect(r$2, isNotNull, reason: '[a]*\n\'a\'\nresult != null');
    expect(s$.position, 1, reason: '[a]*\n\'a\'\nstate.position = 1');
    expect(r$2.$1, [97], reason: '[a]*\n\'a\'\nresult.\$1 != [97]');
    final s$1 = State('a');
    final r$3 = r$1(s$1) as dynamic;
    expect(r$3, isNotNull, reason: '[a]*\n\'a\'\nresult != null');
    expect(s$1.position, 1, reason: '[a]*\n\'a\'\nstate.position = 1');
    expect(r$3.$1, null, reason: '[a]*\n\'a\'\nresult.\$1 != null');
    final s$2 = State('aa');
    final r$4 = r$(s$2) as dynamic;
    expect(r$4, isNotNull, reason: '[a]*\n\'aa\'\nresult != null');
    expect(s$2.position, 2, reason: '[a]*\n\'aa\'\nstate.position = 2');
    expect(r$4.$1, [97, 97], reason: '[a]*\n\'aa\'\nresult.\$1 != [97, 97]');
    final s$3 = State('aa');
    final r$5 = r$1(s$3) as dynamic;
    expect(r$5, isNotNull, reason: '[a]*\n\'aa\'\nresult != null');
    expect(s$3.position, 2, reason: '[a]*\n\'aa\'\nstate.position = 2');
    expect(r$5.$1, null, reason: '[a]*\n\'aa\'\nresult.\$1 != null');
    final s$4 = State('');
    final r$6 = r$(s$4) as dynamic;
    expect(r$6, isNotNull, reason: '[a]*\n\'\'\nresult != null');
    expect(s$4.position, 0, reason: '[a]*\n\'\'\nstate.position = 0');
    expect(r$6.$1, <int>[], reason: '[a]*\n\'\'\nresult.\$1 != <int>[]');
    final s$5 = State('');
    final r$7 = r$1(s$5) as dynamic;
    expect(r$7, isNotNull, reason: '[a]*\n\'\'\nresult != null');
    expect(s$5.position, 0, reason: '[a]*\n\'\'\nstate.position = 0');
    expect(r$7.$1, null, reason: '[a]*\n\'\'\nresult.\$1 != null');
    final s$6 = State('b');
    final r$8 = r$(s$6) as dynamic;
    expect(r$8, isNotNull, reason: '[a]*\n\'b\'\nresult != null');
    expect(s$6.position, 0, reason: '[a]*\n\'b\'\nstate.position = 0');
    expect(r$8.$1, <int>[], reason: '[a]*\n\'b\'\nresult.\$1 != <int>[]');
    final s$7 = State('b');
    final r$9 = r$1(s$7) as dynamic;
    expect(r$9, isNotNull, reason: '[a]*\n\'b\'\nresult != null');
    expect(s$7.position, 0, reason: '[a]*\n\'b\'\nstate.position = 0');
    expect(r$9.$1, null, reason: '[a]*\n\'b\'\nresult.\$1 != null');
    final r$10 = parser.parseZeroOrMore1;
    final r$11 = parser.parseZeroOrMoreVoid1;
    final s$8 = State('a');
    final r$12 = r$10(s$8) as dynamic;
    expect(r$12, isNotNull, reason: '([a] / [z])*\n\'a\'\nresult != null');
    expect(s$8.position, 1, reason: '([a] / [z])*\n\'a\'\nstate.position = 1');
    expect(r$12.$1, [97], reason: '([a] / [z])*\n\'a\'\nresult.\$1 != [97]');
    final s$9 = State('a');
    final r$13 = r$11(s$9) as dynamic;
    expect(r$13, isNotNull, reason: '([a] / [z])*\n\'a\'\nresult != null');
    expect(s$9.position, 1, reason: '([a] / [z])*\n\'a\'\nstate.position = 1');
    expect(r$13.$1, null, reason: '([a] / [z])*\n\'a\'\nresult.\$1 != null');
    final s$10 = State('aa');
    final r$14 = r$10(s$10) as dynamic;
    expect(r$14, isNotNull, reason: '([a] / [z])*\n\'aa\'\nresult != null');
    expect(
      s$10.position,
      2,
      reason: '([a] / [z])*\n\'aa\'\nstate.position = 2',
    );
    expect(r$14.$1, [
      97,
      97,
    ], reason: '([a] / [z])*\n\'aa\'\nresult.\$1 != [97, 97]');
    final s$11 = State('aa');
    final r$15 = r$11(s$11) as dynamic;
    expect(r$15, isNotNull, reason: '([a] / [z])*\n\'aa\'\nresult != null');
    expect(
      s$11.position,
      2,
      reason: '([a] / [z])*\n\'aa\'\nstate.position = 2',
    );
    expect(r$15.$1, null, reason: '([a] / [z])*\n\'aa\'\nresult.\$1 != null');
    final s$12 = State('z');
    final r$16 = r$10(s$12) as dynamic;
    expect(r$16, isNotNull, reason: '([a] / [z])*\n\'z\'\nresult != null');
    expect(s$12.position, 1, reason: '([a] / [z])*\n\'z\'\nstate.position = 1');
    expect(r$16.$1, [122], reason: '([a] / [z])*\n\'z\'\nresult.\$1 != [122]');
    final s$13 = State('z');
    final r$17 = r$11(s$13) as dynamic;
    expect(r$17, isNotNull, reason: '([a] / [z])*\n\'z\'\nresult != null');
    expect(s$13.position, 1, reason: '([a] / [z])*\n\'z\'\nstate.position = 1');
    expect(r$17.$1, null, reason: '([a] / [z])*\n\'z\'\nresult.\$1 != null');
    final s$14 = State('za');
    final r$18 = r$10(s$14) as dynamic;
    expect(r$18, isNotNull, reason: '([a] / [z])*\n\'za\'\nresult != null');
    expect(
      s$14.position,
      2,
      reason: '([a] / [z])*\n\'za\'\nstate.position = 2',
    );
    expect(r$18.$1, [
      122,
      97,
    ], reason: '([a] / [z])*\n\'za\'\nresult.\$1 != [122, 97]');
    final s$15 = State('za');
    final r$19 = r$11(s$15) as dynamic;
    expect(r$19, isNotNull, reason: '([a] / [z])*\n\'za\'\nresult != null');
    expect(
      s$15.position,
      2,
      reason: '([a] / [z])*\n\'za\'\nstate.position = 2',
    );
    expect(r$19.$1, null, reason: '([a] / [z])*\n\'za\'\nresult.\$1 != null');
    final s$16 = State('');
    final r$20 = r$10(s$16) as dynamic;
    expect(r$20, isNotNull, reason: '([a] / [z])*\n\'\'\nresult != null');
    expect(s$16.position, 0, reason: '([a] / [z])*\n\'\'\nstate.position = 0');
    expect(
      r$20.$1,
      <int>[],
      reason: '([a] / [z])*\n\'\'\nresult.\$1 != <int>[]',
    );
    final s$17 = State('');
    final r$21 = r$11(s$17) as dynamic;
    expect(r$21, isNotNull, reason: '([a] / [z])*\n\'\'\nresult != null');
    expect(s$17.position, 0, reason: '([a] / [z])*\n\'\'\nstate.position = 0');
    expect(r$21.$1, null, reason: '([a] / [z])*\n\'\'\nresult.\$1 != null');
    final s$18 = State('b');
    final r$22 = r$10(s$18) as dynamic;
    expect(r$22, isNotNull, reason: '([a] / [z])*\n\'b\'\nresult != null');
    expect(s$18.position, 0, reason: '([a] / [z])*\n\'b\'\nstate.position = 0');
    expect(
      r$22.$1,
      <int>[],
      reason: '([a] / [z])*\n\'b\'\nresult.\$1 != <int>[]',
    );
    final s$19 = State('b');
    final r$23 = r$11(s$19) as dynamic;
    expect(r$23, isNotNull, reason: '([a] / [z])*\n\'b\'\nresult != null');
    expect(s$19.position, 0, reason: '([a] / [z])*\n\'b\'\nstate.position = 0');
    expect(r$23.$1, null, reason: '([a] / [z])*\n\'b\'\nresult.\$1 != null');
  });

  test('Identifier', () {
    final r$ = parser.parseIdentifier0;
    final r$1 = parser.parseIdentifierVoid0;
    final s$ = State('fo');
    final r$2 = r$(s$) as dynamic;
    expect(
      r$2,
      isNotNull,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'fo\'\nresult != null',
    );
    expect(
      s$.position,
      2,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'fo\'\nstate.position = 2',
    );
    expect(
      r$2.$1,
      'fo',
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'fo\'\nresult.\$1 != \'fo\'',
    );
    final s$1 = State('fo');
    final r$3 = r$1(s$1) as dynamic;
    expect(
      r$3,
      isNotNull,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'fo\'\nresult != null',
    );
    expect(
      s$1.position,
      2,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'fo\'\nstate.position = 2',
    );
    expect(
      r$3.$1,
      null,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'fo\'\nresult.\$1 != null',
    );
    final s$2 = State('fort');
    final r$4 = r$(s$2) as dynamic;
    expect(
      r$4,
      isNotNull,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'fort\'\nresult != null',
    );
    expect(
      s$2.position,
      4,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'fort\'\nstate.position = 4',
    );
    expect(
      r$4.$1,
      'fort',
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'fort\'\nresult.\$1 != \'fort\'',
    );
    final s$3 = State('fort');
    final r$5 = r$1(s$3) as dynamic;
    expect(
      r$5,
      isNotNull,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'fort\'\nresult != null',
    );
    expect(
      s$3.position,
      4,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'fort\'\nstate.position = 4',
    );
    expect(
      r$5.$1,
      null,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'fort\'\nresult.\$1 != null',
    );
    final s$4 = State('');
    final r$6 = r$(s$4) as dynamic;
    expect(
      r$6,
      isNull,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'\'\nresult == null',
    );
    expect(
      s$4.farthestPosition,
      0,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$4.position,
      0,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'\'\nstate.position = 0',
    );
    final e$ = s$4.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$.length,
      1,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'\'\nerror count',
    );
    expect(
      e$,
      ['(end: 0, message: Syntax error, start: 0)'],
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'\'\nerrors',
    );
    final s$5 = State('');
    final r$7 = r$1(s$5) as dynamic;
    expect(
      r$7,
      isNull,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'\'\nresult == null',
    );
    expect(
      s$5.farthestPosition,
      0,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$5.position,
      0,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'\'\nstate.position = 0',
    );
    final e$1 = s$5.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$1.length,
      1,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'\'\nerror count',
    );
    expect(
      e$1,
      ['(end: 0, message: Syntax error, start: 0)'],
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'\'\nerrors',
    );
    final s$6 = State('for');
    final r$8 = r$(s$6) as dynamic;
    expect(
      r$8,
      isNull,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'for\'\nresult == null',
    );
    expect(
      s$6.farthestPosition,
      0,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'for\'\nstate.farthestPosition = 0',
    );
    expect(
      s$6.position,
      0,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'for\'\nstate.position = 0',
    );
    final e$2 = s$6.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$2.length,
      1,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'for\'\nerror count',
    );
    expect(
      e$2,
      ['(end: 0, message: Syntax error, start: 0)'],
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'for\'\nerrors',
    );
    final s$7 = State('for');
    final r$9 = r$1(s$7) as dynamic;
    expect(
      r$9,
      isNull,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'for\'\nresult == null',
    );
    expect(
      s$7.farthestPosition,
      0,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'for\'\nstate.farthestPosition = 0',
    );
    expect(
      s$7.position,
      0,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'for\'\nstate.position = 0',
    );
    final e$3 = s$7.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$3.length,
      1,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'for\'\nerror count',
    );
    expect(
      e$3,
      ['(end: 0, message: Syntax error, start: 0)'],
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'for\'\nerrors',
    );
    final s$8 = State('foreach');
    final r$10 = r$(s$8) as dynamic;
    expect(
      r$10,
      isNull,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'foreach\'\nresult == null',
    );
    expect(
      s$8.farthestPosition,
      0,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'foreach\'\nstate.farthestPosition = 0',
    );
    expect(
      s$8.position,
      0,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'foreach\'\nstate.position = 0',
    );
    final e$4 = s$8.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$4.length,
      1,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'foreach\'\nerror count',
    );
    expect(
      e$4,
      ['(end: 0, message: Syntax error, start: 0)'],
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'foreach\'\nerrors',
    );
    final s$9 = State('foreach');
    final r$11 = r$1(s$9) as dynamic;
    expect(
      r$11,
      isNull,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'foreach\'\nresult == null',
    );
    expect(
      s$9.farthestPosition,
      0,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'foreach\'\nstate.farthestPosition = 0',
    );
    expect(
      s$9.position,
      0,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'foreach\'\nstate.position = 0',
    );
    final e$5 = s$9.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$5.length,
      1,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'foreach\'\nerror count',
    );
    expect(
      e$5,
      ['(end: 0, message: Syntax error, start: 0)'],
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'foreach\'\nerrors',
    );
    final r$12 = parser.parseIdentifier1;
    final r$13 = parser.parseIdentifierVoid1;
    final s$10 = State('fo');
    final r$14 = r$12(s$10) as dynamic;
    expect(
      r$14,
      isNotNull,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'fo\'\nresult != null',
    );
    expect(
      s$10.position,
      2,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'fo\'\nstate.position = 2',
    );
    expect(
      r$14.$1,
      'fo',
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'fo\'\nresult.\$1 != \'fo\'',
    );
    final s$11 = State('fo');
    final r$15 = r$13(s$11) as dynamic;
    expect(
      r$15,
      isNotNull,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'fo\'\nresult != null',
    );
    expect(
      s$11.position,
      2,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'fo\'\nstate.position = 2',
    );
    expect(
      r$15.$1,
      null,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'fo\'\nresult.\$1 != null',
    );
    final s$12 = State('fort');
    final r$16 = r$12(s$12) as dynamic;
    expect(
      r$16,
      isNotNull,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'fort\'\nresult != null',
    );
    expect(
      s$12.position,
      4,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'fort\'\nstate.position = 4',
    );
    expect(
      r$16.$1,
      'fort',
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'fort\'\nresult.\$1 != \'fort\'',
    );
    final s$13 = State('fort');
    final r$17 = r$13(s$13) as dynamic;
    expect(
      r$17,
      isNotNull,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'fort\'\nresult != null',
    );
    expect(
      s$13.position,
      4,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'fort\'\nstate.position = 4',
    );
    expect(
      r$17.$1,
      null,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'fort\'\nresult.\$1 != null',
    );
    final s$14 = State('');
    final r$18 = r$12(s$14) as dynamic;
    expect(
      r$18,
      isNull,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'\'\nresult == null',
    );
    expect(
      s$14.farthestPosition,
      0,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$14.position,
      0,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'\'\nstate.position = 0',
    );
    final e$6 = s$14.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$6.length,
      1,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'\'\nerror count',
    );
    expect(
      e$6,
      ['(end: 0, message: Syntax error, start: 0)'],
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'\'\nerrors',
    );
    final s$15 = State('');
    final r$19 = r$13(s$15) as dynamic;
    expect(
      r$19,
      isNull,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'\'\nresult == null',
    );
    expect(
      s$15.farthestPosition,
      0,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      s$15.position,
      0,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'\'\nstate.position = 0',
    );
    final e$7 = s$15.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$7.length,
      1,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'\'\nerror count',
    );
    expect(
      e$7,
      ['(end: 0, message: Syntax error, start: 0)'],
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'\'\nerrors',
    );
    final s$16 = State('for');
    final r$20 = r$12(s$16) as dynamic;
    expect(
      r$20,
      isNull,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'for\'\nresult == null',
    );
    expect(
      s$16.farthestPosition,
      0,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'for\'\nstate.farthestPosition = 0',
    );
    expect(
      s$16.position,
      0,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'for\'\nstate.position = 0',
    );
    final e$8 = s$16.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$8.length,
      1,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'for\'\nerror count',
    );
    expect(
      e$8,
      ['(end: 0, message: Syntax error, start: 0)'],
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'for\'\nerrors',
    );
    final s$17 = State('for');
    final r$21 = r$13(s$17) as dynamic;
    expect(
      r$21,
      isNull,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'for\'\nresult == null',
    );
    expect(
      s$17.farthestPosition,
      0,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'for\'\nstate.farthestPosition = 0',
    );
    expect(
      s$17.position,
      0,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'for\'\nstate.position = 0',
    );
    final e$9 = s$17.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$9.length,
      1,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'for\'\nerror count',
    );
    expect(
      e$9,
      ['(end: 0, message: Syntax error, start: 0)'],
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'for\'\nerrors',
    );
    final s$18 = State('foreach');
    final r$22 = r$12(s$18) as dynamic;
    expect(
      r$22,
      isNull,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'foreach\'\nresult == null',
    );
    expect(
      s$18.farthestPosition,
      0,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'foreach\'\nstate.farthestPosition = 0',
    );
    expect(
      s$18.position,
      0,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'foreach\'\nstate.position = 0',
    );
    final e$10 = s$18.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$10.length,
      1,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'foreach\'\nerror count',
    );
    expect(
      e$10,
      ['(end: 0, message: Syntax error, start: 0)'],
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'foreach\'\nerrors',
    );
    final s$19 = State('foreach');
    final r$23 = r$13(s$19) as dynamic;
    expect(
      r$23,
      isNull,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'foreach\'\nresult == null',
    );
    expect(
      s$19.farthestPosition,
      0,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'foreach\'\nstate.farthestPosition = 0',
    );
    expect(
      s$19.position,
      0,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'foreach\'\nstate.position = 0',
    );
    final e$11 = s$19.getErrors().map((e) => '$e').toList()..sort();
    expect(
      e$11.length,
      1,
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'foreach\'\nerror count',
    );
    expect(
      e$11,
      ['(end: 0, message: Syntax error, start: 0)'],
      reason:
          '{ var end = -1; }\n!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! @while (1) {\n    [a-zA-Z0-9]\n    { end = state.position; }\n  }\n)\n\$ = <\n  (\n    & { end != -1 }\n    @position({ end })\n    ----\n    [a-zA-Z]\n    [a-zA-Z0-9]*\n  )\n>\n\'foreach\'\nerrors',
    );
  });
}

// dart format off
class _TestParser {
  /// [int] **Action0**
  /// ```txt
  /// `int` Action0 =>
  ///   $ = `const` { 41 }
  /// ```
  Result<int> parseAction0(State state) {
    return const Ok(41);
  }

  /// [void] **ActionVoid0**
  /// ```txt
  /// `void` ActionVoid0 =>
  ///   $ = `const` { 41 }
  /// ```
  Result<void> parseActionVoid0(State state) {
    const $$ = Ok(41);
    return Result.none;
  }

  /// [int] **Action1**
  /// ```txt
  /// `int` Action1 =>
  ///   $ = `const int` { 41 }
  /// ```
  Result<int> parseAction1(State state) {
    return const Ok(41);
  }

  /// [void] **ActionVoid1**
  /// ```txt
  /// `void` ActionVoid1 =>
  ///   $ = `const int` { 41 }
  /// ```
  Result<void> parseActionVoid1(State state) {
    const $$ = Ok(41);
    return Result.none;
  }

  /// [int] **Action2**
  /// ```txt
  /// `int` Action2 =>
  ///   { const x = 41; }
  ///   $ = `const` { x }
  /// ```
  Result<int> parseAction2(State state) {
    const x = 41;
    return const Ok(x);
  }

  /// [void] **ActionVoid2**
  /// ```txt
  /// `void` ActionVoid2 =>
  ///   { const x = 41; }
  ///   $ = `const` { x }
  /// ```
  Result<void> parseActionVoid2(State state) {
    const x = 41;
    const $$ = Ok(x);
    return Result.none;
  }

  /// [String] **AndPredicate0**
  /// ```txt
  /// `String` AndPredicate0 =>
  ///   &"abc"
  ///   $ = 'abcd'
  /// ```
  Result<String>? parseAndPredicate0(State state) {
    // "abc"
    if (state.ch == 97 && state.startsWith('abc')) {
      // 'abcd'
      if (state.ch == 97 && state.startsWith('abcd')) {
        state.readChar(state.position + 4);
        return const Ok('abcd');
      }
      state.errorExpected('abcd');
      return null;
    }
    return null;
  }

  /// [void] **AndPredicateVoid0**
  /// ```txt
  /// `void` AndPredicateVoid0 =>
  ///   &"abc"
  ///   $ = 'abcd'
  /// ```
  Result<void>? parseAndPredicateVoid0(State state) {
    // "abc"
    if (state.ch == 97 && state.startsWith('abc')) {
      // 'abcd'
      if (state.ch == 97 && state.startsWith('abcd')) {
        state.readChar(state.position + 4);
        const $$ = Ok('abcd');
        return Result.none;
      }
      state.errorExpected('abcd');
      return null;
    }
    return null;
  }

  /// [void] **AndPredicate1**
  /// ```txt
  /// `void` AndPredicate1 =>
  ///   &"abc"
  /// ```
  Result<void>? parseAndPredicate1(State state) {
    // "abc"
    if (state.ch == 97 && state.startsWith('abc')) {
      return Result.none;
    }
    return null;
  }

  /// [int] **AnyCharacter0**
  /// ```txt
  /// `int` AnyCharacter0 =>
  ///   .
  /// ```
  Result<int>? parseAnyCharacter0(State state) {
    if (state.ch >= 0) {
      final anyCharacter0$ = state.ch;
      state.nextChar();
      return Ok(anyCharacter0$);
    }
    return null;
  }

  /// [void] **AnyCharacterVoid0**
  /// ```txt
  /// `void` AnyCharacterVoid0 =>
  ///   .
  /// ```
  Result<void>? parseAnyCharacterVoid0(State state) {
    if (state.ch >= 0) {
      state.nextChar();
      return Result.none;
    }
    return null;
  }

  /// [String] **Capture0**
  /// ```txt
  /// `String` Capture0 =>
  ///   <[a]>
  /// ```
  Result<String>? parseCapture0(State state) {
    final pos$ = state.position;
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      return Ok(state.substring(pos$, state.position));
    }
    return null;
  }

  /// [void] **CaptureVoid0**
  /// ```txt
  /// `void` CaptureVoid0 =>
  ///   <[a]>
  /// ```
  Result<void>? parseCaptureVoid0(State state) {
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      return Result.none;
    }
    return null;
  }

  /// [void] **Capture1**
  /// ```txt
  /// `void` Capture1 =>
  ///   <[a]>
  /// ```
  Result<void>? parseCapture1(State state) {
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      return Result.none;
    }
    return null;
  }

  /// [String] **Capture2**
  /// ```txt
  /// `String` Capture2 =>
  ///   <[a] / [b]>
  /// ```
  Result<String>? parseCapture2(State state) {
    final pos$ = state.position;
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      return Ok(state.substring(pos$, state.position));
    }
    // [b]
    if (state.ch == 98) {
      state.nextChar();
      return Ok(state.substring(pos$, state.position));
    }
    return null;
  }

  /// [void] **CaptureVoid2**
  /// ```txt
  /// `void` CaptureVoid2 =>
  ///   <[a] / [b]>
  /// ```
  Result<void>? parseCaptureVoid2(State state) {
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      return Result.none;
    }
    // [b]
    if (state.ch == 98) {
      state.nextChar();
      return Result.none;
    }
    return null;
  }

  /// [String] **Capture3**
  /// ```txt
  /// `String` Capture3 =>
  ///   [a]
  ///   $ = <[b] / [c]>
  /// ```
  Result<String>? parseCapture3(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      final pos$1 = state.position;
      // [b]
      if (state.ch == 98) {
        state.nextChar();
        return Ok(state.substring(pos$1, state.position));
      }
      // [c]
      if (state.ch == 99) {
        state.nextChar();
        return Ok(state.substring(pos$1, state.position));
      }
      state.ch = c$;
      state.position = pos$;
      return null;
    }
    return null;
  }

  /// [void] **CaptureVoid3**
  /// ```txt
  /// `void` CaptureVoid3 =>
  ///   [a]
  ///   $ = <[b] / [c]>
  /// ```
  Result<void>? parseCaptureVoid3(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      final pos$1 = state.position;
      // [b]
      if (state.ch == 98) {
        state.nextChar();
        final $$ = Ok(state.substring(pos$1, state.position));
        return Result.none;
      }
      // [c]
      if (state.ch == 99) {
        state.nextChar();
        final $$1 = Ok(state.substring(pos$1, state.position));
        return Result.none;
      }
      state.ch = c$;
      state.position = pos$;
      return null;
    }
    return null;
  }

  /// [int] **CharacterClass0**
  /// ```txt
  /// `int` CharacterClass0 =>
  ///   [a]
  /// ```
  Result<int>? parseCharacterClass0(State state) {
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      return const Ok(97);
    }
    return null;
  }

  /// [void] **CharacterClassVoid0**
  /// ```txt
  /// `void` CharacterClassVoid0 =>
  ///   [a]
  /// ```
  Result<void>? parseCharacterClassVoid0(State state) {
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      return Result.none;
    }
    return null;
  }

  /// [int] **CharacterClass1**
  /// ```txt
  /// `int` CharacterClass1 =>
  ///   [a-z]
  /// ```
  Result<int>? parseCharacterClass1(State state) {
    // [a-z]
    final c$ = state.ch;
    final isSuccess$ = c$ >= 97 && c$ <= 122;
    if (isSuccess$) {
      state.nextChar();
      return Ok(c$);
    }
    return null;
  }

  /// [void] **CharacterClassVoid1**
  /// ```txt
  /// `void` CharacterClassVoid1 =>
  ///   [a-z]
  /// ```
  Result<void>? parseCharacterClassVoid1(State state) {
    // [a-z]
    final c$ = state.ch;
    final isSuccess$ = c$ >= 97 && c$ <= 122;
    if (isSuccess$) {
      state.nextChar();
      return Result.none;
    }
    return null;
  }

  /// [int] **CharacterClass2**
  /// ```txt
  /// `int` CharacterClass2 =>
  ///   [^a]
  /// ```
  Result<int>? parseCharacterClass2(State state) {
    // [^a]
    final c$ = state.ch;
    final isSuccess$ = !(c$ == 97) && !(c$ < 0);
    if (isSuccess$) {
      state.nextChar();
      return Ok(c$);
    }
    return null;
  }

  /// [void] **CharacterClassVoid2**
  /// ```txt
  /// `void` CharacterClassVoid2 =>
  ///   [^a]
  /// ```
  Result<void>? parseCharacterClassVoid2(State state) {
    // [^a]
    final c$ = state.ch;
    final isSuccess$ = !(c$ == 97) && !(c$ < 0);
    if (isSuccess$) {
      state.nextChar();
      return Result.none;
    }
    return null;
  }

  /// [int] **CharacterClass3**
  /// ```txt
  /// `int` CharacterClass3 =>
  ///   [^ab]
  /// ```
  Result<int>? parseCharacterClass3(State state) {
    // [^ab]
    final c$ = state.ch;
    final isSuccess$ = !(c$ >= 97 && c$ <= 98) && !(c$ < 0);
    if (isSuccess$) {
      state.nextChar();
      return Ok(c$);
    }
    return null;
  }

  /// [void] **CharacterClassVoid3**
  /// ```txt
  /// `void` CharacterClassVoid3 =>
  ///   [^ab]
  /// ```
  Result<void>? parseCharacterClassVoid3(State state) {
    // [^ab]
    final c$ = state.ch;
    final isSuccess$ = !(c$ >= 97 && c$ <= 98) && !(c$ < 0);
    if (isSuccess$) {
      state.nextChar();
      return Result.none;
    }
    return null;
  }

  /// [int] **CharacterClass4**
  /// ```txt
  /// `int` CharacterClass4 =>
  ///   [^abc]
  /// ```
  Result<int>? parseCharacterClass4(State state) {
    // [^abc]
    final c$ = state.ch;
    final isSuccess$ = !(c$ >= 97 && c$ <= 99) && !(c$ < 0);
    if (isSuccess$) {
      state.nextChar();
      return Ok(c$);
    }
    return null;
  }

  /// [void] **CharacterClassVoid4**
  /// ```txt
  /// `void` CharacterClassVoid4 =>
  ///   [^abc]
  /// ```
  Result<void>? parseCharacterClassVoid4(State state) {
    // [^abc]
    final c$ = state.ch;
    final isSuccess$ = !(c$ >= 97 && c$ <= 99) && !(c$ < 0);
    if (isSuccess$) {
      state.nextChar();
      return Result.none;
    }
    return null;
  }

  /// [int] **CharacterClass5**
  /// ```txt
  /// `int` CharacterClass5 =>
  ///   [^a-z]
  /// ```
  Result<int>? parseCharacterClass5(State state) {
    // [^a-z]
    final c$ = state.ch;
    final isSuccess$ = !(c$ >= 97 && c$ <= 122) && !(c$ < 0);
    if (isSuccess$) {
      state.nextChar();
      return Ok(c$);
    }
    return null;
  }

  /// [void] **CharacterClassVoid5**
  /// ```txt
  /// `void` CharacterClassVoid5 =>
  ///   [^a-z]
  /// ```
  Result<void>? parseCharacterClassVoid5(State state) {
    // [^a-z]
    final c$ = state.ch;
    final isSuccess$ = !(c$ >= 97 && c$ <= 122) && !(c$ < 0);
    if (isSuccess$) {
      state.nextChar();
      return Result.none;
    }
    return null;
  }

  /// [int] **CharacterClass6**
  /// ```txt
  /// `int` CharacterClass6 =>
  ///   [\^]
  /// ```
  Result<int>? parseCharacterClass6(State state) {
    // [\^]
    if (state.ch == 94) {
      state.nextChar();
      return const Ok(94);
    }
    return null;
  }

  /// [void] **CharacterClassVoid6**
  /// ```txt
  /// `void` CharacterClassVoid6 =>
  ///   [\^]
  /// ```
  Result<void>? parseCharacterClassVoid6(State state) {
    // [\^]
    if (state.ch == 94) {
      state.nextChar();
      return Result.none;
    }
    return null;
  }

  /// [int] **CharacterClass7**
  /// ```txt
  /// `int` CharacterClass7 =>
  ///   [\-]
  /// ```
  Result<int>? parseCharacterClass7(State state) {
    // [\-]
    if (state.ch == 45) {
      state.nextChar();
      return const Ok(45);
    }
    return null;
  }

  /// [void] **CharacterClassVoid7**
  /// ```txt
  /// `void` CharacterClassVoid7 =>
  ///   [\-]
  /// ```
  Result<void>? parseCharacterClassVoid7(State state) {
    // [\-]
    if (state.ch == 45) {
      state.nextChar();
      return Result.none;
    }
    return null;
  }

  /// [int] **CharacterClass8**
  /// ```txt
  /// `int` CharacterClass8 =>
  ///   [\u{20}]
  /// ```
  Result<int>? parseCharacterClass8(State state) {
    // [ ]
    if (state.ch == 32) {
      state.nextChar();
      return const Ok(32);
    }
    return null;
  }

  /// [void] **CharacterClassVoid8**
  /// ```txt
  /// `void` CharacterClassVoid8 =>
  ///   [\u{20}]
  /// ```
  Result<void>? parseCharacterClassVoid8(State state) {
    // [ ]
    if (state.ch == 32) {
      state.nextChar();
      return Result.none;
    }
    return null;
  }

  /// [int] **CharacterClass9**
  /// ```txt
  /// `int` CharacterClass9 =>
  ///   [\u{30}-\u{39}]
  /// ```
  Result<int>? parseCharacterClass9(State state) {
    // [0-9]
    final c$ = state.ch;
    final isSuccess$ = c$ >= 48 && c$ <= 57;
    if (isSuccess$) {
      state.nextChar();
      return Ok(c$);
    }
    return null;
  }

  /// [void] **CharacterClassVoid9**
  /// ```txt
  /// `void` CharacterClassVoid9 =>
  ///   [\u{30}-\u{39}]
  /// ```
  Result<void>? parseCharacterClassVoid9(State state) {
    // [0-9]
    final c$ = state.ch;
    final isSuccess$ = c$ >= 48 && c$ <= 57;
    if (isSuccess$) {
      state.nextChar();
      return Result.none;
    }
    return null;
  }

  /// [int] **CharacterClass10**
  /// ```txt
  /// `int` CharacterClass10 =>
  ///   [\u{0}]
  /// ```
  Result<int>? parseCharacterClass10(State state) {
    // [{0}]
    if (state.ch == 0) {
      state.nextChar();
      return const Ok(0);
    }
    return null;
  }

  /// [void] **CharacterClassVoid10**
  /// ```txt
  /// `void` CharacterClassVoid10 =>
  ///   [\u{0}]
  /// ```
  Result<void>? parseCharacterClassVoid10(State state) {
    // [{0}]
    if (state.ch == 0) {
      state.nextChar();
      return Result.none;
    }
    return null;
  }

  /// [int] **CharacterClass11**
  /// ```txt
  /// `int` CharacterClass11 =>
  ///   [\u{0}-\u{9}]
  /// ```
  Result<int>? parseCharacterClass11(State state) {
    // [{0}-\t]
    final c$ = state.ch;
    final isSuccess$ = c$ >= 0 && c$ <= 9;
    if (isSuccess$) {
      state.nextChar();
      return Ok(c$);
    }
    return null;
  }

  /// [void] **CharacterClassVoid11**
  /// ```txt
  /// `void` CharacterClassVoid11 =>
  ///   [\u{0}-\u{9}]
  /// ```
  Result<void>? parseCharacterClassVoid11(State state) {
    // [{0}-\t]
    final c$ = state.ch;
    final isSuccess$ = c$ >= 0 && c$ <= 9;
    if (isSuccess$) {
      state.nextChar();
      return Result.none;
    }
    return null;
  }

  /// [int] **CharacterClass12**
  /// ```txt
  /// `int` CharacterClass12 =>
  ///   [^\u{0}]
  /// ```
  Result<int>? parseCharacterClass12(State state) {
    // [^{0}]
    final c$ = state.ch;
    final isSuccess$ = !(c$ == 0) && !(c$ < 0);
    if (isSuccess$) {
      state.nextChar();
      return Ok(c$);
    }
    return null;
  }

  /// [void] **CharacterClassVoid12**
  /// ```txt
  /// `void` CharacterClassVoid12 =>
  ///   [^\u{0}]
  /// ```
  Result<void>? parseCharacterClassVoid12(State state) {
    // [^{0}]
    final c$ = state.ch;
    final isSuccess$ = !(c$ == 0) && !(c$ < 0);
    if (isSuccess$) {
      state.nextChar();
      return Result.none;
    }
    return null;
  }

  /// [int] **CharacterClass13**
  /// ```txt
  /// `int` CharacterClass13 =>
  ///   [^\u{0}-\u{9}]
  /// ```
  Result<int>? parseCharacterClass13(State state) {
    // [^{0}-\t]
    final c$ = state.ch;
    final isSuccess$ = !(c$ >= 0 && c$ <= 9) && !(c$ < 0);
    if (isSuccess$) {
      state.nextChar();
      return Ok(c$);
    }
    return null;
  }

  /// [void] **CharacterClassVoid13**
  /// ```txt
  /// `void` CharacterClassVoid13 =>
  ///   [^\u{0}-\u{9}]
  /// ```
  Result<void>? parseCharacterClassVoid13(State state) {
    // [^{0}-\t]
    final c$ = state.ch;
    final isSuccess$ = !(c$ >= 0 && c$ <= 9) && !(c$ < 0);
    if (isSuccess$) {
      state.nextChar();
      return Result.none;
    }
    return null;
  }

  /// [int] **CharacterClass14**
  /// ```txt
  /// `int` CharacterClass14 =>
  ///   [a]
  ///   ---
  ///   [b]
  /// ```
  Result<int>? parseCharacterClass14(State state) {
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      return const Ok(97);
    }
    // [b]
    if (state.ch == 98) {
      state.nextChar();
      return const Ok(98);
    }
    return null;
  }

  /// [void] **CharacterClassVoid14**
  /// ```txt
  /// `void` CharacterClassVoid14 =>
  ///   [a]
  ///   ---
  ///   [b]
  /// ```
  Result<void>? parseCharacterClassVoid14(State state) {
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      return Result.none;
    }
    // [b]
    if (state.ch == 98) {
      state.nextChar();
      return Result.none;
    }
    return null;
  }

  /// [int] **CharacterClass15**
  /// ```txt
  /// `int` CharacterClass15 =>
  ///   $ = (
  ///     [a]
  ///     ---
  ///     [b]
  ///   )
  ///   [ ]
  /// ```
  Result<int>? parseCharacterClass15(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    final Result<int> $$;
    l$:
    {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        $$ = const Ok(97);
        break l$;
      }
      // [b]
      if (state.ch == 98) {
        state.nextChar();
        $$ = const Ok(98);
        break l$;
      }
      return null;
    }
    // l$:
    final $$1 = $$;
    // [ ]
    if (state.ch == 32) {
      state.nextChar();
      return $$1;
    }
    state.ch = c$;
    state.position = pos$;
    return null;
  }

  /// [void] **CharacterClassVoid15**
  /// ```txt
  /// `void` CharacterClassVoid15 =>
  ///   $ = (
  ///     [a]
  ///     ---
  ///     [b]
  ///   )
  ///   [ ]
  /// ```
  Result<void>? parseCharacterClassVoid15(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    final Result<int> $$;
    l$:
    {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        $$ = const Ok(97);
        break l$;
      }
      // [b]
      if (state.ch == 98) {
        state.nextChar();
        $$ = const Ok(98);
        break l$;
      }
      return null;
    }
    // l$:
    final $$1 = $$;
    // [ ]
    if (state.ch == 32) {
      state.nextChar();
      return Result.none;
    }
    state.ch = c$;
    state.position = pos$;
    return null;
  }

  /// [void] **CharacterClass16**
  /// ```txt
  /// `void` CharacterClass16 =>
  ///   (
  ///     [a]
  ///     ---
  ///     [b]
  ///   )
  ///   [ ]
  /// ```
  Result<void>? parseCharacterClass16(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    l$:
    {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        break l$;
      }
      // [b]
      if (state.ch == 98) {
        state.nextChar();
        break l$;
      }
      return null;
    }
    // l$:
    // [ ]
    if (state.ch == 32) {
      state.nextChar();
      return Result.none;
    }
    state.ch = c$;
    state.position = pos$;
    return null;
  }

  /// [int] **Group0**
  /// ```txt
  /// `int` Group0 =>
  ///   ([a] / [z])
  /// ```
  Result<int>? parseGroup0(State state) {
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      return const Ok(97);
    }
    // [z]
    if (state.ch == 122) {
      state.nextChar();
      return const Ok(122);
    }
    return null;
  }

  /// [void] **GroupVoid0**
  /// ```txt
  /// `void` GroupVoid0 =>
  ///   ([a] / [z])
  /// ```
  Result<void>? parseGroupVoid0(State state) {
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      return Result.none;
    }
    // [z]
    if (state.ch == 122) {
      state.nextChar();
      return Result.none;
    }
    return null;
  }

  /// [String] **Literal0**
  /// ```txt
  /// `String` Literal0 =>
  ///   'abc'
  /// ```
  Result<String>? parseLiteral0(State state) {
    // 'abc'
    if (state.ch == 97 && state.startsWith('abc')) {
      state.readChar(state.position + 3);
      return const Ok('abc');
    }
    state.errorExpected('abc');
    return null;
  }

  /// [void] **LiteralVoid0**
  /// ```txt
  /// `void` LiteralVoid0 =>
  ///   'abc'
  /// ```
  Result<void>? parseLiteralVoid0(State state) {
    // 'abc'
    if (state.ch == 97 && state.startsWith('abc')) {
      state.readChar(state.position + 3);
      return Result.none;
    }
    state.errorExpected('abc');
    return null;
  }

  /// [String] **Literal1**
  /// ```txt
  /// `String` Literal1 =>
  ///   "abc"
  /// ```
  Result<String>? parseLiteral1(State state) {
    // "abc"
    if (state.ch == 97 && state.startsWith('abc')) {
      state.readChar(state.position + 3);
      return const Ok('abc');
    }
    return null;
  }

  /// [void] **LiteralVoid1**
  /// ```txt
  /// `void` LiteralVoid1 =>
  ///   "abc"
  /// ```
  Result<void>? parseLiteralVoid1(State state) {
    // "abc"
    if (state.ch == 97 && state.startsWith('abc')) {
      state.readChar(state.position + 3);
      return Result.none;
    }
    return null;
  }

  /// [String] **Literal2**
  /// ```txt
  /// `String` Literal2 =>
  ///   ""
  /// ```
  Result<String> parseLiteral2(State state) {
    // ""
    return const Ok('');
  }

  /// [void] **LiteralVoid2**
  /// ```txt
  /// `void` LiteralVoid2 =>
  ///   ""
  /// ```
  Result<void> parseLiteralVoid2(State state) {
    // ""
    return Result.none;
  }

  /// [String] **Literal3**
  /// ```txt
  /// `String` Literal3 =>
  ///   ''
  /// ```
  Result<String> parseLiteral3(State state) {
    // ''
    return const Ok('');
  }

  /// [void] **LiteralVoid3**
  /// ```txt
  /// `void` LiteralVoid3 =>
  ///   ''
  /// ```
  Result<void> parseLiteralVoid3(State state) {
    // ''
    return Result.none;
  }

  /// [String] **Literal4**
  /// ```txt
  /// `String` Literal4 =>
  ///   "\r\n"
  /// ```
  Result<String>? parseLiteral4(State state) {
    // "\r\n"
    if (state.ch == 13 && state.startsWith('\r\n')) {
      state.readChar(state.position + 2);
      return const Ok('\r\n');
    }
    return null;
  }

  /// [void] **LiteralVoid4**
  /// ```txt
  /// `void` LiteralVoid4 =>
  ///   "\r\n"
  /// ```
  Result<void>? parseLiteralVoid4(State state) {
    // "\r\n"
    if (state.ch == 13 && state.startsWith('\r\n')) {
      state.readChar(state.position + 2);
      return Result.none;
    }
    return null;
  }

  /// [String] **Literal5**
  /// ```txt
  /// `String` Literal5 =>
  ///   "abc"
  ///   ---
  ///   "def"
  /// ```
  Result<String>? parseLiteral5(State state) {
    // "abc"
    if (state.ch == 97 && state.startsWith('abc')) {
      state.readChar(state.position + 3);
      return const Ok('abc');
    }
    // "def"
    if (state.ch == 100 && state.startsWith('def')) {
      state.readChar(state.position + 3);
      return const Ok('def');
    }
    return null;
  }

  /// [void] **LiteralVoid5**
  /// ```txt
  /// `void` LiteralVoid5 =>
  ///   "abc"
  ///   ---
  ///   "def"
  /// ```
  Result<void>? parseLiteralVoid5(State state) {
    // "abc"
    if (state.ch == 97 && state.startsWith('abc')) {
      state.readChar(state.position + 3);
      return Result.none;
    }
    // "def"
    if (state.ch == 100 && state.startsWith('def')) {
      state.readChar(state.position + 3);
      return Result.none;
    }
    return null;
  }

  /// [String] **Literal6**
  /// ```txt
  /// `String` Literal6 =>
  ///   $ = (
  ///     "abc"
  ///     ---
  ///     "def"
  ///   )
  ///   [ ]
  /// ```
  Result<String>? parseLiteral6(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    final Result<String> $$;
    l$:
    {
      // "abc"
      if (state.ch == 97 && state.startsWith('abc')) {
        state.readChar(state.position + 3);
        $$ = const Ok('abc');
        break l$;
      }
      // "def"
      if (state.ch == 100 && state.startsWith('def')) {
        state.readChar(state.position + 3);
        $$ = const Ok('def');
        break l$;
      }
      return null;
    }
    // l$:
    final $$1 = $$;
    // [ ]
    if (state.ch == 32) {
      state.nextChar();
      return $$1;
    }
    state.ch = c$;
    state.position = pos$;
    return null;
  }

  /// [void] **LiteralVoid6**
  /// ```txt
  /// `void` LiteralVoid6 =>
  ///   $ = (
  ///     "abc"
  ///     ---
  ///     "def"
  ///   )
  ///   [ ]
  /// ```
  Result<void>? parseLiteralVoid6(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    final Result<String> $$;
    l$:
    {
      // "abc"
      if (state.ch == 97 && state.startsWith('abc')) {
        state.readChar(state.position + 3);
        $$ = const Ok('abc');
        break l$;
      }
      // "def"
      if (state.ch == 100 && state.startsWith('def')) {
        state.readChar(state.position + 3);
        $$ = const Ok('def');
        break l$;
      }
      return null;
    }
    // l$:
    final $$1 = $$;
    // [ ]
    if (state.ch == 32) {
      state.nextChar();
      return Result.none;
    }
    state.ch = c$;
    state.position = pos$;
    return null;
  }

  /// [void] **Literal7**
  /// ```txt
  /// `void` Literal7 =>
  ///   (
  ///     "abc"
  ///     ---
  ///     "def"
  ///   )
  ///   [ ]
  /// ```
  Result<void>? parseLiteral7(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    l$:
    {
      // "abc"
      if (state.ch == 97 && state.startsWith('abc')) {
        state.readChar(state.position + 3);
        break l$;
      }
      // "def"
      if (state.ch == 100 && state.startsWith('def')) {
        state.readChar(state.position + 3);
        break l$;
      }
      return null;
    }
    // l$:
    // [ ]
    if (state.ch == 32) {
      state.nextChar();
      return Result.none;
    }
    state.ch = c$;
    state.position = pos$;
    return null;
  }

  /// [String] **Literal8**
  /// ```txt
  /// `String` Literal8 =>
  ///   'abc'
  ///   ---
  ///   'def'
  /// ```
  Result<String>? parseLiteral8(State state) {
    // 'abc'
    if (state.ch == 97 && state.startsWith('abc')) {
      state.readChar(state.position + 3);
      return const Ok('abc');
    }
    state.errorExpected('abc');
    // 'def'
    if (state.ch == 100 && state.startsWith('def')) {
      state.readChar(state.position + 3);
      return const Ok('def');
    }
    state.errorExpected('def');
    return null;
  }

  /// [void] **LiteralVoid8**
  /// ```txt
  /// `void` LiteralVoid8 =>
  ///   'abc'
  ///   ---
  ///   'def'
  /// ```
  Result<void>? parseLiteralVoid8(State state) {
    // 'abc'
    if (state.ch == 97 && state.startsWith('abc')) {
      state.readChar(state.position + 3);
      return Result.none;
    }
    state.errorExpected('abc');
    // 'def'
    if (state.ch == 100 && state.startsWith('def')) {
      state.readChar(state.position + 3);
      return Result.none;
    }
    state.errorExpected('def');
    return null;
  }

  /// [String] **Literal9**
  /// ```txt
  /// `String` Literal9 =>
  ///   $ = (
  ///     'abc'
  ///     ---
  ///     'def'
  ///   )
  ///   [ ]
  /// ```
  Result<String>? parseLiteral9(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    final Result<String> $$;
    l$:
    {
      // 'abc'
      if (state.ch == 97 && state.startsWith('abc')) {
        state.readChar(state.position + 3);
        $$ = const Ok('abc');
        break l$;
      }
      state.errorExpected('abc');
      // 'def'
      if (state.ch == 100 && state.startsWith('def')) {
        state.readChar(state.position + 3);
        $$ = const Ok('def');
        break l$;
      }
      state.errorExpected('def');
      return null;
    }
    // l$:
    final $$1 = $$;
    // [ ]
    if (state.ch == 32) {
      state.nextChar();
      return $$1;
    }
    state.ch = c$;
    state.position = pos$;
    return null;
  }

  /// [void] **LiteralVoid9**
  /// ```txt
  /// `void` LiteralVoid9 =>
  ///   $ = (
  ///     'abc'
  ///     ---
  ///     'def'
  ///   )
  ///   [ ]
  /// ```
  Result<void>? parseLiteralVoid9(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    final Result<String> $$;
    l$:
    {
      // 'abc'
      if (state.ch == 97 && state.startsWith('abc')) {
        state.readChar(state.position + 3);
        $$ = const Ok('abc');
        break l$;
      }
      state.errorExpected('abc');
      // 'def'
      if (state.ch == 100 && state.startsWith('def')) {
        state.readChar(state.position + 3);
        $$ = const Ok('def');
        break l$;
      }
      state.errorExpected('def');
      return null;
    }
    // l$:
    final $$1 = $$;
    // [ ]
    if (state.ch == 32) {
      state.nextChar();
      return Result.none;
    }
    state.ch = c$;
    state.position = pos$;
    return null;
  }

  /// [void] **Literal10**
  /// ```txt
  /// `void` Literal10 =>
  ///   (
  ///     'abc'
  ///     ---
  ///     'def'
  ///   )
  ///   [ ]
  /// ```
  Result<void>? parseLiteral10(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    l$:
    {
      // 'abc'
      if (state.ch == 97 && state.startsWith('abc')) {
        state.readChar(state.position + 3);
        break l$;
      }
      state.errorExpected('abc');
      // 'def'
      if (state.ch == 100 && state.startsWith('def')) {
        state.readChar(state.position + 3);
        break l$;
      }
      state.errorExpected('def');
      return null;
    }
    // l$:
    // [ ]
    if (state.ch == 32) {
      state.nextChar();
      return Result.none;
    }
    state.ch = c$;
    state.position = pos$;
    return null;
  }

  /// [String] **Match0**
  /// ```txt
  /// `String` Match0 =>
  ///   @match('for')
  /// ```
  Result<String>? parseMatch0(State state) {
    // @match('for')
    var pos$ = state.position;
    if (state.ch == 102 || state.ch == 70) {
      var c$ = state.charAt(pos$ += 1);
      if (c$ == 111 || c$ == 79) {
        c$ = state.charAt(pos$ += 1);
        if (c$ == 114 || c$ == 82) {
          final match0$ = state.substring(state.position, pos$ += 1);
          state.readChar(pos$);
          return Ok(match0$);
        }
      }
    }
    return null;
  }

  /// [void] **MatchVoid0**
  /// ```txt
  /// `void` MatchVoid0 =>
  ///   @match('for')
  /// ```
  Result<void>? parseMatchVoid0(State state) {
    // @match('for')
    var pos$ = state.position;
    if (state.ch == 102 || state.ch == 70) {
      var c$ = state.charAt(pos$ += 1);
      if (c$ == 111 || c$ == 79) {
        c$ = state.charAt(pos$ += 1);
        if (c$ == 114 || c$ == 82) {
          state.readChar(pos$ += 1);
          return Result.none;
        }
      }
    }
    return null;
  }

  /// [String] **Match1**
  /// ```txt
  /// `String` Match1 =>
  ///   @match('FOR')
  /// ```
  Result<String>? parseMatch1(State state) {
    // @match('FOR')
    var pos$ = state.position;
    if (state.ch == 102 || state.ch == 70) {
      var c$ = state.charAt(pos$ += 1);
      if (c$ == 111 || c$ == 79) {
        c$ = state.charAt(pos$ += 1);
        if (c$ == 114 || c$ == 82) {
          final match1$ = state.substring(state.position, pos$ += 1);
          state.readChar(pos$);
          return Ok(match1$);
        }
      }
    }
    return null;
  }

  /// [void] **MatchVoid1**
  /// ```txt
  /// `void` MatchVoid1 =>
  ///   @match('FOR')
  /// ```
  Result<void>? parseMatchVoid1(State state) {
    // @match('FOR')
    var pos$ = state.position;
    if (state.ch == 102 || state.ch == 70) {
      var c$ = state.charAt(pos$ += 1);
      if (c$ == 111 || c$ == 79) {
        c$ = state.charAt(pos$ += 1);
        if (c$ == 114 || c$ == 82) {
          state.readChar(pos$ += 1);
          return Result.none;
        }
      }
    }
    return null;
  }

  /// [String] **Match2**
  /// ```txt
  /// `String` Match2 =>
  ///   @match('for')
  ///   ~{ state.errorExpected('for'); }
  /// ```
  Result<String>? parseMatch2(State state) {
    // @match('for')
    var pos$ = state.position;
    if (state.ch == 102 || state.ch == 70) {
      var c$ = state.charAt(pos$ += 1);
      if (c$ == 111 || c$ == 79) {
        c$ = state.charAt(pos$ += 1);
        if (c$ == 114 || c$ == 82) {
          final match2$ = state.substring(state.position, pos$ += 1);
          state.readChar(pos$);
          return Ok(match2$);
        }
      }
    }
    state.errorExpected('for');
    return null;
  }

  /// [void] **MatchVoid2**
  /// ```txt
  /// `void` MatchVoid2 =>
  ///   @match('for')
  ///   ~{ state.errorExpected('for'); }
  /// ```
  Result<void>? parseMatchVoid2(State state) {
    // @match('for')
    var pos$ = state.position;
    if (state.ch == 102 || state.ch == 70) {
      var c$ = state.charAt(pos$ += 1);
      if (c$ == 111 || c$ == 79) {
        c$ = state.charAt(pos$ += 1);
        if (c$ == 114 || c$ == 82) {
          state.readChar(pos$ += 1);
          return Result.none;
        }
      }
    }
    state.errorExpected('for');
    return null;
  }

  /// [void] **Match3**
  /// ```txt
  /// `void` Match3 =>
  ///   & @match('for')
  /// ```
  Result<void>? parseMatch3(State state) {
    state.predicate++;
    final pos$ = state.position;
    final c$ = state.ch;
    // @match('for')
    var pos$1 = state.position;
    if (state.ch == 102 || state.ch == 70) {
      var c$1 = state.charAt(pos$1 += 1);
      if (c$1 == 111 || c$1 == 79) {
        c$1 = state.charAt(pos$1 += 1);
        if (c$1 == 114 || c$1 == 82) {
          state.readChar(pos$1 += 1);
          state.ch = c$;
          state.position = pos$;
          state.predicate--;
          return Result.none;
        }
      }
    }
    return null;
  }

  /// [void] **Match4**
  /// ```txt
  /// `void` Match4 =>
  ///   ! @match('for')
  /// ```
  Result<void>? parseMatch4(State state) {
    state.predicate++;
    final pos$ = state.position;
    final c$ = state.ch;
    // @match('for')
    var pos$1 = state.position;
    if (state.ch == 102 || state.ch == 70) {
      var c$1 = state.charAt(pos$1 += 1);
      if (c$1 == 111 || c$1 == 79) {
        c$1 = state.charAt(pos$1 += 1);
        if (c$1 == 114 || c$1 == 82) {
          state.readChar(pos$1 += 1);
          state.ch = c$;
          state.position = pos$;
          state.predicate--;
          return null;
        }
      }
    }
    state.predicate--;
    return Result.none;
  }

  /// [String] **Match5**
  /// ```txt
  /// `String` Match5 =>
  ///   @match('for')
  ///   ---
  ///   @match('while')
  /// ```
  Result<String>? parseMatch5(State state) {
    // @match('for')
    var pos$ = state.position;
    if (state.ch == 102 || state.ch == 70) {
      var c$ = state.charAt(pos$ += 1);
      if (c$ == 111 || c$ == 79) {
        c$ = state.charAt(pos$ += 1);
        if (c$ == 114 || c$ == 82) {
          final match5$ = state.substring(state.position, pos$ += 1);
          state.readChar(pos$);
          return Ok(match5$);
        }
      }
    }
    // @match('while')
    var pos$1 = state.position;
    if (state.ch == 119 || state.ch == 87) {
      var c$1 = state.charAt(pos$1 += 1);
      if (c$1 == 104 || c$1 == 72) {
        c$1 = state.charAt(pos$1 += 1);
        if (c$1 == 105 || c$1 == 73) {
          c$1 = state.charAt(pos$1 += 1);
          if (c$1 == 108 || c$1 == 76) {
            c$1 = state.charAt(pos$1 += 1);
            if (c$1 == 101 || c$1 == 69) {
              final match5$1 = state.substring(state.position, pos$1 += 1);
              state.readChar(pos$1);
              return Ok(match5$1);
            }
          }
        }
      }
    }
    return null;
  }

  /// [void] **MatchVoid5**
  /// ```txt
  /// `void` MatchVoid5 =>
  ///   @match('for')
  ///   ---
  ///   @match('while')
  /// ```
  Result<void>? parseMatchVoid5(State state) {
    // @match('for')
    var pos$ = state.position;
    if (state.ch == 102 || state.ch == 70) {
      var c$ = state.charAt(pos$ += 1);
      if (c$ == 111 || c$ == 79) {
        c$ = state.charAt(pos$ += 1);
        if (c$ == 114 || c$ == 82) {
          state.readChar(pos$ += 1);
          return Result.none;
        }
      }
    }
    // @match('while')
    var pos$1 = state.position;
    if (state.ch == 119 || state.ch == 87) {
      var c$1 = state.charAt(pos$1 += 1);
      if (c$1 == 104 || c$1 == 72) {
        c$1 = state.charAt(pos$1 += 1);
        if (c$1 == 105 || c$1 == 73) {
          c$1 = state.charAt(pos$1 += 1);
          if (c$1 == 108 || c$1 == 76) {
            c$1 = state.charAt(pos$1 += 1);
            if (c$1 == 101 || c$1 == 69) {
              state.readChar(pos$1 += 1);
              return Result.none;
            }
          }
        }
      }
    }
    return null;
  }

  /// [String] **Match6**
  /// ```txt
  /// `String` Match6 =>
  ///   $ = (
  ///     @match('for')
  ///     ---
  ///     @match('while')
  ///   )
  ///   [ ]
  /// ```
  Result<String>? parseMatch6(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    final Result<String> $$;
    l$:
    {
      // @match('for')
      var pos$1 = state.position;
      if (state.ch == 102 || state.ch == 70) {
        var c$1 = state.charAt(pos$1 += 1);
        if (c$1 == 111 || c$1 == 79) {
          c$1 = state.charAt(pos$1 += 1);
          if (c$1 == 114 || c$1 == 82) {
            final text$ = state.substring(state.position, pos$1 += 1);
            state.readChar(pos$1);
            $$ = Ok(text$);
            break l$;
          }
        }
      }
      // @match('while')
      var pos$2 = state.position;
      if (state.ch == 119 || state.ch == 87) {
        var c$2 = state.charAt(pos$2 += 1);
        if (c$2 == 104 || c$2 == 72) {
          c$2 = state.charAt(pos$2 += 1);
          if (c$2 == 105 || c$2 == 73) {
            c$2 = state.charAt(pos$2 += 1);
            if (c$2 == 108 || c$2 == 76) {
              c$2 = state.charAt(pos$2 += 1);
              if (c$2 == 101 || c$2 == 69) {
                final text$1 = state.substring(state.position, pos$2 += 1);
                state.readChar(pos$2);
                $$ = Ok(text$1);
                break l$;
              }
            }
          }
        }
      }
      return null;
    }
    // l$:
    final $$1 = $$;
    // [ ]
    if (state.ch == 32) {
      state.nextChar();
      return $$1;
    }
    state.ch = c$;
    state.position = pos$;
    return null;
  }

  /// [void] **MatchVoid6**
  /// ```txt
  /// `void` MatchVoid6 =>
  ///   $ = (
  ///     @match('for')
  ///     ---
  ///     @match('while')
  ///   )
  ///   [ ]
  /// ```
  Result<void>? parseMatchVoid6(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    final Result<String> $$;
    l$:
    {
      // @match('for')
      var pos$1 = state.position;
      if (state.ch == 102 || state.ch == 70) {
        var c$1 = state.charAt(pos$1 += 1);
        if (c$1 == 111 || c$1 == 79) {
          c$1 = state.charAt(pos$1 += 1);
          if (c$1 == 114 || c$1 == 82) {
            final text$ = state.substring(state.position, pos$1 += 1);
            state.readChar(pos$1);
            $$ = Ok(text$);
            break l$;
          }
        }
      }
      // @match('while')
      var pos$2 = state.position;
      if (state.ch == 119 || state.ch == 87) {
        var c$2 = state.charAt(pos$2 += 1);
        if (c$2 == 104 || c$2 == 72) {
          c$2 = state.charAt(pos$2 += 1);
          if (c$2 == 105 || c$2 == 73) {
            c$2 = state.charAt(pos$2 += 1);
            if (c$2 == 108 || c$2 == 76) {
              c$2 = state.charAt(pos$2 += 1);
              if (c$2 == 101 || c$2 == 69) {
                final text$1 = state.substring(state.position, pos$2 += 1);
                state.readChar(pos$2);
                $$ = Ok(text$1);
                break l$;
              }
            }
          }
        }
      }
      return null;
    }
    // l$:
    final $$1 = $$;
    // [ ]
    if (state.ch == 32) {
      state.nextChar();
      return Result.none;
    }
    state.ch = c$;
    state.position = pos$;
    return null;
  }

  /// [void] **Match7**
  /// ```txt
  /// `void` Match7 =>
  ///   (
  ///     @match('for')
  ///     ---
  ///     @match('while')
  ///   )
  ///   [ ]
  /// ```
  Result<void>? parseMatch7(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    l$:
    {
      // @match('for')
      var pos$1 = state.position;
      if (state.ch == 102 || state.ch == 70) {
        var c$1 = state.charAt(pos$1 += 1);
        if (c$1 == 111 || c$1 == 79) {
          c$1 = state.charAt(pos$1 += 1);
          if (c$1 == 114 || c$1 == 82) {
            state.readChar(pos$1 += 1);
            break l$;
          }
        }
      }
      // @match('while')
      var pos$2 = state.position;
      if (state.ch == 119 || state.ch == 87) {
        var c$2 = state.charAt(pos$2 += 1);
        if (c$2 == 104 || c$2 == 72) {
          c$2 = state.charAt(pos$2 += 1);
          if (c$2 == 105 || c$2 == 73) {
            c$2 = state.charAt(pos$2 += 1);
            if (c$2 == 108 || c$2 == 76) {
              c$2 = state.charAt(pos$2 += 1);
              if (c$2 == 101 || c$2 == 69) {
                state.readChar(pos$2 += 1);
                break l$;
              }
            }
          }
        }
      }
      return null;
    }
    // l$:
    // [ ]
    if (state.ch == 32) {
      state.nextChar();
      return Result.none;
    }
    state.ch = c$;
    state.position = pos$;
    return null;
  }

  /// [String] **NotPredicate0**
  /// ```txt
  /// `String` NotPredicate0 =>
  ///   ! 'abc'
  ///   $ = 'ab'
  /// ```
  Result<String>? parseNotPredicate0(State state) {
    // 'abc'
    if (state.ch == 97 && state.startsWith('abc')) {
      return null;
    }
    state.errorExpected('abc');
    // 'ab'
    if (state.ch == 97 && state.startsWith('ab')) {
      state.readChar(state.position + 2);
      return const Ok('ab');
    }
    state.errorExpected('ab');
    return null;
  }

  /// [void] **NotPredicateVoid0**
  /// ```txt
  /// `void` NotPredicateVoid0 =>
  ///   ! 'abc'
  ///   $ = 'ab'
  /// ```
  Result<void>? parseNotPredicateVoid0(State state) {
    // 'abc'
    if (state.ch == 97 && state.startsWith('abc')) {
      return null;
    }
    state.errorExpected('abc');
    // 'ab'
    if (state.ch == 97 && state.startsWith('ab')) {
      state.readChar(state.position + 2);
      const $$ = Ok('ab');
      return Result.none;
    }
    state.errorExpected('ab');
    return null;
  }

  /// [String] **NotPredicate1**
  /// ```txt
  /// `String` NotPredicate1 =>
  ///   $ = 'abc'
  ///   ! '=>'
  /// ```
  Result<String>? parseNotPredicate1(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    // 'abc'
    if (state.ch == 97 && state.startsWith('abc')) {
      state.readChar(state.position + 3);
      const $$ = Ok('abc');
      // '=>'
      if (state.ch == 61 && state.startsWith('=>')) {
        state.ch = c$;
        state.position = pos$;
        return null;
      }
      state.errorExpected('=>');
      return $$;
    }
    state.errorExpected('abc');
    return null;
  }

  /// [void] **NotPredicateVoid1**
  /// ```txt
  /// `void` NotPredicateVoid1 =>
  ///   $ = 'abc'
  ///   ! '=>'
  /// ```
  Result<void>? parseNotPredicateVoid1(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    // 'abc'
    if (state.ch == 97 && state.startsWith('abc')) {
      state.readChar(state.position + 3);
      const $$ = Ok('abc');
      // '=>'
      if (state.ch == 61 && state.startsWith('=>')) {
        state.ch = c$;
        state.position = pos$;
        return null;
      }
      state.errorExpected('=>');
      return Result.none;
    }
    state.errorExpected('abc');
    return null;
  }

  /// [List<int>] **NotPredicate2**
  /// ```txt
  /// `List<int>` NotPredicate2 =>
  ///   ! @while (2) {
  ///     [a]
  ///   }
  ///   $ = [a]*
  /// ```
  Result<List<int>>? parseNotPredicate2(State state) {
    state.predicate++;
    final pos$ = state.position;
    final c$ = state.ch;
    var count$ = 0;
    // (2)
    while (true) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        count$++;
        continue;
      }
      break;
    }
    if (count$ >= 2) {
      state.ch = c$;
      state.position = pos$;
      state.predicate--;
      return null;
    } else {
      state.ch = c$;
      state.position = pos$;
      state.predicate--;
      final $$ = <int>[];
      // (0)
      while (true) {
        // [a]
        if (state.ch == 97) {
          state.nextChar();
          $$.add(97);
          continue;
        }
        break;
      }
      return Ok($$);
    }
  }

  /// [void] **NotPredicateVoid2**
  /// ```txt
  /// `void` NotPredicateVoid2 =>
  ///   ! @while (2) {
  ///     [a]
  ///   }
  ///   $ = [a]*
  /// ```
  Result<void>? parseNotPredicateVoid2(State state) {
    state.predicate++;
    final pos$ = state.position;
    final c$ = state.ch;
    var count$ = 0;
    // (2)
    while (true) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        count$++;
        continue;
      }
      break;
    }
    if (count$ >= 2) {
      state.ch = c$;
      state.position = pos$;
      state.predicate--;
      return null;
    } else {
      state.ch = c$;
      state.position = pos$;
      state.predicate--;
      final $$ = <int>[];
      // (0)
      while (true) {
        // [a]
        if (state.ch == 97) {
          state.nextChar();
          $$.add(97);
          continue;
        }
        break;
      }
      final $$1 = Ok($$);
      return Result.none;
    }
  }

  /// [List<int>] **OneOrMore0**
  /// ```txt
  /// `List<int>` OneOrMore0 =>
  ///   [a]+
  /// ```
  Result<List<int>>? parseOneOrMore0(State state) {
    final oneOrMore0$ = <int>[];
    // (1)
    while (true) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        oneOrMore0$.add(97);
        continue;
      }
      break;
    }
    if (oneOrMore0$.isNotEmpty) {
      return Ok(oneOrMore0$);
    } else {
      return null;
    }
  }

  /// [void] **OneOrMoreVoid0**
  /// ```txt
  /// `void` OneOrMoreVoid0 =>
  ///   [a]+
  /// ```
  Result<void>? parseOneOrMoreVoid0(State state) {
    var isSuccess$ = false;
    // (1)
    while (true) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        isSuccess$ = true;
        continue;
      }
      break;
    }
    if (isSuccess$) {
      return Result.none;
    } else {
      return null;
    }
  }

  /// [List<int>] **OneOrMore1**
  /// ```txt
  /// `List<int>` OneOrMore1 =>
  ///   ([a] / [z])+
  /// ```
  Result<List<int>>? parseOneOrMore1(State state) {
    final oneOrMore1$ = <int>[];
    // (1)
    while (true) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        oneOrMore1$.add(97);
        continue;
      }
      // [z]
      if (state.ch == 122) {
        state.nextChar();
        oneOrMore1$.add(122);
        continue;
      }
      break;
    }
    if (oneOrMore1$.isNotEmpty) {
      return Ok(oneOrMore1$);
    } else {
      return null;
    }
  }

  /// [void] **OneOrMoreVoid1**
  /// ```txt
  /// `void` OneOrMoreVoid1 =>
  ///   ([a] / [z])+
  /// ```
  Result<void>? parseOneOrMoreVoid1(State state) {
    var isSuccess$ = false;
    // (1)
    while (true) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        isSuccess$ = true;
        continue;
      }
      // [z]
      if (state.ch == 122) {
        state.nextChar();
        isSuccess$ = true;
        continue;
      }
      break;
    }
    if (isSuccess$) {
      return Result.none;
    } else {
      return null;
    }
  }

  /// [int?] **Optional0**
  /// ```txt
  /// `int?` Optional0 =>
  ///   [a]?
  /// ```
  Result<int?> parseOptional0(State state) {
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      return const Ok(97);
    }
    return const Ok(null);
  }

  /// [void] **OptionalVoid0**
  /// ```txt
  /// `void` OptionalVoid0 =>
  ///   [a]?
  /// ```
  Result<void> parseOptionalVoid0(State state) {
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      return Result.none;
    }
    return Result.none;
  }

  /// [int?] **Optional1**
  /// ```txt
  /// `int?` Optional1 =>
  ///   ([a] / [b])?
  /// ```
  Result<int?> parseOptional1(State state) {
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      return const Ok(97);
    }
    // [b]
    if (state.ch == 98) {
      state.nextChar();
      return const Ok(98);
    }
    return const Ok(null);
  }

  /// [void] **OptionalVoid1**
  /// ```txt
  /// `void` OptionalVoid1 =>
  ///   ([a] / [b])?
  /// ```
  Result<void> parseOptionalVoid1(State state) {
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      return Result.none;
    }
    // [b]
    if (state.ch == 98) {
      state.nextChar();
      return Result.none;
    }
    return Result.none;
  }

  /// [int?] **Optional2**
  /// ```txt
  /// `int?` Optional2 =>
  ///   ([a] $ = [b])?
  /// ```
  Result<int?> parseOptional2(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      // [b]
      if (state.ch == 98) {
        state.nextChar();
        return const Ok(98);
      }
      state.ch = c$;
      state.position = pos$;
      return const Ok(null);
    }
    return const Ok(null);
  }

  /// [void] **OptionalVoid2**
  /// ```txt
  /// `void` OptionalVoid2 =>
  ///   ([a] $ = [b])?
  /// ```
  Result<void> parseOptionalVoid2(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      // [b]
      if (state.ch == 98) {
        state.nextChar();
        const $$ = Ok(98);
        return Result.none;
      }
      state.ch = c$;
      state.position = pos$;
      return Result.none;
    }
    return Result.none;
  }

  /// [int?] **Optional3**
  /// ```txt
  /// `int?` Optional3 =>
  ///   ($ = [a] [b])?
  /// ```
  Result<int?> parseOptional3(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      const $$ = Ok(97);
      // [b]
      if (state.ch == 98) {
        state.nextChar();
        return $$;
      }
      state.ch = c$;
      state.position = pos$;
      return const Ok(null);
    }
    return const Ok(null);
  }

  /// [void] **OptionalVoid3**
  /// ```txt
  /// `void` OptionalVoid3 =>
  ///   ($ = [a] [b])?
  /// ```
  Result<void> parseOptionalVoid3(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      const $$ = Ok(97);
      // [b]
      if (state.ch == 98) {
        state.nextChar();
        return Result.none;
      }
      state.ch = c$;
      state.position = pos$;
      return Result.none;
    }
    return Result.none;
  }

  /// [int?] **Optional4**
  /// ```txt
  /// `int?` Optional4 =>
  ///   ([a] / [b])?
  ///   $ = [c]
  /// ```
  Result<int?>? parseOptional4(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    l$:
    {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        break l$;
      }
      // [b]
      if (state.ch == 98) {
        state.nextChar();
        break l$;
      }
      break l$;
    }
    // l$:
    // [c]
    if (state.ch == 99) {
      state.nextChar();
      return const Ok(99);
    }
    state.ch = c$;
    state.position = pos$;
    return null;
  }

  /// [void] **OptionalVoid4**
  /// ```txt
  /// `void` OptionalVoid4 =>
  ///   ([a] / [b])?
  ///   $ = [c]
  /// ```
  Result<void>? parseOptionalVoid4(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    l$:
    {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        break l$;
      }
      // [b]
      if (state.ch == 98) {
        state.nextChar();
        break l$;
      }
      break l$;
    }
    // l$:
    // [c]
    if (state.ch == 99) {
      state.nextChar();
      const $$ = Ok(99);
      return Result.none;
    }
    state.ch = c$;
    state.position = pos$;
    return null;
  }

  /// [void] **Predicate0**
  /// ```txt
  /// `void` Predicate0 =>
  ///   & { true }
  /// ```
  Result<void>? parsePredicate0(State state) {
    final isSuccess$ = true;
    if (isSuccess$) {
      return Result.none;
    }
    return null;
  }

  /// [void] **Predicate1**
  /// ```txt
  /// `void` Predicate1 =>
  ///   & { false }
  /// ```
  Result<void>? parsePredicate1(State state) {
    final isSuccess$ = false;
    if (isSuccess$) {
      return Result.none;
    }
    return null;
  }

  /// [void] **Predicate2**
  /// ```txt
  /// `void` Predicate2 =>
  ///   ! { true }
  /// ```
  Result<void>? parsePredicate2(State state) {
    final isSuccess$ = true;
    if (!isSuccess$) {
      return Result.none;
    }
    return null;
  }

  /// [void] **Predicate3**
  /// ```txt
  /// `void` Predicate3 =>
  ///   ! { false }
  /// ```
  Result<void>? parsePredicate3(State state) {
    final isSuccess$ = false;
    if (!isSuccess$) {
      return Result.none;
    }
    return null;
  }

  /// [void] **Predicate4**
  /// ```txt
  /// `void` Predicate4 =>
  ///   ! { false }
  ///   [ ]
  /// ```
  Result<void>? parsePredicate4(State state) {
    final isSuccess$ = false;
    if (!isSuccess$) {
      // [ ]
      if (state.ch == 32) {
        state.nextChar();
        return Result.none;
      }
      return null;
    }
    return null;
  }

  /// [void] **Predicate5**
  /// ```txt
  /// `void` Predicate5 =>
  ///   ! { true }
  ///   ---
  ///   ! { false }
  /// ```
  Result<void>? parsePredicate5(State state) {
    final isSuccess$ = true;
    if (!isSuccess$) {
      return Result.none;
    }
    final isSuccess$1 = false;
    if (!isSuccess$1) {
      return Result.none;
    }
    return null;
  }

  /// [int] **Sequence0**
  /// ```txt
  /// `int` Sequence0 =>
  ///   a = [0-9]
  ///   b = [0-9]
  ///   c = [0-9]
  ///   $ = { a - 48 + b - 48 + c - 48 }
  /// ```
  Result<int>? parseSequence0(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    // [0-9]
    final isSuccess$ = c$ >= 48 && c$ <= 57;
    if (isSuccess$) {
      state.nextChar();
      final a = c$;
      l$:
      {
        // [0-9]
        final c$1 = state.ch;
        final isSuccess$1 = c$1 >= 48 && c$1 <= 57;
        if (isSuccess$1) {
          state.nextChar();
          final b = c$1;
          // [0-9]
          final c$2 = state.ch;
          final isSuccess$2 = c$2 >= 48 && c$2 <= 57;
          if (isSuccess$2) {
            state.nextChar();
            final c = c$2;
            return Ok(a - 48 + b - 48 + c - 48);
          }
          break l$;
        }
        break l$;
      }
      // l$:
      state.ch = c$;
      state.position = pos$;
      return null;
    }
    return null;
  }

  /// [void] **SequenceVoid0**
  /// ```txt
  /// `void` SequenceVoid0 =>
  ///   a = [0-9]
  ///   b = [0-9]
  ///   c = [0-9]
  ///   $ = { a - 48 + b - 48 + c - 48 }
  /// ```
  Result<void>? parseSequenceVoid0(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    // [0-9]
    final isSuccess$ = c$ >= 48 && c$ <= 57;
    if (isSuccess$) {
      state.nextChar();
      final a = c$;
      l$:
      {
        // [0-9]
        final c$1 = state.ch;
        final isSuccess$1 = c$1 >= 48 && c$1 <= 57;
        if (isSuccess$1) {
          state.nextChar();
          final b = c$1;
          // [0-9]
          final c$2 = state.ch;
          final isSuccess$2 = c$2 >= 48 && c$2 <= 57;
          if (isSuccess$2) {
            state.nextChar();
            final c = c$2;
            final $$ = Ok(a - 48 + b - 48 + c - 48);
            return Result.none;
          }
          break l$;
        }
        break l$;
      }
      // l$:
      state.ch = c$;
      state.position = pos$;
      return null;
    }
    return null;
  }

  /// [String] **Sequence1**
  /// ```txt
  /// `String` Sequence1 =>
  ///   [a]
  ///   [b]
  ///   [c]
  ///   $ = `const` { 'abc' }
  /// ```
  Result<String>? parseSequence1(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      l$:
      {
        // [b]
        if (state.ch == 98) {
          state.nextChar();
          // [c]
          if (state.ch == 99) {
            state.nextChar();
            return const Ok('abc');
          }
          break l$;
        }
        break l$;
      }
      // l$:
      state.ch = c$;
      state.position = pos$;
      return null;
    }
    return null;
  }

  /// [void] **SequenceVoid1**
  /// ```txt
  /// `void` SequenceVoid1 =>
  ///   [a]
  ///   [b]
  ///   [c]
  ///   $ = `const` { 'abc' }
  /// ```
  Result<void>? parseSequenceVoid1(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    // [a]
    if (state.ch == 97) {
      state.nextChar();
      l$:
      {
        // [b]
        if (state.ch == 98) {
          state.nextChar();
          // [c]
          if (state.ch == 99) {
            state.nextChar();
            const $$ = Ok('abc');
            return Result.none;
          }
          break l$;
        }
        break l$;
      }
      // l$:
      state.ch = c$;
      state.position = pos$;
      return null;
    }
    return null;
  }

  /// [String] **Sequence2**
  /// ```txt
  /// `String` Sequence2 =>
  ///   "foo"
  ///   ~ { state.errorExpected('foo'); }
  /// ```
  Result<String>? parseSequence2(State state) {
    // "foo"
    if (state.ch == 102 && state.startsWith('foo')) {
      state.readChar(state.position + 3);
      return const Ok('foo');
    }
    state.errorExpected('foo');
    return null;
  }

  /// [void] **SequenceVoid2**
  /// ```txt
  /// `void` SequenceVoid2 =>
  ///   "foo"
  ///   ~ { state.errorExpected('foo'); }
  /// ```
  Result<void>? parseSequenceVoid2(State state) {
    // "foo"
    if (state.ch == 102 && state.startsWith('foo')) {
      state.readChar(state.position + 3);
      return Result.none;
    }
    state.errorExpected('foo');
    return null;
  }

  /// [List<int>] **While0**
  /// ```txt
  /// `List<int>` While0 =>
  ///   @while (0) {
  ///     [a]
  ///   }
  /// ```
  Result<List<int>> parseWhile0(State state) {
    final while0$ = <int>[];
    // (0)
    while (true) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        while0$.add(97);
        continue;
      }
      break;
    }
    return Ok(while0$);
  }

  /// [void] **WhileVoid0**
  /// ```txt
  /// `void` WhileVoid0 =>
  ///   @while (0) {
  ///     [a]
  ///   }
  /// ```
  Result<void> parseWhileVoid0(State state) {
    // (0)
    while (true) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        continue;
      }
      break;
    }
    return Result.none;
  }

  /// [List<int>] **While1**
  /// ```txt
  /// `List<int>` While1 =>
  ///   @while (0) {
  ///     [a] / [z]
  ///   }
  /// ```
  Result<List<int>> parseWhile1(State state) {
    final while1$ = <int>[];
    // (0)
    while (true) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        while1$.add(97);
        continue;
      }
      // [z]
      if (state.ch == 122) {
        state.nextChar();
        while1$.add(122);
        continue;
      }
      break;
    }
    return Ok(while1$);
  }

  /// [void] **WhileVoid1**
  /// ```txt
  /// `void` WhileVoid1 =>
  ///   @while (0) {
  ///     [a] / [z]
  ///   }
  /// ```
  Result<void> parseWhileVoid1(State state) {
    // (0)
    while (true) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        continue;
      }
      // [z]
      if (state.ch == 122) {
        state.nextChar();
        continue;
      }
      break;
    }
    return Result.none;
  }

  /// [List<int>] **While2**
  /// ```txt
  /// `List<int>` While2 =>
  ///   @while (1) {
  ///     [a]
  ///   }
  /// ```
  Result<List<int>>? parseWhile2(State state) {
    final while2$ = <int>[];
    // (1)
    while (true) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        while2$.add(97);
        continue;
      }
      break;
    }
    if (while2$.isNotEmpty) {
      return Ok(while2$);
    } else {
      return null;
    }
  }

  /// [void] **WhileVoid2**
  /// ```txt
  /// `void` WhileVoid2 =>
  ///   @while (1) {
  ///     [a]
  ///   }
  /// ```
  Result<void>? parseWhileVoid2(State state) {
    var isSuccess$ = false;
    // (1)
    while (true) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        isSuccess$ = true;
        continue;
      }
      break;
    }
    if (isSuccess$) {
      return Result.none;
    } else {
      return null;
    }
  }

  /// [List<int>] **While3**
  /// ```txt
  /// `List<int>` While3 =>
  ///   @while (1) {
  ///     [a] / [z]
  ///   }
  /// ```
  Result<List<int>>? parseWhile3(State state) {
    final while3$ = <int>[];
    // (1)
    while (true) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        while3$.add(97);
        continue;
      }
      // [z]
      if (state.ch == 122) {
        state.nextChar();
        while3$.add(122);
        continue;
      }
      break;
    }
    if (while3$.isNotEmpty) {
      return Ok(while3$);
    } else {
      return null;
    }
  }

  /// [void] **WhileVoid3**
  /// ```txt
  /// `void` WhileVoid3 =>
  ///   @while (1) {
  ///     [a] / [z]
  ///   }
  /// ```
  Result<void>? parseWhileVoid3(State state) {
    var isSuccess$ = false;
    // (1)
    while (true) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        isSuccess$ = true;
        continue;
      }
      // [z]
      if (state.ch == 122) {
        state.nextChar();
        isSuccess$ = true;
        continue;
      }
      break;
    }
    if (isSuccess$) {
      return Result.none;
    } else {
      return null;
    }
  }

  /// [List<int>] **While4**
  /// ```txt
  /// `List<int>` While4 =>
  ///   @while (2) {
  ///     [a]
  ///   }
  /// ```
  Result<List<int>>? parseWhile4(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    final while4$ = <int>[];
    // (2)
    while (true) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        while4$.add(97);
        continue;
      }
      break;
    }
    if (while4$.length >= 2) {
      return Ok(while4$);
    } else {
      state.ch = c$;
      state.position = pos$;
      return null;
    }
  }

  /// [void] **WhileVoid4**
  /// ```txt
  /// `void` WhileVoid4 =>
  ///   @while (2) {
  ///     [a]
  ///   }
  /// ```
  Result<void>? parseWhileVoid4(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    var count$ = 0;
    // (2)
    while (true) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        count$++;
        continue;
      }
      break;
    }
    if (count$ >= 2) {
      return Result.none;
    } else {
      state.ch = c$;
      state.position = pos$;
      return null;
    }
  }

  /// [List<int>] **While5**
  /// ```txt
  /// `List<int>` While5 =>
  ///   @while (2) {
  ///     [a] / [z]
  ///   }
  /// ```
  Result<List<int>>? parseWhile5(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    final while5$ = <int>[];
    // (2)
    while (true) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        while5$.add(97);
        continue;
      }
      // [z]
      if (state.ch == 122) {
        state.nextChar();
        while5$.add(122);
        continue;
      }
      break;
    }
    if (while5$.length >= 2) {
      return Ok(while5$);
    } else {
      state.ch = c$;
      state.position = pos$;
      return null;
    }
  }

  /// [void] **WhileVoid5**
  /// ```txt
  /// `void` WhileVoid5 =>
  ///   @while (2) {
  ///     [a] / [z]
  ///   }
  /// ```
  Result<void>? parseWhileVoid5(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    var count$ = 0;
    // (2)
    while (true) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        count$++;
        continue;
      }
      // [z]
      if (state.ch == 122) {
        state.nextChar();
        count$++;
        continue;
      }
      break;
    }
    if (count$ >= 2) {
      return Result.none;
    } else {
      state.ch = c$;
      state.position = pos$;
      return null;
    }
  }

  /// [List<int>] **While6**
  /// ```txt
  /// `List<int>` While6 =>
  ///   @while (0, 1) {
  ///     [a]
  ///   }
  /// ```
  Result<List<int>> parseWhile6(State state) {
    final while6$ = <int>[];
    // (0, 1)
    while (while6$.isEmpty) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        while6$.add(97);
        continue;
      }
      break;
    }
    return Ok(while6$);
  }

  /// [void] **WhileVoid6**
  /// ```txt
  /// `void` WhileVoid6 =>
  ///   @while (0, 1) {
  ///     [a]
  ///   }
  /// ```
  Result<void> parseWhileVoid6(State state) {
    var isSuccess$ = false;
    // (0, 1)
    while (!isSuccess$) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        isSuccess$ = true;
        continue;
      }
      break;
    }
    return Result.none;
  }

  /// [List<int>] **While7**
  /// ```txt
  /// `List<int>` While7 =>
  ///   @while (0, 2) {
  ///     [a]
  ///   }
  /// ```
  Result<List<int>> parseWhile7(State state) {
    final while7$ = <int>[];
    // (0, 2)
    while (while7$.length < 2) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        while7$.add(97);
        continue;
      }
      break;
    }
    return Ok(while7$);
  }

  /// [void] **WhileVoid7**
  /// ```txt
  /// `void` WhileVoid7 =>
  ///   @while (0, 2) {
  ///     [a]
  ///   }
  /// ```
  Result<void> parseWhileVoid7(State state) {
    var count$ = 0;
    // (0, 2)
    while (count$ < 2) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        count$++;
        continue;
      }
      break;
    }
    return Result.none;
  }

  /// [List<int>] **While8**
  /// ```txt
  /// `List<int>` While8 =>
  ///   @while (1, 1) {
  ///     [a]
  ///   }
  /// ```
  Result<List<int>>? parseWhile8(State state) {
    final while8$ = <int>[];
    // (1, 1)
    while (while8$.isEmpty) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        while8$.add(97);
        continue;
      }
      break;
    }
    if (while8$.isNotEmpty) {
      return Ok(while8$);
    } else {
      return null;
    }
  }

  /// [void] **WhileVoid8**
  /// ```txt
  /// `void` WhileVoid8 =>
  ///   @while (1, 1) {
  ///     [a]
  ///   }
  /// ```
  Result<void>? parseWhileVoid8(State state) {
    var isSuccess$ = false;
    // (1, 1)
    while (!isSuccess$) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        isSuccess$ = true;
        continue;
      }
      break;
    }
    if (isSuccess$) {
      return Result.none;
    } else {
      return null;
    }
  }

  /// [List<int>] **While9**
  /// ```txt
  /// `List<int>` While9 =>
  ///   @while (2, 2) {
  ///     [a]
  ///   }
  /// ```
  Result<List<int>>? parseWhile9(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    final while9$ = <int>[];
    // (2, 2)
    while (while9$.length < 2) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        while9$.add(97);
        continue;
      }
      break;
    }
    if (while9$.length >= 2) {
      return Ok(while9$);
    } else {
      state.ch = c$;
      state.position = pos$;
      return null;
    }
  }

  /// [void] **WhileVoid9**
  /// ```txt
  /// `void` WhileVoid9 =>
  ///   @while (2, 2) {
  ///     [a]
  ///   }
  /// ```
  Result<void>? parseWhileVoid9(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    var count$ = 0;
    // (2, 2)
    while (count$ < 2) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        count$++;
        continue;
      }
      break;
    }
    if (count$ >= 2) {
      return Result.none;
    } else {
      state.ch = c$;
      state.position = pos$;
      return null;
    }
  }

  /// [List<int>] **While10**
  /// ```txt
  /// `List<int>` While10 =>
  ///   @while (2, 3) {
  ///     [a]
  ///   }
  /// ```
  Result<List<int>>? parseWhile10(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    final while10$ = <int>[];
    // (2, 3)
    while (while10$.length < 3) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        while10$.add(97);
        continue;
      }
      break;
    }
    if (while10$.length >= 2) {
      return Ok(while10$);
    } else {
      state.ch = c$;
      state.position = pos$;
      return null;
    }
  }

  /// [void] **WhileVoid10**
  /// ```txt
  /// `void` WhileVoid10 =>
  ///   @while (2, 3) {
  ///     [a]
  ///   }
  /// ```
  Result<void>? parseWhileVoid10(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    var count$ = 0;
    // (2, 3)
    while (count$ < 3) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        count$++;
        continue;
      }
      break;
    }
    if (count$ >= 2) {
      return Result.none;
    } else {
      state.ch = c$;
      state.position = pos$;
      return null;
    }
  }

  /// [List<int>] **While11**
  /// ```txt
  /// `List<int>` While11 =>
  ///   ([a] / [b])
  ///   $ = @while (1) {
  ///     [c]
  ///   }
  /// ```
  Result<List<int>>? parseWhile11(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    l$:
    {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        break l$;
      }
      // [b]
      if (state.ch == 98) {
        state.nextChar();
        break l$;
      }
      return null;
    }
    // l$:
    final $$ = <int>[];
    // (1)
    while (true) {
      // [c]
      if (state.ch == 99) {
        state.nextChar();
        $$.add(99);
        continue;
      }
      break;
    }
    if ($$.isNotEmpty) {
      return Ok($$);
    } else {
      state.ch = c$;
      state.position = pos$;
      return null;
    }
  }

  /// [void] **WhileVoid11**
  /// ```txt
  /// `void` WhileVoid11 =>
  ///   ([a] / [b])
  ///   $ = @while (1) {
  ///     [c]
  ///   }
  /// ```
  Result<void>? parseWhileVoid11(State state) {
    final pos$ = state.position;
    final c$ = state.ch;
    l$:
    {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        break l$;
      }
      // [b]
      if (state.ch == 98) {
        state.nextChar();
        break l$;
      }
      return null;
    }
    // l$:
    final $$ = <int>[];
    // (1)
    while (true) {
      // [c]
      if (state.ch == 99) {
        state.nextChar();
        $$.add(99);
        continue;
      }
      break;
    }
    if ($$.isNotEmpty) {
      final $$1 = Ok($$);
      return Result.none;
    } else {
      state.ch = c$;
      state.position = pos$;
      return null;
    }
  }

  /// [List<int>] **ZeroOrMore0**
  /// ```txt
  /// `List<int>` ZeroOrMore0 =>
  ///   [a]*
  /// ```
  Result<List<int>> parseZeroOrMore0(State state) {
    final zeroOrMore0$ = <int>[];
    // (0)
    while (true) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        zeroOrMore0$.add(97);
        continue;
      }
      break;
    }
    return Ok(zeroOrMore0$);
  }

  /// [void] **ZeroOrMoreVoid0**
  /// ```txt
  /// `void` ZeroOrMoreVoid0 =>
  ///   [a]*
  /// ```
  Result<void> parseZeroOrMoreVoid0(State state) {
    // (0)
    while (true) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        continue;
      }
      break;
    }
    return Result.none;
  }

  /// [List<int>] **ZeroOrMore1**
  /// ```txt
  /// `List<int>` ZeroOrMore1 =>
  ///   ([a] / [z])*
  /// ```
  Result<List<int>> parseZeroOrMore1(State state) {
    final zeroOrMore1$ = <int>[];
    // (0)
    while (true) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        zeroOrMore1$.add(97);
        continue;
      }
      // [z]
      if (state.ch == 122) {
        state.nextChar();
        zeroOrMore1$.add(122);
        continue;
      }
      break;
    }
    return Ok(zeroOrMore1$);
  }

  /// [void] **ZeroOrMoreVoid1**
  /// ```txt
  /// `void` ZeroOrMoreVoid1 =>
  ///   ([a] / [z])*
  /// ```
  Result<void> parseZeroOrMoreVoid1(State state) {
    // (0)
    while (true) {
      // [a]
      if (state.ch == 97) {
        state.nextChar();
        continue;
      }
      // [z]
      if (state.ch == 122) {
        state.nextChar();
        continue;
      }
      break;
    }
    return Result.none;
  }

  /// [String] **Identifier0**
  /// ```txt
  /// `String` Identifier0 =>
  ///   !(
  ///     (
  ///       "foreach"
  ///       ----
  ///       "for"
  ///     )
  ///     ! [a-zA-Z0-9]
  ///   )
  ///   $ = <
  ///     [a-zA-Z]
  ///     [a-zA-Z0-9]*
  ///   >
  /// ```
  Result<String>? parseIdentifier0(State state) {
    l$:
    {
      state.predicate++;
      final pos$ = state.position;
      final c$ = state.ch;
      l$1:
      {
        // "foreach"
        if (state.ch == 102 && state.startsWith('foreach')) {
          state.readChar(state.position + 7);
          break l$1;
        }
        // "for"
        if (state.ch == 102 && state.startsWith('for')) {
          state.readChar(state.position + 3);
          break l$1;
        }
        state.predicate--;
        break l$;
      }
      // l$1:
      // [a-zA-Z0-9]
      final c$1 = state.ch;
      final isSuccess$ = c$1 <= 90 ? c$1 >= 65 || c$1 >= 48 && c$1 <= 57 : c$1 >= 97 && c$1 <= 122;
      if (isSuccess$) {
        state.ch = c$;
        state.position = pos$;
        state.predicate--;
        break l$;
      }
      state.ch = c$;
      state.position = pos$;
      state.predicate--;
      return null;
    }
    // l$:
    final pos$1 = state.position;
    // [a-zA-Z]
    final c$2 = state.ch;
    final isSuccess$1 = c$2 <= 90 ? c$2 >= 65 : c$2 >= 97 && c$2 <= 122;
    if (isSuccess$1) {
      state.nextChar();
      // (0)
      while (true) {
        // [a-zA-Z0-9]
        final c$3 = state.ch;
        final isSuccess$2 = c$3 <= 90 ? c$3 >= 65 || c$3 >= 48 && c$3 <= 57 : c$3 >= 97 && c$3 <= 122;
        if (isSuccess$2) {
          state.nextChar();
          continue;
        }
        break;
      }
      return Ok(state.substring(pos$1, state.position));
    }
    return null;
  }

  /// [void] **IdentifierVoid0**
  /// ```txt
  /// `void` IdentifierVoid0 =>
  ///   !(
  ///     (
  ///       "foreach"
  ///       ----
  ///       "for"
  ///     )
  ///     ! [a-zA-Z0-9]
  ///   )
  ///   $ = <
  ///     [a-zA-Z]
  ///     [a-zA-Z0-9]*
  ///   >
  /// ```
  Result<void>? parseIdentifierVoid0(State state) {
    l$:
    {
      state.predicate++;
      final pos$ = state.position;
      final c$ = state.ch;
      l$1:
      {
        // "foreach"
        if (state.ch == 102 && state.startsWith('foreach')) {
          state.readChar(state.position + 7);
          break l$1;
        }
        // "for"
        if (state.ch == 102 && state.startsWith('for')) {
          state.readChar(state.position + 3);
          break l$1;
        }
        state.predicate--;
        break l$;
      }
      // l$1:
      // [a-zA-Z0-9]
      final c$1 = state.ch;
      final isSuccess$ = c$1 <= 90 ? c$1 >= 65 || c$1 >= 48 && c$1 <= 57 : c$1 >= 97 && c$1 <= 122;
      if (isSuccess$) {
        state.ch = c$;
        state.position = pos$;
        state.predicate--;
        break l$;
      }
      state.ch = c$;
      state.position = pos$;
      state.predicate--;
      return null;
    }
    // l$:
    final pos$1 = state.position;
    // [a-zA-Z]
    final c$2 = state.ch;
    final isSuccess$1 = c$2 <= 90 ? c$2 >= 65 : c$2 >= 97 && c$2 <= 122;
    if (isSuccess$1) {
      state.nextChar();
      // (0)
      while (true) {
        // [a-zA-Z0-9]
        final c$3 = state.ch;
        final isSuccess$2 = c$3 <= 90 ? c$3 >= 65 || c$3 >= 48 && c$3 <= 57 : c$3 >= 97 && c$3 <= 122;
        if (isSuccess$2) {
          state.nextChar();
          continue;
        }
        break;
      }
      final $$ = Ok(state.substring(pos$1, state.position));
      return Result.none;
    }
    return null;
  }

  /// [String] **Identifier1**
  /// ```txt
  /// `String` Identifier1 =>
  ///   { var end = -1; }
  ///   !(
  ///     (
  ///       "foreach"
  ///       ----
  ///       "for"
  ///     )
  ///     ! @while (1) {
  ///       [a-zA-Z0-9]
  ///       { end = state.position; }
  ///     }
  ///   )
  ///   $ = <
  ///     (
  ///       & { end != -1 }
  ///       @position({ end })
  ///       ----
  ///       [a-zA-Z]
  ///       [a-zA-Z0-9]*
  ///     )
  ///   >
  /// ```
  Result<String>? parseIdentifier1(State state) {
    var end = -1;
    l$:
    {
      state.predicate++;
      final pos$ = state.position;
      final c$ = state.ch;
      l$1:
      {
        // "foreach"
        if (state.ch == 102 && state.startsWith('foreach')) {
          state.readChar(state.position + 7);
          break l$1;
        }
        // "for"
        if (state.ch == 102 && state.startsWith('for')) {
          state.readChar(state.position + 3);
          break l$1;
        }
        state.predicate--;
        break l$;
      }
      // l$1:
      state.predicate++;
      final pos$1 = state.position;
      final c$1 = state.ch;
      var isSuccess$ = false;
      // (1)
      while (true) {
        // [a-zA-Z0-9]
        final c$2 = state.ch;
        final isSuccess$1 = c$2 <= 90 ? c$2 >= 65 || c$2 >= 48 && c$2 <= 57 : c$2 >= 97 && c$2 <= 122;
        if (isSuccess$1) {
          state.nextChar();
          end = state.position;
          isSuccess$ = true;
          continue;
        }
        break;
      }
      if (isSuccess$) {
        state.ch = c$1;
        state.position = pos$1;
        state.predicate--;
        state.ch = c$;
        state.position = pos$;
        state.predicate--;
        break l$;
      } else {
        state.predicate--;
        state.ch = c$;
        state.position = pos$;
        state.predicate--;
        return null;
      }
    }
    // l$:
    final pos$2 = state.position;
    final isSuccess$2 = end != -1;
    if (isSuccess$2) {
      state.readChar(end);
      return Ok(state.substring(pos$2, state.position));
    }
    // [a-zA-Z]
    final c$3 = state.ch;
    final isSuccess$3 = c$3 <= 90 ? c$3 >= 65 : c$3 >= 97 && c$3 <= 122;
    if (isSuccess$3) {
      state.nextChar();
      // (0)
      while (true) {
        // [a-zA-Z0-9]
        final c$4 = state.ch;
        final isSuccess$4 = c$4 <= 90 ? c$4 >= 65 || c$4 >= 48 && c$4 <= 57 : c$4 >= 97 && c$4 <= 122;
        if (isSuccess$4) {
          state.nextChar();
          continue;
        }
        break;
      }
      return Ok(state.substring(pos$2, state.position));
    }
    return null;
  }

  /// [void] **IdentifierVoid1**
  /// ```txt
  /// `void` IdentifierVoid1 =>
  ///   { var end = -1; }
  ///   !(
  ///     (
  ///       "foreach"
  ///       ----
  ///       "for"
  ///     )
  ///     ! @while (1) {
  ///       [a-zA-Z0-9]
  ///       { end = state.position; }
  ///     }
  ///   )
  ///   $ = <
  ///     (
  ///       & { end != -1 }
  ///       @position({ end })
  ///       ----
  ///       [a-zA-Z]
  ///       [a-zA-Z0-9]*
  ///     )
  ///   >
  /// ```
  Result<void>? parseIdentifierVoid1(State state) {
    var end = -1;
    l$:
    {
      state.predicate++;
      final pos$ = state.position;
      final c$ = state.ch;
      l$1:
      {
        // "foreach"
        if (state.ch == 102 && state.startsWith('foreach')) {
          state.readChar(state.position + 7);
          break l$1;
        }
        // "for"
        if (state.ch == 102 && state.startsWith('for')) {
          state.readChar(state.position + 3);
          break l$1;
        }
        state.predicate--;
        break l$;
      }
      // l$1:
      state.predicate++;
      final pos$1 = state.position;
      final c$1 = state.ch;
      var isSuccess$ = false;
      // (1)
      while (true) {
        // [a-zA-Z0-9]
        final c$2 = state.ch;
        final isSuccess$1 = c$2 <= 90 ? c$2 >= 65 || c$2 >= 48 && c$2 <= 57 : c$2 >= 97 && c$2 <= 122;
        if (isSuccess$1) {
          state.nextChar();
          end = state.position;
          isSuccess$ = true;
          continue;
        }
        break;
      }
      if (isSuccess$) {
        state.ch = c$1;
        state.position = pos$1;
        state.predicate--;
        state.ch = c$;
        state.position = pos$;
        state.predicate--;
        break l$;
      } else {
        state.predicate--;
        state.ch = c$;
        state.position = pos$;
        state.predicate--;
        return null;
      }
    }
    // l$:
    final pos$2 = state.position;
    final isSuccess$2 = end != -1;
    if (isSuccess$2) {
      state.readChar(end);
      final $$ = Ok(state.substring(pos$2, state.position));
      return Result.none;
    }
    // [a-zA-Z]
    final c$3 = state.ch;
    final isSuccess$3 = c$3 <= 90 ? c$3 >= 65 : c$3 >= 97 && c$3 <= 122;
    if (isSuccess$3) {
      state.nextChar();
      // (0)
      while (true) {
        // [a-zA-Z0-9]
        final c$4 = state.ch;
        final isSuccess$4 = c$4 <= 90 ? c$4 >= 65 || c$4 >= 48 && c$4 <= 57 : c$4 >= 97 && c$4 <= 122;
        if (isSuccess$4) {
          state.nextChar();
          continue;
        }
        break;
      }
      final $$1 = Ok(state.substring(pos$2, state.position));
      return Result.none;
    }
    return null;
  }

}
// dart format on

/// Shortened name (alias) for the [Result] type.
typedef Ok<T> = Result<T>;

class Result<R> {
  /// A successful result that does not provide any resulting value.
  static const none = Result<void>(null);

  // Resulting value.
  final R $1;

  const Result(this.$1);

  @override
  int get hashCode => $1.hashCode;

  @override
  bool operator ==(Object other) => other is Result<R> && other.$1 == $1;

  @override
  String toString() => $1.toString();
}

class State {
  static const _errorExpected = 0;

  static const _maxErrorCount = 64;

  /// Current character.
  int ch = -1;

  /// The furthest position of parsing.
  int farthestPosition = 0;

  /// The length of the input data.
  final int length;

  /// Current parsing position.
  int position = 0;

  /// Intended for internal use only.
  int predicate = 0;

  int _errorCount = 0;

  int _farthestError = 0;

  final List<int?> _flags = List.filled(_maxErrorCount, null);

  final String _input;

  final List<int?> _ends = List.filled(_maxErrorCount, null);

  final List<Object?> _messages = List.filled(_maxErrorCount, null);

  final List<int?> _starts = List.filled(_maxErrorCount, null);

  State(String input) : _input = input, length = input.length {
    readChar(0);
  }

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  int charAt(int position) {
    if (position < length) {
      final ch = _input.codeUnitAt(position);
      if (ch < 0xd800) {
        return ch;
      }

      if (ch < 0xe000) {
        final c = _input.codeUnitAt(position + 1);
        if ((c & 0xfc00) == 0xdc00) {
          return 0x10000 + ((ch & 0x3ff) << 10) + (c & 0x3ff);
        }

        throw FormatException('Invalid UTF-16 character', this, position);
      }

      return ch;
    }

    return -1;
  }

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  /// Returns the size (as the length of the equivalent string) of the character
  /// [char].
  int charSize(int char) => char > 0xffff ? 2 : 1;

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  /// Adds (if possible) an error to the error buffer.
  ///
  /// Parameters:
  ///
  ///  - [message]: A message that describes the error.
  ///  - [position]: Farthest position of the error. Used to determine whether
  /// errors can be added in the error buffer.
  ///  - [start]: Starting position of the location. Used to display the start
  /// of an error.
  ///  - [end]: Ending position of the location. Used to display the end of an
  /// error.
  void error(String message, {int? position, int? start, int? end}) {
    position ??= this.position;
    if (_farthestError <= position) {
      if (_farthestError < position) {
        _farthestError = position;
        _errorCount = 0;
      }

      if (_errorCount < _messages.length) {
        _ends[_errorCount] = end;
        _flags[_errorCount] = null;
        _messages[_errorCount] = message;
        _starts[_errorCount] = start;
        _errorCount++;
      }
    }
  }

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  /// Adds (if possible) an `expected` error to the error buffer.
  ///
  /// Parameters:
  ///
  ///  - [expected]: One or more expected syntactic elements.
  ///  - [position]: Farthest position of the error. Used to determine whether
  /// errors can be added in the error buffer.
  ///  - [start]: Starting position of the location. Used to display the start
  /// of an error.
  ///
  /// Example with one element:
  ///
  /// ```dart
  /// state.errorExpected('string');
  /// ```
  /// Example with multiple elements:
  ///
  /// ```dart
  /// state.errorExpected(const ['string', 'number']);
  /// ```
  void errorExpected(Object expected, {int? position, int? start}) {
    position ??= this.position;
    if (_farthestError <= position) {
      if (_farthestError < position) {
        _farthestError = position;
        _errorCount = 0;
      }

      if (_errorCount < _messages.length) {
        _flags[_errorCount] = _errorExpected;
        _messages[_errorCount] = expected;
        _starts[_errorCount] = start;
        _errorCount++;
      }
    }
  }

  /// Converts error messages to errors and returns them as an error list.
  List<({int end, String message, int start})> getErrors() {
    final position = _farthestError;
    final errors = <({int end, String message, int start})>[];
    final expected = <int, Set<String>>{};
    for (var i = 0; i < _errorCount; i++) {
      final message = _messages[i];
      switch (_flags[i]) {
        case _errorExpected:
          final start = _starts[i] ??= position;
          if (message is List) {
            (expected[start] ??= {}).addAll(message.map((e) => '$e'));
          } else {
            (expected[start] ??= {}).add('$message');
          }

          break;
        default:
          var start = _starts[i];
          var end = _ends[i];
          if (end == null && start != null) {
            end = start;
          } else if (start == null && end != null) {
            start = end;
          }

          start ??= position;
          end ??= position;
          errors.add((message: '$message', start: start, end: end));
      }
    }

    if (expected.isNotEmpty) {
      for (final position in expected.keys) {
        final list = expected[position]!.toList();
        final message = 'Expected: ${list.map((e) => '\'$e\'').join(', ')}';
        errors.add((message: message, start: position, end: position));
      }
    }

    if (errors.isEmpty) {
      errors.add((
        message: 'Syntax error',
        start: farthestPosition,
        end: farthestPosition,
      ));
    }

    return errors.toSet().toList();
  }

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  /// Returns the position of the first match of [string] in input, starting at
  /// [position,.
  int indexOf(String string) => _input.indexOf(string, position);

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  /// Reads the next character, advances the position to the next character and
  /// returns that character.
  int nextChar() {
    if (position < length) {
      position += charSize(ch);
      if (predicate == 0 && farthestPosition < position) {
        farthestPosition = position;
      }

      return ch = charAt(position);
    }

    return ch = -1;
  }

  /// Intended for internal use only.
  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  int readChar(int position) {
    ch = charAt(position);
    this.position = position < length ? position : length;
    if (predicate == 0 && farthestPosition < position) {
      farthestPosition = position;
    }

    return ch;
  }

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  @pragma('vm:unsafe:no-interrupts')
  /// The [startsWith] method is used to check if a string begins with a
  /// specified [substring].
  bool startsWith(String substring, [int? position]) {
    if (substring.isNotEmpty) {
      position ??= this.position;
      final count = substring.length - 1;
      if (position + count < length) {
        if (_input.codeUnitAt(position) == substring.codeUnitAt(0)) {
          for (var i = 1; i <= count; i++) {
            if (_input.codeUnitAt(position + i) != substring.codeUnitAt(i)) {
              return false;
            }
          }
        }

        return true;
      }
    } else {
      return true;
    }

    return false;
  }

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  /// Returns the lengths of the input data.
  int strlen(String string) => string.length;

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  /// Returns the substring of the input data.
  String substring(int start, int end) => _input.substring(start, end);

  @override
  String toString() {
    if (position >= length) {
      return '';
    }

    var rest = length - position;
    if (rest > 80) {
      rest = 80;
    }

    var line = substring(position, position + rest);
    line = line.replaceAll('\n', r'\n');
    return '|$position|$line';
  }
}
