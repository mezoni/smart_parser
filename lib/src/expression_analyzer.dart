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
    _setAcceptancePoints(node, 1);
    _setRejectionPoints(node, 0);
    _setIsComplete(node, true);
  }

  @override
  void visitAndPredicate(AndPredicateExpression node) {
    final child = node.expression;
    child.accept(this);
    _setIsAlwaysSuccessful(node, child.isAlwaysSuccessful);
    _setCanChangePosition(node, false);
    _setIsVoid(child, true);
    _setAcceptancePoints(node, child.acceptancePoints);
    _setRejectionPoints(node, child.rejectionPoints);
    _setIsComplete(node, child.isComplete);
  }

  @override
  void visitAnyCharacter(AnyCharacterExpression node) {
    _setIsAlwaysSuccessful(node, false);
    _setCanChangePosition(node, true);
    _setAcceptancePoints(node, 1);
    _setRejectionPoints(node, 1);
    _setIsComplete(node, true);
  }

  @override
  void visitCapture(CaptureExpression node) {
    final child = node.expression;
    child.accept(this);
    _setIsAlwaysSuccessful(node, child.isAlwaysSuccessful);
    _setCanChangePosition(node, child.canChangePosition);
    _setIsVoid(child, true);
    _setAcceptancePoints(node, child.acceptancePoints);
    _setRejectionPoints(node, child.rejectionPoints);
    _setIsComplete(node, child.isComplete);
  }

  @override
  void visitCharacterClass(CharacterClassExpression node) {
    _setIsAlwaysSuccessful(node, false);
    _setCanChangePosition(node, true);
    _setAcceptancePoints(node, 1);
    _setRejectionPoints(node, 1);
    _setIsComplete(node, true);
  }

  @override
  void visitGroup(GroupExpression node) {
    final child = node.expression;
    child.accept(this);
    _setIsAlwaysSuccessful(node, child.isAlwaysSuccessful);
    _setCanChangePosition(node, child.canChangePosition);
    _setIsVoid(child, node.isVoid);
    _setAcceptancePoints(node, child.acceptancePoints);
    _setRejectionPoints(node, child.rejectionPoints);
    _setIsComplete(node, child.isComplete);
  }

  @override
  void visitLiteral(LiteralExpression node) {
    final text = node.text;
    _setIsAlwaysSuccessful(node, text.isEmpty);
    _setCanChangePosition(node, text.isNotEmpty);
    _setAcceptancePoints(node, 1);
    _setRejectionPoints(node, text.isEmpty ? 0 : 1);
    _setIsComplete(node, true);
  }

  @override
  void visitNotPredicate(NotPredicateExpression node) {
    final child = node.expression;
    child.accept(this);
    _setIsAlwaysSuccessful(node, false);
    _setCanChangePosition(node, false);
    _setIsVoid(child, true);
    _setAcceptancePoints(node, 1);
    _setRejectionPoints(node, 1);
    _setIsComplete(node, true);
  }

  @override
  void visitOneOrMore(OneOrMoreExpression node) {
    final child = node.expression;
    child.accept(this);
    _setIsAlwaysSuccessful(node, child.isAlwaysSuccessful);
    _setCanChangePosition(node, child.canChangePosition);
    _setIsVoid(child, node.isVoid);
    _setAcceptancePoints(node, 1);
    _setRejectionPoints(node, 1);
    _setIsComplete(node, true);

    _checkInfiniteLoop(node);
  }

  @override
  void visitOptional(OptionalExpression node) {
    final child = node.expression;
    child.accept(this);
    _setIsAlwaysSuccessful(node, true);
    _setCanChangePosition(node, child.canChangePosition);
    _setIsVoid(child, node.isVoid);
    _setAcceptancePoints(node, 1);
    _setRejectionPoints(node, 0);
    _setIsComplete(node, true);
  }

  @override
  void visitOrderedChoice(OrderedChoiceExpression node) {
    final children = node.expressions;
    var acceptancePoints = 0;
    var rejectionPoints = 0;
    for (var i = 0; i < children.length; i++) {
      final child = children[i];
      _setIsVoid(child, node.isVoid);
      child.accept(this);
      acceptancePoints += child.acceptancePoints;
      if (i == children.length - 1) {
        if (!child.isAlwaysSuccessful) {
          rejectionPoints++;
        }
      }
    }

    _setIsAlwaysSuccessful(node, children.any((e) => e.isAlwaysSuccessful));
    _setCanChangePosition(node, children.any((e) => e.canChangePosition));
    _setAcceptancePoints(node, acceptancePoints);
    _setRejectionPoints(node, rejectionPoints);
    if (children.length == 1) {
      final child = children.first;
      _setIsComplete(node, child.isComplete);
    } else {
      _setIsComplete(node, false);
    }
  }

  @override
  void visitPosition(PositionExpression node) {
    _setIsAlwaysSuccessful(node, true);
    _setCanChangePosition(node, true);
    _setAcceptancePoints(node, 1);
    _setRejectionPoints(node, 0);
    _setIsComplete(node, true);
  }

  @override
  void visitPredicate(PredicateExpression node) {
    _setIsAlwaysSuccessful(node, false);
    _setCanChangePosition(node, false);
    _setAcceptancePoints(node, 1);
    _setRejectionPoints(node, 1);
    _setIsComplete(node, true);
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

    _setAcceptancePoints(node, 1);
    _setRejectionPoints(node, node.isAlwaysSuccessful ? 0 : 1);
    _setIsComplete(node, true);
  }

  @override
  void visitSequence(SequenceExpression node) {
    final children = node.expressions;
    final last = children.last;
    node.visitChildren(this);
    final isNotAlwaysSuccessful = children.any((e) => !e.isAlwaysSuccessful);
    _setIsAlwaysSuccessful(node, !isNotAlwaysSuccessful);
    _setCanChangePosition(node, children.any((e) => e.canChangePosition));
    var rejectionPoints = 0;
    if (children.length == 1) {
      final child = children.first;
      _setIsVoid(child, node.isVoid);
      rejectionPoints = child.rejectionPoints;
    } else {
      for (final child in children) {
        _setIsVoid(child, true);
        rejectionPoints += child.rejectionPoints;
      }
    }

    _setAcceptancePoints(node, 1);
    _setRejectionPoints(node, rejectionPoints);
    _setIsComplete(node, last.isComplete);
  }

  @override
  void visitValue(ValueExpression node) {
    _setIsAlwaysSuccessful(node, true);
    _setCanChangePosition(node, false);
    _setAcceptancePoints(node, 1);
    _setRejectionPoints(node, 0);
    _setIsComplete(node, true);
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
    _setAcceptancePoints(node, 1);
    _setRejectionPoints(node, min == 0 ? 0 : 1);
    _setIsComplete(node, true);

    _checkInfiniteLoop(node);
  }

  @override
  void visitZeroOrMore(ZeroOrMoreExpression node) {
    final child = node.expression;
    child.accept(this);
    _setIsAlwaysSuccessful(node, true);
    _setCanChangePosition(node, child.canChangePosition);
    _setIsVoid(child, node.isVoid);
    _setAcceptancePoints(node, 1);
    _setRejectionPoints(node, 0);
    _setIsComplete(node, true);

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

  void _setAcceptancePoints(Expression node, int acceptancePoints) {
    if (node.acceptancePoints != acceptancePoints) {
      _hasChanges = true;
      node.acceptancePoints = acceptancePoints;
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

  void _setIsComplete(Expression node, bool isComplete) {
    if (node.isComplete != isComplete) {
      _hasChanges = true;
      node.isComplete = isComplete;
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

  void _setRejectionPoints(Expression node, int rejectionPoints) {
    if (node.rejectionPoints != rejectionPoints) {
      _hasChanges = true;
      node.rejectionPoints = rejectionPoints;
    }
  }
}
