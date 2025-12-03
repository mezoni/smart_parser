import 'dart:convert';

import 'code_builder.dart';
import 'expressions.dart';
import 'helper.dart';

String _action(String code) {
  final lines = CodeBuilder.unindentText(code);
  for (var i = 0; i < lines.length; i++) {
    final line = lines[i];
    lines[i] = line.trimRight();
  }

  if (lines.length > 1) {
    final newLines = ['{'];
    for (final line in lines) {
      newLines.add('  $line');
    }

    newLines.add('}');
    return newLines.join('\n');
  } else {
    if (lines.isEmpty) {
      return '{ }';
    }

    final first = lines.first;
    return '{ $first }';
  }
}

class Printer implements Visitor<String> {
  final bool withErrorHandler;

  const Printer({this.withErrorHandler = true});

  String print(Expression expression) {
    return expression.accept(this);
  }

  @override
  String visitAction(ActionExpression node) {
    final source = node.source;
    return _action(source).addErrorHandler(node, withErrorHandler);
  }

  @override
  String visitAndPredicate(AndPredicateExpression node) {
    final child = node.expression;
    final code = child.accept(this);
    return '&$code'.addErrorHandler(node, withErrorHandler);
  }

  @override
  String visitAnyCharacter(AnyCharacterExpression node) {
    return '.'.addErrorHandler(node, withErrorHandler);
  }

  @override
  String visitCapture(CaptureExpression node) {
    final child = node.expression;
    return _enclose(child, '<', '>').addErrorHandler(node, withErrorHandler);
  }

  @override
  String visitCharacterClass(CharacterClassExpression node) {
    const special = {
      0x2d: r'\-',
      0x5b: r'\[',
      0x5c: r'\\',
      0x5d: r'\]',
      0x5e: r'\^',
      0x7b: r'\{',
      0x7d: r'\}',
    };
    const escaped = {
      0x07: r'\a',
      0x08: r'\b',
      0x09: r'\t',
      0x0a: r'\n',
      0x0b: r'\v',
      0x0c: r'\f',
      0x0d: r'\r',
      0x1b: r'\e',
    };
    final negate = node.negate;
    final ranges = node.ranges;
    final buffer = StringBuffer();
    buffer.write('[');
    if (negate) {
      buffer.write('^');
    }

    ({bool hex, String str}) toChar(int c) {
      if (special.containsKey(c)) {
        return (hex: false, str: special[c]!);
      } else if (escaped.containsKey(c)) {
        return (hex: false, str: escaped[c]!);
      } else if (c <= 0x1f || c >= 0x7e) {
        return (hex: true, str: '{${c.toRadixString(16)}}');
      }

      return (hex: false, str: String.fromCharCode(c));
    }

    for (final range in ranges) {
      final start = range.$1;
      final end = range.$2;
      if (start == end) {
        final c = toChar(start);
        buffer.write(c.str);
      } else {
        final c1 = toChar(start);
        final c2 = toChar(end);
        if (c1.hex && c2.hex) {
          buffer.write('{');
          buffer.write(start.toRadixString(16));
          buffer.write('-');
          buffer.write(end.toRadixString(16));
          buffer.write('}');
        } else {
          buffer.write(c1.str);
          buffer.write('-');
          buffer.write(c2.str);
        }
      }
    }

    buffer.write(']');
    return buffer.toString().addErrorHandler(node, withErrorHandler);
  }

  @override
  String visitGroup(GroupExpression node) {
    final child = node.expression;
    return _enclose(child, '(', ')').addErrorHandler(node, withErrorHandler);
  }

  @override
  String visitLiteral(LiteralExpression node) {
    final isPrimitive = node.isPrimitive;
    final text = node.text;
    final quote = isPrimitive ? '"' : '\'';
    final escaped = escapeString(text, quote);
    return escaped.addErrorHandler(node, withErrorHandler);
  }

  @override
  String visitMatch(MatchExpression node) {
    final text = node.text;
    final quote = node.quote;
    final escaped = escapeString(text, quote);
    return '@match($escaped)'.addErrorHandler(node, withErrorHandler);
  }

  @override
  String visitNotPredicate(NotPredicateExpression node) {
    final child = node.expression;
    final code = child.accept(this);
    return '!$code'.addErrorHandler(node, withErrorHandler);
  }

  @override
  String visitOneOrMore(OneOrMoreExpression node) {
    final child = node.expression;
    final code = child.accept(this);
    return '$code+'.addErrorHandler(node, withErrorHandler);
  }

  @override
  String visitOptional(OptionalExpression node) {
    final child = node.expression;
    final code = child.accept(this);
    return '$code?'.addErrorHandler(node, withErrorHandler);
  }

  @override
  String visitOrderedChoice(OrderedChoiceExpression node) {
    final children = node.expressions;
    final sources = <String>[];
    for (final child in children) {
      final code = child.accept(this);
      sources.add(code);
    }

    if (sources.any((e) => const LineSplitter().convert(e).length > 1)) {
      return sources.join('\n/\n').addErrorHandler(node, withErrorHandler);
    } else {
      return sources.join(' / ').addErrorHandler(node, withErrorHandler);
    }
  }

  @override
  String visitPosition(PositionExpression node) {
    final action = node.action;
    final code = _action(action);
    return '@position($code)'.addErrorHandler(node, withErrorHandler);
  }

  @override
  String visitPredicate(PredicateExpression node) {
    final negate = node.negate;
    final predicate = node.predicate;
    final code = _action(predicate);
    return negate ? '!$code' : '&$code'.addErrorHandler(node, withErrorHandler);
  }

  @override
  String visitProduction(ProductionExpression node) {
    final name = node.name;
    return name.addErrorHandler(node, withErrorHandler);
  }

  @override
  String visitSequence(SequenceExpression node) {
    final children = node.expressions;
    final errorHandler = node.errorHandler;
    final source = <String>[];
    for (final child in children) {
      var code = child.accept(this);
      final semanticValue = child.semanticValue;
      if (semanticValue != null) {
        code = '$semanticValue = $code';
      }

      source.add(code);
    }

    if (errorHandler != null) {
      final code = _action(errorHandler);
      source.add('~$code');
    }

    return source.join('\n').addErrorHandler(node, withErrorHandler);
  }

  @override
  String visitToken(TokenExpression node) {
    final name = node.name;
    return '.$name'.addErrorHandler(node, withErrorHandler);
  }

  @override
  String visitValue(ValueExpression node) {
    final source = node.source;
    final valueType = node.valueType;
    var code = _action(source);
    if (valueType != null) {
      code = '`$valueType` $code';
    }

    return code.addErrorHandler(node, withErrorHandler);
  }

  @override
  String visitWhile(WhileExpression node) {
    final child = node.expression;
    final range = node.range;
    final m = range.$1;
    final n = range.$2;
    var q = '$m';
    if (n != null) {
      q = '$q, $n';
    }

    final code = child.accept(this);
    return '''
@while ($q) {
  $code
}'''
        .addErrorHandler(node, withErrorHandler);
  }

  @override
  String visitZeroOrMore(ZeroOrMoreExpression node) {
    final child = node.expression;
    final code = child.accept(this);
    return '$code*'.addErrorHandler(node, withErrorHandler);
  }

  String _enclose(Expression node, String open, String close) {
    final code = node.accept(this);
    final lines = const LineSplitter().convert(code);
    if (lines.length < 2) {
      return '$open$code$close';
    }

    final newLines = [open];
    newLines.addAll(lines.map((e) => '  $e').toList());
    newLines.add(close);
    return newLines.join('\n');
  }
}

extension on String {
  String addErrorHandler(Expression node, bool withErrorHandler) {
    if (!withErrorHandler) {
      return this;
    }

    final errorHandler = node.errorHandler;
    final source = <String>[];
    source.add(this);
    if (errorHandler != null) {
      final code = _action(errorHandler);
      source.add('~$code');
    }

    return source.join('\n');
  }
}
