import 'package:test/test.dart';

void main() {
  final parser = _TestParser();
  test('Action', () {
    final $r = parser.parseAction0;
    final $r1 = parser.parseActionVoid0;
    final $s = State('a');
    final $r2 = $r($s) as dynamic;
    expect(
      $r2,
      isNotNull,
      reason: '\$ = `const` { 41 }\n\'a\'\nresult != null',
    );
    expect(
      $s.position,
      0,
      reason: '\$ = `const` { 41 }\n\'a\'\nstate.position = 0',
    );
    expect($r2.$1, 41, reason: '\$ = `const` { 41 }\n\'a\'\nresult.\$1 != 41');
    final $s1 = State('a');
    final $r3 = $r1($s1) as dynamic;
    expect(
      $r3,
      isNotNull,
      reason: '\$ = `const` { 41 }\n\'a\'\nresult != null',
    );
    expect(
      $s1.position,
      0,
      reason: '\$ = `const` { 41 }\n\'a\'\nstate.position = 0',
    );
    expect(
      $r3.$1,
      null,
      reason: '\$ = `const` { 41 }\n\'a\'\nresult.\$1 != null',
    );
    final $s2 = State('');
    final $r4 = $r($s2) as dynamic;
    expect($r4, isNotNull, reason: '\$ = `const` { 41 }\n\'\'\nresult != null');
    expect(
      $s2.position,
      0,
      reason: '\$ = `const` { 41 }\n\'\'\nstate.position = 0',
    );
    expect($r4.$1, 41, reason: '\$ = `const` { 41 }\n\'\'\nresult.\$1 != 41');
    final $s3 = State('');
    final $r5 = $r1($s3) as dynamic;
    expect($r5, isNotNull, reason: '\$ = `const` { 41 }\n\'\'\nresult != null');
    expect(
      $s3.position,
      0,
      reason: '\$ = `const` { 41 }\n\'\'\nstate.position = 0',
    );
    expect(
      $r5.$1,
      null,
      reason: '\$ = `const` { 41 }\n\'\'\nresult.\$1 != null',
    );
    final $r6 = parser.parseAction1;
    final $r7 = parser.parseActionVoid1;
    final $s4 = State('a');
    final $r8 = $r6($s4) as dynamic;
    expect(
      $r8,
      isNotNull,
      reason: '\$ = `const int` { 41 }\n\'a\'\nresult != null',
    );
    expect(
      $s4.position,
      0,
      reason: '\$ = `const int` { 41 }\n\'a\'\nstate.position = 0',
    );
    expect(
      $r8.$1,
      41,
      reason: '\$ = `const int` { 41 }\n\'a\'\nresult.\$1 != 41',
    );
    final $s5 = State('a');
    final $r9 = $r7($s5) as dynamic;
    expect(
      $r9,
      isNotNull,
      reason: '\$ = `const int` { 41 }\n\'a\'\nresult != null',
    );
    expect(
      $s5.position,
      0,
      reason: '\$ = `const int` { 41 }\n\'a\'\nstate.position = 0',
    );
    expect(
      $r9.$1,
      null,
      reason: '\$ = `const int` { 41 }\n\'a\'\nresult.\$1 != null',
    );
    final $s6 = State('');
    final $r10 = $r6($s6) as dynamic;
    expect(
      $r10,
      isNotNull,
      reason: '\$ = `const int` { 41 }\n\'\'\nresult != null',
    );
    expect(
      $s6.position,
      0,
      reason: '\$ = `const int` { 41 }\n\'\'\nstate.position = 0',
    );
    expect(
      $r10.$1,
      41,
      reason: '\$ = `const int` { 41 }\n\'\'\nresult.\$1 != 41',
    );
    final $s7 = State('');
    final $r11 = $r7($s7) as dynamic;
    expect(
      $r11,
      isNotNull,
      reason: '\$ = `const int` { 41 }\n\'\'\nresult != null',
    );
    expect(
      $s7.position,
      0,
      reason: '\$ = `const int` { 41 }\n\'\'\nstate.position = 0',
    );
    expect(
      $r11.$1,
      null,
      reason: '\$ = `const int` { 41 }\n\'\'\nresult.\$1 != null',
    );
    final $r12 = parser.parseAction2;
    final $r13 = parser.parseActionVoid2;
    final $s8 = State('a');
    final $r14 = $r12($s8) as dynamic;
    expect(
      $r14,
      isNotNull,
      reason: '{ const x = 41; }\n\$ = `const` { x }\n\'a\'\nresult != null',
    );
    expect(
      $s8.position,
      0,
      reason:
          '{ const x = 41; }\n\$ = `const` { x }\n\'a\'\nstate.position = 0',
    );
    expect(
      $r14.$1,
      41,
      reason: '{ const x = 41; }\n\$ = `const` { x }\n\'a\'\nresult.\$1 != 41',
    );
    final $s9 = State('a');
    final $r15 = $r13($s9) as dynamic;
    expect(
      $r15,
      isNotNull,
      reason: '{ const x = 41; }\n\$ = `const` { x }\n\'a\'\nresult != null',
    );
    expect(
      $s9.position,
      0,
      reason:
          '{ const x = 41; }\n\$ = `const` { x }\n\'a\'\nstate.position = 0',
    );
    expect(
      $r15.$1,
      null,
      reason:
          '{ const x = 41; }\n\$ = `const` { x }\n\'a\'\nresult.\$1 != null',
    );
    final $s10 = State('');
    final $r16 = $r12($s10) as dynamic;
    expect(
      $r16,
      isNotNull,
      reason: '{ const x = 41; }\n\$ = `const` { x }\n\'\'\nresult != null',
    );
    expect(
      $s10.position,
      0,
      reason: '{ const x = 41; }\n\$ = `const` { x }\n\'\'\nstate.position = 0',
    );
    expect(
      $r16.$1,
      41,
      reason: '{ const x = 41; }\n\$ = `const` { x }\n\'\'\nresult.\$1 != 41',
    );
    final $s11 = State('');
    final $r17 = $r13($s11) as dynamic;
    expect(
      $r17,
      isNotNull,
      reason: '{ const x = 41; }\n\$ = `const` { x }\n\'\'\nresult != null',
    );
    expect(
      $s11.position,
      0,
      reason: '{ const x = 41; }\n\$ = `const` { x }\n\'\'\nstate.position = 0',
    );
    expect(
      $r17.$1,
      null,
      reason: '{ const x = 41; }\n\$ = `const` { x }\n\'\'\nresult.\$1 != null',
    );
  });

  test('AndPredicate', () {
    final $r = parser.parseAndPredicate0;
    final $r1 = parser.parseAndPredicateVoid0;
    final $s = State('abcd');
    final $r2 = $r($s) as dynamic;
    expect(
      $r2,
      isNotNull,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'abcd\'\nresult != null',
    );
    expect(
      $s.position,
      4,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'abcd\'\nstate.position = 4',
    );
    expect(
      $r2.$1,
      'abcd',
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'abcd\'\nresult.\$1 != \'abcd\'',
    );
    final $s1 = State('abcd');
    final $r3 = $r1($s1) as dynamic;
    expect(
      $r3,
      isNotNull,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'abcd\'\nresult != null',
    );
    expect(
      $s1.position,
      4,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'abcd\'\nstate.position = 4',
    );
    expect(
      $r3.$1,
      null,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'abcd\'\nresult.\$1 != null',
    );
    final $s2 = State('');
    final $r4 = $r($s2) as dynamic;
    expect(
      $r4,
      isNull,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'\'\nresult == null',
    );
    expect(
      $s2.farthestPosition,
      0,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s2.position,
      0,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'\'\nstate.position = 0',
    );
    final $e = $s2.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e.length,
      1,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'\'\nerror count',
    );
    expect($e, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'\'\nerrors');
    final $s3 = State('');
    final $r5 = $r1($s3) as dynamic;
    expect(
      $r5,
      isNull,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'\'\nresult == null',
    );
    expect(
      $s3.farthestPosition,
      0,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s3.position,
      0,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'\'\nstate.position = 0',
    );
    final $e1 = $s3.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e1.length,
      1,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'\'\nerror count',
    );
    expect($e1, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'\'\nerrors');
    final $s4 = State('z');
    final $r6 = $r($s4) as dynamic;
    expect(
      $r6,
      isNull,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'z\'\nresult == null',
    );
    expect(
      $s4.farthestPosition,
      0,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'z\'\nstate.farthestPosition = 0',
    );
    expect(
      $s4.position,
      0,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'z\'\nstate.position = 0',
    );
    final $e2 = $s4.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e2.length,
      1,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'z\'\nerror count',
    );
    expect($e2, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'z\'\nerrors');
    final $s5 = State('z');
    final $r7 = $r1($s5) as dynamic;
    expect(
      $r7,
      isNull,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'z\'\nresult == null',
    );
    expect(
      $s5.farthestPosition,
      0,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'z\'\nstate.farthestPosition = 0',
    );
    expect(
      $s5.position,
      0,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'z\'\nstate.position = 0',
    );
    final $e3 = $s5.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e3.length,
      1,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'z\'\nerror count',
    );
    expect($e3, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'z\'\nerrors');
    final $s6 = State('abc');
    final $r8 = $r($s6) as dynamic;
    expect(
      $r8,
      isNull,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'abc\'\nresult == null',
    );
    expect(
      $s6.farthestPosition,
      0,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'abc\'\nstate.farthestPosition = 0',
    );
    expect(
      $s6.position,
      0,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'abc\'\nstate.position = 0',
    );
    final $e4 = $s6.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e4.length,
      1,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'abc\'\nerror count',
    );
    expect($e4, [
      '(end: 0, message: Expected: \'abcd\', start: 0)',
    ], reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'abc\'\nerrors');
    final $s7 = State('abc');
    final $r9 = $r1($s7) as dynamic;
    expect(
      $r9,
      isNull,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'abc\'\nresult == null',
    );
    expect(
      $s7.farthestPosition,
      0,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'abc\'\nstate.farthestPosition = 0',
    );
    expect(
      $s7.position,
      0,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'abc\'\nstate.position = 0',
    );
    final $e5 = $s7.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e5.length,
      1,
      reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'abc\'\nerror count',
    );
    expect($e5, [
      '(end: 0, message: Expected: \'abcd\', start: 0)',
    ], reason: '& \'abc\'\n\$ = \'abcd\'\n\n\'abc\'\nerrors');
    final $r10 = parser.parseAndPredicate1;
    final $s8 = State('abc');
    final $r11 = $r10($s8) as dynamic;
    expect($r11, isNotNull, reason: '& \'abc\'\n\n\'abc\'\nresult != null');
    expect($s8.position, 0, reason: '& \'abc\'\n\n\'abc\'\nstate.position = 0');
    expect($r11.$1, null, reason: '& \'abc\'\n\n\'abc\'\nresult.\$1 != null');
    final $s9 = State('');
    final $r12 = $r10($s9) as dynamic;
    expect($r12, isNull, reason: '& \'abc\'\n\n\'\'\nresult == null');
    expect(
      $s9.farthestPosition,
      0,
      reason: '& \'abc\'\n\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s9.position, 0, reason: '& \'abc\'\n\n\'\'\nstate.position = 0');
    final $e6 = $s9.getErrors().map((e) => '$e').toList()..sort();
    expect($e6.length, 1, reason: '& \'abc\'\n\n\'\'\nerror count');
    expect($e6, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '& \'abc\'\n\n\'\'\nerrors');
    final $s10 = State('z');
    final $r13 = $r10($s10) as dynamic;
    expect($r13, isNull, reason: '& \'abc\'\n\n\'z\'\nresult == null');
    expect(
      $s10.farthestPosition,
      0,
      reason: '& \'abc\'\n\n\'z\'\nstate.farthestPosition = 0',
    );
    expect($s10.position, 0, reason: '& \'abc\'\n\n\'z\'\nstate.position = 0');
    final $e7 = $s10.getErrors().map((e) => '$e').toList()..sort();
    expect($e7.length, 1, reason: '& \'abc\'\n\n\'z\'\nerror count');
    expect($e7, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '& \'abc\'\n\n\'z\'\nerrors');
    final $s11 = State('a');
    final $r14 = $r10($s11) as dynamic;
    expect($r14, isNull, reason: '& \'abc\'\n\n\'a\'\nresult == null');
    expect(
      $s11.farthestPosition,
      0,
      reason: '& \'abc\'\n\n\'a\'\nstate.farthestPosition = 0',
    );
    expect($s11.position, 0, reason: '& \'abc\'\n\n\'a\'\nstate.position = 0');
    final $e8 = $s11.getErrors().map((e) => '$e').toList()..sort();
    expect($e8.length, 1, reason: '& \'abc\'\n\n\'a\'\nerror count');
    expect($e8, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '& \'abc\'\n\n\'a\'\nerrors');
    final $s12 = State('ab');
    final $r15 = $r10($s12) as dynamic;
    expect($r15, isNull, reason: '& \'abc\'\n\n\'ab\'\nresult == null');
    expect(
      $s12.farthestPosition,
      0,
      reason: '& \'abc\'\n\n\'ab\'\nstate.farthestPosition = 0',
    );
    expect($s12.position, 0, reason: '& \'abc\'\n\n\'ab\'\nstate.position = 0');
    final $e9 = $s12.getErrors().map((e) => '$e').toList()..sort();
    expect($e9.length, 1, reason: '& \'abc\'\n\n\'ab\'\nerror count');
    expect($e9, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '& \'abc\'\n\n\'ab\'\nerrors');
  });

  test('AnyCharacter', () {
    final $r = parser.parseAnyCharacter0;
    final $r1 = parser.parseAnyCharacterVoid0;
    final $s = State('a');
    final $r2 = $r($s) as dynamic;
    expect($r2, isNotNull, reason: '.\n\'a\'\nresult != null');
    expect($s.position, 1, reason: '.\n\'a\'\nstate.position = 1');
    expect($r2.$1, 97, reason: '.\n\'a\'\nresult.\$1 != 97');
    final $s1 = State('a');
    final $r3 = $r1($s1) as dynamic;
    expect($r3, isNotNull, reason: '.\n\'a\'\nresult != null');
    expect($s1.position, 1, reason: '.\n\'a\'\nstate.position = 1');
    expect($r3.$1, null, reason: '.\n\'a\'\nresult.\$1 != null');
    final $s2 = State('z');
    final $r4 = $r($s2) as dynamic;
    expect($r4, isNotNull, reason: '.\n\'z\'\nresult != null');
    expect($s2.position, 1, reason: '.\n\'z\'\nstate.position = 1');
    expect($r4.$1, 122, reason: '.\n\'z\'\nresult.\$1 != 122');
    final $s3 = State('z');
    final $r5 = $r1($s3) as dynamic;
    expect($r5, isNotNull, reason: '.\n\'z\'\nresult != null');
    expect($s3.position, 1, reason: '.\n\'z\'\nstate.position = 1');
    expect($r5.$1, null, reason: '.\n\'z\'\nresult.\$1 != null');
    final $s4 = State('');
    final $r6 = $r($s4) as dynamic;
    expect($r6, isNull, reason: '.\n\'\'\nresult == null');
    expect(
      $s4.farthestPosition,
      0,
      reason: '.\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s4.position, 0, reason: '.\n\'\'\nstate.position = 0');
    final $e = $s4.getErrors().map((e) => '$e').toList()..sort();
    expect($e.length, 1, reason: '.\n\'\'\nerror count');
    expect($e, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '.\n\'\'\nerrors');
    final $s5 = State('');
    final $r7 = $r1($s5) as dynamic;
    expect($r7, isNull, reason: '.\n\'\'\nresult == null');
    expect(
      $s5.farthestPosition,
      0,
      reason: '.\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s5.position, 0, reason: '.\n\'\'\nstate.position = 0');
    final $e1 = $s5.getErrors().map((e) => '$e').toList()..sort();
    expect($e1.length, 1, reason: '.\n\'\'\nerror count');
    expect($e1, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '.\n\'\'\nerrors');
  });

  test('Capture', () {
    final $r = parser.parseCapture0;
    final $r1 = parser.parseCaptureVoid0;
    final $s = State('a');
    final $r2 = $r($s) as dynamic;
    expect($r2, isNotNull, reason: '<[a]>\n\'a\'\nresult != null');
    expect($s.position, 1, reason: '<[a]>\n\'a\'\nstate.position = 1');
    expect($r2.$1, 'a', reason: '<[a]>\n\'a\'\nresult.\$1 != \'a\'');
    final $s1 = State('a');
    final $r3 = $r1($s1) as dynamic;
    expect($r3, isNotNull, reason: '<[a]>\n\'a\'\nresult != null');
    expect($s1.position, 1, reason: '<[a]>\n\'a\'\nstate.position = 1');
    expect($r3.$1, null, reason: '<[a]>\n\'a\'\nresult.\$1 != null');
    final $s2 = State('');
    final $r4 = $r($s2) as dynamic;
    expect($r4, isNull, reason: '<[a]>\n\'\'\nresult == null');
    expect(
      $s2.farthestPosition,
      0,
      reason: '<[a]>\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s2.position, 0, reason: '<[a]>\n\'\'\nstate.position = 0');
    final $e = $s2.getErrors().map((e) => '$e').toList()..sort();
    expect($e.length, 1, reason: '<[a]>\n\'\'\nerror count');
    expect($e, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '<[a]>\n\'\'\nerrors');
    final $s3 = State('');
    final $r5 = $r1($s3) as dynamic;
    expect($r5, isNull, reason: '<[a]>\n\'\'\nresult == null');
    expect(
      $s3.farthestPosition,
      0,
      reason: '<[a]>\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s3.position, 0, reason: '<[a]>\n\'\'\nstate.position = 0');
    final $e1 = $s3.getErrors().map((e) => '$e').toList()..sort();
    expect($e1.length, 1, reason: '<[a]>\n\'\'\nerror count');
    expect($e1, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '<[a]>\n\'\'\nerrors');
    final $s4 = State('z');
    final $r6 = $r($s4) as dynamic;
    expect($r6, isNull, reason: '<[a]>\n\'z\'\nresult == null');
    expect(
      $s4.farthestPosition,
      0,
      reason: '<[a]>\n\'z\'\nstate.farthestPosition = 0',
    );
    expect($s4.position, 0, reason: '<[a]>\n\'z\'\nstate.position = 0');
    final $e2 = $s4.getErrors().map((e) => '$e').toList()..sort();
    expect($e2.length, 1, reason: '<[a]>\n\'z\'\nerror count');
    expect($e2, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '<[a]>\n\'z\'\nerrors');
    final $s5 = State('z');
    final $r7 = $r1($s5) as dynamic;
    expect($r7, isNull, reason: '<[a]>\n\'z\'\nresult == null');
    expect(
      $s5.farthestPosition,
      0,
      reason: '<[a]>\n\'z\'\nstate.farthestPosition = 0',
    );
    expect($s5.position, 0, reason: '<[a]>\n\'z\'\nstate.position = 0');
    final $e3 = $s5.getErrors().map((e) => '$e').toList()..sort();
    expect($e3.length, 1, reason: '<[a]>\n\'z\'\nerror count');
    expect($e3, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '<[a]>\n\'z\'\nerrors');
    final $r8 = parser.parseCapture1;
    final $s6 = State('a');
    final $r9 = $r8($s6) as dynamic;
    expect($r9, isNotNull, reason: '<[a]>\n\'a\'\nresult != null');
    expect($s6.position, 1, reason: '<[a]>\n\'a\'\nstate.position = 1');
    expect($r9.$1, null, reason: '<[a]>\n\'a\'\nresult.\$1 != null');
    final $s7 = State('');
    final $r10 = $r8($s7) as dynamic;
    expect($r10, isNull, reason: '<[a]>\n\'\'\nresult == null');
    expect(
      $s7.farthestPosition,
      0,
      reason: '<[a]>\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s7.position, 0, reason: '<[a]>\n\'\'\nstate.position = 0');
    final $e4 = $s7.getErrors().map((e) => '$e').toList()..sort();
    expect($e4.length, 1, reason: '<[a]>\n\'\'\nerror count');
    expect($e4, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '<[a]>\n\'\'\nerrors');
    final $s8 = State('z');
    final $r11 = $r8($s8) as dynamic;
    expect($r11, isNull, reason: '<[a]>\n\'z\'\nresult == null');
    expect(
      $s8.farthestPosition,
      0,
      reason: '<[a]>\n\'z\'\nstate.farthestPosition = 0',
    );
    expect($s8.position, 0, reason: '<[a]>\n\'z\'\nstate.position = 0');
    final $e5 = $s8.getErrors().map((e) => '$e').toList()..sort();
    expect($e5.length, 1, reason: '<[a]>\n\'z\'\nerror count');
    expect($e5, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '<[a]>\n\'z\'\nerrors');
    final $r12 = parser.parseCapture2;
    final $r13 = parser.parseCaptureVoid2;
    final $s9 = State('a');
    final $r14 = $r12($s9) as dynamic;
    expect($r14, isNotNull, reason: '<[a] / [b]>\n\'a\'\nresult != null');
    expect($s9.position, 1, reason: '<[a] / [b]>\n\'a\'\nstate.position = 1');
    expect($r14.$1, 'a', reason: '<[a] / [b]>\n\'a\'\nresult.\$1 != \'a\'');
    final $s10 = State('a');
    final $r15 = $r13($s10) as dynamic;
    expect($r15, isNotNull, reason: '<[a] / [b]>\n\'a\'\nresult != null');
    expect($s10.position, 1, reason: '<[a] / [b]>\n\'a\'\nstate.position = 1');
    expect($r15.$1, null, reason: '<[a] / [b]>\n\'a\'\nresult.\$1 != null');
    final $s11 = State('b');
    final $r16 = $r12($s11) as dynamic;
    expect($r16, isNotNull, reason: '<[a] / [b]>\n\'b\'\nresult != null');
    expect($s11.position, 1, reason: '<[a] / [b]>\n\'b\'\nstate.position = 1');
    expect($r16.$1, 'b', reason: '<[a] / [b]>\n\'b\'\nresult.\$1 != \'b\'');
    final $s12 = State('b');
    final $r17 = $r13($s12) as dynamic;
    expect($r17, isNotNull, reason: '<[a] / [b]>\n\'b\'\nresult != null');
    expect($s12.position, 1, reason: '<[a] / [b]>\n\'b\'\nstate.position = 1');
    expect($r17.$1, null, reason: '<[a] / [b]>\n\'b\'\nresult.\$1 != null');
    final $s13 = State('');
    final $r18 = $r12($s13) as dynamic;
    expect($r18, isNull, reason: '<[a] / [b]>\n\'\'\nresult == null');
    expect(
      $s13.farthestPosition,
      0,
      reason: '<[a] / [b]>\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s13.position, 0, reason: '<[a] / [b]>\n\'\'\nstate.position = 0');
    final $e6 = $s13.getErrors().map((e) => '$e').toList()..sort();
    expect($e6.length, 1, reason: '<[a] / [b]>\n\'\'\nerror count');
    expect($e6, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '<[a] / [b]>\n\'\'\nerrors');
    final $s14 = State('');
    final $r19 = $r13($s14) as dynamic;
    expect($r19, isNull, reason: '<[a] / [b]>\n\'\'\nresult == null');
    expect(
      $s14.farthestPosition,
      0,
      reason: '<[a] / [b]>\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s14.position, 0, reason: '<[a] / [b]>\n\'\'\nstate.position = 0');
    final $e7 = $s14.getErrors().map((e) => '$e').toList()..sort();
    expect($e7.length, 1, reason: '<[a] / [b]>\n\'\'\nerror count');
    expect($e7, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '<[a] / [b]>\n\'\'\nerrors');
    final $s15 = State('z');
    final $r20 = $r12($s15) as dynamic;
    expect($r20, isNull, reason: '<[a] / [b]>\n\'z\'\nresult == null');
    expect(
      $s15.farthestPosition,
      0,
      reason: '<[a] / [b]>\n\'z\'\nstate.farthestPosition = 0',
    );
    expect($s15.position, 0, reason: '<[a] / [b]>\n\'z\'\nstate.position = 0');
    final $e8 = $s15.getErrors().map((e) => '$e').toList()..sort();
    expect($e8.length, 1, reason: '<[a] / [b]>\n\'z\'\nerror count');
    expect($e8, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '<[a] / [b]>\n\'z\'\nerrors');
    final $s16 = State('z');
    final $r21 = $r13($s16) as dynamic;
    expect($r21, isNull, reason: '<[a] / [b]>\n\'z\'\nresult == null');
    expect(
      $s16.farthestPosition,
      0,
      reason: '<[a] / [b]>\n\'z\'\nstate.farthestPosition = 0',
    );
    expect($s16.position, 0, reason: '<[a] / [b]>\n\'z\'\nstate.position = 0');
    final $e9 = $s16.getErrors().map((e) => '$e').toList()..sort();
    expect($e9.length, 1, reason: '<[a] / [b]>\n\'z\'\nerror count');
    expect($e9, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '<[a] / [b]>\n\'z\'\nerrors');
    final $r22 = parser.parseCapture3;
    final $r23 = parser.parseCaptureVoid3;
    final $s17 = State('ab');
    final $r24 = $r22($s17) as dynamic;
    expect(
      $r24,
      isNotNull,
      reason: '[a]\n\$ = <[b] / [c]>\n\'ab\'\nresult != null',
    );
    expect(
      $s17.position,
      2,
      reason: '[a]\n\$ = <[b] / [c]>\n\'ab\'\nstate.position = 2',
    );
    expect(
      $r24.$1,
      'b',
      reason: '[a]\n\$ = <[b] / [c]>\n\'ab\'\nresult.\$1 != \'b\'',
    );
    final $s18 = State('ab');
    final $r25 = $r23($s18) as dynamic;
    expect(
      $r25,
      isNotNull,
      reason: '[a]\n\$ = <[b] / [c]>\n\'ab\'\nresult != null',
    );
    expect(
      $s18.position,
      2,
      reason: '[a]\n\$ = <[b] / [c]>\n\'ab\'\nstate.position = 2',
    );
    expect(
      $r25.$1,
      null,
      reason: '[a]\n\$ = <[b] / [c]>\n\'ab\'\nresult.\$1 != null',
    );
    final $s19 = State('ac');
    final $r26 = $r22($s19) as dynamic;
    expect(
      $r26,
      isNotNull,
      reason: '[a]\n\$ = <[b] / [c]>\n\'ac\'\nresult != null',
    );
    expect(
      $s19.position,
      2,
      reason: '[a]\n\$ = <[b] / [c]>\n\'ac\'\nstate.position = 2',
    );
    expect(
      $r26.$1,
      'c',
      reason: '[a]\n\$ = <[b] / [c]>\n\'ac\'\nresult.\$1 != \'c\'',
    );
    final $s20 = State('ac');
    final $r27 = $r23($s20) as dynamic;
    expect(
      $r27,
      isNotNull,
      reason: '[a]\n\$ = <[b] / [c]>\n\'ac\'\nresult != null',
    );
    expect(
      $s20.position,
      2,
      reason: '[a]\n\$ = <[b] / [c]>\n\'ac\'\nstate.position = 2',
    );
    expect(
      $r27.$1,
      null,
      reason: '[a]\n\$ = <[b] / [c]>\n\'ac\'\nresult.\$1 != null',
    );
    final $s21 = State('');
    final $r28 = $r22($s21) as dynamic;
    expect($r28, isNull, reason: '[a]\n\$ = <[b] / [c]>\n\'\'\nresult == null');
    expect(
      $s21.farthestPosition,
      0,
      reason: '[a]\n\$ = <[b] / [c]>\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s21.position,
      0,
      reason: '[a]\n\$ = <[b] / [c]>\n\'\'\nstate.position = 0',
    );
    final $e10 = $s21.getErrors().map((e) => '$e').toList()..sort();
    expect($e10.length, 1, reason: '[a]\n\$ = <[b] / [c]>\n\'\'\nerror count');
    expect($e10, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[a]\n\$ = <[b] / [c]>\n\'\'\nerrors');
    final $s22 = State('');
    final $r29 = $r23($s22) as dynamic;
    expect($r29, isNull, reason: '[a]\n\$ = <[b] / [c]>\n\'\'\nresult == null');
    expect(
      $s22.farthestPosition,
      0,
      reason: '[a]\n\$ = <[b] / [c]>\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s22.position,
      0,
      reason: '[a]\n\$ = <[b] / [c]>\n\'\'\nstate.position = 0',
    );
    final $e11 = $s22.getErrors().map((e) => '$e').toList()..sort();
    expect($e11.length, 1, reason: '[a]\n\$ = <[b] / [c]>\n\'\'\nerror count');
    expect($e11, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[a]\n\$ = <[b] / [c]>\n\'\'\nerrors');
    final $s23 = State('a');
    final $r30 = $r22($s23) as dynamic;
    expect(
      $r30,
      isNull,
      reason: '[a]\n\$ = <[b] / [c]>\n\'a\'\nresult == null',
    );
    expect(
      $s23.farthestPosition,
      1,
      reason: '[a]\n\$ = <[b] / [c]>\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      $s23.position,
      0,
      reason: '[a]\n\$ = <[b] / [c]>\n\'a\'\nstate.position = 0',
    );
    final $e12 = $s23.getErrors().map((e) => '$e').toList()..sort();
    expect($e12.length, 1, reason: '[a]\n\$ = <[b] / [c]>\n\'a\'\nerror count');
    expect($e12, [
      '(end: 1, message: Unexpected input data, start: 1)',
    ], reason: '[a]\n\$ = <[b] / [c]>\n\'a\'\nerrors');
    final $s24 = State('a');
    final $r31 = $r23($s24) as dynamic;
    expect(
      $r31,
      isNull,
      reason: '[a]\n\$ = <[b] / [c]>\n\'a\'\nresult == null',
    );
    expect(
      $s24.farthestPosition,
      1,
      reason: '[a]\n\$ = <[b] / [c]>\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      $s24.position,
      0,
      reason: '[a]\n\$ = <[b] / [c]>\n\'a\'\nstate.position = 0',
    );
    final $e13 = $s24.getErrors().map((e) => '$e').toList()..sort();
    expect($e13.length, 1, reason: '[a]\n\$ = <[b] / [c]>\n\'a\'\nerror count');
    expect($e13, [
      '(end: 1, message: Unexpected input data, start: 1)',
    ], reason: '[a]\n\$ = <[b] / [c]>\n\'a\'\nerrors');
  });

  test('CharacterClass', () {
    final $r = parser.parseCharacterClass0;
    final $r1 = parser.parseCharacterClassVoid0;
    final $s = State('a');
    final $r2 = $r($s) as dynamic;
    expect($r2, isNotNull, reason: '[a]\n\'a\'\nresult != null');
    expect($s.position, 1, reason: '[a]\n\'a\'\nstate.position = 1');
    expect($r2.$1, 97, reason: '[a]\n\'a\'\nresult.\$1 != 97');
    final $s1 = State('a');
    final $r3 = $r1($s1) as dynamic;
    expect($r3, isNotNull, reason: '[a]\n\'a\'\nresult != null');
    expect($s1.position, 1, reason: '[a]\n\'a\'\nstate.position = 1');
    expect($r3.$1, null, reason: '[a]\n\'a\'\nresult.\$1 != null');
    final $s2 = State('');
    final $r4 = $r($s2) as dynamic;
    expect($r4, isNull, reason: '[a]\n\'\'\nresult == null');
    expect(
      $s2.farthestPosition,
      0,
      reason: '[a]\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s2.position, 0, reason: '[a]\n\'\'\nstate.position = 0');
    final $e = $s2.getErrors().map((e) => '$e').toList()..sort();
    expect($e.length, 1, reason: '[a]\n\'\'\nerror count');
    expect($e, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[a]\n\'\'\nerrors');
    final $s3 = State('');
    final $r5 = $r1($s3) as dynamic;
    expect($r5, isNull, reason: '[a]\n\'\'\nresult == null');
    expect(
      $s3.farthestPosition,
      0,
      reason: '[a]\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s3.position, 0, reason: '[a]\n\'\'\nstate.position = 0');
    final $e1 = $s3.getErrors().map((e) => '$e').toList()..sort();
    expect($e1.length, 1, reason: '[a]\n\'\'\nerror count');
    expect($e1, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[a]\n\'\'\nerrors');
    final $s4 = State('z');
    final $r6 = $r($s4) as dynamic;
    expect($r6, isNull, reason: '[a]\n\'z\'\nresult == null');
    expect(
      $s4.farthestPosition,
      0,
      reason: '[a]\n\'z\'\nstate.farthestPosition = 0',
    );
    expect($s4.position, 0, reason: '[a]\n\'z\'\nstate.position = 0');
    final $e2 = $s4.getErrors().map((e) => '$e').toList()..sort();
    expect($e2.length, 1, reason: '[a]\n\'z\'\nerror count');
    expect($e2, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[a]\n\'z\'\nerrors');
    final $s5 = State('z');
    final $r7 = $r1($s5) as dynamic;
    expect($r7, isNull, reason: '[a]\n\'z\'\nresult == null');
    expect(
      $s5.farthestPosition,
      0,
      reason: '[a]\n\'z\'\nstate.farthestPosition = 0',
    );
    expect($s5.position, 0, reason: '[a]\n\'z\'\nstate.position = 0');
    final $e3 = $s5.getErrors().map((e) => '$e').toList()..sort();
    expect($e3.length, 1, reason: '[a]\n\'z\'\nerror count');
    expect($e3, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[a]\n\'z\'\nerrors');
    final $r8 = parser.parseCharacterClass1;
    final $r9 = parser.parseCharacterClassVoid1;
    final $s6 = State('a');
    final $r10 = $r8($s6) as dynamic;
    expect($r10, isNotNull, reason: '[a-z]\n\'a\'\nresult != null');
    expect($s6.position, 1, reason: '[a-z]\n\'a\'\nstate.position = 1');
    expect($r10.$1, 97, reason: '[a-z]\n\'a\'\nresult.\$1 != 97');
    final $s7 = State('a');
    final $r11 = $r9($s7) as dynamic;
    expect($r11, isNotNull, reason: '[a-z]\n\'a\'\nresult != null');
    expect($s7.position, 1, reason: '[a-z]\n\'a\'\nstate.position = 1');
    expect($r11.$1, null, reason: '[a-z]\n\'a\'\nresult.\$1 != null');
    final $s8 = State('z');
    final $r12 = $r8($s8) as dynamic;
    expect($r12, isNotNull, reason: '[a-z]\n\'z\'\nresult != null');
    expect($s8.position, 1, reason: '[a-z]\n\'z\'\nstate.position = 1');
    expect($r12.$1, 122, reason: '[a-z]\n\'z\'\nresult.\$1 != 122');
    final $s9 = State('z');
    final $r13 = $r9($s9) as dynamic;
    expect($r13, isNotNull, reason: '[a-z]\n\'z\'\nresult != null');
    expect($s9.position, 1, reason: '[a-z]\n\'z\'\nstate.position = 1');
    expect($r13.$1, null, reason: '[a-z]\n\'z\'\nresult.\$1 != null');
    final $s10 = State('');
    final $r14 = $r8($s10) as dynamic;
    expect($r14, isNull, reason: '[a-z]\n\'\'\nresult == null');
    expect(
      $s10.farthestPosition,
      0,
      reason: '[a-z]\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s10.position, 0, reason: '[a-z]\n\'\'\nstate.position = 0');
    final $e4 = $s10.getErrors().map((e) => '$e').toList()..sort();
    expect($e4.length, 1, reason: '[a-z]\n\'\'\nerror count');
    expect($e4, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[a-z]\n\'\'\nerrors');
    final $s11 = State('');
    final $r15 = $r9($s11) as dynamic;
    expect($r15, isNull, reason: '[a-z]\n\'\'\nresult == null');
    expect(
      $s11.farthestPosition,
      0,
      reason: '[a-z]\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s11.position, 0, reason: '[a-z]\n\'\'\nstate.position = 0');
    final $e5 = $s11.getErrors().map((e) => '$e').toList()..sort();
    expect($e5.length, 1, reason: '[a-z]\n\'\'\nerror count');
    expect($e5, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[a-z]\n\'\'\nerrors');
    final $s12 = State('!');
    final $r16 = $r8($s12) as dynamic;
    expect($r16, isNull, reason: '[a-z]\n\'!\'\nresult == null');
    expect(
      $s12.farthestPosition,
      0,
      reason: '[a-z]\n\'!\'\nstate.farthestPosition = 0',
    );
    expect($s12.position, 0, reason: '[a-z]\n\'!\'\nstate.position = 0');
    final $e6 = $s12.getErrors().map((e) => '$e').toList()..sort();
    expect($e6.length, 1, reason: '[a-z]\n\'!\'\nerror count');
    expect($e6, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[a-z]\n\'!\'\nerrors');
    final $s13 = State('!');
    final $r17 = $r9($s13) as dynamic;
    expect($r17, isNull, reason: '[a-z]\n\'!\'\nresult == null');
    expect(
      $s13.farthestPosition,
      0,
      reason: '[a-z]\n\'!\'\nstate.farthestPosition = 0',
    );
    expect($s13.position, 0, reason: '[a-z]\n\'!\'\nstate.position = 0');
    final $e7 = $s13.getErrors().map((e) => '$e').toList()..sort();
    expect($e7.length, 1, reason: '[a-z]\n\'!\'\nerror count');
    expect($e7, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[a-z]\n\'!\'\nerrors');
    final $r18 = parser.parseCharacterClass2;
    final $r19 = parser.parseCharacterClassVoid2;
    final $s14 = State('0');
    final $r20 = $r18($s14) as dynamic;
    expect($r20, isNotNull, reason: '[^a]\n\'0\'\nresult != null');
    expect($s14.position, 1, reason: '[^a]\n\'0\'\nstate.position = 1');
    expect($r20.$1, 48, reason: '[^a]\n\'0\'\nresult.\$1 != 48');
    final $s15 = State('0');
    final $r21 = $r19($s15) as dynamic;
    expect($r21, isNotNull, reason: '[^a]\n\'0\'\nresult != null');
    expect($s15.position, 1, reason: '[^a]\n\'0\'\nstate.position = 1');
    expect($r21.$1, null, reason: '[^a]\n\'0\'\nresult.\$1 != null');
    final $s16 = State('z');
    final $r22 = $r18($s16) as dynamic;
    expect($r22, isNotNull, reason: '[^a]\n\'z\'\nresult != null');
    expect($s16.position, 1, reason: '[^a]\n\'z\'\nstate.position = 1');
    expect($r22.$1, 122, reason: '[^a]\n\'z\'\nresult.\$1 != 122');
    final $s17 = State('z');
    final $r23 = $r19($s17) as dynamic;
    expect($r23, isNotNull, reason: '[^a]\n\'z\'\nresult != null');
    expect($s17.position, 1, reason: '[^a]\n\'z\'\nstate.position = 1');
    expect($r23.$1, null, reason: '[^a]\n\'z\'\nresult.\$1 != null');
    final $s18 = State('a');
    final $r24 = $r18($s18) as dynamic;
    expect($r24, isNull, reason: '[^a]\n\'a\'\nresult == null');
    expect(
      $s18.farthestPosition,
      0,
      reason: '[^a]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect($s18.position, 0, reason: '[^a]\n\'a\'\nstate.position = 0');
    final $e8 = $s18.getErrors().map((e) => '$e').toList()..sort();
    expect($e8.length, 1, reason: '[^a]\n\'a\'\nerror count');
    expect($e8, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^a]\n\'a\'\nerrors');
    final $s19 = State('a');
    final $r25 = $r19($s19) as dynamic;
    expect($r25, isNull, reason: '[^a]\n\'a\'\nresult == null');
    expect(
      $s19.farthestPosition,
      0,
      reason: '[^a]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect($s19.position, 0, reason: '[^a]\n\'a\'\nstate.position = 0');
    final $e9 = $s19.getErrors().map((e) => '$e').toList()..sort();
    expect($e9.length, 1, reason: '[^a]\n\'a\'\nerror count');
    expect($e9, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^a]\n\'a\'\nerrors');
    final $s20 = State('');
    final $r26 = $r18($s20) as dynamic;
    expect($r26, isNull, reason: '[^a]\n\'\'\nresult == null');
    expect(
      $s20.farthestPosition,
      0,
      reason: '[^a]\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s20.position, 0, reason: '[^a]\n\'\'\nstate.position = 0');
    final $e10 = $s20.getErrors().map((e) => '$e').toList()..sort();
    expect($e10.length, 1, reason: '[^a]\n\'\'\nerror count');
    expect($e10, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^a]\n\'\'\nerrors');
    final $s21 = State('');
    final $r27 = $r19($s21) as dynamic;
    expect($r27, isNull, reason: '[^a]\n\'\'\nresult == null');
    expect(
      $s21.farthestPosition,
      0,
      reason: '[^a]\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s21.position, 0, reason: '[^a]\n\'\'\nstate.position = 0');
    final $e11 = $s21.getErrors().map((e) => '$e').toList()..sort();
    expect($e11.length, 1, reason: '[^a]\n\'\'\nerror count');
    expect($e11, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^a]\n\'\'\nerrors');
    final $r28 = parser.parseCharacterClass3;
    final $r29 = parser.parseCharacterClassVoid3;
    final $s22 = State('0');
    final $r30 = $r28($s22) as dynamic;
    expect($r30, isNotNull, reason: '[^ab]\n\'0\'\nresult != null');
    expect($s22.position, 1, reason: '[^ab]\n\'0\'\nstate.position = 1');
    expect($r30.$1, 48, reason: '[^ab]\n\'0\'\nresult.\$1 != 48');
    final $s23 = State('0');
    final $r31 = $r29($s23) as dynamic;
    expect($r31, isNotNull, reason: '[^ab]\n\'0\'\nresult != null');
    expect($s23.position, 1, reason: '[^ab]\n\'0\'\nstate.position = 1');
    expect($r31.$1, null, reason: '[^ab]\n\'0\'\nresult.\$1 != null');
    final $s24 = State('z');
    final $r32 = $r28($s24) as dynamic;
    expect($r32, isNotNull, reason: '[^ab]\n\'z\'\nresult != null');
    expect($s24.position, 1, reason: '[^ab]\n\'z\'\nstate.position = 1');
    expect($r32.$1, 122, reason: '[^ab]\n\'z\'\nresult.\$1 != 122');
    final $s25 = State('z');
    final $r33 = $r29($s25) as dynamic;
    expect($r33, isNotNull, reason: '[^ab]\n\'z\'\nresult != null');
    expect($s25.position, 1, reason: '[^ab]\n\'z\'\nstate.position = 1');
    expect($r33.$1, null, reason: '[^ab]\n\'z\'\nresult.\$1 != null');
    final $s26 = State('a');
    final $r34 = $r28($s26) as dynamic;
    expect($r34, isNull, reason: '[^ab]\n\'a\'\nresult == null');
    expect(
      $s26.farthestPosition,
      0,
      reason: '[^ab]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect($s26.position, 0, reason: '[^ab]\n\'a\'\nstate.position = 0');
    final $e12 = $s26.getErrors().map((e) => '$e').toList()..sort();
    expect($e12.length, 1, reason: '[^ab]\n\'a\'\nerror count');
    expect($e12, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^ab]\n\'a\'\nerrors');
    final $s27 = State('a');
    final $r35 = $r29($s27) as dynamic;
    expect($r35, isNull, reason: '[^ab]\n\'a\'\nresult == null');
    expect(
      $s27.farthestPosition,
      0,
      reason: '[^ab]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect($s27.position, 0, reason: '[^ab]\n\'a\'\nstate.position = 0');
    final $e13 = $s27.getErrors().map((e) => '$e').toList()..sort();
    expect($e13.length, 1, reason: '[^ab]\n\'a\'\nerror count');
    expect($e13, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^ab]\n\'a\'\nerrors');
    final $s28 = State('b');
    final $r36 = $r28($s28) as dynamic;
    expect($r36, isNull, reason: '[^ab]\n\'b\'\nresult == null');
    expect(
      $s28.farthestPosition,
      0,
      reason: '[^ab]\n\'b\'\nstate.farthestPosition = 0',
    );
    expect($s28.position, 0, reason: '[^ab]\n\'b\'\nstate.position = 0');
    final $e14 = $s28.getErrors().map((e) => '$e').toList()..sort();
    expect($e14.length, 1, reason: '[^ab]\n\'b\'\nerror count');
    expect($e14, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^ab]\n\'b\'\nerrors');
    final $s29 = State('b');
    final $r37 = $r29($s29) as dynamic;
    expect($r37, isNull, reason: '[^ab]\n\'b\'\nresult == null');
    expect(
      $s29.farthestPosition,
      0,
      reason: '[^ab]\n\'b\'\nstate.farthestPosition = 0',
    );
    expect($s29.position, 0, reason: '[^ab]\n\'b\'\nstate.position = 0');
    final $e15 = $s29.getErrors().map((e) => '$e').toList()..sort();
    expect($e15.length, 1, reason: '[^ab]\n\'b\'\nerror count');
    expect($e15, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^ab]\n\'b\'\nerrors');
    final $s30 = State('');
    final $r38 = $r28($s30) as dynamic;
    expect($r38, isNull, reason: '[^ab]\n\'\'\nresult == null');
    expect(
      $s30.farthestPosition,
      0,
      reason: '[^ab]\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s30.position, 0, reason: '[^ab]\n\'\'\nstate.position = 0');
    final $e16 = $s30.getErrors().map((e) => '$e').toList()..sort();
    expect($e16.length, 1, reason: '[^ab]\n\'\'\nerror count');
    expect($e16, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^ab]\n\'\'\nerrors');
    final $s31 = State('');
    final $r39 = $r29($s31) as dynamic;
    expect($r39, isNull, reason: '[^ab]\n\'\'\nresult == null');
    expect(
      $s31.farthestPosition,
      0,
      reason: '[^ab]\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s31.position, 0, reason: '[^ab]\n\'\'\nstate.position = 0');
    final $e17 = $s31.getErrors().map((e) => '$e').toList()..sort();
    expect($e17.length, 1, reason: '[^ab]\n\'\'\nerror count');
    expect($e17, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^ab]\n\'\'\nerrors');
    final $r40 = parser.parseCharacterClass4;
    final $r41 = parser.parseCharacterClassVoid4;
    final $s32 = State('0');
    final $r42 = $r40($s32) as dynamic;
    expect($r42, isNotNull, reason: '[^abc]\n\'0\'\nresult != null');
    expect($s32.position, 1, reason: '[^abc]\n\'0\'\nstate.position = 1');
    expect($r42.$1, 48, reason: '[^abc]\n\'0\'\nresult.\$1 != 48');
    final $s33 = State('0');
    final $r43 = $r41($s33) as dynamic;
    expect($r43, isNotNull, reason: '[^abc]\n\'0\'\nresult != null');
    expect($s33.position, 1, reason: '[^abc]\n\'0\'\nstate.position = 1');
    expect($r43.$1, null, reason: '[^abc]\n\'0\'\nresult.\$1 != null');
    final $s34 = State('z');
    final $r44 = $r40($s34) as dynamic;
    expect($r44, isNotNull, reason: '[^abc]\n\'z\'\nresult != null');
    expect($s34.position, 1, reason: '[^abc]\n\'z\'\nstate.position = 1');
    expect($r44.$1, 122, reason: '[^abc]\n\'z\'\nresult.\$1 != 122');
    final $s35 = State('z');
    final $r45 = $r41($s35) as dynamic;
    expect($r45, isNotNull, reason: '[^abc]\n\'z\'\nresult != null');
    expect($s35.position, 1, reason: '[^abc]\n\'z\'\nstate.position = 1');
    expect($r45.$1, null, reason: '[^abc]\n\'z\'\nresult.\$1 != null');
    final $s36 = State('a');
    final $r46 = $r40($s36) as dynamic;
    expect($r46, isNull, reason: '[^abc]\n\'a\'\nresult == null');
    expect(
      $s36.farthestPosition,
      0,
      reason: '[^abc]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect($s36.position, 0, reason: '[^abc]\n\'a\'\nstate.position = 0');
    final $e18 = $s36.getErrors().map((e) => '$e').toList()..sort();
    expect($e18.length, 1, reason: '[^abc]\n\'a\'\nerror count');
    expect($e18, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^abc]\n\'a\'\nerrors');
    final $s37 = State('a');
    final $r47 = $r41($s37) as dynamic;
    expect($r47, isNull, reason: '[^abc]\n\'a\'\nresult == null');
    expect(
      $s37.farthestPosition,
      0,
      reason: '[^abc]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect($s37.position, 0, reason: '[^abc]\n\'a\'\nstate.position = 0');
    final $e19 = $s37.getErrors().map((e) => '$e').toList()..sort();
    expect($e19.length, 1, reason: '[^abc]\n\'a\'\nerror count');
    expect($e19, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^abc]\n\'a\'\nerrors');
    final $s38 = State('b');
    final $r48 = $r40($s38) as dynamic;
    expect($r48, isNull, reason: '[^abc]\n\'b\'\nresult == null');
    expect(
      $s38.farthestPosition,
      0,
      reason: '[^abc]\n\'b\'\nstate.farthestPosition = 0',
    );
    expect($s38.position, 0, reason: '[^abc]\n\'b\'\nstate.position = 0');
    final $e20 = $s38.getErrors().map((e) => '$e').toList()..sort();
    expect($e20.length, 1, reason: '[^abc]\n\'b\'\nerror count');
    expect($e20, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^abc]\n\'b\'\nerrors');
    final $s39 = State('b');
    final $r49 = $r41($s39) as dynamic;
    expect($r49, isNull, reason: '[^abc]\n\'b\'\nresult == null');
    expect(
      $s39.farthestPosition,
      0,
      reason: '[^abc]\n\'b\'\nstate.farthestPosition = 0',
    );
    expect($s39.position, 0, reason: '[^abc]\n\'b\'\nstate.position = 0');
    final $e21 = $s39.getErrors().map((e) => '$e').toList()..sort();
    expect($e21.length, 1, reason: '[^abc]\n\'b\'\nerror count');
    expect($e21, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^abc]\n\'b\'\nerrors');
    final $s40 = State('c');
    final $r50 = $r40($s40) as dynamic;
    expect($r50, isNull, reason: '[^abc]\n\'c\'\nresult == null');
    expect(
      $s40.farthestPosition,
      0,
      reason: '[^abc]\n\'c\'\nstate.farthestPosition = 0',
    );
    expect($s40.position, 0, reason: '[^abc]\n\'c\'\nstate.position = 0');
    final $e22 = $s40.getErrors().map((e) => '$e').toList()..sort();
    expect($e22.length, 1, reason: '[^abc]\n\'c\'\nerror count');
    expect($e22, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^abc]\n\'c\'\nerrors');
    final $s41 = State('c');
    final $r51 = $r41($s41) as dynamic;
    expect($r51, isNull, reason: '[^abc]\n\'c\'\nresult == null');
    expect(
      $s41.farthestPosition,
      0,
      reason: '[^abc]\n\'c\'\nstate.farthestPosition = 0',
    );
    expect($s41.position, 0, reason: '[^abc]\n\'c\'\nstate.position = 0');
    final $e23 = $s41.getErrors().map((e) => '$e').toList()..sort();
    expect($e23.length, 1, reason: '[^abc]\n\'c\'\nerror count');
    expect($e23, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^abc]\n\'c\'\nerrors');
    final $s42 = State('');
    final $r52 = $r40($s42) as dynamic;
    expect($r52, isNull, reason: '[^abc]\n\'\'\nresult == null');
    expect(
      $s42.farthestPosition,
      0,
      reason: '[^abc]\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s42.position, 0, reason: '[^abc]\n\'\'\nstate.position = 0');
    final $e24 = $s42.getErrors().map((e) => '$e').toList()..sort();
    expect($e24.length, 1, reason: '[^abc]\n\'\'\nerror count');
    expect($e24, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^abc]\n\'\'\nerrors');
    final $s43 = State('');
    final $r53 = $r41($s43) as dynamic;
    expect($r53, isNull, reason: '[^abc]\n\'\'\nresult == null');
    expect(
      $s43.farthestPosition,
      0,
      reason: '[^abc]\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s43.position, 0, reason: '[^abc]\n\'\'\nstate.position = 0');
    final $e25 = $s43.getErrors().map((e) => '$e').toList()..sort();
    expect($e25.length, 1, reason: '[^abc]\n\'\'\nerror count');
    expect($e25, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^abc]\n\'\'\nerrors');
    final $r54 = parser.parseCharacterClass5;
    final $r55 = parser.parseCharacterClassVoid5;
    final $s44 = State('0');
    final $r56 = $r54($s44) as dynamic;
    expect($r56, isNotNull, reason: '[^a-z]\n\'0\'\nresult != null');
    expect($s44.position, 1, reason: '[^a-z]\n\'0\'\nstate.position = 1');
    expect($r56.$1, 48, reason: '[^a-z]\n\'0\'\nresult.\$1 != 48');
    final $s45 = State('0');
    final $r57 = $r55($s45) as dynamic;
    expect($r57, isNotNull, reason: '[^a-z]\n\'0\'\nresult != null');
    expect($s45.position, 1, reason: '[^a-z]\n\'0\'\nstate.position = 1');
    expect($r57.$1, null, reason: '[^a-z]\n\'0\'\nresult.\$1 != null');
    final $s46 = State('');
    final $r58 = $r54($s46) as dynamic;
    expect($r58, isNull, reason: '[^a-z]\n\'\'\nresult == null');
    expect(
      $s46.farthestPosition,
      0,
      reason: '[^a-z]\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s46.position, 0, reason: '[^a-z]\n\'\'\nstate.position = 0');
    final $e26 = $s46.getErrors().map((e) => '$e').toList()..sort();
    expect($e26.length, 1, reason: '[^a-z]\n\'\'\nerror count');
    expect($e26, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^a-z]\n\'\'\nerrors');
    final $s47 = State('');
    final $r59 = $r55($s47) as dynamic;
    expect($r59, isNull, reason: '[^a-z]\n\'\'\nresult == null');
    expect(
      $s47.farthestPosition,
      0,
      reason: '[^a-z]\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s47.position, 0, reason: '[^a-z]\n\'\'\nstate.position = 0');
    final $e27 = $s47.getErrors().map((e) => '$e').toList()..sort();
    expect($e27.length, 1, reason: '[^a-z]\n\'\'\nerror count');
    expect($e27, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^a-z]\n\'\'\nerrors');
    final $s48 = State('a');
    final $r60 = $r54($s48) as dynamic;
    expect($r60, isNull, reason: '[^a-z]\n\'a\'\nresult == null');
    expect(
      $s48.farthestPosition,
      0,
      reason: '[^a-z]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect($s48.position, 0, reason: '[^a-z]\n\'a\'\nstate.position = 0');
    final $e28 = $s48.getErrors().map((e) => '$e').toList()..sort();
    expect($e28.length, 1, reason: '[^a-z]\n\'a\'\nerror count');
    expect($e28, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^a-z]\n\'a\'\nerrors');
    final $s49 = State('a');
    final $r61 = $r55($s49) as dynamic;
    expect($r61, isNull, reason: '[^a-z]\n\'a\'\nresult == null');
    expect(
      $s49.farthestPosition,
      0,
      reason: '[^a-z]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect($s49.position, 0, reason: '[^a-z]\n\'a\'\nstate.position = 0');
    final $e29 = $s49.getErrors().map((e) => '$e').toList()..sort();
    expect($e29.length, 1, reason: '[^a-z]\n\'a\'\nerror count');
    expect($e29, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^a-z]\n\'a\'\nerrors');
    final $s50 = State('z');
    final $r62 = $r54($s50) as dynamic;
    expect($r62, isNull, reason: '[^a-z]\n\'z\'\nresult == null');
    expect(
      $s50.farthestPosition,
      0,
      reason: '[^a-z]\n\'z\'\nstate.farthestPosition = 0',
    );
    expect($s50.position, 0, reason: '[^a-z]\n\'z\'\nstate.position = 0');
    final $e30 = $s50.getErrors().map((e) => '$e').toList()..sort();
    expect($e30.length, 1, reason: '[^a-z]\n\'z\'\nerror count');
    expect($e30, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^a-z]\n\'z\'\nerrors');
    final $s51 = State('z');
    final $r63 = $r55($s51) as dynamic;
    expect($r63, isNull, reason: '[^a-z]\n\'z\'\nresult == null');
    expect(
      $s51.farthestPosition,
      0,
      reason: '[^a-z]\n\'z\'\nstate.farthestPosition = 0',
    );
    expect($s51.position, 0, reason: '[^a-z]\n\'z\'\nstate.position = 0');
    final $e31 = $s51.getErrors().map((e) => '$e').toList()..sort();
    expect($e31.length, 1, reason: '[^a-z]\n\'z\'\nerror count');
    expect($e31, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^a-z]\n\'z\'\nerrors');
    final $r64 = parser.parseCharacterClass6;
    final $r65 = parser.parseCharacterClassVoid6;
    final $s52 = State('^');
    final $r66 = $r64($s52) as dynamic;
    expect($r66, isNotNull, reason: '[\\^]\n\'^\'\nresult != null');
    expect($s52.position, 1, reason: '[\\^]\n\'^\'\nstate.position = 1');
    expect($r66.$1, 94, reason: '[\\^]\n\'^\'\nresult.\$1 != 94');
    final $s53 = State('^');
    final $r67 = $r65($s53) as dynamic;
    expect($r67, isNotNull, reason: '[\\^]\n\'^\'\nresult != null');
    expect($s53.position, 1, reason: '[\\^]\n\'^\'\nstate.position = 1');
    expect($r67.$1, null, reason: '[\\^]\n\'^\'\nresult.\$1 != null');
    final $s54 = State('');
    final $r68 = $r64($s54) as dynamic;
    expect($r68, isNull, reason: '[\\^]\n\'\'\nresult == null');
    expect(
      $s54.farthestPosition,
      0,
      reason: '[\\^]\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s54.position, 0, reason: '[\\^]\n\'\'\nstate.position = 0');
    final $e32 = $s54.getErrors().map((e) => '$e').toList()..sort();
    expect($e32.length, 1, reason: '[\\^]\n\'\'\nerror count');
    expect($e32, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[\\^]\n\'\'\nerrors');
    final $s55 = State('');
    final $r69 = $r65($s55) as dynamic;
    expect($r69, isNull, reason: '[\\^]\n\'\'\nresult == null');
    expect(
      $s55.farthestPosition,
      0,
      reason: '[\\^]\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s55.position, 0, reason: '[\\^]\n\'\'\nstate.position = 0');
    final $e33 = $s55.getErrors().map((e) => '$e').toList()..sort();
    expect($e33.length, 1, reason: '[\\^]\n\'\'\nerror count');
    expect($e33, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[\\^]\n\'\'\nerrors');
    final $s56 = State('a');
    final $r70 = $r64($s56) as dynamic;
    expect($r70, isNull, reason: '[\\^]\n\'a\'\nresult == null');
    expect(
      $s56.farthestPosition,
      0,
      reason: '[\\^]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect($s56.position, 0, reason: '[\\^]\n\'a\'\nstate.position = 0');
    final $e34 = $s56.getErrors().map((e) => '$e').toList()..sort();
    expect($e34.length, 1, reason: '[\\^]\n\'a\'\nerror count');
    expect($e34, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[\\^]\n\'a\'\nerrors');
    final $s57 = State('a');
    final $r71 = $r65($s57) as dynamic;
    expect($r71, isNull, reason: '[\\^]\n\'a\'\nresult == null');
    expect(
      $s57.farthestPosition,
      0,
      reason: '[\\^]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect($s57.position, 0, reason: '[\\^]\n\'a\'\nstate.position = 0');
    final $e35 = $s57.getErrors().map((e) => '$e').toList()..sort();
    expect($e35.length, 1, reason: '[\\^]\n\'a\'\nerror count');
    expect($e35, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[\\^]\n\'a\'\nerrors');
    final $r72 = parser.parseCharacterClass7;
    final $r73 = parser.parseCharacterClassVoid7;
    final $s58 = State('-');
    final $r74 = $r72($s58) as dynamic;
    expect($r74, isNotNull, reason: '[\\-]\n\'-\'\nresult != null');
    expect($s58.position, 1, reason: '[\\-]\n\'-\'\nstate.position = 1');
    expect($r74.$1, 45, reason: '[\\-]\n\'-\'\nresult.\$1 != 45');
    final $s59 = State('-');
    final $r75 = $r73($s59) as dynamic;
    expect($r75, isNotNull, reason: '[\\-]\n\'-\'\nresult != null');
    expect($s59.position, 1, reason: '[\\-]\n\'-\'\nstate.position = 1');
    expect($r75.$1, null, reason: '[\\-]\n\'-\'\nresult.\$1 != null');
    final $s60 = State('');
    final $r76 = $r72($s60) as dynamic;
    expect($r76, isNull, reason: '[\\-]\n\'\'\nresult == null');
    expect(
      $s60.farthestPosition,
      0,
      reason: '[\\-]\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s60.position, 0, reason: '[\\-]\n\'\'\nstate.position = 0');
    final $e36 = $s60.getErrors().map((e) => '$e').toList()..sort();
    expect($e36.length, 1, reason: '[\\-]\n\'\'\nerror count');
    expect($e36, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[\\-]\n\'\'\nerrors');
    final $s61 = State('');
    final $r77 = $r73($s61) as dynamic;
    expect($r77, isNull, reason: '[\\-]\n\'\'\nresult == null');
    expect(
      $s61.farthestPosition,
      0,
      reason: '[\\-]\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s61.position, 0, reason: '[\\-]\n\'\'\nstate.position = 0');
    final $e37 = $s61.getErrors().map((e) => '$e').toList()..sort();
    expect($e37.length, 1, reason: '[\\-]\n\'\'\nerror count');
    expect($e37, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[\\-]\n\'\'\nerrors');
    final $s62 = State('a');
    final $r78 = $r72($s62) as dynamic;
    expect($r78, isNull, reason: '[\\-]\n\'a\'\nresult == null');
    expect(
      $s62.farthestPosition,
      0,
      reason: '[\\-]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect($s62.position, 0, reason: '[\\-]\n\'a\'\nstate.position = 0');
    final $e38 = $s62.getErrors().map((e) => '$e').toList()..sort();
    expect($e38.length, 1, reason: '[\\-]\n\'a\'\nerror count');
    expect($e38, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[\\-]\n\'a\'\nerrors');
    final $s63 = State('a');
    final $r79 = $r73($s63) as dynamic;
    expect($r79, isNull, reason: '[\\-]\n\'a\'\nresult == null');
    expect(
      $s63.farthestPosition,
      0,
      reason: '[\\-]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect($s63.position, 0, reason: '[\\-]\n\'a\'\nstate.position = 0');
    final $e39 = $s63.getErrors().map((e) => '$e').toList()..sort();
    expect($e39.length, 1, reason: '[\\-]\n\'a\'\nerror count');
    expect($e39, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[\\-]\n\'a\'\nerrors');
    final $r80 = parser.parseCharacterClass8;
    final $r81 = parser.parseCharacterClassVoid8;
    final $s64 = State(' ');
    final $r82 = $r80($s64) as dynamic;
    expect($r82, isNotNull, reason: '[\\u{20}]\n\' \'\nresult != null');
    expect($s64.position, 1, reason: '[\\u{20}]\n\' \'\nstate.position = 1');
    expect($r82.$1, 32, reason: '[\\u{20}]\n\' \'\nresult.\$1 != 32');
    final $s65 = State(' ');
    final $r83 = $r81($s65) as dynamic;
    expect($r83, isNotNull, reason: '[\\u{20}]\n\' \'\nresult != null');
    expect($s65.position, 1, reason: '[\\u{20}]\n\' \'\nstate.position = 1');
    expect($r83.$1, null, reason: '[\\u{20}]\n\' \'\nresult.\$1 != null');
    final $s66 = State('');
    final $r84 = $r80($s66) as dynamic;
    expect($r84, isNull, reason: '[\\u{20}]\n\'\'\nresult == null');
    expect(
      $s66.farthestPosition,
      0,
      reason: '[\\u{20}]\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s66.position, 0, reason: '[\\u{20}]\n\'\'\nstate.position = 0');
    final $e40 = $s66.getErrors().map((e) => '$e').toList()..sort();
    expect($e40.length, 1, reason: '[\\u{20}]\n\'\'\nerror count');
    expect($e40, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[\\u{20}]\n\'\'\nerrors');
    final $s67 = State('');
    final $r85 = $r81($s67) as dynamic;
    expect($r85, isNull, reason: '[\\u{20}]\n\'\'\nresult == null');
    expect(
      $s67.farthestPosition,
      0,
      reason: '[\\u{20}]\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s67.position, 0, reason: '[\\u{20}]\n\'\'\nstate.position = 0');
    final $e41 = $s67.getErrors().map((e) => '$e').toList()..sort();
    expect($e41.length, 1, reason: '[\\u{20}]\n\'\'\nerror count');
    expect($e41, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[\\u{20}]\n\'\'\nerrors');
    final $s68 = State('a');
    final $r86 = $r80($s68) as dynamic;
    expect($r86, isNull, reason: '[\\u{20}]\n\'a\'\nresult == null');
    expect(
      $s68.farthestPosition,
      0,
      reason: '[\\u{20}]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect($s68.position, 0, reason: '[\\u{20}]\n\'a\'\nstate.position = 0');
    final $e42 = $s68.getErrors().map((e) => '$e').toList()..sort();
    expect($e42.length, 1, reason: '[\\u{20}]\n\'a\'\nerror count');
    expect($e42, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[\\u{20}]\n\'a\'\nerrors');
    final $s69 = State('a');
    final $r87 = $r81($s69) as dynamic;
    expect($r87, isNull, reason: '[\\u{20}]\n\'a\'\nresult == null');
    expect(
      $s69.farthestPosition,
      0,
      reason: '[\\u{20}]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect($s69.position, 0, reason: '[\\u{20}]\n\'a\'\nstate.position = 0');
    final $e43 = $s69.getErrors().map((e) => '$e').toList()..sort();
    expect($e43.length, 1, reason: '[\\u{20}]\n\'a\'\nerror count');
    expect($e43, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[\\u{20}]\n\'a\'\nerrors');
    final $r88 = parser.parseCharacterClass9;
    final $r89 = parser.parseCharacterClassVoid9;
    final $s70 = State('0');
    final $r90 = $r88($s70) as dynamic;
    expect($r90, isNotNull, reason: '[\\u{30}-\\u{39}]\n\'0\'\nresult != null');
    expect(
      $s70.position,
      1,
      reason: '[\\u{30}-\\u{39}]\n\'0\'\nstate.position = 1',
    );
    expect($r90.$1, 48, reason: '[\\u{30}-\\u{39}]\n\'0\'\nresult.\$1 != 48');
    final $s71 = State('0');
    final $r91 = $r89($s71) as dynamic;
    expect($r91, isNotNull, reason: '[\\u{30}-\\u{39}]\n\'0\'\nresult != null');
    expect(
      $s71.position,
      1,
      reason: '[\\u{30}-\\u{39}]\n\'0\'\nstate.position = 1',
    );
    expect(
      $r91.$1,
      null,
      reason: '[\\u{30}-\\u{39}]\n\'0\'\nresult.\$1 != null',
    );
    final $s72 = State('9');
    final $r92 = $r88($s72) as dynamic;
    expect($r92, isNotNull, reason: '[\\u{30}-\\u{39}]\n\'9\'\nresult != null');
    expect(
      $s72.position,
      1,
      reason: '[\\u{30}-\\u{39}]\n\'9\'\nstate.position = 1',
    );
    expect($r92.$1, 57, reason: '[\\u{30}-\\u{39}]\n\'9\'\nresult.\$1 != 57');
    final $s73 = State('9');
    final $r93 = $r89($s73) as dynamic;
    expect($r93, isNotNull, reason: '[\\u{30}-\\u{39}]\n\'9\'\nresult != null');
    expect(
      $s73.position,
      1,
      reason: '[\\u{30}-\\u{39}]\n\'9\'\nstate.position = 1',
    );
    expect(
      $r93.$1,
      null,
      reason: '[\\u{30}-\\u{39}]\n\'9\'\nresult.\$1 != null',
    );
    final $s74 = State('');
    final $r94 = $r88($s74) as dynamic;
    expect($r94, isNull, reason: '[\\u{30}-\\u{39}]\n\'\'\nresult == null');
    expect(
      $s74.farthestPosition,
      0,
      reason: '[\\u{30}-\\u{39}]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s74.position,
      0,
      reason: '[\\u{30}-\\u{39}]\n\'\'\nstate.position = 0',
    );
    final $e44 = $s74.getErrors().map((e) => '$e').toList()..sort();
    expect($e44.length, 1, reason: '[\\u{30}-\\u{39}]\n\'\'\nerror count');
    expect($e44, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[\\u{30}-\\u{39}]\n\'\'\nerrors');
    final $s75 = State('');
    final $r95 = $r89($s75) as dynamic;
    expect($r95, isNull, reason: '[\\u{30}-\\u{39}]\n\'\'\nresult == null');
    expect(
      $s75.farthestPosition,
      0,
      reason: '[\\u{30}-\\u{39}]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s75.position,
      0,
      reason: '[\\u{30}-\\u{39}]\n\'\'\nstate.position = 0',
    );
    final $e45 = $s75.getErrors().map((e) => '$e').toList()..sort();
    expect($e45.length, 1, reason: '[\\u{30}-\\u{39}]\n\'\'\nerror count');
    expect($e45, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[\\u{30}-\\u{39}]\n\'\'\nerrors');
    final $s76 = State('a');
    final $r96 = $r88($s76) as dynamic;
    expect($r96, isNull, reason: '[\\u{30}-\\u{39}]\n\'a\'\nresult == null');
    expect(
      $s76.farthestPosition,
      0,
      reason: '[\\u{30}-\\u{39}]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(
      $s76.position,
      0,
      reason: '[\\u{30}-\\u{39}]\n\'a\'\nstate.position = 0',
    );
    final $e46 = $s76.getErrors().map((e) => '$e').toList()..sort();
    expect($e46.length, 1, reason: '[\\u{30}-\\u{39}]\n\'a\'\nerror count');
    expect($e46, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[\\u{30}-\\u{39}]\n\'a\'\nerrors');
    final $s77 = State('a');
    final $r97 = $r89($s77) as dynamic;
    expect($r97, isNull, reason: '[\\u{30}-\\u{39}]\n\'a\'\nresult == null');
    expect(
      $s77.farthestPosition,
      0,
      reason: '[\\u{30}-\\u{39}]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(
      $s77.position,
      0,
      reason: '[\\u{30}-\\u{39}]\n\'a\'\nstate.position = 0',
    );
    final $e47 = $s77.getErrors().map((e) => '$e').toList()..sort();
    expect($e47.length, 1, reason: '[\\u{30}-\\u{39}]\n\'a\'\nerror count');
    expect($e47, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[\\u{30}-\\u{39}]\n\'a\'\nerrors');
    final $r98 = parser.parseCharacterClass10;
    final $r99 = parser.parseCharacterClassVoid10;
    final $s78 = State(' ');
    final $r100 = $r98($s78) as dynamic;
    expect($r100, isNotNull, reason: '[\\u{0}]\n\' \'\nresult != null');
    expect($s78.position, 1, reason: '[\\u{0}]\n\' \'\nstate.position = 1');
    expect($r100.$1, 0, reason: '[\\u{0}]\n\' \'\nresult.\$1 != 0');
    final $s79 = State(' ');
    final $r101 = $r99($s79) as dynamic;
    expect($r101, isNotNull, reason: '[\\u{0}]\n\' \'\nresult != null');
    expect($s79.position, 1, reason: '[\\u{0}]\n\' \'\nstate.position = 1');
    expect($r101.$1, null, reason: '[\\u{0}]\n\' \'\nresult.\$1 != null');
    final $s80 = State('');
    final $r102 = $r98($s80) as dynamic;
    expect($r102, isNull, reason: '[\\u{0}]\n\'\'\nresult == null');
    expect(
      $s80.farthestPosition,
      0,
      reason: '[\\u{0}]\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s80.position, 0, reason: '[\\u{0}]\n\'\'\nstate.position = 0');
    final $e48 = $s80.getErrors().map((e) => '$e').toList()..sort();
    expect($e48.length, 1, reason: '[\\u{0}]\n\'\'\nerror count');
    expect($e48, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[\\u{0}]\n\'\'\nerrors');
    final $s81 = State('');
    final $r103 = $r99($s81) as dynamic;
    expect($r103, isNull, reason: '[\\u{0}]\n\'\'\nresult == null');
    expect(
      $s81.farthestPosition,
      0,
      reason: '[\\u{0}]\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s81.position, 0, reason: '[\\u{0}]\n\'\'\nstate.position = 0');
    final $e49 = $s81.getErrors().map((e) => '$e').toList()..sort();
    expect($e49.length, 1, reason: '[\\u{0}]\n\'\'\nerror count');
    expect($e49, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[\\u{0}]\n\'\'\nerrors');
    final $s82 = State('a');
    final $r104 = $r98($s82) as dynamic;
    expect($r104, isNull, reason: '[\\u{0}]\n\'a\'\nresult == null');
    expect(
      $s82.farthestPosition,
      0,
      reason: '[\\u{0}]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect($s82.position, 0, reason: '[\\u{0}]\n\'a\'\nstate.position = 0');
    final $e50 = $s82.getErrors().map((e) => '$e').toList()..sort();
    expect($e50.length, 1, reason: '[\\u{0}]\n\'a\'\nerror count');
    expect($e50, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[\\u{0}]\n\'a\'\nerrors');
    final $s83 = State('a');
    final $r105 = $r99($s83) as dynamic;
    expect($r105, isNull, reason: '[\\u{0}]\n\'a\'\nresult == null');
    expect(
      $s83.farthestPosition,
      0,
      reason: '[\\u{0}]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect($s83.position, 0, reason: '[\\u{0}]\n\'a\'\nstate.position = 0');
    final $e51 = $s83.getErrors().map((e) => '$e').toList()..sort();
    expect($e51.length, 1, reason: '[\\u{0}]\n\'a\'\nerror count');
    expect($e51, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[\\u{0}]\n\'a\'\nerrors');
    final $r106 = parser.parseCharacterClass11;
    final $r107 = parser.parseCharacterClassVoid11;
    final $s84 = State(' ');
    final $r108 = $r106($s84) as dynamic;
    expect($r108, isNotNull, reason: '[\\u{0}-\\u{9}]\n\' \'\nresult != null');
    expect(
      $s84.position,
      1,
      reason: '[\\u{0}-\\u{9}]\n\' \'\nstate.position = 1',
    );
    expect($r108.$1, 0, reason: '[\\u{0}-\\u{9}]\n\' \'\nresult.\$1 != 0');
    final $s85 = State(' ');
    final $r109 = $r107($s85) as dynamic;
    expect($r109, isNotNull, reason: '[\\u{0}-\\u{9}]\n\' \'\nresult != null');
    expect(
      $s85.position,
      1,
      reason: '[\\u{0}-\\u{9}]\n\' \'\nstate.position = 1',
    );
    expect(
      $r109.$1,
      null,
      reason: '[\\u{0}-\\u{9}]\n\' \'\nresult.\$1 != null',
    );
    final $s86 = State('\t');
    final $r110 = $r106($s86) as dynamic;
    expect(
      $r110,
      isNotNull,
      reason: '[\\u{0}-\\u{9}]\n\'\\t\'\nresult != null',
    );
    expect(
      $s86.position,
      1,
      reason: '[\\u{0}-\\u{9}]\n\'\\t\'\nstate.position = 1',
    );
    expect($r110.$1, 9, reason: '[\\u{0}-\\u{9}]\n\'\\t\'\nresult.\$1 != 9');
    final $s87 = State('\t');
    final $r111 = $r107($s87) as dynamic;
    expect(
      $r111,
      isNotNull,
      reason: '[\\u{0}-\\u{9}]\n\'\\t\'\nresult != null',
    );
    expect(
      $s87.position,
      1,
      reason: '[\\u{0}-\\u{9}]\n\'\\t\'\nstate.position = 1',
    );
    expect(
      $r111.$1,
      null,
      reason: '[\\u{0}-\\u{9}]\n\'\\t\'\nresult.\$1 != null',
    );
    final $s88 = State('');
    final $r112 = $r106($s88) as dynamic;
    expect($r112, isNull, reason: '[\\u{0}-\\u{9}]\n\'\'\nresult == null');
    expect(
      $s88.farthestPosition,
      0,
      reason: '[\\u{0}-\\u{9}]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s88.position,
      0,
      reason: '[\\u{0}-\\u{9}]\n\'\'\nstate.position = 0',
    );
    final $e52 = $s88.getErrors().map((e) => '$e').toList()..sort();
    expect($e52.length, 1, reason: '[\\u{0}-\\u{9}]\n\'\'\nerror count');
    expect($e52, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[\\u{0}-\\u{9}]\n\'\'\nerrors');
    final $s89 = State('');
    final $r113 = $r107($s89) as dynamic;
    expect($r113, isNull, reason: '[\\u{0}-\\u{9}]\n\'\'\nresult == null');
    expect(
      $s89.farthestPosition,
      0,
      reason: '[\\u{0}-\\u{9}]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s89.position,
      0,
      reason: '[\\u{0}-\\u{9}]\n\'\'\nstate.position = 0',
    );
    final $e53 = $s89.getErrors().map((e) => '$e').toList()..sort();
    expect($e53.length, 1, reason: '[\\u{0}-\\u{9}]\n\'\'\nerror count');
    expect($e53, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[\\u{0}-\\u{9}]\n\'\'\nerrors');
    final $s90 = State('a');
    final $r114 = $r106($s90) as dynamic;
    expect($r114, isNull, reason: '[\\u{0}-\\u{9}]\n\'a\'\nresult == null');
    expect(
      $s90.farthestPosition,
      0,
      reason: '[\\u{0}-\\u{9}]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(
      $s90.position,
      0,
      reason: '[\\u{0}-\\u{9}]\n\'a\'\nstate.position = 0',
    );
    final $e54 = $s90.getErrors().map((e) => '$e').toList()..sort();
    expect($e54.length, 1, reason: '[\\u{0}-\\u{9}]\n\'a\'\nerror count');
    expect($e54, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[\\u{0}-\\u{9}]\n\'a\'\nerrors');
    final $s91 = State('a');
    final $r115 = $r107($s91) as dynamic;
    expect($r115, isNull, reason: '[\\u{0}-\\u{9}]\n\'a\'\nresult == null');
    expect(
      $s91.farthestPosition,
      0,
      reason: '[\\u{0}-\\u{9}]\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(
      $s91.position,
      0,
      reason: '[\\u{0}-\\u{9}]\n\'a\'\nstate.position = 0',
    );
    final $e55 = $s91.getErrors().map((e) => '$e').toList()..sort();
    expect($e55.length, 1, reason: '[\\u{0}-\\u{9}]\n\'a\'\nerror count');
    expect($e55, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[\\u{0}-\\u{9}]\n\'a\'\nerrors');
    final $r116 = parser.parseCharacterClass12;
    final $r117 = parser.parseCharacterClassVoid12;
    final $s92 = State('a');
    final $r118 = $r116($s92) as dynamic;
    expect($r118, isNotNull, reason: '[^\\u{0}]\n\'a\'\nresult != null');
    expect($s92.position, 1, reason: '[^\\u{0}]\n\'a\'\nstate.position = 1');
    expect($r118.$1, 97, reason: '[^\\u{0}]\n\'a\'\nresult.\$1 != 97');
    final $s93 = State('a');
    final $r119 = $r117($s93) as dynamic;
    expect($r119, isNotNull, reason: '[^\\u{0}]\n\'a\'\nresult != null');
    expect($s93.position, 1, reason: '[^\\u{0}]\n\'a\'\nstate.position = 1');
    expect($r119.$1, null, reason: '[^\\u{0}]\n\'a\'\nresult.\$1 != null');
    final $s94 = State('');
    final $r120 = $r116($s94) as dynamic;
    expect($r120, isNull, reason: '[^\\u{0}]\n\'\'\nresult == null');
    expect(
      $s94.farthestPosition,
      0,
      reason: '[^\\u{0}]\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s94.position, 0, reason: '[^\\u{0}]\n\'\'\nstate.position = 0');
    final $e56 = $s94.getErrors().map((e) => '$e').toList()..sort();
    expect($e56.length, 1, reason: '[^\\u{0}]\n\'\'\nerror count');
    expect($e56, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^\\u{0}]\n\'\'\nerrors');
    final $s95 = State('');
    final $r121 = $r117($s95) as dynamic;
    expect($r121, isNull, reason: '[^\\u{0}]\n\'\'\nresult == null');
    expect(
      $s95.farthestPosition,
      0,
      reason: '[^\\u{0}]\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s95.position, 0, reason: '[^\\u{0}]\n\'\'\nstate.position = 0');
    final $e57 = $s95.getErrors().map((e) => '$e').toList()..sort();
    expect($e57.length, 1, reason: '[^\\u{0}]\n\'\'\nerror count');
    expect($e57, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^\\u{0}]\n\'\'\nerrors');
    final $s96 = State(' ');
    final $r122 = $r116($s96) as dynamic;
    expect($r122, isNull, reason: '[^\\u{0}]\n\' \'\nresult == null');
    expect(
      $s96.farthestPosition,
      0,
      reason: '[^\\u{0}]\n\' \'\nstate.farthestPosition = 0',
    );
    expect($s96.position, 0, reason: '[^\\u{0}]\n\' \'\nstate.position = 0');
    final $e58 = $s96.getErrors().map((e) => '$e').toList()..sort();
    expect($e58.length, 1, reason: '[^\\u{0}]\n\' \'\nerror count');
    expect($e58, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^\\u{0}]\n\' \'\nerrors');
    final $s97 = State(' ');
    final $r123 = $r117($s97) as dynamic;
    expect($r123, isNull, reason: '[^\\u{0}]\n\' \'\nresult == null');
    expect(
      $s97.farthestPosition,
      0,
      reason: '[^\\u{0}]\n\' \'\nstate.farthestPosition = 0',
    );
    expect($s97.position, 0, reason: '[^\\u{0}]\n\' \'\nstate.position = 0');
    final $e59 = $s97.getErrors().map((e) => '$e').toList()..sort();
    expect($e59.length, 1, reason: '[^\\u{0}]\n\' \'\nerror count');
    expect($e59, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^\\u{0}]\n\' \'\nerrors');
    final $r124 = parser.parseCharacterClass13;
    final $r125 = parser.parseCharacterClassVoid13;
    final $s98 = State('a');
    final $r126 = $r124($s98) as dynamic;
    expect($r126, isNotNull, reason: '[^\\u{0}-\\u{9}]\n\'a\'\nresult != null');
    expect(
      $s98.position,
      1,
      reason: '[^\\u{0}-\\u{9}]\n\'a\'\nstate.position = 1',
    );
    expect($r126.$1, 97, reason: '[^\\u{0}-\\u{9}]\n\'a\'\nresult.\$1 != 97');
    final $s99 = State('a');
    final $r127 = $r125($s99) as dynamic;
    expect($r127, isNotNull, reason: '[^\\u{0}-\\u{9}]\n\'a\'\nresult != null');
    expect(
      $s99.position,
      1,
      reason: '[^\\u{0}-\\u{9}]\n\'a\'\nstate.position = 1',
    );
    expect(
      $r127.$1,
      null,
      reason: '[^\\u{0}-\\u{9}]\n\'a\'\nresult.\$1 != null',
    );
    final $s100 = State('');
    final $r128 = $r124($s100) as dynamic;
    expect($r128, isNull, reason: '[^\\u{0}-\\u{9}]\n\'\'\nresult == null');
    expect(
      $s100.farthestPosition,
      0,
      reason: '[^\\u{0}-\\u{9}]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s100.position,
      0,
      reason: '[^\\u{0}-\\u{9}]\n\'\'\nstate.position = 0',
    );
    final $e60 = $s100.getErrors().map((e) => '$e').toList()..sort();
    expect($e60.length, 1, reason: '[^\\u{0}-\\u{9}]\n\'\'\nerror count');
    expect($e60, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^\\u{0}-\\u{9}]\n\'\'\nerrors');
    final $s101 = State('');
    final $r129 = $r125($s101) as dynamic;
    expect($r129, isNull, reason: '[^\\u{0}-\\u{9}]\n\'\'\nresult == null');
    expect(
      $s101.farthestPosition,
      0,
      reason: '[^\\u{0}-\\u{9}]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s101.position,
      0,
      reason: '[^\\u{0}-\\u{9}]\n\'\'\nstate.position = 0',
    );
    final $e61 = $s101.getErrors().map((e) => '$e').toList()..sort();
    expect($e61.length, 1, reason: '[^\\u{0}-\\u{9}]\n\'\'\nerror count');
    expect($e61, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^\\u{0}-\\u{9}]\n\'\'\nerrors');
    final $s102 = State(' ');
    final $r130 = $r124($s102) as dynamic;
    expect($r130, isNull, reason: '[^\\u{0}-\\u{9}]\n\' \'\nresult == null');
    expect(
      $s102.farthestPosition,
      0,
      reason: '[^\\u{0}-\\u{9}]\n\' \'\nstate.farthestPosition = 0',
    );
    expect(
      $s102.position,
      0,
      reason: '[^\\u{0}-\\u{9}]\n\' \'\nstate.position = 0',
    );
    final $e62 = $s102.getErrors().map((e) => '$e').toList()..sort();
    expect($e62.length, 1, reason: '[^\\u{0}-\\u{9}]\n\' \'\nerror count');
    expect($e62, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^\\u{0}-\\u{9}]\n\' \'\nerrors');
    final $s103 = State(' ');
    final $r131 = $r125($s103) as dynamic;
    expect($r131, isNull, reason: '[^\\u{0}-\\u{9}]\n\' \'\nresult == null');
    expect(
      $s103.farthestPosition,
      0,
      reason: '[^\\u{0}-\\u{9}]\n\' \'\nstate.farthestPosition = 0',
    );
    expect(
      $s103.position,
      0,
      reason: '[^\\u{0}-\\u{9}]\n\' \'\nstate.position = 0',
    );
    final $e63 = $s103.getErrors().map((e) => '$e').toList()..sort();
    expect($e63.length, 1, reason: '[^\\u{0}-\\u{9}]\n\' \'\nerror count');
    expect($e63, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^\\u{0}-\\u{9}]\n\' \'\nerrors');
    final $s104 = State('\t');
    final $r132 = $r124($s104) as dynamic;
    expect($r132, isNull, reason: '[^\\u{0}-\\u{9}]\n\'\\t\'\nresult == null');
    expect(
      $s104.farthestPosition,
      0,
      reason: '[^\\u{0}-\\u{9}]\n\'\\t\'\nstate.farthestPosition = 0',
    );
    expect(
      $s104.position,
      0,
      reason: '[^\\u{0}-\\u{9}]\n\'\\t\'\nstate.position = 0',
    );
    final $e64 = $s104.getErrors().map((e) => '$e').toList()..sort();
    expect($e64.length, 1, reason: '[^\\u{0}-\\u{9}]\n\'\\t\'\nerror count');
    expect($e64, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^\\u{0}-\\u{9}]\n\'\\t\'\nerrors');
    final $s105 = State('\t');
    final $r133 = $r125($s105) as dynamic;
    expect($r133, isNull, reason: '[^\\u{0}-\\u{9}]\n\'\\t\'\nresult == null');
    expect(
      $s105.farthestPosition,
      0,
      reason: '[^\\u{0}-\\u{9}]\n\'\\t\'\nstate.farthestPosition = 0',
    );
    expect(
      $s105.position,
      0,
      reason: '[^\\u{0}-\\u{9}]\n\'\\t\'\nstate.position = 0',
    );
    final $e65 = $s105.getErrors().map((e) => '$e').toList()..sort();
    expect($e65.length, 1, reason: '[^\\u{0}-\\u{9}]\n\'\\t\'\nerror count');
    expect($e65, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[^\\u{0}-\\u{9}]\n\'\\t\'\nerrors');
  });

  test('Group', () {
    final $r = parser.parseGroup0;
    final $r1 = parser.parseGroupVoid0;
    final $s = State('a');
    final $r2 = $r($s) as dynamic;
    expect($r2, isNotNull, reason: '([a] / [z])\n\'a\'\nresult != null');
    expect($s.position, 1, reason: '([a] / [z])\n\'a\'\nstate.position = 1');
    expect($r2.$1, 97, reason: '([a] / [z])\n\'a\'\nresult.\$1 != 97');
    final $s1 = State('a');
    final $r3 = $r1($s1) as dynamic;
    expect($r3, isNotNull, reason: '([a] / [z])\n\'a\'\nresult != null');
    expect($s1.position, 1, reason: '([a] / [z])\n\'a\'\nstate.position = 1');
    expect($r3.$1, null, reason: '([a] / [z])\n\'a\'\nresult.\$1 != null');
    final $s2 = State('z');
    final $r4 = $r($s2) as dynamic;
    expect($r4, isNotNull, reason: '([a] / [z])\n\'z\'\nresult != null');
    expect($s2.position, 1, reason: '([a] / [z])\n\'z\'\nstate.position = 1');
    expect($r4.$1, 122, reason: '([a] / [z])\n\'z\'\nresult.\$1 != 122');
    final $s3 = State('z');
    final $r5 = $r1($s3) as dynamic;
    expect($r5, isNotNull, reason: '([a] / [z])\n\'z\'\nresult != null');
    expect($s3.position, 1, reason: '([a] / [z])\n\'z\'\nstate.position = 1');
    expect($r5.$1, null, reason: '([a] / [z])\n\'z\'\nresult.\$1 != null');
    final $s4 = State('');
    final $r6 = $r($s4) as dynamic;
    expect($r6, isNull, reason: '([a] / [z])\n\'\'\nresult == null');
    expect(
      $s4.farthestPosition,
      0,
      reason: '([a] / [z])\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s4.position, 0, reason: '([a] / [z])\n\'\'\nstate.position = 0');
    final $e = $s4.getErrors().map((e) => '$e').toList()..sort();
    expect($e.length, 1, reason: '([a] / [z])\n\'\'\nerror count');
    expect($e, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '([a] / [z])\n\'\'\nerrors');
    final $s5 = State('');
    final $r7 = $r1($s5) as dynamic;
    expect($r7, isNull, reason: '([a] / [z])\n\'\'\nresult == null');
    expect(
      $s5.farthestPosition,
      0,
      reason: '([a] / [z])\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s5.position, 0, reason: '([a] / [z])\n\'\'\nstate.position = 0');
    final $e1 = $s5.getErrors().map((e) => '$e').toList()..sort();
    expect($e1.length, 1, reason: '([a] / [z])\n\'\'\nerror count');
    expect($e1, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '([a] / [z])\n\'\'\nerrors');
    final $s6 = State('b');
    final $r8 = $r($s6) as dynamic;
    expect($r8, isNull, reason: '([a] / [z])\n\'b\'\nresult == null');
    expect(
      $s6.farthestPosition,
      0,
      reason: '([a] / [z])\n\'b\'\nstate.farthestPosition = 0',
    );
    expect($s6.position, 0, reason: '([a] / [z])\n\'b\'\nstate.position = 0');
    final $e2 = $s6.getErrors().map((e) => '$e').toList()..sort();
    expect($e2.length, 1, reason: '([a] / [z])\n\'b\'\nerror count');
    expect($e2, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '([a] / [z])\n\'b\'\nerrors');
    final $s7 = State('b');
    final $r9 = $r1($s7) as dynamic;
    expect($r9, isNull, reason: '([a] / [z])\n\'b\'\nresult == null');
    expect(
      $s7.farthestPosition,
      0,
      reason: '([a] / [z])\n\'b\'\nstate.farthestPosition = 0',
    );
    expect($s7.position, 0, reason: '([a] / [z])\n\'b\'\nstate.position = 0');
    final $e3 = $s7.getErrors().map((e) => '$e').toList()..sort();
    expect($e3.length, 1, reason: '([a] / [z])\n\'b\'\nerror count');
    expect($e3, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '([a] / [z])\n\'b\'\nerrors');
  });

  test('Literal', () {
    final $r = parser.parseLiteral0;
    final $r1 = parser.parseLiteralVoid0;
    final $s = State('abc');
    final $r2 = $r($s) as dynamic;
    expect($r2, isNotNull, reason: '\'abc\'\n\'abc\'\nresult != null');
    expect($s.position, 3, reason: '\'abc\'\n\'abc\'\nstate.position = 3');
    expect($r2.$1, 'abc', reason: '\'abc\'\n\'abc\'\nresult.\$1 != \'abc\'');
    final $s1 = State('abc');
    final $r3 = $r1($s1) as dynamic;
    expect($r3, isNotNull, reason: '\'abc\'\n\'abc\'\nresult != null');
    expect($s1.position, 3, reason: '\'abc\'\n\'abc\'\nstate.position = 3');
    expect($r3.$1, null, reason: '\'abc\'\n\'abc\'\nresult.\$1 != null');
    final $s2 = State('');
    final $r4 = $r($s2) as dynamic;
    expect($r4, isNull, reason: '\'abc\'\n\'\'\nresult == null');
    expect(
      $s2.farthestPosition,
      0,
      reason: '\'abc\'\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s2.position, 0, reason: '\'abc\'\n\'\'\nstate.position = 0');
    final $e = $s2.getErrors().map((e) => '$e').toList()..sort();
    expect($e.length, 1, reason: '\'abc\'\n\'\'\nerror count');
    expect($e, [
      '(end: 0, message: Expected: \'abc\', start: 0)',
    ], reason: '\'abc\'\n\'\'\nerrors');
    final $s3 = State('');
    final $r5 = $r1($s3) as dynamic;
    expect($r5, isNull, reason: '\'abc\'\n\'\'\nresult == null');
    expect(
      $s3.farthestPosition,
      0,
      reason: '\'abc\'\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s3.position, 0, reason: '\'abc\'\n\'\'\nstate.position = 0');
    final $e1 = $s3.getErrors().map((e) => '$e').toList()..sort();
    expect($e1.length, 1, reason: '\'abc\'\n\'\'\nerror count');
    expect($e1, [
      '(end: 0, message: Expected: \'abc\', start: 0)',
    ], reason: '\'abc\'\n\'\'\nerrors');
    final $s4 = State('a');
    final $r6 = $r($s4) as dynamic;
    expect($r6, isNull, reason: '\'abc\'\n\'a\'\nresult == null');
    expect(
      $s4.farthestPosition,
      0,
      reason: '\'abc\'\n\'a\'\nstate.farthestPosition = 0',
    );
    expect($s4.position, 0, reason: '\'abc\'\n\'a\'\nstate.position = 0');
    final $e2 = $s4.getErrors().map((e) => '$e').toList()..sort();
    expect($e2.length, 1, reason: '\'abc\'\n\'a\'\nerror count');
    expect($e2, [
      '(end: 0, message: Expected: \'abc\', start: 0)',
    ], reason: '\'abc\'\n\'a\'\nerrors');
    final $s5 = State('a');
    final $r7 = $r1($s5) as dynamic;
    expect($r7, isNull, reason: '\'abc\'\n\'a\'\nresult == null');
    expect(
      $s5.farthestPosition,
      0,
      reason: '\'abc\'\n\'a\'\nstate.farthestPosition = 0',
    );
    expect($s5.position, 0, reason: '\'abc\'\n\'a\'\nstate.position = 0');
    final $e3 = $s5.getErrors().map((e) => '$e').toList()..sort();
    expect($e3.length, 1, reason: '\'abc\'\n\'a\'\nerror count');
    expect($e3, [
      '(end: 0, message: Expected: \'abc\', start: 0)',
    ], reason: '\'abc\'\n\'a\'\nerrors');
    final $r8 = parser.parseLiteral1;
    final $r9 = parser.parseLiteralVoid1;
    final $s6 = State('abc');
    final $r10 = $r8($s6) as dynamic;
    expect($r10, isNotNull, reason: '"abc"\n\'abc\'\nresult != null');
    expect($s6.position, 3, reason: '"abc"\n\'abc\'\nstate.position = 3');
    expect($r10.$1, 'abc', reason: '"abc"\n\'abc\'\nresult.\$1 != \'abc\'');
    final $s7 = State('abc');
    final $r11 = $r9($s7) as dynamic;
    expect($r11, isNotNull, reason: '"abc"\n\'abc\'\nresult != null');
    expect($s7.position, 3, reason: '"abc"\n\'abc\'\nstate.position = 3');
    expect($r11.$1, null, reason: '"abc"\n\'abc\'\nresult.\$1 != null');
    final $s8 = State('');
    final $r12 = $r8($s8) as dynamic;
    expect($r12, isNull, reason: '"abc"\n\'\'\nresult == null');
    expect(
      $s8.farthestPosition,
      0,
      reason: '"abc"\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s8.position, 0, reason: '"abc"\n\'\'\nstate.position = 0');
    final $e4 = $s8.getErrors().map((e) => '$e').toList()..sort();
    expect($e4.length, 1, reason: '"abc"\n\'\'\nerror count');
    expect($e4, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '"abc"\n\'\'\nerrors');
    final $s9 = State('');
    final $r13 = $r9($s9) as dynamic;
    expect($r13, isNull, reason: '"abc"\n\'\'\nresult == null');
    expect(
      $s9.farthestPosition,
      0,
      reason: '"abc"\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s9.position, 0, reason: '"abc"\n\'\'\nstate.position = 0');
    final $e5 = $s9.getErrors().map((e) => '$e').toList()..sort();
    expect($e5.length, 1, reason: '"abc"\n\'\'\nerror count');
    expect($e5, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '"abc"\n\'\'\nerrors');
    final $s10 = State('a');
    final $r14 = $r8($s10) as dynamic;
    expect($r14, isNull, reason: '"abc"\n\'a\'\nresult == null');
    expect(
      $s10.farthestPosition,
      0,
      reason: '"abc"\n\'a\'\nstate.farthestPosition = 0',
    );
    expect($s10.position, 0, reason: '"abc"\n\'a\'\nstate.position = 0');
    final $e6 = $s10.getErrors().map((e) => '$e').toList()..sort();
    expect($e6.length, 1, reason: '"abc"\n\'a\'\nerror count');
    expect($e6, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '"abc"\n\'a\'\nerrors');
    final $s11 = State('a');
    final $r15 = $r9($s11) as dynamic;
    expect($r15, isNull, reason: '"abc"\n\'a\'\nresult == null');
    expect(
      $s11.farthestPosition,
      0,
      reason: '"abc"\n\'a\'\nstate.farthestPosition = 0',
    );
    expect($s11.position, 0, reason: '"abc"\n\'a\'\nstate.position = 0');
    final $e7 = $s11.getErrors().map((e) => '$e').toList()..sort();
    expect($e7.length, 1, reason: '"abc"\n\'a\'\nerror count');
    expect($e7, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '"abc"\n\'a\'\nerrors');
    final $r16 = parser.parseLiteral2;
    final $r17 = parser.parseLiteralVoid2;
    final $s12 = State('');
    final $r18 = $r16($s12) as dynamic;
    expect($r18, isNotNull, reason: '""\n\'\'\nresult != null');
    expect($s12.position, 0, reason: '""\n\'\'\nstate.position = 0');
    expect($r18.$1, '', reason: '""\n\'\'\nresult.\$1 != \'\'');
    final $s13 = State('');
    final $r19 = $r17($s13) as dynamic;
    expect($r19, isNotNull, reason: '""\n\'\'\nresult != null');
    expect($s13.position, 0, reason: '""\n\'\'\nstate.position = 0');
    expect($r19.$1, null, reason: '""\n\'\'\nresult.\$1 != null');
    final $s14 = State('a');
    final $r20 = $r16($s14) as dynamic;
    expect($r20, isNotNull, reason: '""\n\'a\'\nresult != null');
    expect($s14.position, 0, reason: '""\n\'a\'\nstate.position = 0');
    expect($r20.$1, '', reason: '""\n\'a\'\nresult.\$1 != \'\'');
    final $s15 = State('a');
    final $r21 = $r17($s15) as dynamic;
    expect($r21, isNotNull, reason: '""\n\'a\'\nresult != null');
    expect($s15.position, 0, reason: '""\n\'a\'\nstate.position = 0');
    expect($r21.$1, null, reason: '""\n\'a\'\nresult.\$1 != null');
    final $r22 = parser.parseLiteral3;
    final $r23 = parser.parseLiteralVoid3;
    final $s16 = State('');
    final $r24 = $r22($s16) as dynamic;
    expect($r24, isNotNull, reason: '\'\'\n\'\'\nresult != null');
    expect($s16.position, 0, reason: '\'\'\n\'\'\nstate.position = 0');
    expect($r24.$1, '', reason: '\'\'\n\'\'\nresult.\$1 != \'\'');
    final $s17 = State('');
    final $r25 = $r23($s17) as dynamic;
    expect($r25, isNotNull, reason: '\'\'\n\'\'\nresult != null');
    expect($s17.position, 0, reason: '\'\'\n\'\'\nstate.position = 0');
    expect($r25.$1, null, reason: '\'\'\n\'\'\nresult.\$1 != null');
    final $s18 = State('a');
    final $r26 = $r22($s18) as dynamic;
    expect($r26, isNotNull, reason: '\'\'\n\'a\'\nresult != null');
    expect($s18.position, 0, reason: '\'\'\n\'a\'\nstate.position = 0');
    expect($r26.$1, '', reason: '\'\'\n\'a\'\nresult.\$1 != \'\'');
    final $s19 = State('a');
    final $r27 = $r23($s19) as dynamic;
    expect($r27, isNotNull, reason: '\'\'\n\'a\'\nresult != null');
    expect($s19.position, 0, reason: '\'\'\n\'a\'\nstate.position = 0');
    expect($r27.$1, null, reason: '\'\'\n\'a\'\nresult.\$1 != null');
    final $r28 = parser.parseLiteral4;
    final $r29 = parser.parseLiteralVoid4;
    final $s20 = State('\r\n');
    final $r30 = $r28($s20) as dynamic;
    expect($r30, isNotNull, reason: '"\\r\\n"\n\'\\r\\n\'\nresult != null');
    expect(
      $s20.position,
      2,
      reason: '"\\r\\n"\n\'\\r\\n\'\nstate.position = 2',
    );
    expect(
      $r30.$1,
      '\r\n',
      reason: '"\\r\\n"\n\'\\r\\n\'\nresult.\$1 != \'\\r\\n\'',
    );
    final $s21 = State('\r\n');
    final $r31 = $r29($s21) as dynamic;
    expect($r31, isNotNull, reason: '"\\r\\n"\n\'\\r\\n\'\nresult != null');
    expect(
      $s21.position,
      2,
      reason: '"\\r\\n"\n\'\\r\\n\'\nstate.position = 2',
    );
    expect($r31.$1, null, reason: '"\\r\\n"\n\'\\r\\n\'\nresult.\$1 != null');
    final $s22 = State('\r');
    final $r32 = $r28($s22) as dynamic;
    expect($r32, isNull, reason: '"\\r\\n"\n\'\\r\'\nresult == null');
    expect(
      $s22.farthestPosition,
      0,
      reason: '"\\r\\n"\n\'\\r\'\nstate.farthestPosition = 0',
    );
    expect($s22.position, 0, reason: '"\\r\\n"\n\'\\r\'\nstate.position = 0');
    final $e8 = $s22.getErrors().map((e) => '$e').toList()..sort();
    expect($e8.length, 1, reason: '"\\r\\n"\n\'\\r\'\nerror count');
    expect($e8, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '"\\r\\n"\n\'\\r\'\nerrors');
    final $s23 = State('\r');
    final $r33 = $r29($s23) as dynamic;
    expect($r33, isNull, reason: '"\\r\\n"\n\'\\r\'\nresult == null');
    expect(
      $s23.farthestPosition,
      0,
      reason: '"\\r\\n"\n\'\\r\'\nstate.farthestPosition = 0',
    );
    expect($s23.position, 0, reason: '"\\r\\n"\n\'\\r\'\nstate.position = 0');
    final $e9 = $s23.getErrors().map((e) => '$e').toList()..sort();
    expect($e9.length, 1, reason: '"\\r\\n"\n\'\\r\'\nerror count');
    expect($e9, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '"\\r\\n"\n\'\\r\'\nerrors');
  });

  test('NotPredicate', () {
    final $r = parser.parseNotPredicate0;
    final $r1 = parser.parseNotPredicateVoid0;
    final $s = State('ab');
    final $r2 = $r($s) as dynamic;
    expect(
      $r2,
      isNotNull,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'ab\'\nresult != null',
    );
    expect(
      $s.position,
      2,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'ab\'\nstate.position = 2',
    );
    expect(
      $r2.$1,
      'ab',
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'ab\'\nresult.\$1 != \'ab\'',
    );
    final $s1 = State('ab');
    final $r3 = $r1($s1) as dynamic;
    expect(
      $r3,
      isNotNull,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'ab\'\nresult != null',
    );
    expect(
      $s1.position,
      2,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'ab\'\nstate.position = 2',
    );
    expect(
      $r3.$1,
      null,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'ab\'\nresult.\$1 != null',
    );
    final $s2 = State('abc');
    final $r4 = $r($s2) as dynamic;
    expect(
      $r4,
      isNull,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'abc\'\nresult == null',
    );
    expect(
      $s2.farthestPosition,
      0,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'abc\'\nstate.farthestPosition = 0',
    );
    expect(
      $s2.position,
      0,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'abc\'\nstate.position = 0',
    );
    final $e = $s2.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e.length,
      1,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'abc\'\nerror count',
    );
    expect($e, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '! \'abc\'\n\$ = \'ab\'\n\n\'abc\'\nerrors');
    final $s3 = State('abc');
    final $r5 = $r1($s3) as dynamic;
    expect(
      $r5,
      isNull,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'abc\'\nresult == null',
    );
    expect(
      $s3.farthestPosition,
      0,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'abc\'\nstate.farthestPosition = 0',
    );
    expect(
      $s3.position,
      0,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'abc\'\nstate.position = 0',
    );
    final $e1 = $s3.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e1.length,
      1,
      reason: '! \'abc\'\n\$ = \'ab\'\n\n\'abc\'\nerror count',
    );
    expect($e1, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '! \'abc\'\n\$ = \'ab\'\n\n\'abc\'\nerrors');
    final $r6 = parser.parseNotPredicate1;
    final $r7 = parser.parseNotPredicateVoid1;
    final $s4 = State('abc');
    final $r8 = $r6($s4) as dynamic;
    expect(
      $r8,
      isNotNull,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc\'\nresult != null',
    );
    expect(
      $s4.position,
      3,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc\'\nstate.position = 3',
    );
    expect(
      $r8.$1,
      'abc',
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc\'\nresult.\$1 != \'abc\'',
    );
    final $s5 = State('abc');
    final $r9 = $r7($s5) as dynamic;
    expect(
      $r9,
      isNotNull,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc\'\nresult != null',
    );
    expect(
      $s5.position,
      3,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc\'\nstate.position = 3',
    );
    expect(
      $r9.$1,
      null,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc\'\nresult.\$1 != null',
    );
    final $s6 = State('abc=>');
    final $r10 = $r6($s6) as dynamic;
    expect(
      $r10,
      isNull,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc=>\'\nresult == null',
    );
    expect(
      $s6.farthestPosition,
      3,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc=>\'\nstate.farthestPosition = 3',
    );
    expect(
      $s6.position,
      0,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc=>\'\nstate.position = 0',
    );
    final $e2 = $s6.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e2.length,
      1,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc=>\'\nerror count',
    );
    expect($e2, [
      '(end: 3, message: Unexpected input data, start: 3)',
    ], reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc=>\'\nerrors');
    final $s7 = State('abc=>');
    final $r11 = $r7($s7) as dynamic;
    expect(
      $r11,
      isNull,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc=>\'\nresult == null',
    );
    expect(
      $s7.farthestPosition,
      3,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc=>\'\nstate.farthestPosition = 3',
    );
    expect(
      $s7.position,
      0,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc=>\'\nstate.position = 0',
    );
    final $e3 = $s7.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e3.length,
      1,
      reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc=>\'\nerror count',
    );
    expect($e3, [
      '(end: 3, message: Unexpected input data, start: 3)',
    ], reason: '\$ = \'abc\'\n! \'=>\'\n\n\'abc=>\'\nerrors');
    final $r12 = parser.parseNotPredicate2;
    final $r13 = parser.parseNotPredicateVoid2;
    final $s8 = State('');
    final $r14 = $r12($s8) as dynamic;
    expect(
      $r14,
      isNotNull,
      reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'\'\nresult != null',
    );
    expect(
      $s8.position,
      0,
      reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'\'\nstate.position = 0',
    );
    expect(
      $r14.$1,
      <int>[],
      reason:
          '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'\'\nresult.\$1 != <int>[]',
    );
    final $s9 = State('');
    final $r15 = $r13($s9) as dynamic;
    expect(
      $r15,
      isNotNull,
      reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'\'\nresult != null',
    );
    expect(
      $s9.position,
      0,
      reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'\'\nstate.position = 0',
    );
    expect(
      $r15.$1,
      null,
      reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'\'\nresult.\$1 != null',
    );
    final $s10 = State('a');
    final $r16 = $r12($s10) as dynamic;
    expect(
      $r16,
      isNotNull,
      reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'a\'\nresult != null',
    );
    expect(
      $s10.position,
      1,
      reason:
          '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'a\'\nstate.position = 1',
    );
    expect(
      $r16.$1,
      [97],
      reason:
          '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'a\'\nresult.\$1 != [97]',
    );
    final $s11 = State('a');
    final $r17 = $r13($s11) as dynamic;
    expect(
      $r17,
      isNotNull,
      reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'a\'\nresult != null',
    );
    expect(
      $s11.position,
      1,
      reason:
          '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'a\'\nstate.position = 1',
    );
    expect(
      $r17.$1,
      null,
      reason:
          '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'a\'\nresult.\$1 != null',
    );
    final $s12 = State('aa');
    final $r18 = $r12($s12) as dynamic;
    expect(
      $r18,
      isNull,
      reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'aa\'\nresult == null',
    );
    expect(
      $s12.farthestPosition,
      0,
      reason:
          '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'aa\'\nstate.farthestPosition = 0',
    );
    expect(
      $s12.position,
      0,
      reason:
          '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'aa\'\nstate.position = 0',
    );
    final $e4 = $s12.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e4.length,
      1,
      reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'aa\'\nerror count',
    );
    expect($e4, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'aa\'\nerrors');
    final $s13 = State('aa');
    final $r19 = $r13($s13) as dynamic;
    expect(
      $r19,
      isNull,
      reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'aa\'\nresult == null',
    );
    expect(
      $s13.farthestPosition,
      0,
      reason:
          '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'aa\'\nstate.farthestPosition = 0',
    );
    expect(
      $s13.position,
      0,
      reason:
          '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'aa\'\nstate.position = 0',
    );
    final $e5 = $s13.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e5.length,
      1,
      reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'aa\'\nerror count',
    );
    expect($e5, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '! @while (2) {\n  [a]\n}\n\$ = [a]*\n\n\'aa\'\nerrors');
    final $r20 = parser.parseNotPredicate3;
    final $s14 = State('a');
    final $r21 = $r20($s14) as dynamic;
    expect($r21, isNull, reason: '!\'\'\n\'a\'\nresult == null');
    expect(
      $s14.farthestPosition,
      0,
      reason: '!\'\'\n\'a\'\nstate.farthestPosition = 0',
    );
    expect($s14.position, 0, reason: '!\'\'\n\'a\'\nstate.position = 0');
    final $e6 = $s14.getErrors().map((e) => '$e').toList()..sort();
    expect($e6.length, 1, reason: '!\'\'\n\'a\'\nerror count');
    expect($e6, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '!\'\'\n\'a\'\nerrors');
    final $s15 = State('');
    final $r22 = $r20($s15) as dynamic;
    expect($r22, isNull, reason: '!\'\'\n\'\'\nresult == null');
    expect(
      $s15.farthestPosition,
      0,
      reason: '!\'\'\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s15.position, 0, reason: '!\'\'\n\'\'\nstate.position = 0');
    final $e7 = $s15.getErrors().map((e) => '$e').toList()..sort();
    expect($e7.length, 1, reason: '!\'\'\n\'\'\nerror count');
    expect($e7, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '!\'\'\n\'\'\nerrors');
    final $r23 = parser.parseNotPredicate4;
    final $s16 = State('a');
    final $r24 = $r23($s16) as dynamic;
    expect($r24, isNull, reason: '![a]?\n\'a\'\nresult == null');
    expect(
      $s16.farthestPosition,
      0,
      reason: '![a]?\n\'a\'\nstate.farthestPosition = 0',
    );
    expect($s16.position, 0, reason: '![a]?\n\'a\'\nstate.position = 0');
    final $e8 = $s16.getErrors().map((e) => '$e').toList()..sort();
    expect($e8.length, 1, reason: '![a]?\n\'a\'\nerror count');
    expect($e8, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '![a]?\n\'a\'\nerrors');
    final $s17 = State('b');
    final $r25 = $r23($s17) as dynamic;
    expect($r25, isNull, reason: '![a]?\n\'b\'\nresult == null');
    expect(
      $s17.farthestPosition,
      0,
      reason: '![a]?\n\'b\'\nstate.farthestPosition = 0',
    );
    expect($s17.position, 0, reason: '![a]?\n\'b\'\nstate.position = 0');
    final $e9 = $s17.getErrors().map((e) => '$e').toList()..sort();
    expect($e9.length, 1, reason: '![a]?\n\'b\'\nerror count');
    expect($e9, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '![a]?\n\'b\'\nerrors');
    final $s18 = State('');
    final $r26 = $r23($s18) as dynamic;
    expect($r26, isNull, reason: '![a]?\n\'\'\nresult == null');
    expect(
      $s18.farthestPosition,
      0,
      reason: '![a]?\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s18.position, 0, reason: '![a]?\n\'\'\nstate.position = 0');
    final $e10 = $s18.getErrors().map((e) => '$e').toList()..sort();
    expect($e10.length, 1, reason: '![a]?\n\'\'\nerror count');
    expect($e10, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '![a]?\n\'\'\nerrors');
    final $r27 = parser.parseNotPredicate5;
    final $s19 = State('a');
    final $r28 = $r27($s19) as dynamic;
    expect($r28, isNull, reason: '!([a] / [z])?\n\'a\'\nresult == null');
    expect(
      $s19.farthestPosition,
      0,
      reason: '!([a] / [z])?\n\'a\'\nstate.farthestPosition = 0',
    );
    expect(
      $s19.position,
      0,
      reason: '!([a] / [z])?\n\'a\'\nstate.position = 0',
    );
    final $e11 = $s19.getErrors().map((e) => '$e').toList()..sort();
    expect($e11.length, 1, reason: '!([a] / [z])?\n\'a\'\nerror count');
    expect($e11, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '!([a] / [z])?\n\'a\'\nerrors');
    final $s20 = State('z');
    final $r29 = $r27($s20) as dynamic;
    expect($r29, isNull, reason: '!([a] / [z])?\n\'z\'\nresult == null');
    expect(
      $s20.farthestPosition,
      0,
      reason: '!([a] / [z])?\n\'z\'\nstate.farthestPosition = 0',
    );
    expect(
      $s20.position,
      0,
      reason: '!([a] / [z])?\n\'z\'\nstate.position = 0',
    );
    final $e12 = $s20.getErrors().map((e) => '$e').toList()..sort();
    expect($e12.length, 1, reason: '!([a] / [z])?\n\'z\'\nerror count');
    expect($e12, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '!([a] / [z])?\n\'z\'\nerrors');
    final $s21 = State('b');
    final $r30 = $r27($s21) as dynamic;
    expect($r30, isNull, reason: '!([a] / [z])?\n\'b\'\nresult == null');
    expect(
      $s21.farthestPosition,
      0,
      reason: '!([a] / [z])?\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      $s21.position,
      0,
      reason: '!([a] / [z])?\n\'b\'\nstate.position = 0',
    );
    final $e13 = $s21.getErrors().map((e) => '$e').toList()..sort();
    expect($e13.length, 1, reason: '!([a] / [z])?\n\'b\'\nerror count');
    expect($e13, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '!([a] / [z])?\n\'b\'\nerrors');
    final $s22 = State('');
    final $r31 = $r27($s22) as dynamic;
    expect($r31, isNull, reason: '!([a] / [z])?\n\'\'\nresult == null');
    expect(
      $s22.farthestPosition,
      0,
      reason: '!([a] / [z])?\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s22.position, 0, reason: '!([a] / [z])?\n\'\'\nstate.position = 0');
    final $e14 = $s22.getErrors().map((e) => '$e').toList()..sort();
    expect($e14.length, 1, reason: '!([a] / [z])?\n\'\'\nerror count');
    expect($e14, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '!([a] / [z])?\n\'\'\nerrors');
  });

  test('OneOrMore', () {
    final $r = parser.parseOneOrMore0;
    final $r1 = parser.parseOneOrMoreVoid0;
    final $s = State('a');
    final $r2 = $r($s) as dynamic;
    expect($r2, isNotNull, reason: '[a]+\n\'a\'\nresult != null');
    expect($s.position, 1, reason: '[a]+\n\'a\'\nstate.position = 1');
    expect($r2.$1, [97], reason: '[a]+\n\'a\'\nresult.\$1 != [97]');
    final $s1 = State('a');
    final $r3 = $r1($s1) as dynamic;
    expect($r3, isNotNull, reason: '[a]+\n\'a\'\nresult != null');
    expect($s1.position, 1, reason: '[a]+\n\'a\'\nstate.position = 1');
    expect($r3.$1, null, reason: '[a]+\n\'a\'\nresult.\$1 != null');
    final $s2 = State('aa');
    final $r4 = $r($s2) as dynamic;
    expect($r4, isNotNull, reason: '[a]+\n\'aa\'\nresult != null');
    expect($s2.position, 2, reason: '[a]+\n\'aa\'\nstate.position = 2');
    expect($r4.$1, [97, 97], reason: '[a]+\n\'aa\'\nresult.\$1 != [97, 97]');
    final $s3 = State('aa');
    final $r5 = $r1($s3) as dynamic;
    expect($r5, isNotNull, reason: '[a]+\n\'aa\'\nresult != null');
    expect($s3.position, 2, reason: '[a]+\n\'aa\'\nstate.position = 2');
    expect($r5.$1, null, reason: '[a]+\n\'aa\'\nresult.\$1 != null');
    final $s4 = State('');
    final $r6 = $r($s4) as dynamic;
    expect($r6, isNull, reason: '[a]+\n\'\'\nresult == null');
    expect(
      $s4.farthestPosition,
      0,
      reason: '[a]+\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s4.position, 0, reason: '[a]+\n\'\'\nstate.position = 0');
    final $e = $s4.getErrors().map((e) => '$e').toList()..sort();
    expect($e.length, 1, reason: '[a]+\n\'\'\nerror count');
    expect($e, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[a]+\n\'\'\nerrors');
    final $s5 = State('');
    final $r7 = $r1($s5) as dynamic;
    expect($r7, isNull, reason: '[a]+\n\'\'\nresult == null');
    expect(
      $s5.farthestPosition,
      0,
      reason: '[a]+\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s5.position, 0, reason: '[a]+\n\'\'\nstate.position = 0');
    final $e1 = $s5.getErrors().map((e) => '$e').toList()..sort();
    expect($e1.length, 1, reason: '[a]+\n\'\'\nerror count');
    expect($e1, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[a]+\n\'\'\nerrors');
    final $s6 = State('b');
    final $r8 = $r($s6) as dynamic;
    expect($r8, isNull, reason: '[a]+\n\'b\'\nresult == null');
    expect(
      $s6.farthestPosition,
      0,
      reason: '[a]+\n\'b\'\nstate.farthestPosition = 0',
    );
    expect($s6.position, 0, reason: '[a]+\n\'b\'\nstate.position = 0');
    final $e2 = $s6.getErrors().map((e) => '$e').toList()..sort();
    expect($e2.length, 1, reason: '[a]+\n\'b\'\nerror count');
    expect($e2, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[a]+\n\'b\'\nerrors');
    final $s7 = State('b');
    final $r9 = $r1($s7) as dynamic;
    expect($r9, isNull, reason: '[a]+\n\'b\'\nresult == null');
    expect(
      $s7.farthestPosition,
      0,
      reason: '[a]+\n\'b\'\nstate.farthestPosition = 0',
    );
    expect($s7.position, 0, reason: '[a]+\n\'b\'\nstate.position = 0');
    final $e3 = $s7.getErrors().map((e) => '$e').toList()..sort();
    expect($e3.length, 1, reason: '[a]+\n\'b\'\nerror count');
    expect($e3, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '[a]+\n\'b\'\nerrors');
    final $r10 = parser.parseOneOrMore1;
    final $r11 = parser.parseOneOrMoreVoid1;
    final $s8 = State('a');
    final $r12 = $r10($s8) as dynamic;
    expect($r12, isNotNull, reason: '([a] / [z])+\n\'a\'\nresult != null');
    expect($s8.position, 1, reason: '([a] / [z])+\n\'a\'\nstate.position = 1');
    expect($r12.$1, [97], reason: '([a] / [z])+\n\'a\'\nresult.\$1 != [97]');
    final $s9 = State('a');
    final $r13 = $r11($s9) as dynamic;
    expect($r13, isNotNull, reason: '([a] / [z])+\n\'a\'\nresult != null');
    expect($s9.position, 1, reason: '([a] / [z])+\n\'a\'\nstate.position = 1');
    expect($r13.$1, null, reason: '([a] / [z])+\n\'a\'\nresult.\$1 != null');
    final $s10 = State('aa');
    final $r14 = $r10($s10) as dynamic;
    expect($r14, isNotNull, reason: '([a] / [z])+\n\'aa\'\nresult != null');
    expect(
      $s10.position,
      2,
      reason: '([a] / [z])+\n\'aa\'\nstate.position = 2',
    );
    expect($r14.$1, [
      97,
      97,
    ], reason: '([a] / [z])+\n\'aa\'\nresult.\$1 != [97, 97]');
    final $s11 = State('aa');
    final $r15 = $r11($s11) as dynamic;
    expect($r15, isNotNull, reason: '([a] / [z])+\n\'aa\'\nresult != null');
    expect(
      $s11.position,
      2,
      reason: '([a] / [z])+\n\'aa\'\nstate.position = 2',
    );
    expect($r15.$1, null, reason: '([a] / [z])+\n\'aa\'\nresult.\$1 != null');
    final $s12 = State('z');
    final $r16 = $r10($s12) as dynamic;
    expect($r16, isNotNull, reason: '([a] / [z])+\n\'z\'\nresult != null');
    expect($s12.position, 1, reason: '([a] / [z])+\n\'z\'\nstate.position = 1');
    expect($r16.$1, [122], reason: '([a] / [z])+\n\'z\'\nresult.\$1 != [122]');
    final $s13 = State('z');
    final $r17 = $r11($s13) as dynamic;
    expect($r17, isNotNull, reason: '([a] / [z])+\n\'z\'\nresult != null');
    expect($s13.position, 1, reason: '([a] / [z])+\n\'z\'\nstate.position = 1');
    expect($r17.$1, null, reason: '([a] / [z])+\n\'z\'\nresult.\$1 != null');
    final $s14 = State('za');
    final $r18 = $r10($s14) as dynamic;
    expect($r18, isNotNull, reason: '([a] / [z])+\n\'za\'\nresult != null');
    expect(
      $s14.position,
      2,
      reason: '([a] / [z])+\n\'za\'\nstate.position = 2',
    );
    expect($r18.$1, [
      122,
      97,
    ], reason: '([a] / [z])+\n\'za\'\nresult.\$1 != [122, 97]');
    final $s15 = State('za');
    final $r19 = $r11($s15) as dynamic;
    expect($r19, isNotNull, reason: '([a] / [z])+\n\'za\'\nresult != null');
    expect(
      $s15.position,
      2,
      reason: '([a] / [z])+\n\'za\'\nstate.position = 2',
    );
    expect($r19.$1, null, reason: '([a] / [z])+\n\'za\'\nresult.\$1 != null');
    final $s16 = State('');
    final $r20 = $r10($s16) as dynamic;
    expect($r20, isNull, reason: '([a] / [z])+\n\'\'\nresult == null');
    expect(
      $s16.farthestPosition,
      0,
      reason: '([a] / [z])+\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s16.position, 0, reason: '([a] / [z])+\n\'\'\nstate.position = 0');
    final $e4 = $s16.getErrors().map((e) => '$e').toList()..sort();
    expect($e4.length, 1, reason: '([a] / [z])+\n\'\'\nerror count');
    expect($e4, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '([a] / [z])+\n\'\'\nerrors');
    final $s17 = State('');
    final $r21 = $r11($s17) as dynamic;
    expect($r21, isNull, reason: '([a] / [z])+\n\'\'\nresult == null');
    expect(
      $s17.farthestPosition,
      0,
      reason: '([a] / [z])+\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s17.position, 0, reason: '([a] / [z])+\n\'\'\nstate.position = 0');
    final $e5 = $s17.getErrors().map((e) => '$e').toList()..sort();
    expect($e5.length, 1, reason: '([a] / [z])+\n\'\'\nerror count');
    expect($e5, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '([a] / [z])+\n\'\'\nerrors');
    final $s18 = State('b');
    final $r22 = $r10($s18) as dynamic;
    expect($r22, isNull, reason: '([a] / [z])+\n\'b\'\nresult == null');
    expect(
      $s18.farthestPosition,
      0,
      reason: '([a] / [z])+\n\'b\'\nstate.farthestPosition = 0',
    );
    expect($s18.position, 0, reason: '([a] / [z])+\n\'b\'\nstate.position = 0');
    final $e6 = $s18.getErrors().map((e) => '$e').toList()..sort();
    expect($e6.length, 1, reason: '([a] / [z])+\n\'b\'\nerror count');
    expect($e6, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '([a] / [z])+\n\'b\'\nerrors');
    final $s19 = State('b');
    final $r23 = $r11($s19) as dynamic;
    expect($r23, isNull, reason: '([a] / [z])+\n\'b\'\nresult == null');
    expect(
      $s19.farthestPosition,
      0,
      reason: '([a] / [z])+\n\'b\'\nstate.farthestPosition = 0',
    );
    expect($s19.position, 0, reason: '([a] / [z])+\n\'b\'\nstate.position = 0');
    final $e7 = $s19.getErrors().map((e) => '$e').toList()..sort();
    expect($e7.length, 1, reason: '([a] / [z])+\n\'b\'\nerror count');
    expect($e7, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '([a] / [z])+\n\'b\'\nerrors');
  });

  test('Optional', () {
    final $r = parser.parseOptional0;
    final $r1 = parser.parseOptionalVoid0;
    final $s = State('a');
    final $r2 = $r($s) as dynamic;
    expect($r2, isNotNull, reason: '[a]?\n\'a\'\nresult != null');
    expect($s.position, 1, reason: '[a]?\n\'a\'\nstate.position = 1');
    expect($r2.$1, 97, reason: '[a]?\n\'a\'\nresult.\$1 != 97');
    final $s1 = State('a');
    final $r3 = $r1($s1) as dynamic;
    expect($r3, isNotNull, reason: '[a]?\n\'a\'\nresult != null');
    expect($s1.position, 1, reason: '[a]?\n\'a\'\nstate.position = 1');
    expect($r3.$1, null, reason: '[a]?\n\'a\'\nresult.\$1 != null');
    final $s2 = State('');
    final $r4 = $r($s2) as dynamic;
    expect($r4, isNotNull, reason: '[a]?\n\'\'\nresult != null');
    expect($s2.position, 0, reason: '[a]?\n\'\'\nstate.position = 0');
    expect($r4.$1, null, reason: '[a]?\n\'\'\nresult.\$1 != null');
    final $s3 = State('');
    final $r5 = $r1($s3) as dynamic;
    expect($r5, isNotNull, reason: '[a]?\n\'\'\nresult != null');
    expect($s3.position, 0, reason: '[a]?\n\'\'\nstate.position = 0');
    expect($r5.$1, null, reason: '[a]?\n\'\'\nresult.\$1 != null');
    final $r6 = parser.parseOptional1;
    final $r7 = parser.parseOptionalVoid1;
    final $s4 = State('a');
    final $r8 = $r6($s4) as dynamic;
    expect($r8, isNotNull, reason: '([a] / [b])?\n\'a\'\nresult != null');
    expect($s4.position, 1, reason: '([a] / [b])?\n\'a\'\nstate.position = 1');
    expect($r8.$1, 97, reason: '([a] / [b])?\n\'a\'\nresult.\$1 != 97');
    final $s5 = State('a');
    final $r9 = $r7($s5) as dynamic;
    expect($r9, isNotNull, reason: '([a] / [b])?\n\'a\'\nresult != null');
    expect($s5.position, 1, reason: '([a] / [b])?\n\'a\'\nstate.position = 1');
    expect($r9.$1, null, reason: '([a] / [b])?\n\'a\'\nresult.\$1 != null');
    final $s6 = State('b');
    final $r10 = $r6($s6) as dynamic;
    expect($r10, isNotNull, reason: '([a] / [b])?\n\'b\'\nresult != null');
    expect($s6.position, 1, reason: '([a] / [b])?\n\'b\'\nstate.position = 1');
    expect($r10.$1, 98, reason: '([a] / [b])?\n\'b\'\nresult.\$1 != 98');
    final $s7 = State('b');
    final $r11 = $r7($s7) as dynamic;
    expect($r11, isNotNull, reason: '([a] / [b])?\n\'b\'\nresult != null');
    expect($s7.position, 1, reason: '([a] / [b])?\n\'b\'\nstate.position = 1');
    expect($r11.$1, null, reason: '([a] / [b])?\n\'b\'\nresult.\$1 != null');
    final $s8 = State('');
    final $r12 = $r6($s8) as dynamic;
    expect($r12, isNotNull, reason: '([a] / [b])?\n\'\'\nresult != null');
    expect($s8.position, 0, reason: '([a] / [b])?\n\'\'\nstate.position = 0');
    expect($r12.$1, null, reason: '([a] / [b])?\n\'\'\nresult.\$1 != null');
    final $s9 = State('');
    final $r13 = $r7($s9) as dynamic;
    expect($r13, isNotNull, reason: '([a] / [b])?\n\'\'\nresult != null');
    expect($s9.position, 0, reason: '([a] / [b])?\n\'\'\nstate.position = 0');
    expect($r13.$1, null, reason: '([a] / [b])?\n\'\'\nresult.\$1 != null');
    final $r14 = parser.parseOptional2;
    final $r15 = parser.parseOptionalVoid2;
    final $s10 = State('ab');
    final $r16 = $r14($s10) as dynamic;
    expect($r16, isNotNull, reason: '([a] \$ = [b])?\n\'ab\'\nresult != null');
    expect(
      $s10.position,
      2,
      reason: '([a] \$ = [b])?\n\'ab\'\nstate.position = 2',
    );
    expect($r16.$1, 98, reason: '([a] \$ = [b])?\n\'ab\'\nresult.\$1 != 98');
    final $s11 = State('ab');
    final $r17 = $r15($s11) as dynamic;
    expect($r17, isNotNull, reason: '([a] \$ = [b])?\n\'ab\'\nresult != null');
    expect(
      $s11.position,
      2,
      reason: '([a] \$ = [b])?\n\'ab\'\nstate.position = 2',
    );
    expect(
      $r17.$1,
      null,
      reason: '([a] \$ = [b])?\n\'ab\'\nresult.\$1 != null',
    );
    final $s12 = State('');
    final $r18 = $r14($s12) as dynamic;
    expect($r18, isNotNull, reason: '([a] \$ = [b])?\n\'\'\nresult != null');
    expect(
      $s12.position,
      0,
      reason: '([a] \$ = [b])?\n\'\'\nstate.position = 0',
    );
    expect($r18.$1, null, reason: '([a] \$ = [b])?\n\'\'\nresult.\$1 != null');
    final $s13 = State('');
    final $r19 = $r15($s13) as dynamic;
    expect($r19, isNotNull, reason: '([a] \$ = [b])?\n\'\'\nresult != null');
    expect(
      $s13.position,
      0,
      reason: '([a] \$ = [b])?\n\'\'\nstate.position = 0',
    );
    expect($r19.$1, null, reason: '([a] \$ = [b])?\n\'\'\nresult.\$1 != null');
    final $s14 = State('a');
    final $r20 = $r14($s14) as dynamic;
    expect($r20, isNotNull, reason: '([a] \$ = [b])?\n\'a\'\nresult != null');
    expect(
      $s14.position,
      0,
      reason: '([a] \$ = [b])?\n\'a\'\nstate.position = 0',
    );
    expect($r20.$1, null, reason: '([a] \$ = [b])?\n\'a\'\nresult.\$1 != null');
    final $s15 = State('a');
    final $r21 = $r15($s15) as dynamic;
    expect($r21, isNotNull, reason: '([a] \$ = [b])?\n\'a\'\nresult != null');
    expect(
      $s15.position,
      0,
      reason: '([a] \$ = [b])?\n\'a\'\nstate.position = 0',
    );
    expect($r21.$1, null, reason: '([a] \$ = [b])?\n\'a\'\nresult.\$1 != null');
    final $r22 = parser.parseOptional3;
    final $r23 = parser.parseOptionalVoid3;
    final $s16 = State('ab');
    final $r24 = $r22($s16) as dynamic;
    expect($r24, isNotNull, reason: '(\$ = [a] [b])?\n\'ab\'\nresult != null');
    expect(
      $s16.position,
      2,
      reason: '(\$ = [a] [b])?\n\'ab\'\nstate.position = 2',
    );
    expect($r24.$1, 97, reason: '(\$ = [a] [b])?\n\'ab\'\nresult.\$1 != 97');
    final $s17 = State('ab');
    final $r25 = $r23($s17) as dynamic;
    expect($r25, isNotNull, reason: '(\$ = [a] [b])?\n\'ab\'\nresult != null');
    expect(
      $s17.position,
      2,
      reason: '(\$ = [a] [b])?\n\'ab\'\nstate.position = 2',
    );
    expect(
      $r25.$1,
      null,
      reason: '(\$ = [a] [b])?\n\'ab\'\nresult.\$1 != null',
    );
    final $s18 = State('');
    final $r26 = $r22($s18) as dynamic;
    expect($r26, isNotNull, reason: '(\$ = [a] [b])?\n\'\'\nresult != null');
    expect(
      $s18.position,
      0,
      reason: '(\$ = [a] [b])?\n\'\'\nstate.position = 0',
    );
    expect($r26.$1, null, reason: '(\$ = [a] [b])?\n\'\'\nresult.\$1 != null');
    final $s19 = State('');
    final $r27 = $r23($s19) as dynamic;
    expect($r27, isNotNull, reason: '(\$ = [a] [b])?\n\'\'\nresult != null');
    expect(
      $s19.position,
      0,
      reason: '(\$ = [a] [b])?\n\'\'\nstate.position = 0',
    );
    expect($r27.$1, null, reason: '(\$ = [a] [b])?\n\'\'\nresult.\$1 != null');
    final $s20 = State('a');
    final $r28 = $r22($s20) as dynamic;
    expect($r28, isNotNull, reason: '(\$ = [a] [b])?\n\'a\'\nresult != null');
    expect(
      $s20.position,
      0,
      reason: '(\$ = [a] [b])?\n\'a\'\nstate.position = 0',
    );
    expect($r28.$1, null, reason: '(\$ = [a] [b])?\n\'a\'\nresult.\$1 != null');
    final $s21 = State('a');
    final $r29 = $r23($s21) as dynamic;
    expect($r29, isNotNull, reason: '(\$ = [a] [b])?\n\'a\'\nresult != null');
    expect(
      $s21.position,
      0,
      reason: '(\$ = [a] [b])?\n\'a\'\nstate.position = 0',
    );
    expect($r29.$1, null, reason: '(\$ = [a] [b])?\n\'a\'\nresult.\$1 != null');
    final $r30 = parser.parseOptional4;
    final $r31 = parser.parseOptionalVoid4;
    final $s22 = State('ac');
    final $r32 = $r30($s22) as dynamic;
    expect(
      $r32,
      isNotNull,
      reason: '([a] / [b])?\n\$ = [c]\n\'ac\'\nresult != null',
    );
    expect(
      $s22.position,
      2,
      reason: '([a] / [b])?\n\$ = [c]\n\'ac\'\nstate.position = 2',
    );
    expect(
      $r32.$1,
      99,
      reason: '([a] / [b])?\n\$ = [c]\n\'ac\'\nresult.\$1 != 99',
    );
    final $s23 = State('ac');
    final $r33 = $r31($s23) as dynamic;
    expect(
      $r33,
      isNotNull,
      reason: '([a] / [b])?\n\$ = [c]\n\'ac\'\nresult != null',
    );
    expect(
      $s23.position,
      2,
      reason: '([a] / [b])?\n\$ = [c]\n\'ac\'\nstate.position = 2',
    );
    expect(
      $r33.$1,
      null,
      reason: '([a] / [b])?\n\$ = [c]\n\'ac\'\nresult.\$1 != null',
    );
    final $s24 = State('bc');
    final $r34 = $r30($s24) as dynamic;
    expect(
      $r34,
      isNotNull,
      reason: '([a] / [b])?\n\$ = [c]\n\'bc\'\nresult != null',
    );
    expect(
      $s24.position,
      2,
      reason: '([a] / [b])?\n\$ = [c]\n\'bc\'\nstate.position = 2',
    );
    expect(
      $r34.$1,
      99,
      reason: '([a] / [b])?\n\$ = [c]\n\'bc\'\nresult.\$1 != 99',
    );
    final $s25 = State('bc');
    final $r35 = $r31($s25) as dynamic;
    expect(
      $r35,
      isNotNull,
      reason: '([a] / [b])?\n\$ = [c]\n\'bc\'\nresult != null',
    );
    expect(
      $s25.position,
      2,
      reason: '([a] / [b])?\n\$ = [c]\n\'bc\'\nstate.position = 2',
    );
    expect(
      $r35.$1,
      null,
      reason: '([a] / [b])?\n\$ = [c]\n\'bc\'\nresult.\$1 != null',
    );
    final $s26 = State('c');
    final $r36 = $r30($s26) as dynamic;
    expect(
      $r36,
      isNotNull,
      reason: '([a] / [b])?\n\$ = [c]\n\'c\'\nresult != null',
    );
    expect(
      $s26.position,
      1,
      reason: '([a] / [b])?\n\$ = [c]\n\'c\'\nstate.position = 1',
    );
    expect(
      $r36.$1,
      99,
      reason: '([a] / [b])?\n\$ = [c]\n\'c\'\nresult.\$1 != 99',
    );
    final $s27 = State('c');
    final $r37 = $r31($s27) as dynamic;
    expect(
      $r37,
      isNotNull,
      reason: '([a] / [b])?\n\$ = [c]\n\'c\'\nresult != null',
    );
    expect(
      $s27.position,
      1,
      reason: '([a] / [b])?\n\$ = [c]\n\'c\'\nstate.position = 1',
    );
    expect(
      $r37.$1,
      null,
      reason: '([a] / [b])?\n\$ = [c]\n\'c\'\nresult.\$1 != null',
    );
    final $s28 = State('');
    final $r38 = $r30($s28) as dynamic;
    expect(
      $r38,
      isNull,
      reason: '([a] / [b])?\n\$ = [c]\n\'\'\nresult == null',
    );
    expect(
      $s28.farthestPosition,
      0,
      reason: '([a] / [b])?\n\$ = [c]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s28.position,
      0,
      reason: '([a] / [b])?\n\$ = [c]\n\'\'\nstate.position = 0',
    );
    final $e = $s28.getErrors().map((e) => '$e').toList()..sort();
    expect($e.length, 1, reason: '([a] / [b])?\n\$ = [c]\n\'\'\nerror count');
    expect($e, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '([a] / [b])?\n\$ = [c]\n\'\'\nerrors');
    final $s29 = State('');
    final $r39 = $r31($s29) as dynamic;
    expect(
      $r39,
      isNull,
      reason: '([a] / [b])?\n\$ = [c]\n\'\'\nresult == null',
    );
    expect(
      $s29.farthestPosition,
      0,
      reason: '([a] / [b])?\n\$ = [c]\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s29.position,
      0,
      reason: '([a] / [b])?\n\$ = [c]\n\'\'\nstate.position = 0',
    );
    final $e1 = $s29.getErrors().map((e) => '$e').toList()..sort();
    expect($e1.length, 1, reason: '([a] / [b])?\n\$ = [c]\n\'\'\nerror count');
    expect($e1, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '([a] / [b])?\n\$ = [c]\n\'\'\nerrors');
  });

  test('Predicate', () {
    final $r = parser.parsePredicate0;
    final $s = State('a');
    final $r1 = $r($s) as dynamic;
    expect($r1, isNotNull, reason: '& { true }\n\'a\'\nresult != null');
    expect($s.position, 0, reason: '& { true }\n\'a\'\nstate.position = 0');
    expect($r1.$1, null, reason: '& { true }\n\'a\'\nresult.\$1 != null');
    final $s1 = State('');
    final $r2 = $r($s1) as dynamic;
    expect($r2, isNotNull, reason: '& { true }\n\'\'\nresult != null');
    expect($s1.position, 0, reason: '& { true }\n\'\'\nstate.position = 0');
    expect($r2.$1, null, reason: '& { true }\n\'\'\nresult.\$1 != null');
    final $r3 = parser.parsePredicate1;
    final $s2 = State('a');
    final $r4 = $r3($s2) as dynamic;
    expect($r4, isNull, reason: '& { false }\n\'a\'\nresult == null');
    expect(
      $s2.farthestPosition,
      0,
      reason: '& { false }\n\'a\'\nstate.farthestPosition = 0',
    );
    expect($s2.position, 0, reason: '& { false }\n\'a\'\nstate.position = 0');
    final $e = $s2.getErrors().map((e) => '$e').toList()..sort();
    expect($e.length, 1, reason: '& { false }\n\'a\'\nerror count');
    expect($e, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '& { false }\n\'a\'\nerrors');
    final $s3 = State('');
    final $r5 = $r3($s3) as dynamic;
    expect($r5, isNull, reason: '& { false }\n\'\'\nresult == null');
    expect(
      $s3.farthestPosition,
      0,
      reason: '& { false }\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s3.position, 0, reason: '& { false }\n\'\'\nstate.position = 0');
    final $e1 = $s3.getErrors().map((e) => '$e').toList()..sort();
    expect($e1.length, 1, reason: '& { false }\n\'\'\nerror count');
    expect($e1, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '& { false }\n\'\'\nerrors');
    final $r6 = parser.parsePredicate2;
    final $s4 = State('a');
    final $r7 = $r6($s4) as dynamic;
    expect($r7, isNull, reason: '! { true }\n\'a\'\nresult == null');
    expect(
      $s4.farthestPosition,
      0,
      reason: '! { true }\n\'a\'\nstate.farthestPosition = 0',
    );
    expect($s4.position, 0, reason: '! { true }\n\'a\'\nstate.position = 0');
    final $e2 = $s4.getErrors().map((e) => '$e').toList()..sort();
    expect($e2.length, 1, reason: '! { true }\n\'a\'\nerror count');
    expect($e2, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '! { true }\n\'a\'\nerrors');
    final $s5 = State('');
    final $r8 = $r6($s5) as dynamic;
    expect($r8, isNull, reason: '! { true }\n\'\'\nresult == null');
    expect(
      $s5.farthestPosition,
      0,
      reason: '! { true }\n\'\'\nstate.farthestPosition = 0',
    );
    expect($s5.position, 0, reason: '! { true }\n\'\'\nstate.position = 0');
    final $e3 = $s5.getErrors().map((e) => '$e').toList()..sort();
    expect($e3.length, 1, reason: '! { true }\n\'\'\nerror count');
    expect($e3, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '! { true }\n\'\'\nerrors');
    final $r9 = parser.parsePredicate3;
    final $s6 = State('a');
    final $r10 = $r9($s6) as dynamic;
    expect($r10, isNotNull, reason: '! { false }\n\'a\'\nresult != null');
    expect($s6.position, 0, reason: '! { false }\n\'a\'\nstate.position = 0');
    expect($r10.$1, null, reason: '! { false }\n\'a\'\nresult.\$1 != null');
    final $s7 = State('');
    final $r11 = $r9($s7) as dynamic;
    expect($r11, isNotNull, reason: '! { false }\n\'\'\nresult != null');
    expect($s7.position, 0, reason: '! { false }\n\'\'\nstate.position = 0');
    expect($r11.$1, null, reason: '! { false }\n\'\'\nresult.\$1 != null');
    final $r12 = parser.parsePredicate4;
    final $s8 = State('a');
    final $r13 = $r12($s8) as dynamic;
    expect($r13, isNotNull, reason: '& (a = { false })\n\'a\'\nresult != null');
    expect(
      $s8.position,
      0,
      reason: '& (a = { false })\n\'a\'\nstate.position = 0',
    );
    expect(
      $r13.$1,
      null,
      reason: '& (a = { false })\n\'a\'\nresult.\$1 != null',
    );
    final $s9 = State('');
    final $r14 = $r12($s9) as dynamic;
    expect($r14, isNotNull, reason: '& (a = { false })\n\'\'\nresult != null');
    expect(
      $s9.position,
      0,
      reason: '& (a = { false })\n\'\'\nstate.position = 0',
    );
    expect(
      $r14.$1,
      null,
      reason: '& (a = { false })\n\'\'\nresult.\$1 != null',
    );
  });

  test('Sequence', () {
    final $r = parser.parseSequence0;
    final $r1 = parser.parseSequenceVoid0;
    final $s = State('123');
    final $r2 = $r($s) as dynamic;
    expect(
      $r2,
      isNotNull,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'123\'\nresult != null',
    );
    expect(
      $s.position,
      3,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'123\'\nstate.position = 3',
    );
    expect(
      $r2.$1,
      6,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'123\'\nresult.\$1 != 6',
    );
    final $s1 = State('123');
    final $r3 = $r1($s1) as dynamic;
    expect(
      $r3,
      isNotNull,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'123\'\nresult != null',
    );
    expect(
      $s1.position,
      3,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'123\'\nstate.position = 3',
    );
    expect(
      $r3.$1,
      null,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'123\'\nresult.\$1 != null',
    );
    final $s2 = State('12');
    final $r4 = $r($s2) as dynamic;
    expect(
      $r4,
      isNull,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'12\'\nresult == null',
    );
    expect(
      $s2.farthestPosition,
      2,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'12\'\nstate.farthestPosition = 2',
    );
    expect(
      $s2.position,
      0,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'12\'\nstate.position = 0',
    );
    final $e = $s2.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e.length,
      1,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'12\'\nerror count',
    );
    expect(
      $e,
      ['(end: 2, message: Unexpected input data, start: 2)'],
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'12\'\nerrors',
    );
    final $s3 = State('12');
    final $r5 = $r1($s3) as dynamic;
    expect(
      $r5,
      isNull,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'12\'\nresult == null',
    );
    expect(
      $s3.farthestPosition,
      2,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'12\'\nstate.farthestPosition = 2',
    );
    expect(
      $s3.position,
      0,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'12\'\nstate.position = 0',
    );
    final $e1 = $s3.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e1.length,
      1,
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'12\'\nerror count',
    );
    expect(
      $e1,
      ['(end: 2, message: Unexpected input data, start: 2)'],
      reason:
          'a = [0-9]\nb = [0-9]\nc = [0-9]\n\$ = { a - 48 + b - 48 + c - 48 }\n\'12\'\nerrors',
    );
    final $r6 = parser.parseSequence1;
    final $r7 = parser.parseSequenceVoid1;
    final $s4 = State('abc');
    final $r8 = $r6($s4) as dynamic;
    expect(
      $r8,
      isNotNull,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'abc\'\nresult != null',
    );
    expect(
      $s4.position,
      3,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'abc\'\nstate.position = 3',
    );
    expect(
      $r8.$1,
      'abc',
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'abc\'\nresult.\$1 != \'abc\'',
    );
    final $s5 = State('abc');
    final $r9 = $r7($s5) as dynamic;
    expect(
      $r9,
      isNotNull,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'abc\'\nresult != null',
    );
    expect(
      $s5.position,
      3,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'abc\'\nstate.position = 3',
    );
    expect(
      $r9.$1,
      null,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'abc\'\nresult.\$1 != null',
    );
    final $s6 = State('');
    final $r10 = $r6($s6) as dynamic;
    expect(
      $r10,
      isNull,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'\'\nresult == null',
    );
    expect(
      $s6.farthestPosition,
      0,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s6.position,
      0,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'\'\nstate.position = 0',
    );
    final $e2 = $s6.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e2.length,
      1,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'\'\nerror count',
    );
    expect(
      $e2,
      ['(end: 0, message: Expected: \'abc\', start: 0)'],
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'\'\nerrors',
    );
    final $s7 = State('');
    final $r11 = $r7($s7) as dynamic;
    expect(
      $r11,
      isNull,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'\'\nresult == null',
    );
    expect(
      $s7.farthestPosition,
      0,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s7.position,
      0,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'\'\nstate.position = 0',
    );
    final $e3 = $s7.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e3.length,
      1,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'\'\nerror count',
    );
    expect(
      $e3,
      ['(end: 0, message: Expected: \'abc\', start: 0)'],
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'\'\nerrors',
    );
    final $s8 = State('a');
    final $r12 = $r6($s8) as dynamic;
    expect(
      $r12,
      isNull,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'a\'\nresult == null',
    );
    expect(
      $s8.farthestPosition,
      1,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      $s8.position,
      0,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'a\'\nstate.position = 0',
    );
    final $e4 = $s8.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e4.length,
      3,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'a\'\nerror count',
    );
    expect(
      $e4,
      [
        '(end: 0, message: Start, start: 0)',
        '(end: 1, message: End, start: 1)',
        '(end: 1, message: Full, start: 0)',
      ],
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'a\'\nerrors',
    );
    final $s9 = State('a');
    final $r13 = $r7($s9) as dynamic;
    expect(
      $r13,
      isNull,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'a\'\nresult == null',
    );
    expect(
      $s9.farthestPosition,
      1,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      $s9.position,
      0,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'a\'\nstate.position = 0',
    );
    final $e5 = $s9.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e5.length,
      3,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'a\'\nerror count',
    );
    expect(
      $e5,
      [
        '(end: 0, message: Start, start: 0)',
        '(end: 1, message: End, start: 1)',
        '(end: 1, message: Full, start: 0)',
      ],
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'a\'\nerrors',
    );
    final $s10 = State('ab');
    final $r14 = $r6($s10) as dynamic;
    expect(
      $r14,
      isNull,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'ab\'\nresult == null',
    );
    expect(
      $s10.farthestPosition,
      2,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'ab\'\nstate.farthestPosition = 2',
    );
    expect(
      $s10.position,
      0,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'ab\'\nstate.position = 0',
    );
    final $e6 = $s10.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e6.length,
      3,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'ab\'\nerror count',
    );
    expect(
      $e6,
      [
        '(end: 0, message: Start, start: 0)',
        '(end: 2, message: End, start: 2)',
        '(end: 2, message: Full, start: 0)',
      ],
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'ab\'\nerrors',
    );
    final $s11 = State('ab');
    final $r15 = $r7($s11) as dynamic;
    expect(
      $r15,
      isNull,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'ab\'\nresult == null',
    );
    expect(
      $s11.farthestPosition,
      2,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'ab\'\nstate.farthestPosition = 2',
    );
    expect(
      $s11.position,
      0,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'ab\'\nstate.position = 0',
    );
    final $e7 = $s11.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e7.length,
      3,
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'ab\'\nerror count',
    );
    expect(
      $e7,
      [
        '(end: 0, message: Start, start: 0)',
        '(end: 2, message: End, start: 2)',
        '(end: 2, message: Full, start: 0)',
      ],
      reason:
          '[a]\n[b]\n[c]\n\$ = `const` { \'abc\' }\n~ {\n  state.errorExpected(\'abc\');\n  state.errorIncorrect(\'Full\', true);\n  state.errorIncorrect(\'End\', false);\n  state.errorIncorrect(\'Start\', null);\n}\n\'ab\'\nerrors',
    );
    final $r16 = parser.parseSequence2;
    final $r17 = parser.parseSequenceVoid2;
    final $s12 = State('bar');
    final $r18 = $r16($s12) as dynamic;
    expect(
      $r18,
      isNotNull,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'bar\'\nresult != null',
    );
    expect(
      $s12.position,
      3,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'bar\'\nstate.position = 3',
    );
    expect(
      $r18.$1,
      'bar',
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'bar\'\nresult.\$1 != \'bar\'',
    );
    final $s13 = State('bar');
    final $r19 = $r17($s13) as dynamic;
    expect(
      $r19,
      isNotNull,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'bar\'\nresult != null',
    );
    expect(
      $s13.position,
      3,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'bar\'\nstate.position = 3',
    );
    expect(
      $r19.$1,
      null,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'bar\'\nresult.\$1 != null',
    );
    final $s14 = State('baz');
    final $r20 = $r16($s14) as dynamic;
    expect(
      $r20,
      isNotNull,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'baz\'\nresult != null',
    );
    expect(
      $s14.position,
      3,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'baz\'\nstate.position = 3',
    );
    expect(
      $r20.$1,
      'baz',
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'baz\'\nresult.\$1 != \'baz\'',
    );
    final $s15 = State('baz');
    final $r21 = $r17($s15) as dynamic;
    expect(
      $r21,
      isNotNull,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'baz\'\nresult != null',
    );
    expect(
      $s15.position,
      3,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'baz\'\nstate.position = 3',
    );
    expect(
      $r21.$1,
      null,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'baz\'\nresult.\$1 != null',
    );
    final $s16 = State('');
    final $r22 = $r16($s16) as dynamic;
    expect(
      $r22,
      isNull,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'\'\nresult == null',
    );
    expect(
      $s16.farthestPosition,
      0,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s16.position,
      0,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'\'\nstate.position = 0',
    );
    final $e8 = $s16.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e8.length,
      1,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'\'\nerror count',
    );
    expect(
      $e8,
      ['(end: 0, message: Expected: \'foo\', start: 0)'],
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'\'\nerrors',
    );
    final $s17 = State('');
    final $r23 = $r17($s17) as dynamic;
    expect(
      $r23,
      isNull,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'\'\nresult == null',
    );
    expect(
      $s17.farthestPosition,
      0,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s17.position,
      0,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'\'\nstate.position = 0',
    );
    final $e9 = $s17.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e9.length,
      1,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'\'\nerror count',
    );
    expect(
      $e9,
      ['(end: 0, message: Expected: \'foo\', start: 0)'],
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'\'\nerrors',
    );
    final $s18 = State('abc');
    final $r24 = $r16($s18) as dynamic;
    expect(
      $r24,
      isNull,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'abc\'\nresult == null',
    );
    expect(
      $s18.farthestPosition,
      0,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'abc\'\nstate.farthestPosition = 0',
    );
    expect(
      $s18.position,
      0,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'abc\'\nstate.position = 0',
    );
    final $e10 = $s18.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e10.length,
      1,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'abc\'\nerror count',
    );
    expect(
      $e10,
      ['(end: 0, message: Expected: \'foo\', start: 0)'],
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'abc\'\nerrors',
    );
    final $s19 = State('abc');
    final $r25 = $r17($s19) as dynamic;
    expect(
      $r25,
      isNull,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'abc\'\nresult == null',
    );
    expect(
      $s19.farthestPosition,
      0,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'abc\'\nstate.farthestPosition = 0',
    );
    expect(
      $s19.position,
      0,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'abc\'\nstate.position = 0',
    );
    final $e11 = $s19.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e11.length,
      1,
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'abc\'\nerror count',
    );
    expect(
      $e11,
      ['(end: 0, message: Expected: \'foo\', start: 0)'],
      reason:
          '(\n  \'bar\'\n  /\n  \'baz\'\n)\n~ {\n  state.removeRecentErrors();\n  state.errorExpected(\'foo\');\n}\n\'abc\'\nerrors',
    );
    final $r26 = parser.parseSequence3;
    final $r27 = parser.parseSequenceVoid3;
    final $s20 = State('foo');
    final $r28 = $r26($s20) as dynamic;
    expect(
      $r28,
      isNotNull,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'foo\'\nresult != null',
    );
    expect(
      $s20.position,
      3,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'foo\'\nstate.position = 3',
    );
    expect(
      $r28.$1,
      'foo',
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'foo\'\nresult.\$1 != \'foo\'',
    );
    final $s21 = State('foo');
    final $r29 = $r27($s21) as dynamic;
    expect(
      $r29,
      isNotNull,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'foo\'\nresult != null',
    );
    expect(
      $s21.position,
      3,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'foo\'\nstate.position = 3',
    );
    expect(
      $r29.$1,
      null,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'foo\'\nresult.\$1 != null',
    );
    final $s22 = State('');
    final $r30 = $r26($s22) as dynamic;
    expect(
      $r30,
      isNull,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'\'\nresult == null',
    );
    expect(
      $s22.farthestPosition,
      0,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s22.position,
      0,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'\'\nstate.position = 0',
    );
    final $e12 = $s22.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e12.length,
      1,
      reason: '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'\'\nerror count',
    );
    expect($e12, [
      '(end: 0, message: Expected: \'foo\', start: 0)',
    ], reason: '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'\'\nerrors');
    final $s23 = State('');
    final $r31 = $r27($s23) as dynamic;
    expect(
      $r31,
      isNull,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'\'\nresult == null',
    );
    expect(
      $s23.farthestPosition,
      0,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s23.position,
      0,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'\'\nstate.position = 0',
    );
    final $e13 = $s23.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e13.length,
      1,
      reason: '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'\'\nerror count',
    );
    expect($e13, [
      '(end: 0, message: Expected: \'foo\', start: 0)',
    ], reason: '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'\'\nerrors');
    final $s24 = State('abc');
    final $r32 = $r26($s24) as dynamic;
    expect(
      $r32,
      isNull,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'abc\'\nresult == null',
    );
    expect(
      $s24.farthestPosition,
      0,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'abc\'\nstate.farthestPosition = 0',
    );
    expect(
      $s24.position,
      0,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'abc\'\nstate.position = 0',
    );
    final $e14 = $s24.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e14.length,
      1,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'abc\'\nerror count',
    );
    expect($e14, [
      '(end: 0, message: Expected: \'foo\', start: 0)',
    ], reason: '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'abc\'\nerrors');
    final $s25 = State('abc');
    final $r33 = $r27($s25) as dynamic;
    expect(
      $r33,
      isNull,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'abc\'\nresult == null',
    );
    expect(
      $s25.farthestPosition,
      0,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'abc\'\nstate.farthestPosition = 0',
    );
    expect(
      $s25.position,
      0,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'abc\'\nstate.position = 0',
    );
    final $e15 = $s25.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e15.length,
      1,
      reason:
          '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'abc\'\nerror count',
    );
    expect($e15, [
      '(end: 0, message: Expected: \'foo\', start: 0)',
    ], reason: '"foo"\n~ { state.errorExpected(\'foo\'); }\n\'abc\'\nerrors');
  });

  test('While', () {
    final $r = parser.parseWhile0;
    final $r1 = parser.parseWhileVoid0;
    final $s = State('a');
    final $r2 = $r($s) as dynamic;
    expect(
      $r2,
      isNotNull,
      reason: '@while (0) {\n  [a]\n}\n\'a\'\nresult != null',
    );
    expect(
      $s.position,
      1,
      reason: '@while (0) {\n  [a]\n}\n\'a\'\nstate.position = 1',
    );
    expect($r2.$1, [
      97,
    ], reason: '@while (0) {\n  [a]\n}\n\'a\'\nresult.\$1 != [97]');
    final $s1 = State('a');
    final $r3 = $r1($s1) as dynamic;
    expect(
      $r3,
      isNotNull,
      reason: '@while (0) {\n  [a]\n}\n\'a\'\nresult != null',
    );
    expect(
      $s1.position,
      1,
      reason: '@while (0) {\n  [a]\n}\n\'a\'\nstate.position = 1',
    );
    expect(
      $r3.$1,
      null,
      reason: '@while (0) {\n  [a]\n}\n\'a\'\nresult.\$1 != null',
    );
    final $s2 = State('aa');
    final $r4 = $r($s2) as dynamic;
    expect(
      $r4,
      isNotNull,
      reason: '@while (0) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      $s2.position,
      2,
      reason: '@while (0) {\n  [a]\n}\n\'aa\'\nstate.position = 2',
    );
    expect($r4.$1, [
      97,
      97,
    ], reason: '@while (0) {\n  [a]\n}\n\'aa\'\nresult.\$1 != [97, 97]');
    final $s3 = State('aa');
    final $r5 = $r1($s3) as dynamic;
    expect(
      $r5,
      isNotNull,
      reason: '@while (0) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      $s3.position,
      2,
      reason: '@while (0) {\n  [a]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      $r5.$1,
      null,
      reason: '@while (0) {\n  [a]\n}\n\'aa\'\nresult.\$1 != null',
    );
    final $s4 = State('');
    final $r6 = $r($s4) as dynamic;
    expect(
      $r6,
      isNotNull,
      reason: '@while (0) {\n  [a]\n}\n\'\'\nresult != null',
    );
    expect(
      $s4.position,
      0,
      reason: '@while (0) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    expect(
      $r6.$1,
      <int>[],
      reason: '@while (0) {\n  [a]\n}\n\'\'\nresult.\$1 != <int>[]',
    );
    final $s5 = State('');
    final $r7 = $r1($s5) as dynamic;
    expect(
      $r7,
      isNotNull,
      reason: '@while (0) {\n  [a]\n}\n\'\'\nresult != null',
    );
    expect(
      $s5.position,
      0,
      reason: '@while (0) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    expect(
      $r7.$1,
      null,
      reason: '@while (0) {\n  [a]\n}\n\'\'\nresult.\$1 != null',
    );
    final $s6 = State('b');
    final $r8 = $r($s6) as dynamic;
    expect(
      $r8,
      isNotNull,
      reason: '@while (0) {\n  [a]\n}\n\'b\'\nresult != null',
    );
    expect(
      $s6.position,
      0,
      reason: '@while (0) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    expect(
      $r8.$1,
      <int>[],
      reason: '@while (0) {\n  [a]\n}\n\'b\'\nresult.\$1 != <int>[]',
    );
    final $s7 = State('b');
    final $r9 = $r1($s7) as dynamic;
    expect(
      $r9,
      isNotNull,
      reason: '@while (0) {\n  [a]\n}\n\'b\'\nresult != null',
    );
    expect(
      $s7.position,
      0,
      reason: '@while (0) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    expect(
      $r9.$1,
      null,
      reason: '@while (0) {\n  [a]\n}\n\'b\'\nresult.\$1 != null',
    );
    final $r10 = parser.parseWhile1;
    final $r11 = parser.parseWhileVoid1;
    final $s8 = State('a');
    final $r12 = $r10($s8) as dynamic;
    expect(
      $r12,
      isNotNull,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'a\'\nresult != null',
    );
    expect(
      $s8.position,
      1,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'a\'\nstate.position = 1',
    );
    expect($r12.$1, [
      97,
    ], reason: '@while (0) {\n  [a] / [z]\n}\n\'a\'\nresult.\$1 != [97]');
    final $s9 = State('a');
    final $r13 = $r11($s9) as dynamic;
    expect(
      $r13,
      isNotNull,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'a\'\nresult != null',
    );
    expect(
      $s9.position,
      1,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'a\'\nstate.position = 1',
    );
    expect(
      $r13.$1,
      null,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'a\'\nresult.\$1 != null',
    );
    final $s10 = State('aa');
    final $r14 = $r10($s10) as dynamic;
    expect(
      $r14,
      isNotNull,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'aa\'\nresult != null',
    );
    expect(
      $s10.position,
      2,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      $r14.$1,
      [97, 97],
      reason: '@while (0) {\n  [a] / [z]\n}\n\'aa\'\nresult.\$1 != [97, 97]',
    );
    final $s11 = State('aa');
    final $r15 = $r11($s11) as dynamic;
    expect(
      $r15,
      isNotNull,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'aa\'\nresult != null',
    );
    expect(
      $s11.position,
      2,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      $r15.$1,
      null,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'aa\'\nresult.\$1 != null',
    );
    final $s12 = State('z');
    final $r16 = $r10($s12) as dynamic;
    expect(
      $r16,
      isNotNull,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'z\'\nresult != null',
    );
    expect(
      $s12.position,
      1,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'z\'\nstate.position = 1',
    );
    expect($r16.$1, [
      122,
    ], reason: '@while (0) {\n  [a] / [z]\n}\n\'z\'\nresult.\$1 != [122]');
    final $s13 = State('z');
    final $r17 = $r11($s13) as dynamic;
    expect(
      $r17,
      isNotNull,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'z\'\nresult != null',
    );
    expect(
      $s13.position,
      1,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'z\'\nstate.position = 1',
    );
    expect(
      $r17.$1,
      null,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'z\'\nresult.\$1 != null',
    );
    final $s14 = State('za');
    final $r18 = $r10($s14) as dynamic;
    expect(
      $r18,
      isNotNull,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'za\'\nresult != null',
    );
    expect(
      $s14.position,
      2,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'za\'\nstate.position = 2',
    );
    expect(
      $r18.$1,
      [122, 97],
      reason: '@while (0) {\n  [a] / [z]\n}\n\'za\'\nresult.\$1 != [122, 97]',
    );
    final $s15 = State('za');
    final $r19 = $r11($s15) as dynamic;
    expect(
      $r19,
      isNotNull,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'za\'\nresult != null',
    );
    expect(
      $s15.position,
      2,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'za\'\nstate.position = 2',
    );
    expect(
      $r19.$1,
      null,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'za\'\nresult.\$1 != null',
    );
    final $s16 = State('');
    final $r20 = $r10($s16) as dynamic;
    expect(
      $r20,
      isNotNull,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'\'\nresult != null',
    );
    expect(
      $s16.position,
      0,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'\'\nstate.position = 0',
    );
    expect(
      $r20.$1,
      <int>[],
      reason: '@while (0) {\n  [a] / [z]\n}\n\'\'\nresult.\$1 != <int>[]',
    );
    final $s17 = State('');
    final $r21 = $r11($s17) as dynamic;
    expect(
      $r21,
      isNotNull,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'\'\nresult != null',
    );
    expect(
      $s17.position,
      0,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'\'\nstate.position = 0',
    );
    expect(
      $r21.$1,
      null,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'\'\nresult.\$1 != null',
    );
    final $s18 = State('b');
    final $r22 = $r10($s18) as dynamic;
    expect(
      $r22,
      isNotNull,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'b\'\nresult != null',
    );
    expect(
      $s18.position,
      0,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'b\'\nstate.position = 0',
    );
    expect(
      $r22.$1,
      <int>[],
      reason: '@while (0) {\n  [a] / [z]\n}\n\'b\'\nresult.\$1 != <int>[]',
    );
    final $s19 = State('b');
    final $r23 = $r11($s19) as dynamic;
    expect(
      $r23,
      isNotNull,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'b\'\nresult != null',
    );
    expect(
      $s19.position,
      0,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'b\'\nstate.position = 0',
    );
    expect(
      $r23.$1,
      null,
      reason: '@while (0) {\n  [a] / [z]\n}\n\'b\'\nresult.\$1 != null',
    );
    final $r24 = parser.parseWhile2;
    final $r25 = parser.parseWhileVoid2;
    final $s20 = State('a');
    final $r26 = $r24($s20) as dynamic;
    expect(
      $r26,
      isNotNull,
      reason: '@while (1) {\n  [a]\n}\n\'a\'\nresult != null',
    );
    expect(
      $s20.position,
      1,
      reason: '@while (1) {\n  [a]\n}\n\'a\'\nstate.position = 1',
    );
    expect($r26.$1, [
      97,
    ], reason: '@while (1) {\n  [a]\n}\n\'a\'\nresult.\$1 != [97]');
    final $s21 = State('a');
    final $r27 = $r25($s21) as dynamic;
    expect(
      $r27,
      isNotNull,
      reason: '@while (1) {\n  [a]\n}\n\'a\'\nresult != null',
    );
    expect(
      $s21.position,
      1,
      reason: '@while (1) {\n  [a]\n}\n\'a\'\nstate.position = 1',
    );
    expect(
      $r27.$1,
      null,
      reason: '@while (1) {\n  [a]\n}\n\'a\'\nresult.\$1 != null',
    );
    final $s22 = State('aa');
    final $r28 = $r24($s22) as dynamic;
    expect(
      $r28,
      isNotNull,
      reason: '@while (1) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      $s22.position,
      2,
      reason: '@while (1) {\n  [a]\n}\n\'aa\'\nstate.position = 2',
    );
    expect($r28.$1, [
      97,
      97,
    ], reason: '@while (1) {\n  [a]\n}\n\'aa\'\nresult.\$1 != [97, 97]');
    final $s23 = State('aa');
    final $r29 = $r25($s23) as dynamic;
    expect(
      $r29,
      isNotNull,
      reason: '@while (1) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      $s23.position,
      2,
      reason: '@while (1) {\n  [a]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      $r29.$1,
      null,
      reason: '@while (1) {\n  [a]\n}\n\'aa\'\nresult.\$1 != null',
    );
    final $s24 = State('');
    final $r30 = $r24($s24) as dynamic;
    expect(
      $r30,
      isNull,
      reason: '@while (1) {\n  [a]\n}\n\'\'\nresult == null',
    );
    expect(
      $s24.farthestPosition,
      0,
      reason: '@while (1) {\n  [a]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s24.position,
      0,
      reason: '@while (1) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    final $e = $s24.getErrors().map((e) => '$e').toList()..sort();
    expect($e.length, 1, reason: '@while (1) {\n  [a]\n}\n\'\'\nerror count');
    expect($e, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (1) {\n  [a]\n}\n\'\'\nerrors');
    final $s25 = State('');
    final $r31 = $r25($s25) as dynamic;
    expect(
      $r31,
      isNull,
      reason: '@while (1) {\n  [a]\n}\n\'\'\nresult == null',
    );
    expect(
      $s25.farthestPosition,
      0,
      reason: '@while (1) {\n  [a]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s25.position,
      0,
      reason: '@while (1) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    final $e1 = $s25.getErrors().map((e) => '$e').toList()..sort();
    expect($e1.length, 1, reason: '@while (1) {\n  [a]\n}\n\'\'\nerror count');
    expect($e1, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (1) {\n  [a]\n}\n\'\'\nerrors');
    final $s26 = State('b');
    final $r32 = $r24($s26) as dynamic;
    expect(
      $r32,
      isNull,
      reason: '@while (1) {\n  [a]\n}\n\'b\'\nresult == null',
    );
    expect(
      $s26.farthestPosition,
      0,
      reason: '@while (1) {\n  [a]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      $s26.position,
      0,
      reason: '@while (1) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    final $e2 = $s26.getErrors().map((e) => '$e').toList()..sort();
    expect($e2.length, 1, reason: '@while (1) {\n  [a]\n}\n\'b\'\nerror count');
    expect($e2, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (1) {\n  [a]\n}\n\'b\'\nerrors');
    final $s27 = State('b');
    final $r33 = $r25($s27) as dynamic;
    expect(
      $r33,
      isNull,
      reason: '@while (1) {\n  [a]\n}\n\'b\'\nresult == null',
    );
    expect(
      $s27.farthestPosition,
      0,
      reason: '@while (1) {\n  [a]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      $s27.position,
      0,
      reason: '@while (1) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    final $e3 = $s27.getErrors().map((e) => '$e').toList()..sort();
    expect($e3.length, 1, reason: '@while (1) {\n  [a]\n}\n\'b\'\nerror count');
    expect($e3, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (1) {\n  [a]\n}\n\'b\'\nerrors');
    final $r34 = parser.parseWhile3;
    final $r35 = parser.parseWhileVoid3;
    final $s28 = State('a');
    final $r36 = $r34($s28) as dynamic;
    expect(
      $r36,
      isNotNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'a\'\nresult != null',
    );
    expect(
      $s28.position,
      1,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'a\'\nstate.position = 1',
    );
    expect($r36.$1, [
      97,
    ], reason: '@while (1) {\n  [a] / [z]\n}\n\'a\'\nresult.\$1 != [97]');
    final $s29 = State('a');
    final $r37 = $r35($s29) as dynamic;
    expect(
      $r37,
      isNotNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'a\'\nresult != null',
    );
    expect(
      $s29.position,
      1,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'a\'\nstate.position = 1',
    );
    expect(
      $r37.$1,
      null,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'a\'\nresult.\$1 != null',
    );
    final $s30 = State('aa');
    final $r38 = $r34($s30) as dynamic;
    expect(
      $r38,
      isNotNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'aa\'\nresult != null',
    );
    expect(
      $s30.position,
      2,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      $r38.$1,
      [97, 97],
      reason: '@while (1) {\n  [a] / [z]\n}\n\'aa\'\nresult.\$1 != [97, 97]',
    );
    final $s31 = State('aa');
    final $r39 = $r35($s31) as dynamic;
    expect(
      $r39,
      isNotNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'aa\'\nresult != null',
    );
    expect(
      $s31.position,
      2,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      $r39.$1,
      null,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'aa\'\nresult.\$1 != null',
    );
    final $s32 = State('z');
    final $r40 = $r34($s32) as dynamic;
    expect(
      $r40,
      isNotNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'z\'\nresult != null',
    );
    expect(
      $s32.position,
      1,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'z\'\nstate.position = 1',
    );
    expect($r40.$1, [
      122,
    ], reason: '@while (1) {\n  [a] / [z]\n}\n\'z\'\nresult.\$1 != [122]');
    final $s33 = State('z');
    final $r41 = $r35($s33) as dynamic;
    expect(
      $r41,
      isNotNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'z\'\nresult != null',
    );
    expect(
      $s33.position,
      1,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'z\'\nstate.position = 1',
    );
    expect(
      $r41.$1,
      null,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'z\'\nresult.\$1 != null',
    );
    final $s34 = State('za');
    final $r42 = $r34($s34) as dynamic;
    expect(
      $r42,
      isNotNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'za\'\nresult != null',
    );
    expect(
      $s34.position,
      2,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'za\'\nstate.position = 2',
    );
    expect(
      $r42.$1,
      [122, 97],
      reason: '@while (1) {\n  [a] / [z]\n}\n\'za\'\nresult.\$1 != [122, 97]',
    );
    final $s35 = State('za');
    final $r43 = $r35($s35) as dynamic;
    expect(
      $r43,
      isNotNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'za\'\nresult != null',
    );
    expect(
      $s35.position,
      2,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'za\'\nstate.position = 2',
    );
    expect(
      $r43.$1,
      null,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'za\'\nresult.\$1 != null',
    );
    final $s36 = State('zz');
    final $r44 = $r34($s36) as dynamic;
    expect(
      $r44,
      isNotNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'zz\'\nresult != null',
    );
    expect(
      $s36.position,
      2,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'zz\'\nstate.position = 2',
    );
    expect(
      $r44.$1,
      [122, 122],
      reason: '@while (1) {\n  [a] / [z]\n}\n\'zz\'\nresult.\$1 != [122, 122]',
    );
    final $s37 = State('zz');
    final $r45 = $r35($s37) as dynamic;
    expect(
      $r45,
      isNotNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'zz\'\nresult != null',
    );
    expect(
      $s37.position,
      2,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'zz\'\nstate.position = 2',
    );
    expect(
      $r45.$1,
      null,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'zz\'\nresult.\$1 != null',
    );
    final $s38 = State('');
    final $r46 = $r34($s38) as dynamic;
    expect(
      $r46,
      isNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'\'\nresult == null',
    );
    expect(
      $s38.farthestPosition,
      0,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s38.position,
      0,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'\'\nstate.position = 0',
    );
    final $e4 = $s38.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e4.length,
      1,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'\'\nerror count',
    );
    expect($e4, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (1) {\n  [a] / [z]\n}\n\'\'\nerrors');
    final $s39 = State('');
    final $r47 = $r35($s39) as dynamic;
    expect(
      $r47,
      isNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'\'\nresult == null',
    );
    expect(
      $s39.farthestPosition,
      0,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s39.position,
      0,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'\'\nstate.position = 0',
    );
    final $e5 = $s39.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e5.length,
      1,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'\'\nerror count',
    );
    expect($e5, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (1) {\n  [a] / [z]\n}\n\'\'\nerrors');
    final $s40 = State('b');
    final $r48 = $r34($s40) as dynamic;
    expect(
      $r48,
      isNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'b\'\nresult == null',
    );
    expect(
      $s40.farthestPosition,
      0,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      $s40.position,
      0,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'b\'\nstate.position = 0',
    );
    final $e6 = $s40.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e6.length,
      1,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'b\'\nerror count',
    );
    expect($e6, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (1) {\n  [a] / [z]\n}\n\'b\'\nerrors');
    final $s41 = State('b');
    final $r49 = $r35($s41) as dynamic;
    expect(
      $r49,
      isNull,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'b\'\nresult == null',
    );
    expect(
      $s41.farthestPosition,
      0,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      $s41.position,
      0,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'b\'\nstate.position = 0',
    );
    final $e7 = $s41.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e7.length,
      1,
      reason: '@while (1) {\n  [a] / [z]\n}\n\'b\'\nerror count',
    );
    expect($e7, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (1) {\n  [a] / [z]\n}\n\'b\'\nerrors');
    final $r50 = parser.parseWhile4;
    final $r51 = parser.parseWhileVoid4;
    final $s42 = State('aa');
    final $r52 = $r50($s42) as dynamic;
    expect(
      $r52,
      isNotNull,
      reason: '@while (2) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      $s42.position,
      2,
      reason: '@while (2) {\n  [a]\n}\n\'aa\'\nstate.position = 2',
    );
    expect($r52.$1, [
      97,
      97,
    ], reason: '@while (2) {\n  [a]\n}\n\'aa\'\nresult.\$1 != [97, 97]');
    final $s43 = State('aa');
    final $r53 = $r51($s43) as dynamic;
    expect(
      $r53,
      isNotNull,
      reason: '@while (2) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      $s43.position,
      2,
      reason: '@while (2) {\n  [a]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      $r53.$1,
      null,
      reason: '@while (2) {\n  [a]\n}\n\'aa\'\nresult.\$1 != null',
    );
    final $s44 = State('aaa');
    final $r54 = $r50($s44) as dynamic;
    expect(
      $r54,
      isNotNull,
      reason: '@while (2) {\n  [a]\n}\n\'aaa\'\nresult != null',
    );
    expect(
      $s44.position,
      3,
      reason: '@while (2) {\n  [a]\n}\n\'aaa\'\nstate.position = 3',
    );
    expect(
      $r54.$1,
      [97, 97, 97],
      reason: '@while (2) {\n  [a]\n}\n\'aaa\'\nresult.\$1 != [97, 97, 97]',
    );
    final $s45 = State('aaa');
    final $r55 = $r51($s45) as dynamic;
    expect(
      $r55,
      isNotNull,
      reason: '@while (2) {\n  [a]\n}\n\'aaa\'\nresult != null',
    );
    expect(
      $s45.position,
      3,
      reason: '@while (2) {\n  [a]\n}\n\'aaa\'\nstate.position = 3',
    );
    expect(
      $r55.$1,
      null,
      reason: '@while (2) {\n  [a]\n}\n\'aaa\'\nresult.\$1 != null',
    );
    final $s46 = State('');
    final $r56 = $r50($s46) as dynamic;
    expect(
      $r56,
      isNull,
      reason: '@while (2) {\n  [a]\n}\n\'\'\nresult == null',
    );
    expect(
      $s46.farthestPosition,
      0,
      reason: '@while (2) {\n  [a]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s46.position,
      0,
      reason: '@while (2) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    final $e8 = $s46.getErrors().map((e) => '$e').toList()..sort();
    expect($e8.length, 1, reason: '@while (2) {\n  [a]\n}\n\'\'\nerror count');
    expect($e8, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (2) {\n  [a]\n}\n\'\'\nerrors');
    final $s47 = State('');
    final $r57 = $r51($s47) as dynamic;
    expect(
      $r57,
      isNull,
      reason: '@while (2) {\n  [a]\n}\n\'\'\nresult == null',
    );
    expect(
      $s47.farthestPosition,
      0,
      reason: '@while (2) {\n  [a]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s47.position,
      0,
      reason: '@while (2) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    final $e9 = $s47.getErrors().map((e) => '$e').toList()..sort();
    expect($e9.length, 1, reason: '@while (2) {\n  [a]\n}\n\'\'\nerror count');
    expect($e9, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (2) {\n  [a]\n}\n\'\'\nerrors');
    final $s48 = State('a');
    final $r58 = $r50($s48) as dynamic;
    expect(
      $r58,
      isNull,
      reason: '@while (2) {\n  [a]\n}\n\'a\'\nresult == null',
    );
    expect(
      $s48.farthestPosition,
      1,
      reason: '@while (2) {\n  [a]\n}\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      $s48.position,
      0,
      reason: '@while (2) {\n  [a]\n}\n\'a\'\nstate.position = 0',
    );
    final $e10 = $s48.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e10.length,
      1,
      reason: '@while (2) {\n  [a]\n}\n\'a\'\nerror count',
    );
    expect($e10, [
      '(end: 1, message: Unexpected input data, start: 1)',
    ], reason: '@while (2) {\n  [a]\n}\n\'a\'\nerrors');
    final $s49 = State('a');
    final $r59 = $r51($s49) as dynamic;
    expect(
      $r59,
      isNull,
      reason: '@while (2) {\n  [a]\n}\n\'a\'\nresult == null',
    );
    expect(
      $s49.farthestPosition,
      1,
      reason: '@while (2) {\n  [a]\n}\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      $s49.position,
      0,
      reason: '@while (2) {\n  [a]\n}\n\'a\'\nstate.position = 0',
    );
    final $e11 = $s49.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e11.length,
      1,
      reason: '@while (2) {\n  [a]\n}\n\'a\'\nerror count',
    );
    expect($e11, [
      '(end: 1, message: Unexpected input data, start: 1)',
    ], reason: '@while (2) {\n  [a]\n}\n\'a\'\nerrors');
    final $s50 = State('b');
    final $r60 = $r50($s50) as dynamic;
    expect(
      $r60,
      isNull,
      reason: '@while (2) {\n  [a]\n}\n\'b\'\nresult == null',
    );
    expect(
      $s50.farthestPosition,
      0,
      reason: '@while (2) {\n  [a]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      $s50.position,
      0,
      reason: '@while (2) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    final $e12 = $s50.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e12.length,
      1,
      reason: '@while (2) {\n  [a]\n}\n\'b\'\nerror count',
    );
    expect($e12, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (2) {\n  [a]\n}\n\'b\'\nerrors');
    final $s51 = State('b');
    final $r61 = $r51($s51) as dynamic;
    expect(
      $r61,
      isNull,
      reason: '@while (2) {\n  [a]\n}\n\'b\'\nresult == null',
    );
    expect(
      $s51.farthestPosition,
      0,
      reason: '@while (2) {\n  [a]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      $s51.position,
      0,
      reason: '@while (2) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    final $e13 = $s51.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e13.length,
      1,
      reason: '@while (2) {\n  [a]\n}\n\'b\'\nerror count',
    );
    expect($e13, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (2) {\n  [a]\n}\n\'b\'\nerrors');
    final $r62 = parser.parseWhile5;
    final $r63 = parser.parseWhileVoid5;
    final $s52 = State('aa');
    final $r64 = $r62($s52) as dynamic;
    expect(
      $r64,
      isNotNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'aa\'\nresult != null',
    );
    expect(
      $s52.position,
      2,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      $r64.$1,
      [97, 97],
      reason: '@while (2) {\n  [a] / [z]\n}\n\'aa\'\nresult.\$1 != [97, 97]',
    );
    final $s53 = State('aa');
    final $r65 = $r63($s53) as dynamic;
    expect(
      $r65,
      isNotNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'aa\'\nresult != null',
    );
    expect(
      $s53.position,
      2,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      $r65.$1,
      null,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'aa\'\nresult.\$1 != null',
    );
    final $s54 = State('az');
    final $r66 = $r62($s54) as dynamic;
    expect(
      $r66,
      isNotNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'az\'\nresult != null',
    );
    expect(
      $s54.position,
      2,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'az\'\nstate.position = 2',
    );
    expect(
      $r66.$1,
      [97, 122],
      reason: '@while (2) {\n  [a] / [z]\n}\n\'az\'\nresult.\$1 != [97, 122]',
    );
    final $s55 = State('az');
    final $r67 = $r63($s55) as dynamic;
    expect(
      $r67,
      isNotNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'az\'\nresult != null',
    );
    expect(
      $s55.position,
      2,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'az\'\nstate.position = 2',
    );
    expect(
      $r67.$1,
      null,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'az\'\nresult.\$1 != null',
    );
    final $s56 = State('za');
    final $r68 = $r62($s56) as dynamic;
    expect(
      $r68,
      isNotNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'za\'\nresult != null',
    );
    expect(
      $s56.position,
      2,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'za\'\nstate.position = 2',
    );
    expect(
      $r68.$1,
      [122, 97],
      reason: '@while (2) {\n  [a] / [z]\n}\n\'za\'\nresult.\$1 != [122, 97]',
    );
    final $s57 = State('za');
    final $r69 = $r63($s57) as dynamic;
    expect(
      $r69,
      isNotNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'za\'\nresult != null',
    );
    expect(
      $s57.position,
      2,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'za\'\nstate.position = 2',
    );
    expect(
      $r69.$1,
      null,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'za\'\nresult.\$1 != null',
    );
    final $s58 = State('zz');
    final $r70 = $r62($s58) as dynamic;
    expect(
      $r70,
      isNotNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'zz\'\nresult != null',
    );
    expect(
      $s58.position,
      2,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'zz\'\nstate.position = 2',
    );
    expect(
      $r70.$1,
      [122, 122],
      reason: '@while (2) {\n  [a] / [z]\n}\n\'zz\'\nresult.\$1 != [122, 122]',
    );
    final $s59 = State('zz');
    final $r71 = $r63($s59) as dynamic;
    expect(
      $r71,
      isNotNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'zz\'\nresult != null',
    );
    expect(
      $s59.position,
      2,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'zz\'\nstate.position = 2',
    );
    expect(
      $r71.$1,
      null,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'zz\'\nresult.\$1 != null',
    );
    final $s60 = State('zzz');
    final $r72 = $r62($s60) as dynamic;
    expect(
      $r72,
      isNotNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'zzz\'\nresult != null',
    );
    expect(
      $s60.position,
      3,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'zzz\'\nstate.position = 3',
    );
    expect(
      $r72.$1,
      [122, 122, 122],
      reason:
          '@while (2) {\n  [a] / [z]\n}\n\'zzz\'\nresult.\$1 != [122, 122, 122]',
    );
    final $s61 = State('zzz');
    final $r73 = $r63($s61) as dynamic;
    expect(
      $r73,
      isNotNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'zzz\'\nresult != null',
    );
    expect(
      $s61.position,
      3,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'zzz\'\nstate.position = 3',
    );
    expect(
      $r73.$1,
      null,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'zzz\'\nresult.\$1 != null',
    );
    final $s62 = State('');
    final $r74 = $r62($s62) as dynamic;
    expect(
      $r74,
      isNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'\'\nresult == null',
    );
    expect(
      $s62.farthestPosition,
      0,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s62.position,
      0,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'\'\nstate.position = 0',
    );
    final $e14 = $s62.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e14.length,
      1,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'\'\nerror count',
    );
    expect($e14, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (2) {\n  [a] / [z]\n}\n\'\'\nerrors');
    final $s63 = State('');
    final $r75 = $r63($s63) as dynamic;
    expect(
      $r75,
      isNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'\'\nresult == null',
    );
    expect(
      $s63.farthestPosition,
      0,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s63.position,
      0,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'\'\nstate.position = 0',
    );
    final $e15 = $s63.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e15.length,
      1,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'\'\nerror count',
    );
    expect($e15, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (2) {\n  [a] / [z]\n}\n\'\'\nerrors');
    final $s64 = State('a');
    final $r76 = $r62($s64) as dynamic;
    expect(
      $r76,
      isNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'a\'\nresult == null',
    );
    expect(
      $s64.farthestPosition,
      1,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      $s64.position,
      0,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'a\'\nstate.position = 0',
    );
    final $e16 = $s64.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e16.length,
      1,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'a\'\nerror count',
    );
    expect($e16, [
      '(end: 1, message: Unexpected input data, start: 1)',
    ], reason: '@while (2) {\n  [a] / [z]\n}\n\'a\'\nerrors');
    final $s65 = State('a');
    final $r77 = $r63($s65) as dynamic;
    expect(
      $r77,
      isNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'a\'\nresult == null',
    );
    expect(
      $s65.farthestPosition,
      1,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      $s65.position,
      0,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'a\'\nstate.position = 0',
    );
    final $e17 = $s65.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e17.length,
      1,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'a\'\nerror count',
    );
    expect($e17, [
      '(end: 1, message: Unexpected input data, start: 1)',
    ], reason: '@while (2) {\n  [a] / [z]\n}\n\'a\'\nerrors');
    final $s66 = State('b');
    final $r78 = $r62($s66) as dynamic;
    expect(
      $r78,
      isNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'b\'\nresult == null',
    );
    expect(
      $s66.farthestPosition,
      0,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      $s66.position,
      0,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'b\'\nstate.position = 0',
    );
    final $e18 = $s66.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e18.length,
      1,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'b\'\nerror count',
    );
    expect($e18, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (2) {\n  [a] / [z]\n}\n\'b\'\nerrors');
    final $s67 = State('b');
    final $r79 = $r63($s67) as dynamic;
    expect(
      $r79,
      isNull,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'b\'\nresult == null',
    );
    expect(
      $s67.farthestPosition,
      0,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      $s67.position,
      0,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'b\'\nstate.position = 0',
    );
    final $e19 = $s67.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e19.length,
      1,
      reason: '@while (2) {\n  [a] / [z]\n}\n\'b\'\nerror count',
    );
    expect($e19, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (2) {\n  [a] / [z]\n}\n\'b\'\nerrors');
    final $r80 = parser.parseWhile6;
    final $r81 = parser.parseWhileVoid6;
    final $s68 = State('a');
    final $r82 = $r80($s68) as dynamic;
    expect(
      $r82,
      isNotNull,
      reason: '@while (0, 1) {\n  [a]\n}\n\'a\'\nresult != null',
    );
    expect(
      $s68.position,
      1,
      reason: '@while (0, 1) {\n  [a]\n}\n\'a\'\nstate.position = 1',
    );
    expect($r82.$1, [
      97,
    ], reason: '@while (0, 1) {\n  [a]\n}\n\'a\'\nresult.\$1 != [97]');
    final $s69 = State('a');
    final $r83 = $r81($s69) as dynamic;
    expect(
      $r83,
      isNotNull,
      reason: '@while (0, 1) {\n  [a]\n}\n\'a\'\nresult != null',
    );
    expect(
      $s69.position,
      1,
      reason: '@while (0, 1) {\n  [a]\n}\n\'a\'\nstate.position = 1',
    );
    expect(
      $r83.$1,
      null,
      reason: '@while (0, 1) {\n  [a]\n}\n\'a\'\nresult.\$1 != null',
    );
    final $s70 = State('aa');
    final $r84 = $r80($s70) as dynamic;
    expect(
      $r84,
      isNotNull,
      reason: '@while (0, 1) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      $s70.position,
      1,
      reason: '@while (0, 1) {\n  [a]\n}\n\'aa\'\nstate.position = 1',
    );
    expect($r84.$1, [
      97,
    ], reason: '@while (0, 1) {\n  [a]\n}\n\'aa\'\nresult.\$1 != [97]');
    final $s71 = State('aa');
    final $r85 = $r81($s71) as dynamic;
    expect(
      $r85,
      isNotNull,
      reason: '@while (0, 1) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      $s71.position,
      1,
      reason: '@while (0, 1) {\n  [a]\n}\n\'aa\'\nstate.position = 1',
    );
    expect(
      $r85.$1,
      null,
      reason: '@while (0, 1) {\n  [a]\n}\n\'aa\'\nresult.\$1 != null',
    );
    final $s72 = State('');
    final $r86 = $r80($s72) as dynamic;
    expect(
      $r86,
      isNotNull,
      reason: '@while (0, 1) {\n  [a]\n}\n\'\'\nresult != null',
    );
    expect(
      $s72.position,
      0,
      reason: '@while (0, 1) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    expect(
      $r86.$1,
      <int>[],
      reason: '@while (0, 1) {\n  [a]\n}\n\'\'\nresult.\$1 != <int>[]',
    );
    final $s73 = State('');
    final $r87 = $r81($s73) as dynamic;
    expect(
      $r87,
      isNotNull,
      reason: '@while (0, 1) {\n  [a]\n}\n\'\'\nresult != null',
    );
    expect(
      $s73.position,
      0,
      reason: '@while (0, 1) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    expect(
      $r87.$1,
      null,
      reason: '@while (0, 1) {\n  [a]\n}\n\'\'\nresult.\$1 != null',
    );
    final $s74 = State('b');
    final $r88 = $r80($s74) as dynamic;
    expect(
      $r88,
      isNotNull,
      reason: '@while (0, 1) {\n  [a]\n}\n\'b\'\nresult != null',
    );
    expect(
      $s74.position,
      0,
      reason: '@while (0, 1) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    expect(
      $r88.$1,
      <int>[],
      reason: '@while (0, 1) {\n  [a]\n}\n\'b\'\nresult.\$1 != <int>[]',
    );
    final $s75 = State('b');
    final $r89 = $r81($s75) as dynamic;
    expect(
      $r89,
      isNotNull,
      reason: '@while (0, 1) {\n  [a]\n}\n\'b\'\nresult != null',
    );
    expect(
      $s75.position,
      0,
      reason: '@while (0, 1) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    expect(
      $r89.$1,
      null,
      reason: '@while (0, 1) {\n  [a]\n}\n\'b\'\nresult.\$1 != null',
    );
    final $r90 = parser.parseWhile7;
    final $r91 = parser.parseWhileVoid7;
    final $s76 = State('a');
    final $r92 = $r90($s76) as dynamic;
    expect(
      $r92,
      isNotNull,
      reason: '@while (0, 2) {\n  [a]\n}\n\'a\'\nresult != null',
    );
    expect(
      $s76.position,
      1,
      reason: '@while (0, 2) {\n  [a]\n}\n\'a\'\nstate.position = 1',
    );
    expect($r92.$1, [
      97,
    ], reason: '@while (0, 2) {\n  [a]\n}\n\'a\'\nresult.\$1 != [97]');
    final $s77 = State('a');
    final $r93 = $r91($s77) as dynamic;
    expect(
      $r93,
      isNotNull,
      reason: '@while (0, 2) {\n  [a]\n}\n\'a\'\nresult != null',
    );
    expect(
      $s77.position,
      1,
      reason: '@while (0, 2) {\n  [a]\n}\n\'a\'\nstate.position = 1',
    );
    expect(
      $r93.$1,
      null,
      reason: '@while (0, 2) {\n  [a]\n}\n\'a\'\nresult.\$1 != null',
    );
    final $s78 = State('aa');
    final $r94 = $r90($s78) as dynamic;
    expect(
      $r94,
      isNotNull,
      reason: '@while (0, 2) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      $s78.position,
      2,
      reason: '@while (0, 2) {\n  [a]\n}\n\'aa\'\nstate.position = 2',
    );
    expect($r94.$1, [
      97,
      97,
    ], reason: '@while (0, 2) {\n  [a]\n}\n\'aa\'\nresult.\$1 != [97, 97]');
    final $s79 = State('aa');
    final $r95 = $r91($s79) as dynamic;
    expect(
      $r95,
      isNotNull,
      reason: '@while (0, 2) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      $s79.position,
      2,
      reason: '@while (0, 2) {\n  [a]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      $r95.$1,
      null,
      reason: '@while (0, 2) {\n  [a]\n}\n\'aa\'\nresult.\$1 != null',
    );
    final $s80 = State('aaa');
    final $r96 = $r90($s80) as dynamic;
    expect(
      $r96,
      isNotNull,
      reason: '@while (0, 2) {\n  [a]\n}\n\'aaa\'\nresult != null',
    );
    expect(
      $s80.position,
      2,
      reason: '@while (0, 2) {\n  [a]\n}\n\'aaa\'\nstate.position = 2',
    );
    expect(
      $r96.$1,
      [97, 97],
      reason: '@while (0, 2) {\n  [a]\n}\n\'aaa\'\nresult.\$1 != [97, 97]',
    );
    final $s81 = State('aaa');
    final $r97 = $r91($s81) as dynamic;
    expect(
      $r97,
      isNotNull,
      reason: '@while (0, 2) {\n  [a]\n}\n\'aaa\'\nresult != null',
    );
    expect(
      $s81.position,
      2,
      reason: '@while (0, 2) {\n  [a]\n}\n\'aaa\'\nstate.position = 2',
    );
    expect(
      $r97.$1,
      null,
      reason: '@while (0, 2) {\n  [a]\n}\n\'aaa\'\nresult.\$1 != null',
    );
    final $s82 = State('');
    final $r98 = $r90($s82) as dynamic;
    expect(
      $r98,
      isNotNull,
      reason: '@while (0, 2) {\n  [a]\n}\n\'\'\nresult != null',
    );
    expect(
      $s82.position,
      0,
      reason: '@while (0, 2) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    expect(
      $r98.$1,
      <int>[],
      reason: '@while (0, 2) {\n  [a]\n}\n\'\'\nresult.\$1 != <int>[]',
    );
    final $s83 = State('');
    final $r99 = $r91($s83) as dynamic;
    expect(
      $r99,
      isNotNull,
      reason: '@while (0, 2) {\n  [a]\n}\n\'\'\nresult != null',
    );
    expect(
      $s83.position,
      0,
      reason: '@while (0, 2) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    expect(
      $r99.$1,
      null,
      reason: '@while (0, 2) {\n  [a]\n}\n\'\'\nresult.\$1 != null',
    );
    final $s84 = State('b');
    final $r100 = $r90($s84) as dynamic;
    expect(
      $r100,
      isNotNull,
      reason: '@while (0, 2) {\n  [a]\n}\n\'b\'\nresult != null',
    );
    expect(
      $s84.position,
      0,
      reason: '@while (0, 2) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    expect(
      $r100.$1,
      <int>[],
      reason: '@while (0, 2) {\n  [a]\n}\n\'b\'\nresult.\$1 != <int>[]',
    );
    final $s85 = State('b');
    final $r101 = $r91($s85) as dynamic;
    expect(
      $r101,
      isNotNull,
      reason: '@while (0, 2) {\n  [a]\n}\n\'b\'\nresult != null',
    );
    expect(
      $s85.position,
      0,
      reason: '@while (0, 2) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    expect(
      $r101.$1,
      null,
      reason: '@while (0, 2) {\n  [a]\n}\n\'b\'\nresult.\$1 != null',
    );
    final $r102 = parser.parseWhile8;
    final $r103 = parser.parseWhileVoid8;
    final $s86 = State('a');
    final $r104 = $r102($s86) as dynamic;
    expect(
      $r104,
      isNotNull,
      reason: '@while (1, 1) {\n  [a]\n}\n\'a\'\nresult != null',
    );
    expect(
      $s86.position,
      1,
      reason: '@while (1, 1) {\n  [a]\n}\n\'a\'\nstate.position = 1',
    );
    expect($r104.$1, [
      97,
    ], reason: '@while (1, 1) {\n  [a]\n}\n\'a\'\nresult.\$1 != [97]');
    final $s87 = State('a');
    final $r105 = $r103($s87) as dynamic;
    expect(
      $r105,
      isNotNull,
      reason: '@while (1, 1) {\n  [a]\n}\n\'a\'\nresult != null',
    );
    expect(
      $s87.position,
      1,
      reason: '@while (1, 1) {\n  [a]\n}\n\'a\'\nstate.position = 1',
    );
    expect(
      $r105.$1,
      null,
      reason: '@while (1, 1) {\n  [a]\n}\n\'a\'\nresult.\$1 != null',
    );
    final $s88 = State('aa');
    final $r106 = $r102($s88) as dynamic;
    expect(
      $r106,
      isNotNull,
      reason: '@while (1, 1) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      $s88.position,
      1,
      reason: '@while (1, 1) {\n  [a]\n}\n\'aa\'\nstate.position = 1',
    );
    expect($r106.$1, [
      97,
    ], reason: '@while (1, 1) {\n  [a]\n}\n\'aa\'\nresult.\$1 != [97]');
    final $s89 = State('aa');
    final $r107 = $r103($s89) as dynamic;
    expect(
      $r107,
      isNotNull,
      reason: '@while (1, 1) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      $s89.position,
      1,
      reason: '@while (1, 1) {\n  [a]\n}\n\'aa\'\nstate.position = 1',
    );
    expect(
      $r107.$1,
      null,
      reason: '@while (1, 1) {\n  [a]\n}\n\'aa\'\nresult.\$1 != null',
    );
    final $s90 = State('');
    final $r108 = $r102($s90) as dynamic;
    expect(
      $r108,
      isNull,
      reason: '@while (1, 1) {\n  [a]\n}\n\'\'\nresult == null',
    );
    expect(
      $s90.farthestPosition,
      0,
      reason: '@while (1, 1) {\n  [a]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s90.position,
      0,
      reason: '@while (1, 1) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    final $e20 = $s90.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e20.length,
      1,
      reason: '@while (1, 1) {\n  [a]\n}\n\'\'\nerror count',
    );
    expect($e20, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (1, 1) {\n  [a]\n}\n\'\'\nerrors');
    final $s91 = State('');
    final $r109 = $r103($s91) as dynamic;
    expect(
      $r109,
      isNull,
      reason: '@while (1, 1) {\n  [a]\n}\n\'\'\nresult == null',
    );
    expect(
      $s91.farthestPosition,
      0,
      reason: '@while (1, 1) {\n  [a]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s91.position,
      0,
      reason: '@while (1, 1) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    final $e21 = $s91.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e21.length,
      1,
      reason: '@while (1, 1) {\n  [a]\n}\n\'\'\nerror count',
    );
    expect($e21, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (1, 1) {\n  [a]\n}\n\'\'\nerrors');
    final $s92 = State('b');
    final $r110 = $r102($s92) as dynamic;
    expect(
      $r110,
      isNull,
      reason: '@while (1, 1) {\n  [a]\n}\n\'b\'\nresult == null',
    );
    expect(
      $s92.farthestPosition,
      0,
      reason: '@while (1, 1) {\n  [a]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      $s92.position,
      0,
      reason: '@while (1, 1) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    final $e22 = $s92.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e22.length,
      1,
      reason: '@while (1, 1) {\n  [a]\n}\n\'b\'\nerror count',
    );
    expect($e22, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (1, 1) {\n  [a]\n}\n\'b\'\nerrors');
    final $s93 = State('b');
    final $r111 = $r103($s93) as dynamic;
    expect(
      $r111,
      isNull,
      reason: '@while (1, 1) {\n  [a]\n}\n\'b\'\nresult == null',
    );
    expect(
      $s93.farthestPosition,
      0,
      reason: '@while (1, 1) {\n  [a]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      $s93.position,
      0,
      reason: '@while (1, 1) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    final $e23 = $s93.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e23.length,
      1,
      reason: '@while (1, 1) {\n  [a]\n}\n\'b\'\nerror count',
    );
    expect($e23, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (1, 1) {\n  [a]\n}\n\'b\'\nerrors');
    final $r112 = parser.parseWhile9;
    final $r113 = parser.parseWhileVoid9;
    final $s94 = State('aa');
    final $r114 = $r112($s94) as dynamic;
    expect(
      $r114,
      isNotNull,
      reason: '@while (2, 2) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      $s94.position,
      2,
      reason: '@while (2, 2) {\n  [a]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      $r114.$1,
      [97, 97],
      reason: '@while (2, 2) {\n  [a]\n}\n\'aa\'\nresult.\$1 != [97, 97]',
    );
    final $s95 = State('aa');
    final $r115 = $r113($s95) as dynamic;
    expect(
      $r115,
      isNotNull,
      reason: '@while (2, 2) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      $s95.position,
      2,
      reason: '@while (2, 2) {\n  [a]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      $r115.$1,
      null,
      reason: '@while (2, 2) {\n  [a]\n}\n\'aa\'\nresult.\$1 != null',
    );
    final $s96 = State('aaa');
    final $r116 = $r112($s96) as dynamic;
    expect(
      $r116,
      isNotNull,
      reason: '@while (2, 2) {\n  [a]\n}\n\'aaa\'\nresult != null',
    );
    expect(
      $s96.position,
      2,
      reason: '@while (2, 2) {\n  [a]\n}\n\'aaa\'\nstate.position = 2',
    );
    expect(
      $r116.$1,
      [97, 97],
      reason: '@while (2, 2) {\n  [a]\n}\n\'aaa\'\nresult.\$1 != [97, 97]',
    );
    final $s97 = State('aaa');
    final $r117 = $r113($s97) as dynamic;
    expect(
      $r117,
      isNotNull,
      reason: '@while (2, 2) {\n  [a]\n}\n\'aaa\'\nresult != null',
    );
    expect(
      $s97.position,
      2,
      reason: '@while (2, 2) {\n  [a]\n}\n\'aaa\'\nstate.position = 2',
    );
    expect(
      $r117.$1,
      null,
      reason: '@while (2, 2) {\n  [a]\n}\n\'aaa\'\nresult.\$1 != null',
    );
    final $s98 = State('');
    final $r118 = $r112($s98) as dynamic;
    expect(
      $r118,
      isNull,
      reason: '@while (2, 2) {\n  [a]\n}\n\'\'\nresult == null',
    );
    expect(
      $s98.farthestPosition,
      0,
      reason: '@while (2, 2) {\n  [a]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s98.position,
      0,
      reason: '@while (2, 2) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    final $e24 = $s98.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e24.length,
      1,
      reason: '@while (2, 2) {\n  [a]\n}\n\'\'\nerror count',
    );
    expect($e24, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (2, 2) {\n  [a]\n}\n\'\'\nerrors');
    final $s99 = State('');
    final $r119 = $r113($s99) as dynamic;
    expect(
      $r119,
      isNull,
      reason: '@while (2, 2) {\n  [a]\n}\n\'\'\nresult == null',
    );
    expect(
      $s99.farthestPosition,
      0,
      reason: '@while (2, 2) {\n  [a]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s99.position,
      0,
      reason: '@while (2, 2) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    final $e25 = $s99.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e25.length,
      1,
      reason: '@while (2, 2) {\n  [a]\n}\n\'\'\nerror count',
    );
    expect($e25, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (2, 2) {\n  [a]\n}\n\'\'\nerrors');
    final $s100 = State('a');
    final $r120 = $r112($s100) as dynamic;
    expect(
      $r120,
      isNull,
      reason: '@while (2, 2) {\n  [a]\n}\n\'a\'\nresult == null',
    );
    expect(
      $s100.farthestPosition,
      1,
      reason: '@while (2, 2) {\n  [a]\n}\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      $s100.position,
      0,
      reason: '@while (2, 2) {\n  [a]\n}\n\'a\'\nstate.position = 0',
    );
    final $e26 = $s100.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e26.length,
      1,
      reason: '@while (2, 2) {\n  [a]\n}\n\'a\'\nerror count',
    );
    expect($e26, [
      '(end: 1, message: Unexpected input data, start: 1)',
    ], reason: '@while (2, 2) {\n  [a]\n}\n\'a\'\nerrors');
    final $s101 = State('a');
    final $r121 = $r113($s101) as dynamic;
    expect(
      $r121,
      isNull,
      reason: '@while (2, 2) {\n  [a]\n}\n\'a\'\nresult == null',
    );
    expect(
      $s101.farthestPosition,
      1,
      reason: '@while (2, 2) {\n  [a]\n}\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      $s101.position,
      0,
      reason: '@while (2, 2) {\n  [a]\n}\n\'a\'\nstate.position = 0',
    );
    final $e27 = $s101.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e27.length,
      1,
      reason: '@while (2, 2) {\n  [a]\n}\n\'a\'\nerror count',
    );
    expect($e27, [
      '(end: 1, message: Unexpected input data, start: 1)',
    ], reason: '@while (2, 2) {\n  [a]\n}\n\'a\'\nerrors');
    final $s102 = State('b');
    final $r122 = $r112($s102) as dynamic;
    expect(
      $r122,
      isNull,
      reason: '@while (2, 2) {\n  [a]\n}\n\'b\'\nresult == null',
    );
    expect(
      $s102.farthestPosition,
      0,
      reason: '@while (2, 2) {\n  [a]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      $s102.position,
      0,
      reason: '@while (2, 2) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    final $e28 = $s102.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e28.length,
      1,
      reason: '@while (2, 2) {\n  [a]\n}\n\'b\'\nerror count',
    );
    expect($e28, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (2, 2) {\n  [a]\n}\n\'b\'\nerrors');
    final $s103 = State('b');
    final $r123 = $r113($s103) as dynamic;
    expect(
      $r123,
      isNull,
      reason: '@while (2, 2) {\n  [a]\n}\n\'b\'\nresult == null',
    );
    expect(
      $s103.farthestPosition,
      0,
      reason: '@while (2, 2) {\n  [a]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      $s103.position,
      0,
      reason: '@while (2, 2) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    final $e29 = $s103.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e29.length,
      1,
      reason: '@while (2, 2) {\n  [a]\n}\n\'b\'\nerror count',
    );
    expect($e29, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (2, 2) {\n  [a]\n}\n\'b\'\nerrors');
    final $r124 = parser.parseWhile10;
    final $r125 = parser.parseWhileVoid10;
    final $s104 = State('aa');
    final $r126 = $r124($s104) as dynamic;
    expect(
      $r126,
      isNotNull,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      $s104.position,
      2,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      $r126.$1,
      [97, 97],
      reason: '@while (2, 3) {\n  [a]\n}\n\'aa\'\nresult.\$1 != [97, 97]',
    );
    final $s105 = State('aa');
    final $r127 = $r125($s105) as dynamic;
    expect(
      $r127,
      isNotNull,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aa\'\nresult != null',
    );
    expect(
      $s105.position,
      2,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aa\'\nstate.position = 2',
    );
    expect(
      $r127.$1,
      null,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aa\'\nresult.\$1 != null',
    );
    final $s106 = State('aaa');
    final $r128 = $r124($s106) as dynamic;
    expect(
      $r128,
      isNotNull,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aaa\'\nresult != null',
    );
    expect(
      $s106.position,
      3,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aaa\'\nstate.position = 3',
    );
    expect(
      $r128.$1,
      [97, 97, 97],
      reason: '@while (2, 3) {\n  [a]\n}\n\'aaa\'\nresult.\$1 != [97, 97, 97]',
    );
    final $s107 = State('aaa');
    final $r129 = $r125($s107) as dynamic;
    expect(
      $r129,
      isNotNull,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aaa\'\nresult != null',
    );
    expect(
      $s107.position,
      3,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aaa\'\nstate.position = 3',
    );
    expect(
      $r129.$1,
      null,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aaa\'\nresult.\$1 != null',
    );
    final $s108 = State('aaaa');
    final $r130 = $r124($s108) as dynamic;
    expect(
      $r130,
      isNotNull,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aaaa\'\nresult != null',
    );
    expect(
      $s108.position,
      3,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aaaa\'\nstate.position = 3',
    );
    expect(
      $r130.$1,
      [97, 97, 97],
      reason: '@while (2, 3) {\n  [a]\n}\n\'aaaa\'\nresult.\$1 != [97, 97, 97]',
    );
    final $s109 = State('aaaa');
    final $r131 = $r125($s109) as dynamic;
    expect(
      $r131,
      isNotNull,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aaaa\'\nresult != null',
    );
    expect(
      $s109.position,
      3,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aaaa\'\nstate.position = 3',
    );
    expect(
      $r131.$1,
      null,
      reason: '@while (2, 3) {\n  [a]\n}\n\'aaaa\'\nresult.\$1 != null',
    );
    final $s110 = State('');
    final $r132 = $r124($s110) as dynamic;
    expect(
      $r132,
      isNull,
      reason: '@while (2, 3) {\n  [a]\n}\n\'\'\nresult == null',
    );
    expect(
      $s110.farthestPosition,
      0,
      reason: '@while (2, 3) {\n  [a]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s110.position,
      0,
      reason: '@while (2, 3) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    final $e30 = $s110.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e30.length,
      1,
      reason: '@while (2, 3) {\n  [a]\n}\n\'\'\nerror count',
    );
    expect($e30, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (2, 3) {\n  [a]\n}\n\'\'\nerrors');
    final $s111 = State('');
    final $r133 = $r125($s111) as dynamic;
    expect(
      $r133,
      isNull,
      reason: '@while (2, 3) {\n  [a]\n}\n\'\'\nresult == null',
    );
    expect(
      $s111.farthestPosition,
      0,
      reason: '@while (2, 3) {\n  [a]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s111.position,
      0,
      reason: '@while (2, 3) {\n  [a]\n}\n\'\'\nstate.position = 0',
    );
    final $e31 = $s111.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e31.length,
      1,
      reason: '@while (2, 3) {\n  [a]\n}\n\'\'\nerror count',
    );
    expect($e31, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (2, 3) {\n  [a]\n}\n\'\'\nerrors');
    final $s112 = State('a');
    final $r134 = $r124($s112) as dynamic;
    expect(
      $r134,
      isNull,
      reason: '@while (2, 3) {\n  [a]\n}\n\'a\'\nresult == null',
    );
    expect(
      $s112.farthestPosition,
      1,
      reason: '@while (2, 3) {\n  [a]\n}\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      $s112.position,
      0,
      reason: '@while (2, 3) {\n  [a]\n}\n\'a\'\nstate.position = 0',
    );
    final $e32 = $s112.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e32.length,
      1,
      reason: '@while (2, 3) {\n  [a]\n}\n\'a\'\nerror count',
    );
    expect($e32, [
      '(end: 1, message: Unexpected input data, start: 1)',
    ], reason: '@while (2, 3) {\n  [a]\n}\n\'a\'\nerrors');
    final $s113 = State('a');
    final $r135 = $r125($s113) as dynamic;
    expect(
      $r135,
      isNull,
      reason: '@while (2, 3) {\n  [a]\n}\n\'a\'\nresult == null',
    );
    expect(
      $s113.farthestPosition,
      1,
      reason: '@while (2, 3) {\n  [a]\n}\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      $s113.position,
      0,
      reason: '@while (2, 3) {\n  [a]\n}\n\'a\'\nstate.position = 0',
    );
    final $e33 = $s113.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e33.length,
      1,
      reason: '@while (2, 3) {\n  [a]\n}\n\'a\'\nerror count',
    );
    expect($e33, [
      '(end: 1, message: Unexpected input data, start: 1)',
    ], reason: '@while (2, 3) {\n  [a]\n}\n\'a\'\nerrors');
    final $s114 = State('b');
    final $r136 = $r124($s114) as dynamic;
    expect(
      $r136,
      isNull,
      reason: '@while (2, 3) {\n  [a]\n}\n\'b\'\nresult == null',
    );
    expect(
      $s114.farthestPosition,
      0,
      reason: '@while (2, 3) {\n  [a]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      $s114.position,
      0,
      reason: '@while (2, 3) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    final $e34 = $s114.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e34.length,
      1,
      reason: '@while (2, 3) {\n  [a]\n}\n\'b\'\nerror count',
    );
    expect($e34, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (2, 3) {\n  [a]\n}\n\'b\'\nerrors');
    final $s115 = State('b');
    final $r137 = $r125($s115) as dynamic;
    expect(
      $r137,
      isNull,
      reason: '@while (2, 3) {\n  [a]\n}\n\'b\'\nresult == null',
    );
    expect(
      $s115.farthestPosition,
      0,
      reason: '@while (2, 3) {\n  [a]\n}\n\'b\'\nstate.farthestPosition = 0',
    );
    expect(
      $s115.position,
      0,
      reason: '@while (2, 3) {\n  [a]\n}\n\'b\'\nstate.position = 0',
    );
    final $e35 = $s115.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e35.length,
      1,
      reason: '@while (2, 3) {\n  [a]\n}\n\'b\'\nerror count',
    );
    expect($e35, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '@while (2, 3) {\n  [a]\n}\n\'b\'\nerrors');
    final $r138 = parser.parseWhile11;
    final $r139 = parser.parseWhileVoid11;
    final $s116 = State('ac');
    final $r140 = $r138($s116) as dynamic;
    expect(
      $r140,
      isNotNull,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'ac\'\nresult != null',
    );
    expect(
      $s116.position,
      2,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'ac\'\nstate.position = 2',
    );
    expect(
      $r140.$1,
      [99],
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'ac\'\nresult.\$1 != [99]',
    );
    final $s117 = State('ac');
    final $r141 = $r139($s117) as dynamic;
    expect(
      $r141,
      isNotNull,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'ac\'\nresult != null',
    );
    expect(
      $s117.position,
      2,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'ac\'\nstate.position = 2',
    );
    expect(
      $r141.$1,
      null,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'ac\'\nresult.\$1 != null',
    );
    final $s118 = State('bc');
    final $r142 = $r138($s118) as dynamic;
    expect(
      $r142,
      isNotNull,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'bc\'\nresult != null',
    );
    expect(
      $s118.position,
      2,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'bc\'\nstate.position = 2',
    );
    expect(
      $r142.$1,
      [99],
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'bc\'\nresult.\$1 != [99]',
    );
    final $s119 = State('bc');
    final $r143 = $r139($s119) as dynamic;
    expect(
      $r143,
      isNotNull,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'bc\'\nresult != null',
    );
    expect(
      $s119.position,
      2,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'bc\'\nstate.position = 2',
    );
    expect(
      $r143.$1,
      null,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'bc\'\nresult.\$1 != null',
    );
    final $s120 = State('bcc');
    final $r144 = $r138($s120) as dynamic;
    expect(
      $r144,
      isNotNull,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'bcc\'\nresult != null',
    );
    expect(
      $s120.position,
      3,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'bcc\'\nstate.position = 3',
    );
    expect(
      $r144.$1,
      [99, 99],
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'bcc\'\nresult.\$1 != [99, 99]',
    );
    final $s121 = State('bcc');
    final $r145 = $r139($s121) as dynamic;
    expect(
      $r145,
      isNotNull,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'bcc\'\nresult != null',
    );
    expect(
      $s121.position,
      3,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'bcc\'\nstate.position = 3',
    );
    expect(
      $r145.$1,
      null,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'bcc\'\nresult.\$1 != null',
    );
    final $s122 = State('');
    final $r146 = $r138($s122) as dynamic;
    expect(
      $r146,
      isNull,
      reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'\'\nresult == null',
    );
    expect(
      $s122.farthestPosition,
      0,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s122.position,
      0,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'\'\nstate.position = 0',
    );
    final $e36 = $s122.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e36.length,
      1,
      reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'\'\nerror count',
    );
    expect($e36, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'\'\nerrors');
    final $s123 = State('');
    final $r147 = $r139($s123) as dynamic;
    expect(
      $r147,
      isNull,
      reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'\'\nresult == null',
    );
    expect(
      $s123.farthestPosition,
      0,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s123.position,
      0,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'\'\nstate.position = 0',
    );
    final $e37 = $s123.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e37.length,
      1,
      reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'\'\nerror count',
    );
    expect($e37, [
      '(end: 0, message: Unexpected input data, start: 0)',
    ], reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'\'\nerrors');
    final $s124 = State('a');
    final $r148 = $r138($s124) as dynamic;
    expect(
      $r148,
      isNull,
      reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'a\'\nresult == null',
    );
    expect(
      $s124.farthestPosition,
      1,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      $s124.position,
      0,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'a\'\nstate.position = 0',
    );
    final $e38 = $s124.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e38.length,
      1,
      reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'a\'\nerror count',
    );
    expect($e38, [
      '(end: 1, message: Unexpected input data, start: 1)',
    ], reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'a\'\nerrors');
    final $s125 = State('a');
    final $r149 = $r139($s125) as dynamic;
    expect(
      $r149,
      isNull,
      reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'a\'\nresult == null',
    );
    expect(
      $s125.farthestPosition,
      1,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'a\'\nstate.farthestPosition = 1',
    );
    expect(
      $s125.position,
      0,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'a\'\nstate.position = 0',
    );
    final $e39 = $s125.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e39.length,
      1,
      reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'a\'\nerror count',
    );
    expect($e39, [
      '(end: 1, message: Unexpected input data, start: 1)',
    ], reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'a\'\nerrors');
    final $s126 = State('b');
    final $r150 = $r138($s126) as dynamic;
    expect(
      $r150,
      isNull,
      reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'b\'\nresult == null',
    );
    expect(
      $s126.farthestPosition,
      1,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'b\'\nstate.farthestPosition = 1',
    );
    expect(
      $s126.position,
      0,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'b\'\nstate.position = 0',
    );
    final $e40 = $s126.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e40.length,
      1,
      reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'b\'\nerror count',
    );
    expect($e40, [
      '(end: 1, message: Unexpected input data, start: 1)',
    ], reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'b\'\nerrors');
    final $s127 = State('b');
    final $r151 = $r139($s127) as dynamic;
    expect(
      $r151,
      isNull,
      reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'b\'\nresult == null',
    );
    expect(
      $s127.farthestPosition,
      1,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'b\'\nstate.farthestPosition = 1',
    );
    expect(
      $s127.position,
      0,
      reason:
          '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'b\'\nstate.position = 0',
    );
    final $e41 = $s127.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e41.length,
      1,
      reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'b\'\nerror count',
    );
    expect($e41, [
      '(end: 1, message: Unexpected input data, start: 1)',
    ], reason: '([a] / [b])\n\$ = @while (1) {\n  [c]\n}\n\'b\'\nerrors');
  });

  test('ZeroOrMore', () {
    final $r = parser.parseZeroOrMore0;
    final $r1 = parser.parseZeroOrMoreVoid0;
    final $s = State('a');
    final $r2 = $r($s) as dynamic;
    expect($r2, isNotNull, reason: '[a]*\n\'a\'\nresult != null');
    expect($s.position, 1, reason: '[a]*\n\'a\'\nstate.position = 1');
    expect($r2.$1, [97], reason: '[a]*\n\'a\'\nresult.\$1 != [97]');
    final $s1 = State('a');
    final $r3 = $r1($s1) as dynamic;
    expect($r3, isNotNull, reason: '[a]*\n\'a\'\nresult != null');
    expect($s1.position, 1, reason: '[a]*\n\'a\'\nstate.position = 1');
    expect($r3.$1, null, reason: '[a]*\n\'a\'\nresult.\$1 != null');
    final $s2 = State('aa');
    final $r4 = $r($s2) as dynamic;
    expect($r4, isNotNull, reason: '[a]*\n\'aa\'\nresult != null');
    expect($s2.position, 2, reason: '[a]*\n\'aa\'\nstate.position = 2');
    expect($r4.$1, [97, 97], reason: '[a]*\n\'aa\'\nresult.\$1 != [97, 97]');
    final $s3 = State('aa');
    final $r5 = $r1($s3) as dynamic;
    expect($r5, isNotNull, reason: '[a]*\n\'aa\'\nresult != null');
    expect($s3.position, 2, reason: '[a]*\n\'aa\'\nstate.position = 2');
    expect($r5.$1, null, reason: '[a]*\n\'aa\'\nresult.\$1 != null');
    final $s4 = State('');
    final $r6 = $r($s4) as dynamic;
    expect($r6, isNotNull, reason: '[a]*\n\'\'\nresult != null');
    expect($s4.position, 0, reason: '[a]*\n\'\'\nstate.position = 0');
    expect($r6.$1, <int>[], reason: '[a]*\n\'\'\nresult.\$1 != <int>[]');
    final $s5 = State('');
    final $r7 = $r1($s5) as dynamic;
    expect($r7, isNotNull, reason: '[a]*\n\'\'\nresult != null');
    expect($s5.position, 0, reason: '[a]*\n\'\'\nstate.position = 0');
    expect($r7.$1, null, reason: '[a]*\n\'\'\nresult.\$1 != null');
    final $s6 = State('b');
    final $r8 = $r($s6) as dynamic;
    expect($r8, isNotNull, reason: '[a]*\n\'b\'\nresult != null');
    expect($s6.position, 0, reason: '[a]*\n\'b\'\nstate.position = 0');
    expect($r8.$1, <int>[], reason: '[a]*\n\'b\'\nresult.\$1 != <int>[]');
    final $s7 = State('b');
    final $r9 = $r1($s7) as dynamic;
    expect($r9, isNotNull, reason: '[a]*\n\'b\'\nresult != null');
    expect($s7.position, 0, reason: '[a]*\n\'b\'\nstate.position = 0');
    expect($r9.$1, null, reason: '[a]*\n\'b\'\nresult.\$1 != null');
    final $r10 = parser.parseZeroOrMore1;
    final $r11 = parser.parseZeroOrMoreVoid1;
    final $s8 = State('a');
    final $r12 = $r10($s8) as dynamic;
    expect($r12, isNotNull, reason: '([a] / [z])*\n\'a\'\nresult != null');
    expect($s8.position, 1, reason: '([a] / [z])*\n\'a\'\nstate.position = 1');
    expect($r12.$1, [97], reason: '([a] / [z])*\n\'a\'\nresult.\$1 != [97]');
    final $s9 = State('a');
    final $r13 = $r11($s9) as dynamic;
    expect($r13, isNotNull, reason: '([a] / [z])*\n\'a\'\nresult != null');
    expect($s9.position, 1, reason: '([a] / [z])*\n\'a\'\nstate.position = 1');
    expect($r13.$1, null, reason: '([a] / [z])*\n\'a\'\nresult.\$1 != null');
    final $s10 = State('aa');
    final $r14 = $r10($s10) as dynamic;
    expect($r14, isNotNull, reason: '([a] / [z])*\n\'aa\'\nresult != null');
    expect(
      $s10.position,
      2,
      reason: '([a] / [z])*\n\'aa\'\nstate.position = 2',
    );
    expect($r14.$1, [
      97,
      97,
    ], reason: '([a] / [z])*\n\'aa\'\nresult.\$1 != [97, 97]');
    final $s11 = State('aa');
    final $r15 = $r11($s11) as dynamic;
    expect($r15, isNotNull, reason: '([a] / [z])*\n\'aa\'\nresult != null');
    expect(
      $s11.position,
      2,
      reason: '([a] / [z])*\n\'aa\'\nstate.position = 2',
    );
    expect($r15.$1, null, reason: '([a] / [z])*\n\'aa\'\nresult.\$1 != null');
    final $s12 = State('z');
    final $r16 = $r10($s12) as dynamic;
    expect($r16, isNotNull, reason: '([a] / [z])*\n\'z\'\nresult != null');
    expect($s12.position, 1, reason: '([a] / [z])*\n\'z\'\nstate.position = 1');
    expect($r16.$1, [122], reason: '([a] / [z])*\n\'z\'\nresult.\$1 != [122]');
    final $s13 = State('z');
    final $r17 = $r11($s13) as dynamic;
    expect($r17, isNotNull, reason: '([a] / [z])*\n\'z\'\nresult != null');
    expect($s13.position, 1, reason: '([a] / [z])*\n\'z\'\nstate.position = 1');
    expect($r17.$1, null, reason: '([a] / [z])*\n\'z\'\nresult.\$1 != null');
    final $s14 = State('za');
    final $r18 = $r10($s14) as dynamic;
    expect($r18, isNotNull, reason: '([a] / [z])*\n\'za\'\nresult != null');
    expect(
      $s14.position,
      2,
      reason: '([a] / [z])*\n\'za\'\nstate.position = 2',
    );
    expect($r18.$1, [
      122,
      97,
    ], reason: '([a] / [z])*\n\'za\'\nresult.\$1 != [122, 97]');
    final $s15 = State('za');
    final $r19 = $r11($s15) as dynamic;
    expect($r19, isNotNull, reason: '([a] / [z])*\n\'za\'\nresult != null');
    expect(
      $s15.position,
      2,
      reason: '([a] / [z])*\n\'za\'\nstate.position = 2',
    );
    expect($r19.$1, null, reason: '([a] / [z])*\n\'za\'\nresult.\$1 != null');
    final $s16 = State('');
    final $r20 = $r10($s16) as dynamic;
    expect($r20, isNotNull, reason: '([a] / [z])*\n\'\'\nresult != null');
    expect($s16.position, 0, reason: '([a] / [z])*\n\'\'\nstate.position = 0');
    expect(
      $r20.$1,
      <int>[],
      reason: '([a] / [z])*\n\'\'\nresult.\$1 != <int>[]',
    );
    final $s17 = State('');
    final $r21 = $r11($s17) as dynamic;
    expect($r21, isNotNull, reason: '([a] / [z])*\n\'\'\nresult != null');
    expect($s17.position, 0, reason: '([a] / [z])*\n\'\'\nstate.position = 0');
    expect($r21.$1, null, reason: '([a] / [z])*\n\'\'\nresult.\$1 != null');
    final $s18 = State('b');
    final $r22 = $r10($s18) as dynamic;
    expect($r22, isNotNull, reason: '([a] / [z])*\n\'b\'\nresult != null');
    expect($s18.position, 0, reason: '([a] / [z])*\n\'b\'\nstate.position = 0');
    expect(
      $r22.$1,
      <int>[],
      reason: '([a] / [z])*\n\'b\'\nresult.\$1 != <int>[]',
    );
    final $s19 = State('b');
    final $r23 = $r11($s19) as dynamic;
    expect($r23, isNotNull, reason: '([a] / [z])*\n\'b\'\nresult != null');
    expect($s19.position, 0, reason: '([a] / [z])*\n\'b\'\nstate.position = 0');
    expect($r23.$1, null, reason: '([a] / [z])*\n\'b\'\nresult.\$1 != null');
  });

  test('Identifier', () {
    final $r = parser.parseIdentifier0;
    final $r1 = parser.parseIdentifierVoid0;
    final $s = State('fo');
    final $r2 = $r($s) as dynamic;
    expect(
      $r2,
      isNotNull,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'fo\'\nresult != null',
    );
    expect(
      $s.position,
      2,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'fo\'\nstate.position = 2',
    );
    expect(
      $r2.$1,
      'fo',
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'fo\'\nresult.\$1 != \'fo\'',
    );
    final $s1 = State('fo');
    final $r3 = $r1($s1) as dynamic;
    expect(
      $r3,
      isNotNull,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'fo\'\nresult != null',
    );
    expect(
      $s1.position,
      2,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'fo\'\nstate.position = 2',
    );
    expect(
      $r3.$1,
      null,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'fo\'\nresult.\$1 != null',
    );
    final $s2 = State('fort');
    final $r4 = $r($s2) as dynamic;
    expect(
      $r4,
      isNotNull,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'fort\'\nresult != null',
    );
    expect(
      $s2.position,
      4,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'fort\'\nstate.position = 4',
    );
    expect(
      $r4.$1,
      'fort',
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'fort\'\nresult.\$1 != \'fort\'',
    );
    final $s3 = State('fort');
    final $r5 = $r1($s3) as dynamic;
    expect(
      $r5,
      isNotNull,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'fort\'\nresult != null',
    );
    expect(
      $s3.position,
      4,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'fort\'\nstate.position = 4',
    );
    expect(
      $r5.$1,
      null,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'fort\'\nresult.\$1 != null',
    );
    final $s4 = State('');
    final $r6 = $r($s4) as dynamic;
    expect(
      $r6,
      isNull,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'\'\nresult == null',
    );
    expect(
      $s4.farthestPosition,
      0,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s4.position,
      0,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'\'\nstate.position = 0',
    );
    final $e = $s4.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e.length,
      1,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'\'\nerror count',
    );
    expect(
      $e,
      ['(end: 0, message: Unexpected input data, start: 0)'],
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'\'\nerrors',
    );
    final $s5 = State('');
    final $r7 = $r1($s5) as dynamic;
    expect(
      $r7,
      isNull,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'\'\nresult == null',
    );
    expect(
      $s5.farthestPosition,
      0,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'\'\nstate.farthestPosition = 0',
    );
    expect(
      $s5.position,
      0,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'\'\nstate.position = 0',
    );
    final $e1 = $s5.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e1.length,
      1,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'\'\nerror count',
    );
    expect(
      $e1,
      ['(end: 0, message: Unexpected input data, start: 0)'],
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'\'\nerrors',
    );
    final $s6 = State('for');
    final $r8 = $r($s6) as dynamic;
    expect(
      $r8,
      isNull,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'for\'\nresult == null',
    );
    expect(
      $s6.farthestPosition,
      0,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'for\'\nstate.farthestPosition = 0',
    );
    expect(
      $s6.position,
      0,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'for\'\nstate.position = 0',
    );
    final $e2 = $s6.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e2.length,
      1,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'for\'\nerror count',
    );
    expect(
      $e2,
      ['(end: 0, message: Unexpected input data, start: 0)'],
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'for\'\nerrors',
    );
    final $s7 = State('for');
    final $r9 = $r1($s7) as dynamic;
    expect(
      $r9,
      isNull,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'for\'\nresult == null',
    );
    expect(
      $s7.farthestPosition,
      0,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'for\'\nstate.farthestPosition = 0',
    );
    expect(
      $s7.position,
      0,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'for\'\nstate.position = 0',
    );
    final $e3 = $s7.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e3.length,
      1,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'for\'\nerror count',
    );
    expect(
      $e3,
      ['(end: 0, message: Unexpected input data, start: 0)'],
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'for\'\nerrors',
    );
    final $s8 = State('foreach');
    final $r10 = $r($s8) as dynamic;
    expect(
      $r10,
      isNull,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'foreach\'\nresult == null',
    );
    expect(
      $s8.farthestPosition,
      0,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'foreach\'\nstate.farthestPosition = 0',
    );
    expect(
      $s8.position,
      0,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'foreach\'\nstate.position = 0',
    );
    final $e4 = $s8.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e4.length,
      1,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'foreach\'\nerror count',
    );
    expect(
      $e4,
      ['(end: 0, message: Unexpected input data, start: 0)'],
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'foreach\'\nerrors',
    );
    final $s9 = State('foreach');
    final $r11 = $r1($s9) as dynamic;
    expect(
      $r11,
      isNull,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'foreach\'\nresult == null',
    );
    expect(
      $s9.farthestPosition,
      0,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'foreach\'\nstate.farthestPosition = 0',
    );
    expect(
      $s9.position,
      0,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'foreach\'\nstate.position = 0',
    );
    final $e5 = $s9.getErrors().map((e) => '$e').toList()..sort();
    expect(
      $e5.length,
      1,
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'foreach\'\nerror count',
    );
    expect(
      $e5,
      ['(end: 0, message: Unexpected input data, start: 0)'],
      reason:
          '!(\n  (\n    "foreach"\n    ----\n    "for"\n  )\n  ! [a-zA-Z0-9]\n)\n\$ = <\n  [a-zA-Z]\n  [a-zA-Z0-9]*\n>\n\n\'foreach\'\nerrors',
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
    const $0 = 41;
    return const Ok($0);
  }

  /// [void] **ActionVoid0**
  /// ```txt
  /// `void` ActionVoid0 =>
  ///   $ = `const` { 41 }
  /// ```
  Result<void> parseActionVoid0(State state) {
    const $0 = 41;
    return Result.none;
  }

  /// [int] **Action1**
  /// ```txt
  /// `int` Action1 =>
  ///   $ = `const int` { 41 }
  /// ```
  Result<int> parseAction1(State state) {
    const int $0 = 41;
    return const Ok($0);
  }

  /// [void] **ActionVoid1**
  /// ```txt
  /// `void` ActionVoid1 =>
  ///   $ = `const int` { 41 }
  /// ```
  Result<void> parseActionVoid1(State state) {
    const int $0 = 41;
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
    const $0 = x;
    return const Ok($0);
  }

  /// [void] **ActionVoid2**
  /// ```txt
  /// `void` ActionVoid2 =>
  ///   { const x = 41; }
  ///   $ = `const` { x }
  /// ```
  Result<void> parseActionVoid2(State state) {
    const x = 41;
    const $0 = x;
    return Result.none;
  }

  /// [String] **AndPredicate0**
  /// ```txt
  /// `String` AndPredicate0 =>
  ///   & 'abc'
  ///   $ = 'abcd'
  /// ```
  Result<String>? parseAndPredicate0(State state) {
    state.predicate++;
    final $0 = state.position;
    final $1 = state.peek();
    if ($1 == 97 && state.startsWith('abc')) {
      state.position += 3;
      state.backtrack($0);
      state.predicate--;
      final $2 = state.peek();
      if ($2 == 97 && state.startsWith('abcd')) {
        state.position += 4;
        return const Ok('abcd');
      } else {
        state.errorExpected('abcd');
      }
    } else {
      state.errorExpected('abc');
      state.predicate--;
    }
    return null;
  }

  /// [void] **AndPredicateVoid0**
  /// ```txt
  /// `void` AndPredicateVoid0 =>
  ///   & 'abc'
  ///   $ = 'abcd'
  /// ```
  Result<void>? parseAndPredicateVoid0(State state) {
    state.predicate++;
    final $0 = state.position;
    final $1 = state.peek();
    if ($1 == 97 && state.startsWith('abc')) {
      state.position += 3;
      state.backtrack($0);
      state.predicate--;
      final $2 = state.peek();
      if ($2 == 97 && state.startsWith('abcd')) {
        state.position += 4;
        return Result.none;
      } else {
        state.errorExpected('abcd');
      }
    } else {
      state.errorExpected('abc');
      state.predicate--;
    }
    return null;
  }

  /// [void] **AndPredicate1**
  /// ```txt
  /// `void` AndPredicate1 =>
  ///   & 'abc'
  /// ```
  Result<void>? parseAndPredicate1(State state) {
    state.predicate++;
    final $0 = state.position;
    final $1 = state.peek();
    if ($1 == 97 && state.startsWith('abc')) {
      state.position += 3;
      state.backtrack($0);
      state.predicate--;
      return Result.none;
    } else {
      state.errorExpected('abc');
      state.predicate--;
    }
    return null;
  }

  /// [int] **AnyCharacter0**
  /// ```txt
  /// `int` AnyCharacter0 =>
  ///   .
  /// ```
  Result<int>? parseAnyCharacter0(State state) {
    final $0 = state.peek();
    if ($0 >= 0) {
      state.position += $0 > 0xffff ? 2 : 1;
      return Ok($0);
    }
    return null;
  }

  /// [void] **AnyCharacterVoid0**
  /// ```txt
  /// `void` AnyCharacterVoid0 =>
  ///   .
  /// ```
  Result<void>? parseAnyCharacterVoid0(State state) {
    final $0 = state.peek();
    if ($0 >= 0) {
      state.position += $0 > 0xffff ? 2 : 1;
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
    final $0 = state.position;
    final $1 = state.peek();
    // [a]
    if ($1 == 97) {
      state.position += 1;
      final $2 = state.substring($0, state.position);
      return Ok($2);
    }
    return null;
  }

  /// [void] **CaptureVoid0**
  /// ```txt
  /// `void` CaptureVoid0 =>
  ///   <[a]>
  /// ```
  Result<void>? parseCaptureVoid0(State state) {
    final $0 = state.peek();
    // [a]
    if ($0 == 97) {
      state.position += 1;
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
    final $0 = state.peek();
    // [a]
    if ($0 == 97) {
      state.position += 1;
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
    final $0 = state.position;
    final $1 = state.peek();
    // [a]
    if ($1 == 97) {
      state.position += 1;
      final $2 = state.substring($0, state.position);
      return Ok($2);
    }
    // [b]
    if ($1 == 98) {
      state.position += 1;
      final $3 = state.substring($0, state.position);
      return Ok($3);
    }
    return null;
  }

  /// [void] **CaptureVoid2**
  /// ```txt
  /// `void` CaptureVoid2 =>
  ///   <[a] / [b]>
  /// ```
  Result<void>? parseCaptureVoid2(State state) {
    final $0 = state.peek();
    // [a]
    if ($0 == 97) {
      state.position += 1;
      return Result.none;
    }
    // [b]
    if ($0 == 98) {
      state.position += 1;
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
    final $0 = state.position;
    final $1 = state.peek();
    // [a]
    if ($1 == 97) {
      state.position += 1;
      final $2 = state.position;
      final $3 = state.peek();
      // [b]
      if ($3 == 98) {
        state.position += 1;
        final $4 = state.substring($2, state.position);
        return Ok($4);
      }
      // [c]
      if ($3 == 99) {
        state.position += 1;
        final $5 = state.substring($2, state.position);
        return Ok($5);
      }
      state.backtrack($0);
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
    final $0 = state.position;
    final $1 = state.peek();
    // [a]
    if ($1 == 97) {
      state.position += 1;
      final $2 = state.position;
      final $3 = state.peek();
      // [b]
      if ($3 == 98) {
        state.position += 1;
        final $4 = state.substring($2, state.position);
        return Result.none;
      }
      // [c]
      if ($3 == 99) {
        state.position += 1;
        final $5 = state.substring($2, state.position);
        return Result.none;
      }
      state.backtrack($0);
    }
    return null;
  }

  /// [int] **CharacterClass0**
  /// ```txt
  /// `int` CharacterClass0 =>
  ///   [a]
  /// ```
  Result<int>? parseCharacterClass0(State state) {
    final $0 = state.peek();
    // [a]
    if ($0 == 97) {
      state.position += 1;
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
    final $0 = state.peek();
    // [a]
    if ($0 == 97) {
      state.position += 1;
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
    final $0 = state.peek();
    // [a-z]
    final $1 = $0 >= 97 && $0 <= 122;
    if ($1) {
      state.position += 1;
      return Ok($0);
    }
    return null;
  }

  /// [void] **CharacterClassVoid1**
  /// ```txt
  /// `void` CharacterClassVoid1 =>
  ///   [a-z]
  /// ```
  Result<void>? parseCharacterClassVoid1(State state) {
    final $0 = state.peek();
    // [a-z]
    final $1 = $0 >= 97 && $0 <= 122;
    if ($1) {
      state.position += 1;
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
    final $0 = state.peek();
    // [^a]
    final $1 = !($0 == 97) && !($0 < 0);
    if ($1) {
      state.position += $0 > 0xffff ? 2 : 1;
      return Ok($0);
    }
    return null;
  }

  /// [void] **CharacterClassVoid2**
  /// ```txt
  /// `void` CharacterClassVoid2 =>
  ///   [^a]
  /// ```
  Result<void>? parseCharacterClassVoid2(State state) {
    final $0 = state.peek();
    // [^a]
    final $1 = !($0 == 97) && !($0 < 0);
    if ($1) {
      state.position += $0 > 0xffff ? 2 : 1;
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
    final $0 = state.peek();
    // [^ab]
    final $1 = !($0 >= 97 && $0 <= 98) && !($0 < 0);
    if ($1) {
      state.position += $0 > 0xffff ? 2 : 1;
      return Ok($0);
    }
    return null;
  }

  /// [void] **CharacterClassVoid3**
  /// ```txt
  /// `void` CharacterClassVoid3 =>
  ///   [^ab]
  /// ```
  Result<void>? parseCharacterClassVoid3(State state) {
    final $0 = state.peek();
    // [^ab]
    final $1 = !($0 >= 97 && $0 <= 98) && !($0 < 0);
    if ($1) {
      state.position += $0 > 0xffff ? 2 : 1;
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
    final $0 = state.peek();
    // [^abc]
    final $1 = !($0 >= 97 && $0 <= 99) && !($0 < 0);
    if ($1) {
      state.position += $0 > 0xffff ? 2 : 1;
      return Ok($0);
    }
    return null;
  }

  /// [void] **CharacterClassVoid4**
  /// ```txt
  /// `void` CharacterClassVoid4 =>
  ///   [^abc]
  /// ```
  Result<void>? parseCharacterClassVoid4(State state) {
    final $0 = state.peek();
    // [^abc]
    final $1 = !($0 >= 97 && $0 <= 99) && !($0 < 0);
    if ($1) {
      state.position += $0 > 0xffff ? 2 : 1;
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
    final $0 = state.peek();
    // [^a-z]
    final $1 = !($0 >= 97 && $0 <= 122) && !($0 < 0);
    if ($1) {
      state.position += $0 > 0xffff ? 2 : 1;
      return Ok($0);
    }
    return null;
  }

  /// [void] **CharacterClassVoid5**
  /// ```txt
  /// `void` CharacterClassVoid5 =>
  ///   [^a-z]
  /// ```
  Result<void>? parseCharacterClassVoid5(State state) {
    final $0 = state.peek();
    // [^a-z]
    final $1 = !($0 >= 97 && $0 <= 122) && !($0 < 0);
    if ($1) {
      state.position += $0 > 0xffff ? 2 : 1;
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
    final $0 = state.peek();
    // [\^]
    if ($0 == 94) {
      state.position += 1;
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
    final $0 = state.peek();
    // [\^]
    if ($0 == 94) {
      state.position += 1;
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
    final $0 = state.peek();
    // [\-]
    if ($0 == 45) {
      state.position += 1;
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
    final $0 = state.peek();
    // [\-]
    if ($0 == 45) {
      state.position += 1;
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
    final $0 = state.peek();
    // [ ]
    if ($0 == 32) {
      state.position += 1;
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
    final $0 = state.peek();
    // [ ]
    if ($0 == 32) {
      state.position += 1;
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
    final $0 = state.peek();
    // [0-9]
    final $1 = $0 >= 48 && $0 <= 57;
    if ($1) {
      state.position += 1;
      return Ok($0);
    }
    return null;
  }

  /// [void] **CharacterClassVoid9**
  /// ```txt
  /// `void` CharacterClassVoid9 =>
  ///   [\u{30}-\u{39}]
  /// ```
  Result<void>? parseCharacterClassVoid9(State state) {
    final $0 = state.peek();
    // [0-9]
    final $1 = $0 >= 48 && $0 <= 57;
    if ($1) {
      state.position += 1;
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
    final $0 = state.peek();
    // [{0}]
    if ($0 == 0) {
      state.position += 1;
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
    final $0 = state.peek();
    // [{0}]
    if ($0 == 0) {
      state.position += 1;
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
    final $0 = state.peek();
    // [{0}-\t]
    final $1 = $0 >= 0 && $0 <= 9;
    if ($1) {
      state.position += 1;
      return Ok($0);
    }
    return null;
  }

  /// [void] **CharacterClassVoid11**
  /// ```txt
  /// `void` CharacterClassVoid11 =>
  ///   [\u{0}-\u{9}]
  /// ```
  Result<void>? parseCharacterClassVoid11(State state) {
    final $0 = state.peek();
    // [{0}-\t]
    final $1 = $0 >= 0 && $0 <= 9;
    if ($1) {
      state.position += 1;
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
    final $0 = state.peek();
    // [^{0}]
    final $1 = !($0 == 0) && !($0 < 0);
    if ($1) {
      state.position += $0 > 0xffff ? 2 : 1;
      return Ok($0);
    }
    return null;
  }

  /// [void] **CharacterClassVoid12**
  /// ```txt
  /// `void` CharacterClassVoid12 =>
  ///   [^\u{0}]
  /// ```
  Result<void>? parseCharacterClassVoid12(State state) {
    final $0 = state.peek();
    // [^{0}]
    final $1 = !($0 == 0) && !($0 < 0);
    if ($1) {
      state.position += $0 > 0xffff ? 2 : 1;
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
    final $0 = state.peek();
    // [^{0}-\t]
    final $1 = !($0 >= 0 && $0 <= 9) && !($0 < 0);
    if ($1) {
      state.position += $0 > 0xffff ? 2 : 1;
      return Ok($0);
    }
    return null;
  }

  /// [void] **CharacterClassVoid13**
  /// ```txt
  /// `void` CharacterClassVoid13 =>
  ///   [^\u{0}-\u{9}]
  /// ```
  Result<void>? parseCharacterClassVoid13(State state) {
    final $0 = state.peek();
    // [^{0}-\t]
    final $1 = !($0 >= 0 && $0 <= 9) && !($0 < 0);
    if ($1) {
      state.position += $0 > 0xffff ? 2 : 1;
      return Result.none;
    }
    return null;
  }

  /// [int] **Group0**
  /// ```txt
  /// `int` Group0 =>
  ///   ([a] / [z])
  /// ```
  Result<int>? parseGroup0(State state) {
    final $0 = state.peek();
    // [a]
    if ($0 == 97) {
      state.position += 1;
      return const Ok(97);
    }
    // [z]
    if ($0 == 122) {
      state.position += 1;
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
    final $0 = state.peek();
    // [a]
    if ($0 == 97) {
      state.position += 1;
      return Result.none;
    }
    // [z]
    if ($0 == 122) {
      state.position += 1;
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
    final $0 = state.peek();
    if ($0 == 97 && state.startsWith('abc')) {
      state.position += 3;
      return const Ok('abc');
    } else {
      state.errorExpected('abc');
    }
    return null;
  }

  /// [void] **LiteralVoid0**
  /// ```txt
  /// `void` LiteralVoid0 =>
  ///   'abc'
  /// ```
  Result<void>? parseLiteralVoid0(State state) {
    final $0 = state.peek();
    if ($0 == 97 && state.startsWith('abc')) {
      state.position += 3;
      return Result.none;
    } else {
      state.errorExpected('abc');
    }
    return null;
  }

  /// [String] **Literal1**
  /// ```txt
  /// `String` Literal1 =>
  ///   "abc"
  /// ```
  Result<String>? parseLiteral1(State state) {
    final $0 = state.peek();
    if ($0 == 97 && state.startsWith('abc')) {
      state.position += 3;
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
    final $0 = state.peek();
    if ($0 == 97 && state.startsWith('abc')) {
      state.position += 3;
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
    return const Ok('');
  }

  /// [void] **LiteralVoid2**
  /// ```txt
  /// `void` LiteralVoid2 =>
  ///   ""
  /// ```
  Result<void> parseLiteralVoid2(State state) {
    return Result.none;
  }

  /// [String] **Literal3**
  /// ```txt
  /// `String` Literal3 =>
  ///   ''
  /// ```
  Result<String> parseLiteral3(State state) {
    if (true) {
      return const Ok('');
    } else {
      state.errorExpected('');
    }
  }

  /// [void] **LiteralVoid3**
  /// ```txt
  /// `void` LiteralVoid3 =>
  ///   ''
  /// ```
  Result<void> parseLiteralVoid3(State state) {
    if (true) {
      return Result.none;
    } else {
      state.errorExpected('');
    }
  }

  /// [String] **Literal4**
  /// ```txt
  /// `String` Literal4 =>
  ///   "\r\n"
  /// ```
  Result<String>? parseLiteral4(State state) {
    final $0 = state.peek();
    if ($0 == 13 && state.startsWith('\r\n')) {
      state.position += 2;
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
    final $0 = state.peek();
    if ($0 == 13 && state.startsWith('\r\n')) {
      state.position += 2;
      return Result.none;
    }
    return null;
  }

  /// [String] **NotPredicate0**
  /// ```txt
  /// `String` NotPredicate0 =>
  ///   ! 'abc'
  ///   $ = 'ab'
  /// ```
  Result<String>? parseNotPredicate0(State state) {
    final $0 = state.position;
    state.predicate++;
    var $1 = true;
    final $2 = state.peek();
    if ($2 == 97 && state.startsWith('abc')) {
      state.position += 3;
      $1 = false;
      state.backtrack($0);
    } else {
      state.errorExpected('abc');
    }
    state.predicate--;
    if ($1) {
      if ($2 == 97 && state.startsWith('ab')) {
        state.position += 2;
        return const Ok('ab');
      } else {
        state.errorExpected('ab');
      }
    }
    return null;
  }

  /// [void] **NotPredicateVoid0**
  /// ```txt
  /// `void` NotPredicateVoid0 =>
  ///   ! 'abc'
  ///   $ = 'ab'
  /// ```
  Result<void>? parseNotPredicateVoid0(State state) {
    final $0 = state.position;
    state.predicate++;
    var $1 = true;
    final $2 = state.peek();
    if ($2 == 97 && state.startsWith('abc')) {
      state.position += 3;
      $1 = false;
      state.backtrack($0);
    } else {
      state.errorExpected('abc');
    }
    state.predicate--;
    if ($1) {
      if ($2 == 97 && state.startsWith('ab')) {
        state.position += 2;
        return Result.none;
      } else {
        state.errorExpected('ab');
      }
    }
    return null;
  }

  /// [String] **NotPredicate1**
  /// ```txt
  /// `String` NotPredicate1 =>
  ///   $ = 'abc'
  ///   ! '=>'
  /// ```
  Result<String>? parseNotPredicate1(State state) {
    final $0 = state.position;
    final $1 = state.peek();
    if ($1 == 97 && state.startsWith('abc')) {
      state.position += 3;
      final $2 = state.position;
      state.predicate++;
      var $3 = true;
      final $4 = state.peek();
      if ($4 == 61 && state.startsWith('=>')) {
        state.position += 2;
        $3 = false;
        state.backtrack($2);
      } else {
        state.errorExpected('=>');
      }
      state.predicate--;
      if ($3) {
        return const Ok('abc');
      } else {
        state.backtrack($0);
      }
    } else {
      state.errorExpected('abc');
    }
    return null;
  }

  /// [void] **NotPredicateVoid1**
  /// ```txt
  /// `void` NotPredicateVoid1 =>
  ///   $ = 'abc'
  ///   ! '=>'
  /// ```
  Result<void>? parseNotPredicateVoid1(State state) {
    final $0 = state.position;
    final $1 = state.peek();
    if ($1 == 97 && state.startsWith('abc')) {
      state.position += 3;
      final $2 = state.position;
      state.predicate++;
      var $3 = true;
      final $4 = state.peek();
      if ($4 == 61 && state.startsWith('=>')) {
        state.position += 2;
        $3 = false;
        state.backtrack($2);
      } else {
        state.errorExpected('=>');
      }
      state.predicate--;
      if ($3) {
        return Result.none;
      } else {
        state.backtrack($0);
      }
    } else {
      state.errorExpected('abc');
    }
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
    final $0 = state.position;
    state.predicate++;
    var $1 = true;
    var $2 = 0;
    // (2)
    while (true) {
      final $3 = state.peek();
      // [a]
      if ($3 == 97) {
        state.position += 1;
        $2++;
        continue;
      }
      break;
    }
    if ($2 >= 2) {
      $1 = false;
      state.backtrack($0);
    } else {
      state.backtrack($0);
    }
    state.predicate--;
    if ($1) {
      final $4 = <int>[];
      // (0)
      while (true) {
        final $5 = state.peek();
        // [a]
        if ($5 == 97) {
          state.position += 1;
          $4.add(97);
          continue;
        }
        break;
      }
      return Ok($4);
    }
    return null;
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
    final $0 = state.position;
    state.predicate++;
    var $1 = true;
    var $2 = 0;
    // (2)
    while (true) {
      final $3 = state.peek();
      // [a]
      if ($3 == 97) {
        state.position += 1;
        $2++;
        continue;
      }
      break;
    }
    if ($2 >= 2) {
      $1 = false;
      state.backtrack($0);
    } else {
      state.backtrack($0);
    }
    state.predicate--;
    if ($1) {
      final $4 = <int>[];
      // (0)
      while (true) {
        final $5 = state.peek();
        // [a]
        if ($5 == 97) {
          state.position += 1;
          $4.add(97);
          continue;
        }
        break;
      }
      return Result.none;
    }
    return null;
  }

  /// [void] **NotPredicate3**
  /// ```txt
  /// `void` NotPredicate3 =>
  ///   !''
  /// ```
  Result<void>? parseNotPredicate3(State state) {
    state.predicate++;
    var $0 = true;
    if (true) {
      $0 = false;
    } else {
      state.errorExpected('');
    }
    state.predicate--;
    if ($0) {
      return Result.none;
    }
    return null;
  }

  /// [void] **NotPredicate4**
  /// ```txt
  /// `void` NotPredicate4 =>
  ///   ![a]?
  /// ```
  Result<void>? parseNotPredicate4(State state) {
    final $0 = state.position;
    state.predicate++;
    var $1 = true;
    final $2 = state.peek();
    // [a]
    if ($2 == 97) {
      state.position += 1;
    }
    $1 = false;
    state.backtrack($0);
    state.predicate--;
    if ($1) {
      return Result.none;
    }
    return null;
  }

  /// [void] **NotPredicate5**
  /// ```txt
  /// `void` NotPredicate5 =>
  ///   !([a] / [z])?
  /// ```
  Result<void>? parseNotPredicate5(State state) {
    final $0 = state.position;
    state.predicate++;
    var $1 = true;
    $l:
    {
      final $2 = state.peek();
      // [a]
      if ($2 == 97) {
        state.position += 1;
        break $l;
      }
      // [z]
      if ($2 == 122) {
        state.position += 1;
        break $l;
      }
    }
    $1 = false;
    state.backtrack($0);
    state.predicate--;
    if ($1) {
      return Result.none;
    }
    return null;
  }

  /// [List<int>] **OneOrMore0**
  /// ```txt
  /// `List<int>` OneOrMore0 =>
  ///   [a]+
  /// ```
  Result<List<int>>? parseOneOrMore0(State state) {
    final $0 = <int>[];
    // (1)
    while (true) {
      final $1 = state.peek();
      // [a]
      if ($1 == 97) {
        state.position += 1;
        $0.add(97);
        continue;
      }
      break;
    }
    if ($0.isNotEmpty) {
      return Ok($0);
    }
    return null;
  }

  /// [void] **OneOrMoreVoid0**
  /// ```txt
  /// `void` OneOrMoreVoid0 =>
  ///   [a]+
  /// ```
  Result<void>? parseOneOrMoreVoid0(State state) {
    var $0 = false;
    // (1)
    while (true) {
      final $1 = state.peek();
      // [a]
      if ($1 == 97) {
        state.position += 1;
        $0 = true;
        continue;
      }
      break;
    }
    if ($0) {
      return Result.none;
    }
    return null;
  }

  /// [List<int>] **OneOrMore1**
  /// ```txt
  /// `List<int>` OneOrMore1 =>
  ///   ([a] / [z])+
  /// ```
  Result<List<int>>? parseOneOrMore1(State state) {
    final $0 = <int>[];
    // (1)
    while (true) {
      final $1 = state.peek();
      // [a]
      if ($1 == 97) {
        state.position += 1;
        $0.add(97);
        continue;
      }
      // [z]
      if ($1 == 122) {
        state.position += 1;
        $0.add(122);
        continue;
      }
      break;
    }
    if ($0.isNotEmpty) {
      return Ok($0);
    }
    return null;
  }

  /// [void] **OneOrMoreVoid1**
  /// ```txt
  /// `void` OneOrMoreVoid1 =>
  ///   ([a] / [z])+
  /// ```
  Result<void>? parseOneOrMoreVoid1(State state) {
    var $0 = false;
    // (1)
    while (true) {
      final $1 = state.peek();
      // [a]
      if ($1 == 97) {
        state.position += 1;
        $0 = true;
        continue;
      }
      // [z]
      if ($1 == 122) {
        state.position += 1;
        $0 = true;
        continue;
      }
      break;
    }
    if ($0) {
      return Result.none;
    }
    return null;
  }

  /// [int?] **Optional0**
  /// ```txt
  /// `int?` Optional0 =>
  ///   [a]?
  /// ```
  Result<int?> parseOptional0(State state) {
    int? $0;
    final $1 = state.peek();
    // [a]
    if ($1 == 97) {
      state.position += 1;
      $0 = 97;
    }
    return Ok($0);
  }

  /// [void] **OptionalVoid0**
  /// ```txt
  /// `void` OptionalVoid0 =>
  ///   [a]?
  /// ```
  Result<void> parseOptionalVoid0(State state) {
    final $0 = state.peek();
    // [a]
    if ($0 == 97) {
      state.position += 1;
    }
    return Result.none;
  }

  /// [int?] **Optional1**
  /// ```txt
  /// `int?` Optional1 =>
  ///   ([a] / [b])?
  /// ```
  Result<int?> parseOptional1(State state) {
    int? $0;
    $l:
    {
      final $1 = state.peek();
      // [a]
      if ($1 == 97) {
        state.position += 1;
        $0 = 97;
        break $l;
      }
      // [b]
      if ($1 == 98) {
        state.position += 1;
        $0 = 98;
        break $l;
      }
    }
    return Ok($0);
  }

  /// [void] **OptionalVoid1**
  /// ```txt
  /// `void` OptionalVoid1 =>
  ///   ([a] / [b])?
  /// ```
  Result<void> parseOptionalVoid1(State state) {
    $l:
    {
      final $0 = state.peek();
      // [a]
      if ($0 == 97) {
        state.position += 1;
        break $l;
      }
      // [b]
      if ($0 == 98) {
        state.position += 1;
        break $l;
      }
    }
    return Result.none;
  }

  /// [int?] **Optional2**
  /// ```txt
  /// `int?` Optional2 =>
  ///   ([a] $ = [b])?
  /// ```
  Result<int?> parseOptional2(State state) {
    int? $0;
    final $1 = state.position;
    final $2 = state.peek();
    // [a]
    if ($2 == 97) {
      state.position += 1;
      final $3 = state.peek();
      // [b]
      if ($3 == 98) {
        state.position += 1;
        $0 = 98;
      } else {
        state.backtrack($1);
      }
    }
    return Ok($0);
  }

  /// [void] **OptionalVoid2**
  /// ```txt
  /// `void` OptionalVoid2 =>
  ///   ([a] $ = [b])?
  /// ```
  Result<void> parseOptionalVoid2(State state) {
    final $0 = state.position;
    final $1 = state.peek();
    // [a]
    if ($1 == 97) {
      state.position += 1;
      final $2 = state.peek();
      // [b]
      if ($2 == 98) {
        state.position += 1;
      } else {
        state.backtrack($0);
      }
    }
    return Result.none;
  }

  /// [int?] **Optional3**
  /// ```txt
  /// `int?` Optional3 =>
  ///   ($ = [a] [b])?
  /// ```
  Result<int?> parseOptional3(State state) {
    int? $0;
    final $1 = state.position;
    final $2 = state.peek();
    // [a]
    if ($2 == 97) {
      state.position += 1;
      final $3 = state.peek();
      // [b]
      if ($3 == 98) {
        state.position += 1;
        $0 = 97;
      } else {
        state.backtrack($1);
      }
    }
    return Ok($0);
  }

  /// [void] **OptionalVoid3**
  /// ```txt
  /// `void` OptionalVoid3 =>
  ///   ($ = [a] [b])?
  /// ```
  Result<void> parseOptionalVoid3(State state) {
    final $0 = state.position;
    final $1 = state.peek();
    // [a]
    if ($1 == 97) {
      state.position += 1;
      final $2 = state.peek();
      // [b]
      if ($2 == 98) {
        state.position += 1;
      } else {
        state.backtrack($0);
      }
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
    final $0 = state.position;
    $l:
    {
      final $1 = state.peek();
      // [a]
      if ($1 == 97) {
        state.position += 1;
        break $l;
      }
      // [b]
      if ($1 == 98) {
        state.position += 1;
        break $l;
      }
    }
    final $2 = state.peek();
    // [c]
    if ($2 == 99) {
      state.position += 1;
      return const Ok(99);
    } else {
      state.backtrack($0);
    }
    return null;
  }

  /// [void] **OptionalVoid4**
  /// ```txt
  /// `void` OptionalVoid4 =>
  ///   ([a] / [b])?
  ///   $ = [c]
  /// ```
  Result<void>? parseOptionalVoid4(State state) {
    final $0 = state.position;
    $l:
    {
      final $1 = state.peek();
      // [a]
      if ($1 == 97) {
        state.position += 1;
        break $l;
      }
      // [b]
      if ($1 == 98) {
        state.position += 1;
        break $l;
      }
    }
    final $2 = state.peek();
    // [c]
    if ($2 == 99) {
      state.position += 1;
      return Result.none;
    } else {
      state.backtrack($0);
    }
    return null;
  }

  /// [void] **Predicate0**
  /// ```txt
  /// `void` Predicate0 =>
  ///   & { true }
  /// ```
  Result<void>? parsePredicate0(State state) {
    final $0 = true;
    if ($0) {
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
    final $0 = false;
    if ($0) {
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
    final $0 = true;
    if (!$0) {
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
    final $0 = false;
    if (!$0) {
      return Result.none;
    }
    return null;
  }

  /// [void] **Predicate4**
  /// ```txt
  /// `void` Predicate4 =>
  ///   & (a = { false })
  /// ```
  Result<void> parsePredicate4(State state) {
    state.predicate++;
    if (true) {
      final $0 = false;
      final a = $0;
      state.predicate--;
      return Result.none;
    } else {
      state.predicate--;
    }
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
    final $0 = state.position;
    final $1 = state.peek();
    // [0-9]
    final $2 = $1 >= 48 && $1 <= 57;
    if ($2) {
      state.position += 1;
      final a = $1;
      final $3 = state.peek();
      // [0-9]
      final $4 = $3 >= 48 && $3 <= 57;
      if ($4) {
        state.position += 1;
        final b = $3;
        final $5 = state.peek();
        // [0-9]
        final $6 = $5 >= 48 && $5 <= 57;
        if ($6) {
          state.position += 1;
          final c = $5;
          final $7 = a - 48 + b - 48 + c - 48;
          return Ok($7);
        } else {
          state.backtrack($0);
        }
      } else {
        state.backtrack($0);
      }
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
    final $0 = state.position;
    final $1 = state.peek();
    // [0-9]
    final $2 = $1 >= 48 && $1 <= 57;
    if ($2) {
      state.position += 1;
      final a = $1;
      final $3 = state.peek();
      // [0-9]
      final $4 = $3 >= 48 && $3 <= 57;
      if ($4) {
        state.position += 1;
        final b = $3;
        final $5 = state.peek();
        // [0-9]
        final $6 = $5 >= 48 && $5 <= 57;
        if ($6) {
          state.position += 1;
          final c = $5;
          final $7 = a - 48 + b - 48 + c - 48;
          return Result.none;
        } else {
          state.backtrack($0);
        }
      } else {
        state.backtrack($0);
      }
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
  ///   ~ {
  ///     state.errorExpected('abc');
  ///     state.errorIncorrect('Full', true);
  ///     state.errorIncorrect('End', false);
  ///     state.errorIncorrect('Start', null);
  ///   }
  /// ```
  Result<String>? parseSequence1(State state) {
    Result<String>? $0;
    final $1 = state.beginErrorHandling();
    $l:
    {
      final $2 = state.position;
      final $3 = state.peek();
      // [a]
      if ($3 == 97) {
        state.position += 1;
        final $4 = state.peek();
        // [b]
        if ($4 == 98) {
          state.position += 1;
          final $5 = state.peek();
          // [c]
          if ($5 == 99) {
            state.position += 1;
            const $6 = 'abc';
            $0 = const Ok($6);
            break $l;
          } else {
            state.backtrack($2);
          }
        } else {
          state.backtrack($2);
        }
      }
    }
    if ($0 != null) {
      state.endErrorHandling($1);
      return $0;
    } else {
      state.errorExpected('abc');
      state.errorIncorrect('Full', true);
      state.errorIncorrect('End', false);
      state.errorIncorrect('Start', null);
      state.endErrorHandling($1);
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
  ///   ~ {
  ///     state.errorExpected('abc');
  ///     state.errorIncorrect('Full', true);
  ///     state.errorIncorrect('End', false);
  ///     state.errorIncorrect('Start', null);
  ///   }
  /// ```
  Result<void>? parseSequenceVoid1(State state) {
    var $0 = false;
    final $1 = state.beginErrorHandling();
    $l:
    {
      final $2 = state.position;
      final $3 = state.peek();
      // [a]
      if ($3 == 97) {
        state.position += 1;
        final $4 = state.peek();
        // [b]
        if ($4 == 98) {
          state.position += 1;
          final $5 = state.peek();
          // [c]
          if ($5 == 99) {
            state.position += 1;
            const $6 = 'abc';
            $0 = true;
            break $l;
          } else {
            state.backtrack($2);
          }
        } else {
          state.backtrack($2);
        }
      }
    }
    if ($0) {
      state.endErrorHandling($1);
      return Result.none;
    } else {
      state.errorExpected('abc');
      state.errorIncorrect('Full', true);
      state.errorIncorrect('End', false);
      state.errorIncorrect('Start', null);
      state.endErrorHandling($1);
    }
    return null;
  }

  /// [String] **Sequence2**
  /// ```txt
  /// `String` Sequence2 =>
  ///   (
  ///     'bar'
  ///     /
  ///     'baz'
  ///   )
  ///   ~ {
  ///     state.removeRecentErrors();
  ///     state.errorExpected('foo');
  ///   }
  /// ```
  Result<String>? parseSequence2(State state) {
    Result<String>? $0;
    final $1 = state.setErrorState();
    $l:
    {
      final $2 = state.peek();
      if ($2 == 98 && state.startsWith('bar')) {
        state.position += 3;
        $0 = const Ok('bar');
        break $l;
      } else {
        state.errorExpected('bar');
      }
      if ($2 == 98 && state.startsWith('baz')) {
        state.position += 3;
        $0 = const Ok('baz');
        break $l;
      } else {
        state.errorExpected('baz');
      }
    }
    if ($0 != null) {
      state.restoreErrorState($1);
      return $0;
    } else {
      state.removeRecentErrors();
      state.errorExpected('foo');
      state.restoreErrorState($1);
    }
    return null;
  }

  /// [void] **SequenceVoid2**
  /// ```txt
  /// `void` SequenceVoid2 =>
  ///   (
  ///     'bar'
  ///     /
  ///     'baz'
  ///   )
  ///   ~ {
  ///     state.removeRecentErrors();
  ///     state.errorExpected('foo');
  ///   }
  /// ```
  Result<void>? parseSequenceVoid2(State state) {
    var $0 = false;
    final $1 = state.setErrorState();
    $l:
    {
      final $2 = state.peek();
      if ($2 == 98 && state.startsWith('bar')) {
        state.position += 3;
        $0 = true;
        break $l;
      } else {
        state.errorExpected('bar');
      }
      if ($2 == 98 && state.startsWith('baz')) {
        state.position += 3;
        $0 = true;
        break $l;
      } else {
        state.errorExpected('baz');
      }
    }
    if ($0) {
      state.restoreErrorState($1);
      return Result.none;
    } else {
      state.removeRecentErrors();
      state.errorExpected('foo');
      state.restoreErrorState($1);
    }
    return null;
  }

  /// [String] **Sequence3**
  /// ```txt
  /// `String` Sequence3 =>
  ///   "foo"
  ///   ~ { state.errorExpected('foo'); }
  /// ```
  Result<String>? parseSequence3(State state) {
    final $0 = state.peek();
    if ($0 == 102 && state.startsWith('foo')) {
      state.position += 3;
      return const Ok('foo');
    } else {
      state.errorExpected('foo');
    }
    return null;
  }

  /// [void] **SequenceVoid3**
  /// ```txt
  /// `void` SequenceVoid3 =>
  ///   "foo"
  ///   ~ { state.errorExpected('foo'); }
  /// ```
  Result<void>? parseSequenceVoid3(State state) {
    final $0 = state.peek();
    if ($0 == 102 && state.startsWith('foo')) {
      state.position += 3;
      return Result.none;
    } else {
      state.errorExpected('foo');
    }
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
    final $0 = <int>[];
    // (0)
    while (true) {
      final $1 = state.peek();
      // [a]
      if ($1 == 97) {
        state.position += 1;
        $0.add(97);
        continue;
      }
      break;
    }
    return Ok($0);
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
      final $0 = state.peek();
      // [a]
      if ($0 == 97) {
        state.position += 1;
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
    final $0 = <int>[];
    // (0)
    while (true) {
      final $1 = state.peek();
      // [a]
      if ($1 == 97) {
        state.position += 1;
        $0.add(97);
        continue;
      }
      // [z]
      if ($1 == 122) {
        state.position += 1;
        $0.add(122);
        continue;
      }
      break;
    }
    return Ok($0);
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
      final $0 = state.peek();
      // [a]
      if ($0 == 97) {
        state.position += 1;
        continue;
      }
      // [z]
      if ($0 == 122) {
        state.position += 1;
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
    final $0 = <int>[];
    // (1)
    while (true) {
      final $1 = state.peek();
      // [a]
      if ($1 == 97) {
        state.position += 1;
        $0.add(97);
        continue;
      }
      break;
    }
    if ($0.isNotEmpty) {
      return Ok($0);
    }
    return null;
  }

  /// [void] **WhileVoid2**
  /// ```txt
  /// `void` WhileVoid2 =>
  ///   @while (1) {
  ///     [a]
  ///   }
  /// ```
  Result<void>? parseWhileVoid2(State state) {
    var $0 = false;
    // (1)
    while (true) {
      final $1 = state.peek();
      // [a]
      if ($1 == 97) {
        state.position += 1;
        $0 = true;
        continue;
      }
      break;
    }
    if ($0) {
      return Result.none;
    }
    return null;
  }

  /// [List<int>] **While3**
  /// ```txt
  /// `List<int>` While3 =>
  ///   @while (1) {
  ///     [a] / [z]
  ///   }
  /// ```
  Result<List<int>>? parseWhile3(State state) {
    final $0 = <int>[];
    // (1)
    while (true) {
      final $1 = state.peek();
      // [a]
      if ($1 == 97) {
        state.position += 1;
        $0.add(97);
        continue;
      }
      // [z]
      if ($1 == 122) {
        state.position += 1;
        $0.add(122);
        continue;
      }
      break;
    }
    if ($0.isNotEmpty) {
      return Ok($0);
    }
    return null;
  }

  /// [void] **WhileVoid3**
  /// ```txt
  /// `void` WhileVoid3 =>
  ///   @while (1) {
  ///     [a] / [z]
  ///   }
  /// ```
  Result<void>? parseWhileVoid3(State state) {
    var $0 = false;
    // (1)
    while (true) {
      final $1 = state.peek();
      // [a]
      if ($1 == 97) {
        state.position += 1;
        $0 = true;
        continue;
      }
      // [z]
      if ($1 == 122) {
        state.position += 1;
        $0 = true;
        continue;
      }
      break;
    }
    if ($0) {
      return Result.none;
    }
    return null;
  }

  /// [List<int>] **While4**
  /// ```txt
  /// `List<int>` While4 =>
  ///   @while (2) {
  ///     [a]
  ///   }
  /// ```
  Result<List<int>>? parseWhile4(State state) {
    final $0 = state.position;
    final $1 = <int>[];
    // (2)
    while (true) {
      final $2 = state.peek();
      // [a]
      if ($2 == 97) {
        state.position += 1;
        $1.add(97);
        continue;
      }
      break;
    }
    if ($1.length >= 2) {
      return Ok($1);
    } else {
      state.backtrack($0);
    }
    return null;
  }

  /// [void] **WhileVoid4**
  /// ```txt
  /// `void` WhileVoid4 =>
  ///   @while (2) {
  ///     [a]
  ///   }
  /// ```
  Result<void>? parseWhileVoid4(State state) {
    final $0 = state.position;
    var $1 = 0;
    // (2)
    while (true) {
      final $2 = state.peek();
      // [a]
      if ($2 == 97) {
        state.position += 1;
        $1++;
        continue;
      }
      break;
    }
    if ($1 >= 2) {
      return Result.none;
    } else {
      state.backtrack($0);
    }
    return null;
  }

  /// [List<int>] **While5**
  /// ```txt
  /// `List<int>` While5 =>
  ///   @while (2) {
  ///     [a] / [z]
  ///   }
  /// ```
  Result<List<int>>? parseWhile5(State state) {
    final $0 = state.position;
    final $1 = <int>[];
    // (2)
    while (true) {
      final $2 = state.peek();
      // [a]
      if ($2 == 97) {
        state.position += 1;
        $1.add(97);
        continue;
      }
      // [z]
      if ($2 == 122) {
        state.position += 1;
        $1.add(122);
        continue;
      }
      break;
    }
    if ($1.length >= 2) {
      return Ok($1);
    } else {
      state.backtrack($0);
    }
    return null;
  }

  /// [void] **WhileVoid5**
  /// ```txt
  /// `void` WhileVoid5 =>
  ///   @while (2) {
  ///     [a] / [z]
  ///   }
  /// ```
  Result<void>? parseWhileVoid5(State state) {
    final $0 = state.position;
    var $1 = 0;
    // (2)
    while (true) {
      final $2 = state.peek();
      // [a]
      if ($2 == 97) {
        state.position += 1;
        $1++;
        continue;
      }
      // [z]
      if ($2 == 122) {
        state.position += 1;
        $1++;
        continue;
      }
      break;
    }
    if ($1 >= 2) {
      return Result.none;
    } else {
      state.backtrack($0);
    }
    return null;
  }

  /// [List<int>] **While6**
  /// ```txt
  /// `List<int>` While6 =>
  ///   @while (0, 1) {
  ///     [a]
  ///   }
  /// ```
  Result<List<int>> parseWhile6(State state) {
    final $0 = <int>[];
    // (0, 1)
    while ($0.isEmpty) {
      final $1 = state.peek();
      // [a]
      if ($1 == 97) {
        state.position += 1;
        $0.add(97);
        continue;
      }
      break;
    }
    return Ok($0);
  }

  /// [void] **WhileVoid6**
  /// ```txt
  /// `void` WhileVoid6 =>
  ///   @while (0, 1) {
  ///     [a]
  ///   }
  /// ```
  Result<void> parseWhileVoid6(State state) {
    var $0 = false;
    // (0, 1)
    while (!$0) {
      final $1 = state.peek();
      // [a]
      if ($1 == 97) {
        state.position += 1;
        $0 = true;
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
    final $0 = <int>[];
    // (0, 2)
    while ($0.length < 2) {
      final $1 = state.peek();
      // [a]
      if ($1 == 97) {
        state.position += 1;
        $0.add(97);
        continue;
      }
      break;
    }
    return Ok($0);
  }

  /// [void] **WhileVoid7**
  /// ```txt
  /// `void` WhileVoid7 =>
  ///   @while (0, 2) {
  ///     [a]
  ///   }
  /// ```
  Result<void> parseWhileVoid7(State state) {
    var $0 = 0;
    // (0, 2)
    while ($0 < 2) {
      final $1 = state.peek();
      // [a]
      if ($1 == 97) {
        state.position += 1;
        $0++;
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
    final $0 = <int>[];
    // (1, 1)
    while ($0.isEmpty) {
      final $1 = state.peek();
      // [a]
      if ($1 == 97) {
        state.position += 1;
        $0.add(97);
        continue;
      }
      break;
    }
    if ($0.isNotEmpty) {
      return Ok($0);
    }
    return null;
  }

  /// [void] **WhileVoid8**
  /// ```txt
  /// `void` WhileVoid8 =>
  ///   @while (1, 1) {
  ///     [a]
  ///   }
  /// ```
  Result<void>? parseWhileVoid8(State state) {
    var $0 = false;
    // (1, 1)
    while (!$0) {
      final $1 = state.peek();
      // [a]
      if ($1 == 97) {
        state.position += 1;
        $0 = true;
        continue;
      }
      break;
    }
    if ($0) {
      return Result.none;
    }
    return null;
  }

  /// [List<int>] **While9**
  /// ```txt
  /// `List<int>` While9 =>
  ///   @while (2, 2) {
  ///     [a]
  ///   }
  /// ```
  Result<List<int>>? parseWhile9(State state) {
    final $0 = state.position;
    final $1 = <int>[];
    // (2, 2)
    while ($1.length < 2) {
      final $2 = state.peek();
      // [a]
      if ($2 == 97) {
        state.position += 1;
        $1.add(97);
        continue;
      }
      break;
    }
    if ($1.length >= 2) {
      return Ok($1);
    } else {
      state.backtrack($0);
    }
    return null;
  }

  /// [void] **WhileVoid9**
  /// ```txt
  /// `void` WhileVoid9 =>
  ///   @while (2, 2) {
  ///     [a]
  ///   }
  /// ```
  Result<void>? parseWhileVoid9(State state) {
    final $0 = state.position;
    var $1 = 0;
    // (2, 2)
    while ($1 < 2) {
      final $2 = state.peek();
      // [a]
      if ($2 == 97) {
        state.position += 1;
        $1++;
        continue;
      }
      break;
    }
    if ($1 >= 2) {
      return Result.none;
    } else {
      state.backtrack($0);
    }
    return null;
  }

  /// [List<int>] **While10**
  /// ```txt
  /// `List<int>` While10 =>
  ///   @while (2, 3) {
  ///     [a]
  ///   }
  /// ```
  Result<List<int>>? parseWhile10(State state) {
    final $0 = state.position;
    final $1 = <int>[];
    // (2, 3)
    while ($1.length < 3) {
      final $2 = state.peek();
      // [a]
      if ($2 == 97) {
        state.position += 1;
        $1.add(97);
        continue;
      }
      break;
    }
    if ($1.length >= 2) {
      return Ok($1);
    } else {
      state.backtrack($0);
    }
    return null;
  }

  /// [void] **WhileVoid10**
  /// ```txt
  /// `void` WhileVoid10 =>
  ///   @while (2, 3) {
  ///     [a]
  ///   }
  /// ```
  Result<void>? parseWhileVoid10(State state) {
    final $0 = state.position;
    var $1 = 0;
    // (2, 3)
    while ($1 < 3) {
      final $2 = state.peek();
      // [a]
      if ($2 == 97) {
        state.position += 1;
        $1++;
        continue;
      }
      break;
    }
    if ($1 >= 2) {
      return Result.none;
    } else {
      state.backtrack($0);
    }
    return null;
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
    final $0 = state.position;
    var $1 = false;
    $l:
    {
      final $2 = state.peek();
      // [a]
      if ($2 == 97) {
        state.position += 1;
        $1 = true;
        break $l;
      }
      // [b]
      if ($2 == 98) {
        state.position += 1;
        $1 = true;
        break $l;
      }
    }
    if ($1) {
      final $3 = <int>[];
      // (1)
      while (true) {
        final $4 = state.peek();
        // [c]
        if ($4 == 99) {
          state.position += 1;
          $3.add(99);
          continue;
        }
        break;
      }
      if ($3.isNotEmpty) {
        return Ok($3);
      } else {
        state.backtrack($0);
      }
    }
    return null;
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
    final $0 = state.position;
    var $1 = false;
    $l:
    {
      final $2 = state.peek();
      // [a]
      if ($2 == 97) {
        state.position += 1;
        $1 = true;
        break $l;
      }
      // [b]
      if ($2 == 98) {
        state.position += 1;
        $1 = true;
        break $l;
      }
    }
    if ($1) {
      final $3 = <int>[];
      // (1)
      while (true) {
        final $4 = state.peek();
        // [c]
        if ($4 == 99) {
          state.position += 1;
          $3.add(99);
          continue;
        }
        break;
      }
      if ($3.isNotEmpty) {
        return Result.none;
      } else {
        state.backtrack($0);
      }
    }
    return null;
  }

  /// [List<int>] **ZeroOrMore0**
  /// ```txt
  /// `List<int>` ZeroOrMore0 =>
  ///   [a]*
  /// ```
  Result<List<int>> parseZeroOrMore0(State state) {
    final $0 = <int>[];
    // (0)
    while (true) {
      final $1 = state.peek();
      // [a]
      if ($1 == 97) {
        state.position += 1;
        $0.add(97);
        continue;
      }
      break;
    }
    return Ok($0);
  }

  /// [void] **ZeroOrMoreVoid0**
  /// ```txt
  /// `void` ZeroOrMoreVoid0 =>
  ///   [a]*
  /// ```
  Result<void> parseZeroOrMoreVoid0(State state) {
    // (0)
    while (true) {
      final $0 = state.peek();
      // [a]
      if ($0 == 97) {
        state.position += 1;
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
    final $0 = <int>[];
    // (0)
    while (true) {
      final $1 = state.peek();
      // [a]
      if ($1 == 97) {
        state.position += 1;
        $0.add(97);
        continue;
      }
      // [z]
      if ($1 == 122) {
        state.position += 1;
        $0.add(122);
        continue;
      }
      break;
    }
    return Ok($0);
  }

  /// [void] **ZeroOrMoreVoid1**
  /// ```txt
  /// `void` ZeroOrMoreVoid1 =>
  ///   ([a] / [z])*
  /// ```
  Result<void> parseZeroOrMoreVoid1(State state) {
    // (0)
    while (true) {
      final $0 = state.peek();
      // [a]
      if ($0 == 97) {
        state.position += 1;
        continue;
      }
      // [z]
      if ($0 == 122) {
        state.position += 1;
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
    final $0 = state.position;
    state.predicate++;
    var $1 = true;
    var $2 = false;
    $l:
    {
      final $3 = state.peek();
      if ($3 == 102 && state.startsWith('foreach')) {
        state.position += 7;
        $2 = true;
        break $l;
      }
      if ($3 == 102 && state.startsWith('for')) {
        state.position += 3;
        $2 = true;
        break $l;
      }
    }
    if ($2) {
      final $4 = state.position;
      state.predicate++;
      var $5 = true;
      final $6 = state.peek();
      // [a-zA-Z0-9]
      final $7 = $6 <= 90 ? $6 >= 65 || $6 >= 48 && $6 <= 57 : $6 >= 97 && $6 <= 122;
      if ($7) {
        state.position += 1;
        $5 = false;
        state.backtrack($4);
      }
      state.predicate--;
      if ($5) {
        $1 = false;
        state.backtrack($0);
      } else {
        state.backtrack($0);
      }
    }
    state.predicate--;
    if ($1) {
      final $8 = state.peek();
      // [a-zA-Z]
      final $9 = $8 <= 90 ? $8 >= 65 : $8 >= 97 && $8 <= 122;
      if ($9) {
        state.position += 1;
        // (0)
        while (true) {
          final $10 = state.peek();
          // [a-zA-Z0-9]
          final $11 = $10 <= 90 ? $10 >= 65 || $10 >= 48 && $10 <= 57 : $10 >= 97 && $10 <= 122;
          if ($11) {
            state.position += 1;
            continue;
          }
          break;
        }
        final $12 = state.substring($0, state.position);
        return Ok($12);
      }
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
    final $0 = state.position;
    state.predicate++;
    var $1 = true;
    var $2 = false;
    $l:
    {
      final $3 = state.peek();
      if ($3 == 102 && state.startsWith('foreach')) {
        state.position += 7;
        $2 = true;
        break $l;
      }
      if ($3 == 102 && state.startsWith('for')) {
        state.position += 3;
        $2 = true;
        break $l;
      }
    }
    if ($2) {
      final $4 = state.position;
      state.predicate++;
      var $5 = true;
      final $6 = state.peek();
      // [a-zA-Z0-9]
      final $7 = $6 <= 90 ? $6 >= 65 || $6 >= 48 && $6 <= 57 : $6 >= 97 && $6 <= 122;
      if ($7) {
        state.position += 1;
        $5 = false;
        state.backtrack($4);
      }
      state.predicate--;
      if ($5) {
        $1 = false;
        state.backtrack($0);
      } else {
        state.backtrack($0);
      }
    }
    state.predicate--;
    if ($1) {
      final $8 = state.peek();
      // [a-zA-Z]
      final $9 = $8 <= 90 ? $8 >= 65 : $8 >= 97 && $8 <= 122;
      if ($9) {
        state.position += 1;
        // (0)
        while (true) {
          final $10 = state.peek();
          // [a-zA-Z0-9]
          final $11 = $10 <= 90 ? $10 >= 65 || $10 >= 48 && $10 <= 57 : $10 >= 97 && $10 <= 122;
          if ($11) {
            state.position += 1;
            continue;
          }
          break;
        }
        final $12 = state.substring($0, state.position);
        return Result.none;
      }
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
  static const _expected = Object();

  static const _maxErrorCount = 64;

  /// The farthest local parsing position.
  int farthestPosition = 0;

  /// The length of the input data.
  final int length;

  /// Current parsing position.
  int position = 0;

  /// Intended for internal use only.
  int predicate = 0;

  int _ch = 0;

  final List<Object?> _flags = List.filled(_maxErrorCount, null);

  int _errorCount = 0;

  int _errorState = -1;

  int _farthestError = 0;

  int _farthestPosition = 0;

  final String _input;

  final List<String?> _messages = List.filled(_maxErrorCount, null);

  int _peekPosition = -1;

  final List<int?> _starts = List.filled(_maxErrorCount, null);

  State(String input) : _input = input, length = input.length {
    peek();
  }

  void backtrack(int position) {
    if (position > this.position) {
      throw RangeError.range(position, 0, this.position, 'position');
    }

    if (predicate == 0) {
      if (_farthestPosition < this.position) {
        _farthestPosition = this.position;
      }

      if (farthestPosition < this.position) {
        farthestPosition = this.position;
      }
    }

    this.position = position;
  }

  /// Intended for internal use only.
  /// @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  int beginErrorHandling() {
    final farthestPosition = this.farthestPosition;
    this.farthestPosition = position;
    return farthestPosition;
  }

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  /// Returns the size (as the length of the equivalent string) of the character
  /// [char].
  int charSize(int char) => char > 0xffff ? 2 : 1;

  /// Intended for internal use only.
  /// @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  void endErrorHandling(int farthestPosition) {
    if (this.farthestPosition < farthestPosition) {
      this.farthestPosition = farthestPosition;
    }
  }

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  /// Adds (if possible) an error to the error buffer.
  ///
  /// Parameters:
  ///
  ///  - [message]: The message text used when building error messages.
  ///  - [fullSpan]: Specifies information about the location of the error.
  ///  - `true` - (start, end)
  ///  - `false` - (end, end)
  ///  - `null` - (start, start)
  void error(String message, [bool? fullSpan = false]) {
    if (predicate != 0) {
      return;
    }

    if (_farthestError <= farthestPosition) {
      if (_farthestError < farthestPosition) {
        _farthestError = farthestPosition;
        _errorCount = 0;
      }

      if (_errorCount < _messages.length) {
        _flags[_errorCount] = fullSpan;
        _messages[_errorCount] = message;
        _starts[_errorCount] = position;
        _errorCount++;
      }
    }
  }

  /// Intended for internal use only.
  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  /// Adds (if possible) an `expected` error to the error buffer at the current
  /// position.
  ///
  /// Parameters:
  ///
  ///  - [element]: A specific syntactic element that was expected but was
  /// missing.
  void errorExpected(String element) {
    if (predicate != 0) {
      return;
    }

    if (_farthestError <= position) {
      if (_farthestError < position) {
        _farthestError = position;
        _errorCount = 0;
      }

      if (_errorCount < _messages.length) {
        _flags[_errorCount] = _expected;
        _messages[_errorCount] = element;
        _errorCount++;
      }
    }

    if (_farthestPosition < position) {
      _farthestPosition = position;
    }

    if (farthestPosition < position) {
      farthestPosition = position;
    }
  }

  /// Intended for internal use only.
  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  /// Adds (if possible) an error to the error buffer in the case where the
  /// error has a position further than the staring parsing position.
  ///
  /// Parameters:
  ///
  ///  - [message]: The message text used when building error messages.
  ///  - [fullSpan]: Specifies information about the location of the error.
  ///  - `true` - (start, end)
  ///  - `false` - (end, end)
  ///  - `null` - (start, start)
  void errorIncorrect(String message, [bool? fullSpan = false]) {
    if (predicate != 0) {
      return;
    }

    if (farthestPosition > position) {
      error(message, fullSpan);
    }
  }

  /// Converts error messages to errors and returns them as an error list.
  List<({int end, String message, int start})> getErrors() {
    final errors = <({int end, String message, int start})>[];
    if (_farthestPosition < position) {
      _farthestPosition = position;
    }

    final end = _farthestError;
    final expected = <String>{};
    for (var i = 0; i < _errorCount; i++) {
      final message = _messages[i];
      if (message == null) {
        continue;
      }

      switch (_flags[i]) {
        case _expected:
          expected.add(message);
          break;
        case true:
          final start = _starts[i]!;
          errors.add((message: message, start: start, end: end));
          break;
        case false:
          errors.add((message: message, start: end, end: end));
          break;
        case null:
          final start = _starts[i]!;
          errors.add((message: message, start: start, end: start));
          break;
        default:
          errors.add((message: message, start: end, end: end));
      }
    }

    if (expected.isNotEmpty) {
      final list = expected.toList();
      list.sort();
      final message = 'Expected: ${list.map((e) => '\'$e\'').join(', ')}';
      errors.add((
        message: message,
        start: _farthestError,
        end: _farthestError,
      ));
    }

    if (errors.isEmpty) {
      errors.add((
        message: 'Unexpected input data',
        start: _farthestPosition,
        end: _farthestPosition,
      ));
    }

    return errors.toSet().toList();
  }

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  /// Returns the position of the first match of [string] in input, starting at
  /// [position,.
  int indexOf(String string) => _input.indexOf(string, position);

  /// Intended for internal use only.
  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  int peek() {
    if (_peekPosition == position) {
      return _ch;
    }

    _peekPosition = position;
    if (position < length) {
      if ((_ch = _input.codeUnitAt(position)) < 0xd800) {
        return _ch;
      }

      if (_ch < 0xe000) {
        final c = _input.codeUnitAt(position + 1);
        if ((c & 0xfc00) == 0xdc00) {
          return _ch = 0x10000 + ((_ch & 0x3ff) << 10) + (c & 0x3ff);
        }

        throw FormatException('Invalid UTF-16 character', this, position);
      }

      return _ch;
    } else {
      return _ch = -1;
    }
  }

  /// Removes recent errors. Recent errors are errors that were added while
  /// parsing the expression.
  void removeRecentErrors() {
    if (_farthestError == position) {
      if (_errorState >= 0) {
        _errorCount = _errorState > _maxErrorCount
            ? _maxErrorCount
            : _errorState;
      }
    }
  }

  /// Intended for internal use only.
  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  void restoreErrorState(int errorState) {
    _errorState = errorState;
  }

  /// Intended for internal use only.
  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  int setErrorState() {
    final errorState = _errorState;
    if (_farthestError < position) {
      _errorState = 0;
    } else if (_farthestError == position) {
      _errorState = _errorCount;
    } else {
      _errorState = -1;
    }
    return errorState;
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
