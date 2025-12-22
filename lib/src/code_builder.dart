import 'dart:collection';
import 'dart:convert';

class Code extends CodeBuilder {
  final String begin;

  String end;

  final bool hideEmpty;

  final String indent;

  final List<Object> _elements = [];

  Code({
    this.begin = '',
    this.end = '',
    this.hideEmpty = true,
    this.indent = '',
  });

  @override
  bool get isEmpty {
    for (final element in _elements) {
      if (element is String) {
        if (element.isNotEmpty) {
          return false;
        }
      } else if (element is CodeBuilder) {
        if (element.isNotEmpty) {
          return false;
        }
      } else {
        return false;
      }
    }

    return true;
  }

  @override
  bool get isNotEmpty => !isEmpty;

  T add<T extends CodeBuilder>(T element) {
    _elements.add(element);
    return element;
  }

  Code addBlock({String begin = '{', String end = '}', String indent = '  '}) {
    final block = Code(begin: begin, end: end, indent: indent);
    _elements.add(block);
    return block;
  }

  Code addCode() {
    final block = Code(begin: '', end: '');
    _elements.add(block);
    return block;
  }

  void assign(String lhs, String rhs) {
    stmt('$lhs = $rhs');
  }

  Code block(void Function(Code code) f) {
    final block = addBlock();
    f(block);
    return block;
  }

  @override
  void build(List<String> lines, String indent) {
    if (isEmpty && hideEmpty) {
      return;
    }

    final indent2 = '$indent${this.indent}';
    if (begin.isNotEmpty) {
      lines.add('$indent$begin');
    }

    for (final element in _elements) {
      if (element is String) {
        if (element.isEmpty) {
          lines.add('');
        } else {
          lines.add('$indent2$element');
        }
      } else if (element is CodeBuilder) {
        element.build(lines, indent2);
      } else {
        lines.add('$indent2$element');
      }
    }

    if (end.isNotEmpty) {
      lines.add('$indent$end');
    }
  }

  void call(void Function(Code code) f) {
    f(this);
  }

  void declare(String type, String lhs, [String? rhs]) {
    if (rhs != null) {
      stmt('$type $lhs = $rhs');
    } else {
      stmt('$type $lhs');
    }
  }

  Code group(void Function(Code code) f) {
    final block = addBlock();
    f(block);
    return block;
  }

  Code if$(String cond, void Function(Code code) f) {
    final ifElse = IfElse(cond, '!($cond)');
    _elements.add(ifElse);
    final block = ifElse.ifBlock;
    f(block);
    return block;
  }

  IfElse ifElse(String ok, [String? notOk]) {
    final ifElse = IfElse(ok, notOk ?? '!($ok)');
    _elements.add(ifElse);
    return ifElse;
  }

  Code statements() {
    final statements = Code();
    add(statements);
    return statements;
  }

  void stmt(String statement) {
    writeln('$statement;');
  }

  Code switch$(
    String expr,
    List<(List<String>, Code code)> cases, [
    Code? defaultCase,
  ]) {
    if (expr.isEmpty) {
      throw ArgumentError.value('Must not be empty', 'expr');
    }

    final code = Code();
    final block = code.addBlock(begin: 'switch ($expr) {');
    for (final caseClause in cases) {
      final conditions = caseClause.$1;
      if (conditions.isEmpty) {
        throw ArgumentError('Condition list must not be empty');
      }

      for (final condition in conditions) {
        block.writeln('case $condition:');
      }

      block.addBlock(begin: '', end: '')((code) {
        code.add(caseClause.$2);
      });
    }

    if (defaultCase != null) {
      block.writeln('default:');
      block.addBlock(begin: '', end: '')((code) {
        code.add(defaultCase);
      });
    }

    add(code);
    return code;
  }

  Code while$(String cond, void Function(Code code) f) {
    final block = addBlock(begin: 'while ($cond) {');
    f(block);
    return block;
  }

  void writeln([String string = ""]) {
    _elements.add(string);
  }
}

abstract class CodeBuilder {
  bool get isEmpty;

  bool get isNotEmpty;

  void build(List<String> lines, String indent);

  @override
  String toString() {
    final lines = <String>[];
    build(lines, '');
    return lines.join('\n');
  }

  static String indentText(
    String text, {
    String indent = '  ',
    bool removeEmptyLines = true,
  }) {
    final buffer = StringBuffer();
    final lines = const LineSplitter().convert(text);
    for (var line in lines) {
      line = line.trimRight();
      if (line.isNotEmpty || !removeEmptyLines) {
        if (line.isEmpty) {
          buffer.writeln();
        } else {
          buffer.writeln('$indent$line');
        }
      }
    }

    return '$buffer';
  }

  static List<String> unindentText(String text) {
    int? indent;
    final queue = ListQueue.of(const LineSplitter().convert(text));
    while (queue.isNotEmpty) {
      final first = queue.first.trim();
      if (first.isEmpty) {
        queue.removeFirst();
      } else {
        break;
      }
    }

    while (queue.isNotEmpty) {
      final last = queue.last.trim();
      if (last.isEmpty) {
        queue.removeLast();
      } else {
        break;
      }
    }

    final lines = queue.toList();
    for (final line in lines) {
      if (line.trim().isEmpty) {
        continue;
      }

      final current = line.length - line.trimLeft().length;
      if (indent == null || indent > current) {
        indent = current;
      }
    }

    indent ??= 0;
    final buffer = <String>[];
    for (final line in lines) {
      if (line.trim().isEmpty) {
        buffer.add('');
      } else {
        buffer.add(line.substring(indent));
      }
    }

    return buffer;
  }
}

class IfElse extends CodeBuilder {
  final elseBlock = Code(begin: '', end: '');

  final ifBlock = Code(begin: '', end: '');

  final String ok;

  final String notOk;

  IfElse(this.ok, this.notOk);

  @override
  bool get isEmpty => ifBlock.isEmpty && elseBlock.isEmpty;

  @override
  bool get isNotEmpty => !isEmpty;

  @override
  void build(List<String> lines, String indent) {
    final code = Code(begin: '', end: '');
    var flag = ifBlock.isNotEmpty ? 1 : 0;
    flag |= elseBlock.isNotEmpty ? 2 : 0;
    switch (flag) {
      case 0:
      case 1:
        if (ok == 'true') {
          code.add(ifBlock);
        } else {
          code.addBlock(begin: 'if ($ok) {')((code) {
            code.add(ifBlock);
          });
        }

        break;
      case 2:
        if (notOk == 'true') {
          code.add(elseBlock);
        } else {
          code.addBlock(begin: 'if ($notOk) {')((code) {
            code.add(elseBlock);
          });
        }

        break;
      case 3:
        code.addBlock(begin: 'if ($ok) {', end: '')((code) {
          code.add(ifBlock);
        });
        code.addBlock(begin: '} else {')((code) {
          code.add(elseBlock);
        });
        break;
    }

    code.build(lines, indent);
  }
}
