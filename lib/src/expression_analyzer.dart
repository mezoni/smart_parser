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
    _setHasSideEffects(node, false);
    _setIsSingleExitPoint(node, true);
  }

  @override
  void visitAndPredicate(AndPredicateExpression node) {
    final child = node.expression;
    child.accept(this);
    _setIsAlwaysSuccessful(node, child.isAlwaysSuccessful);
    _setCanChangePosition(node, child.canChangePosition);
    _setIsVoid(child, true);
    _setHasSideEffects(node, child.hasSideEffects);
    _setIsSingleExitPoint(node, child.isSingleExitPoint);
  }

  @override
  void visitAnyCharacter(AnyCharacterExpression node) {
    _setIsAlwaysSuccessful(node, false);
    _setCanChangePosition(node, true);
    _setHasSideEffects(node, false);
    _setIsSingleExitPoint(node, true);
  }

  @override
  void visitCapture(CaptureExpression node) {
    final child = node.expression;
    child.accept(this);
    _setIsAlwaysSuccessful(node, child.isAlwaysSuccessful);
    _setCanChangePosition(node, child.canChangePosition);
    _setIsVoid(child, true);
    _setHasSideEffects(node, child.hasSideEffects);
    _setIsSingleExitPoint(node, child.isSingleExitPoint);
  }

  @override
  void visitCharacterClass(CharacterClassExpression node) {
    _setIsAlwaysSuccessful(node, false);
    _setCanChangePosition(node, true);
    _setHasSideEffects(node, false);
    _setIsSingleExitPoint(node, true);
  }

  @override
  void visitGroup(GroupExpression node) {
    final child = node.expression;
    child.accept(this);
    _setIsAlwaysSuccessful(node, child.isAlwaysSuccessful);
    _setCanChangePosition(node, child.canChangePosition);
    _setIsVoid(child, node.isVoid);
    _setHasSideEffects(node, child.hasSideEffects);
    _setIsSingleExitPoint(node, child.isSingleExitPoint);
  }

  @override
  void visitLiteral(LiteralExpression node) {
    final text = node.text;
    _setIsAlwaysSuccessful(node, text.isEmpty);
    _setCanChangePosition(node, text.isNotEmpty);
    _setHasSideEffects(node, false);
    _setIsSingleExitPoint(node, true);
  }

  @override
  void visitNotPredicate(NotPredicateExpression node) {
    final child = node.expression;
    child.accept(this);
    _setIsAlwaysSuccessful(node, false);
    _setCanChangePosition(node, child.canChangePosition);
    _setIsVoid(child, true);
    _setHasSideEffects(node, false);
    _setIsSingleExitPoint(node, true);
  }

  @override
  void visitOneOrMore(OneOrMoreExpression node) {
    final child = node.expression;
    child.accept(this);
    _setIsAlwaysSuccessful(node, child.isAlwaysSuccessful);
    _setCanChangePosition(node, child.canChangePosition);
    _checkInfiniteLoop(node);
    _setIsVoid(child, node.isVoid);
    _setHasSideEffects(node, false);
    _setIsSingleExitPoint(node, true);
  }

  @override
  void visitOptional(OptionalExpression node) {
    final child = node.expression;
    child.accept(this);
    _setIsAlwaysSuccessful(node, true);
    _setCanChangePosition(node, child.canChangePosition);
    _setIsVoid(child, node.isVoid);
    _setHasSideEffects(node, false);
    _setIsSingleExitPoint(node, true);
  }

  @override
  void visitOrderedChoice(OrderedChoiceExpression node) {
    final children = node.expressions;
    for (final child in children) {
      _setIsVoid(child, node.isVoid);
      child.accept(this);
    }

    _setIsAlwaysSuccessful(node, children.any((e) => e.isAlwaysSuccessful));
    _setCanChangePosition(node, children.any((e) => e.canChangePosition));
    _setHasSideEffects(node, children.any((e) => e.hasSideEffects));
    if (children.length == 1) {
      final child = children.first;
      _setIsSingleExitPoint(node, child.isSingleExitPoint);
    } else {
      _setIsSingleExitPoint(node, false);
    }
  }

  @override
  void visitPosition(PositionExpression node) {
    _setIsAlwaysSuccessful(node, true);
    _setCanChangePosition(node, true);
    _setHasSideEffects(node, false);
    _setIsSingleExitPoint(node, true);
  }

  @override
  void visitPredicate(PredicateExpression node) {
    _setIsAlwaysSuccessful(node, false);
    _setCanChangePosition(node, false);
    _setHasSideEffects(node, false);
    _setIsSingleExitPoint(node, true);
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

    _setHasSideEffects(node, false);
    _setIsSingleExitPoint(node, true);
  }

  @override
  void visitSequence(SequenceExpression node) {
    final children = node.expressions;
    node.visitChildren(this);
    final isNotAlwaysSuccessful = children.any((e) => !e.isAlwaysSuccessful);
    _setIsAlwaysSuccessful(node, !isNotAlwaysSuccessful);
    _setCanChangePosition(node, children.any((e) => e.canChangePosition));
    if (children.length == 1) {
      final child = children.first;
      _setIsVoid(child, node.isVoid);
    } else {
      for (final child in children) {
        _setIsVoid(child, true);
      }
    }

    final hasSideEffects =
        children.any((e) => e.hasSideEffects) ||
        children.where((e) => e.canChangePosition).length > 1 ||
        node.errorHandler != null;
    _setHasSideEffects(node, hasSideEffects);
    final lastChild = children.last;
    _setIsSingleExitPoint(node, lastChild.isSingleExitPoint);
  }

  @override
  void visitValue(ValueExpression node) {
    _setIsAlwaysSuccessful(node, true);
    _setCanChangePosition(node, false);
    _setHasSideEffects(node, false);
    _setIsSingleExitPoint(node, true);
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
    _setHasSideEffects(node, false);
    _setIsSingleExitPoint(node, true);
    _checkInfiniteLoop(node);
  }

  @override
  void visitZeroOrMore(ZeroOrMoreExpression node) {
    final child = node.expression;
    child.accept(this);
    _setIsAlwaysSuccessful(node, true);
    _setCanChangePosition(node, child.canChangePosition);
    _setIsVoid(child, node.isVoid);
    _setHasSideEffects(node, false);
    _setIsSingleExitPoint(node, true);
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

  void _setHasSideEffects(Expression node, bool hasSideEffects) {
    if (node.hasSideEffects != hasSideEffects) {
      _hasChanges = true;
      node.hasSideEffects = hasSideEffects;
    }
  }

  void _setIsAlwaysSuccessful(Expression node, bool isAlwaysSuccessful) {
    if (node.isAlwaysSuccessful != isAlwaysSuccessful) {
      _hasChanges = true;
      node.isAlwaysSuccessful = isAlwaysSuccessful;
    }
  }

  void _setIsSingleExitPoint(Expression node, bool isSingleExitPoint) {
    if (node.isSingleExitPoint != isSingleExitPoint) {
      _hasChanges = true;
      node.isSingleExitPoint = isSingleExitPoint;
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
}
