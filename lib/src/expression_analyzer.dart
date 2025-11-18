import 'expressions.dart';

class ExpressionAnalyzer implements Visitor<void> {
  final Map<String, Production> productions;

  bool _hasChanges = false;

  final _warnings = <String>{};

  ExpressionAnalyzer({required this.productions});

  void analyze() {
    _warnings.clear();
    final productionList = productions.values;
    while (true) {
      _hasChanges = false;
      for (final production in productionList) {
        final isVoid = production.isVoid;
        final expression = production.expression;
        _setIsVoid(expression, isVoid);
        expression.accept(this);
      }

      if (!_hasChanges) {
        break;
      }
    }

    for (final warning in _warnings) {
      print(warning);
    }
  }

  @override
  void visitAction(ActionExpression node) {
    _setIsAlwaysSuccessful(node, true);
    _setCanChangePosition(node, false);
    _setNumberOfAcceptancePoints(node, 1);
    _setNumberOfRejectionPoints(node, 0);
  }

  @override
  void visitAndPredicate(AndPredicateExpression node) {
    final child = node.expression;
    child.accept(this);
    _setIsAlwaysSuccessful(node, child.isAlwaysSuccessful);
    _setCanChangePosition(node, false);
    _setIsVoid(child, true);
    _setNumberOfAcceptancePoints(node, child.numberOfAcceptancePoints);
    _setNumberOfRejectionPoints(node, child.numberOfRejectionPoints);
  }

  @override
  void visitAnyCharacter(AnyCharacterExpression node) {
    _setIsAlwaysSuccessful(node, false);
    _setCanChangePosition(node, true);
    _setNumberOfAcceptancePoints(node, 1);
    _setNumberOfRejectionPoints(node, 1);
  }

  @override
  void visitCapture(CaptureExpression node) {
    final child = node.expression;
    child.accept(this);
    _setIsAlwaysSuccessful(node, child.isAlwaysSuccessful);
    _setCanChangePosition(node, child.canChangePosition);
    _setIsVoid(child, true);
    _setNumberOfAcceptancePoints(node, child.numberOfAcceptancePoints);
    _setNumberOfRejectionPoints(node, child.numberOfRejectionPoints);
  }

  @override
  void visitCharacterClass(CharacterClassExpression node) {
    _setIsAlwaysSuccessful(node, false);
    _setCanChangePosition(node, true);
    _setNumberOfAcceptancePoints(node, 1);
    _setNumberOfRejectionPoints(node, 1);
  }

  @override
  void visitGroup(GroupExpression node) {
    final child = node.expression;
    child.accept(this);
    _setIsAlwaysSuccessful(node, child.isAlwaysSuccessful);
    _setCanChangePosition(node, child.canChangePosition);
    _setIsVoid(child, node.isVoid);
    _setNumberOfAcceptancePoints(node, child.numberOfAcceptancePoints);
    _setNumberOfRejectionPoints(node, child.numberOfRejectionPoints);
  }

  @override
  void visitLiteral(LiteralExpression node) {
    final text = node.text;
    _setIsAlwaysSuccessful(node, text.isEmpty);
    _setCanChangePosition(node, text.isNotEmpty);
    _setNumberOfAcceptancePoints(node, 1);
    _setNumberOfRejectionPoints(node, text.isEmpty ? 0 : 1);
  }

  @override
  void visitNotPredicate(NotPredicateExpression node) {
    final child = node.expression;
    child.accept(this);
    _setIsAlwaysSuccessful(node, false);
    _setCanChangePosition(node, false);
    _setIsVoid(child, true);
    _setNumberOfAcceptancePoints(node, 1);
    _setNumberOfRejectionPoints(node, 1);
  }

  @override
  void visitOneOrMore(OneOrMoreExpression node) {
    final child = node.expression;
    child.accept(this);
    _setIsAlwaysSuccessful(node, child.isAlwaysSuccessful);
    _setCanChangePosition(node, child.canChangePosition);
    _checkInfiniteLoop(node);
    _setIsVoid(child, node.isVoid);
    _setNumberOfAcceptancePoints(node, 1);
    _setNumberOfRejectionPoints(node, 1);
  }

  @override
  void visitOptional(OptionalExpression node) {
    final child = node.expression;
    child.accept(this);
    _setIsAlwaysSuccessful(node, true);
    _setCanChangePosition(node, child.canChangePosition);
    _setIsVoid(child, node.isVoid);
    _setNumberOfAcceptancePoints(node, 1);
    _setNumberOfRejectionPoints(node, 0);
  }

  @override
  void visitOrderedChoice(OrderedChoiceExpression node) {
    final children = node.expressions;
    var numberOfAcceptancePoints = 0;
    var numberOfRejectionPoints = 0;
    for (final child in children) {
      _setIsVoid(child, node.isVoid);
      child.accept(this);
      numberOfAcceptancePoints += child.numberOfAcceptancePoints;
      numberOfRejectionPoints += child.numberOfRejectionPoints;
    }

    _setIsAlwaysSuccessful(node, children.any((e) => e.isAlwaysSuccessful));
    _setCanChangePosition(node, children.any((e) => e.canChangePosition));
    _setNumberOfAcceptancePoints(node, numberOfAcceptancePoints);
    _setNumberOfRejectionPoints(node, numberOfRejectionPoints);
  }

  @override
  void visitPosition(PositionExpression node) {
    _setIsAlwaysSuccessful(node, true);
    _setCanChangePosition(node, true);
    _setNumberOfAcceptancePoints(node, 1);
    _setNumberOfRejectionPoints(node, 0);
  }

  @override
  void visitPredicate(PredicateExpression node) {
    _setIsAlwaysSuccessful(node, false);
    _setCanChangePosition(node, false);
    _setNumberOfAcceptancePoints(node, 1);
    _setNumberOfRejectionPoints(node, 1);
  }

  @override
  void visitProduction(ProductionExpression node) {
    final name = node.name;
    final production = productions[name];
    if (production == null) {
      _setIsAlwaysSuccessful(node, false);
      _setCanChangePosition(node, true);
    } else {
      final expression = production.expression;
      _setIsAlwaysSuccessful(node, expression.isAlwaysSuccessful);
      _setCanChangePosition(node, expression.canChangePosition);
    }

    _setNumberOfAcceptancePoints(node, 1);
    _setNumberOfRejectionPoints(node, node.isAlwaysSuccessful ? 0 : 1);
  }

  @override
  void visitSequence(SequenceExpression node) {
    final children = node.expressions;
    node.visitChildren(this);
    final isNotAlwaysSuccessful = children.any((e) => !e.isAlwaysSuccessful);
    _setIsAlwaysSuccessful(node, !isNotAlwaysSuccessful);
    _setCanChangePosition(node, children.any((e) => e.canChangePosition));
    var numberOfRejectionPoints = 0;
    if (children.length == 1) {
      final child = children.first;
      _setIsVoid(child, node.isVoid);
      numberOfRejectionPoints = child.numberOfRejectionPoints;
    } else {
      for (final child in children) {
        _setIsVoid(child, true);
        numberOfRejectionPoints += child.numberOfRejectionPoints;
      }
    }

    _setNumberOfAcceptancePoints(node, 1);
    _setNumberOfRejectionPoints(node, numberOfRejectionPoints);
  }

  @override
  void visitValue(ValueExpression node) {
    _setIsAlwaysSuccessful(node, true);
    _setCanChangePosition(node, false);
    _setNumberOfAcceptancePoints(node, 1);
    _setNumberOfRejectionPoints(node, 0);
  }

  @override
  void visitWhile(WhileExpression node) {
    final child = node.expression;
    final range = node.range;
    final min = range.$1;
    final isAlwaysSuccessful = min == 0;
    child.accept(this);
    _setIsAlwaysSuccessful(
      node,
      child.isAlwaysSuccessful || isAlwaysSuccessful,
    );
    _setCanChangePosition(node, child.canChangePosition);
    _setIsVoid(child, node.isVoid);
    _setNumberOfAcceptancePoints(node, 1);
    _setNumberOfRejectionPoints(node, min == 0 ? 0 : 1);

    _checkInfiniteLoop(node);
  }

  @override
  void visitZeroOrMore(ZeroOrMoreExpression node) {
    final child = node.expression;
    child.accept(this);
    _setIsAlwaysSuccessful(node, true);
    _setCanChangePosition(node, child.canChangePosition);
    _setIsVoid(child, node.isVoid);
    _setNumberOfAcceptancePoints(node, 1);
    _setNumberOfRejectionPoints(node, 0);

    _checkInfiniteLoop(node);
  }

  void _checkInfiniteLoop(SingleExpression node) {
    final child = node.expression;
    if (child.isAlwaysSuccessful) {
      _warnings.add('''
Possibly an infinite loop.
Loop expression: ${node.runtimeType}
Block expression: ${child.runtimeType}
Block expression source: ${child.sourceCode}''');
    }
  }

  void _setCanChangePosition(Expression node, bool canChangePosition) {
    if (node.canChangePosition != canChangePosition) {
      _hasChanges = true;
      node.canChangePosition = canChangePosition;
    }
  }

  void _setIsAlwaysSuccessful(Expression node, bool isAlwaysSuccessful) {
    if (node.isAlwaysSuccessful != isAlwaysSuccessful) {
      _hasChanges = true;
      node.isAlwaysSuccessful = isAlwaysSuccessful;
    }
  }

  void _setIsVoid(Expression node, bool isVoid) {
    final semanticValue = node.semanticValue;
    isVoid = isVoid && semanticValue == null;
    if (node.isVoid != isVoid) {
      _hasChanges = true;
      node.isVoid = isVoid;
    }
  }

  void _setNumberOfAcceptancePoints(
    Expression node,
    int numberOfAcceptancePoints,
  ) {
    if (node.numberOfAcceptancePoints != numberOfAcceptancePoints) {
      _hasChanges = true;
      node.numberOfAcceptancePoints = numberOfAcceptancePoints;
    }
  }

  void _setNumberOfRejectionPoints(
    Expression node,
    int numberOfRejectionPoints,
  ) {
    if (node.numberOfRejectionPoints != numberOfRejectionPoints) {
      _hasChanges = true;
      node.numberOfRejectionPoints = numberOfRejectionPoints;
    }
  }
}
