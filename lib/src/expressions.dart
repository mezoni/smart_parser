import 'printer.dart';
import 'visitors.dart';

export 'visitors.dart';

class ActionExpression extends Expression {
  final String source;

  ActionExpression({required this.source});

  @override
  T accept<T>(Visitor<T> visitor) {
    return visitor.visitAction(this);
  }
}

class AndPredicateExpression extends SingleExpression {
  AndPredicateExpression({required super.expression});

  @override
  T accept<T>(Visitor<T> visitor) {
    return visitor.visitAndPredicate(this);
  }
}

class AnyCharacterExpression extends Expression {
  AnyCharacterExpression();

  @override
  T accept<T>(Visitor<T> visitor) {
    return visitor.visitAnyCharacter(this);
  }
}

class CaptureExpression extends SingleExpression {
  CaptureExpression({required super.expression});

  @override
  T accept<T>(Visitor<T> visitor) {
    return visitor.visitCapture(this);
  }
}

class CharacterClassExpression extends Expression {
  final bool negate;

  final List<(int, int)> ranges;

  CharacterClassExpression({this.negate = false, required this.ranges});

  @override
  T accept<T>(Visitor<T> visitor) {
    return visitor.visitCharacterClass(this);
  }
}

abstract class Expression {
  static const String defaultType = 'void';

  int acceptancePoints = 1;

  bool canChangePosition = true;

  String? errorHandler;

  bool isAlwaysSuccessful = false;

  bool isConst = false;

  bool isReturn = false;

  int rejectionPoints = 1;

  bool isVoid = false;

  String? semanticValue;

  String? sourceCode;

  String type = defaultType;

  T accept<T>(Visitor<T> visitor);

  String print() {
    const printer = Printer();
    return accept(printer);
  }

  @override
  String toString() {
    return sourceCode ?? super.toString();
  }

  void visitChildren<T>(Visitor<T> visitor) {
    // Nothing
  }
}

class GroupExpression extends SingleExpression {
  GroupExpression({required super.expression});

  @override
  T accept<T>(Visitor<T> visitor) {
    return visitor.visitGroup(this);
  }
}

class LiteralExpression extends Expression {
  final bool isPrimitive;

  final String text;

  LiteralExpression({this.isPrimitive = false, required this.text});

  @override
  T accept<T>(Visitor<T> visitor) {
    return visitor.visitLiteral(this);
  }
}

class MatchExpression extends Expression {
  final String quote;

  final String text;

  MatchExpression({required this.quote, required this.text});

  @override
  T accept<T>(Visitor<T> visitor) {
    return visitor.visitMatch(this);
  }
}

abstract class MultiExpression extends Expression {
  final List<Expression> expressions;

  MultiExpression({required this.expressions}) {
    if (expressions.isEmpty) {
      throw ArgumentError('Expression list must not be empty');
    }
  }

  @override
  void visitChildren<T>(Visitor<T> visitor) {
    for (var i = 0; i < expressions.length; i++) {
      final expression = expressions[i];
      expression.accept(visitor);
    }
  }
}

class NotPredicateExpression extends SingleExpression {
  NotPredicateExpression({required super.expression});

  @override
  T accept<T>(Visitor<T> visitor) {
    return visitor.visitNotPredicate(this);
  }
}

class OneOrMoreExpression extends SingleExpression {
  OneOrMoreExpression({required super.expression});

  @override
  T accept<T>(Visitor<T> visitor) {
    return visitor.visitOneOrMore(this);
  }
}

class OptionalExpression extends SingleExpression {
  OptionalExpression({required super.expression});

  @override
  T accept<T>(Visitor<T> visitor) {
    return visitor.visitOptional(this);
  }
}

class OrderedChoiceExpression extends MultiExpression {
  OrderedChoiceExpression({required super.expressions});

  @override
  T accept<T>(Visitor<T> visitor) {
    return visitor.visitOrderedChoice(this);
  }
}

class PositionExpression extends Expression {
  final String action;

  PositionExpression({required this.action});

  @override
  T accept<T>(Visitor<T> visitor) {
    return visitor.visitPosition(this);
  }
}

class PredicateExpression extends Expression {
  final bool negate;

  final String predicate;

  PredicateExpression({required this.negate, required this.predicate});

  @override
  T accept<T>(Visitor<T> visitor) {
    return visitor.visitPredicate(this);
  }
}

class Production {
  final Expression expression;

  final String name;

  String? sourceCode;

  final String type;

  Production({
    required this.expression,
    required this.name,
    this.sourceCode,
    required this.type,
  });

  bool get isVoid => type.trim() == 'void';

  @override
  String toString() {
    return name;
  }
}

class ProductionExpression extends Expression {
  final String name;

  Production? production;

  ProductionExpression({required this.name});

  @override
  T accept<T>(Visitor<T> visitor) {
    return visitor.visitProduction(this);
  }
}

class SequenceExpression extends MultiExpression {
  SequenceExpression({required super.expressions});

  @override
  T accept<T>(Visitor<T> visitor) {
    return visitor.visitSequence(this);
  }
}

abstract class SingleExpression extends Expression {
  final Expression expression;

  SingleExpression({required this.expression});

  @override
  void visitChildren<T>(Visitor<T> visitor) {
    expression.accept(visitor);
  }
}

class TokenExpression extends Expression {
  final String name;

  TokenExpression({required this.name});

  @override
  T accept<T>(Visitor<T> visitor) {
    return visitor.visitToken(this);
  }
}

class ValueExpression extends Expression {
  final String source;

  final String? valueType;

  ValueExpression({required this.source, this.valueType});

  @override
  T accept<T>(Visitor<T> visitor) {
    return visitor.visitValue(this);
  }
}

class WhileExpression extends SingleExpression {
  final (int, int?) range;

  WhileExpression({required super.expression, required this.range});

  @override
  T accept<T>(Visitor<T> visitor) {
    return visitor.visitWhile(this);
  }
}

class ZeroOrMoreExpression extends SingleExpression {
  ZeroOrMoreExpression({required super.expression});

  @override
  T accept<T>(Visitor<T> visitor) {
    return visitor.visitZeroOrMore(this);
  }
}
