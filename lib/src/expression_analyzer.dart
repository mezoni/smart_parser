import 'expressions.dart';

class ExpressionAnalyzer implements Visitor<void> {
  final Map<String, Production> productions;

  bool _hasChanges = false;

  String _name = '';

  final _productionsUsed = <String, bool>{};

  final _warnings = <String>{};

  ExpressionAnalyzer({required this.productions});

  void analyze() {
    _productionsUsed.clear();
    _warnings.clear();
    final productionList = productions.values;
    _productionsUsed.addEntries(
      productionList.map((e) => MapEntry(e.name, false)),
    );
    while (true) {
      _hasChanges = false;
      for (final production in productionList) {
        final isVoid = production.isVoid;
        final expression = production.expression;
        _name = production.name;
        _setIsVoid(expression, isVoid);
        _setIsReturn(expression, true);
        _setIsLatest(expression, true);
        expression.accept(this);
      }

      if (!_hasChanges) {
        break;
      }
    }

    final unusedProductions = _productionsUsed.entries
        .where((e) => !e.value)
        .map((e) => e.key)
        .toList();
    if (unusedProductions.length > 1) {
      _warnings.add('''
Found unreferenced productions:
${unusedProductions.join('\n')}''');
    }

    print(_warnings.join('\n\n'));
  }

  @override
  void visitAction(ActionExpression node) {
    _setIsAlwaysSuccessful(node, true);
    _setCanChangePosition(node, false);
    _setSuccessCount(node, 1);
    _setFailureCount(node, 0);
    _setIsConst(node, true);
  }

  @override
  void visitAndPredicate(AndPredicateExpression node) {
    final child = node.expression;
    _setParent(child, node);
    _setIsVoid(child, true);
    child.accept(this);
    _setIsAlwaysSuccessful(node, child.isAlwaysSuccessful);
    _setCanChangePosition(node, false);
    _setSuccessCount(node, child.successCount);
    _setFailureCount(node, child.failureCount);
    _setIsConst(node, true);
  }

  @override
  void visitAnyCharacter(AnyCharacterExpression node) {
    _setIsAlwaysSuccessful(node, false);
    _setCanChangePosition(node, true);
    _setSuccessCount(node, 1);
    _setFailureCount(node, 1);
    _setIsConst(node, false);
  }

  @override
  void visitCapture(CaptureExpression node) {
    final child = node.expression;
    _setIsVoid(child, true);
    _setParent(child, node);
    child.accept(this);
    _setIsAlwaysSuccessful(node, child.isAlwaysSuccessful);
    _setCanChangePosition(node, child.canChangePosition);
    _setSuccessCount(node, child.successCount);
    _setFailureCount(node, child.failureCount);
    _setIsConst(node, false);
  }

  @override
  void visitCharacterClass(CharacterClassExpression node) {
    _setIsAlwaysSuccessful(node, false);
    _setCanChangePosition(node, true);
    _setSuccessCount(node, 1);
    _setFailureCount(node, 1);
    _setIsConst(node, true);
  }

  @override
  void visitGroup(GroupExpression node) {
    final child = node.expression;
    _setIsReturn(child, node.isReturn);
    _setIsVoid(child, node.isVoid);
    _setParent(child, node);
    child.accept(this);
    _setIsAlwaysSuccessful(node, child.isAlwaysSuccessful);
    _setCanChangePosition(node, child.canChangePosition);
    _setSuccessCount(node, child.successCount);
    _setFailureCount(node, child.failureCount);
    _setIsConst(node, child.isConst);
  }

  @override
  void visitLiteral(LiteralExpression node) {
    final text = node.text;
    _setIsAlwaysSuccessful(node, text.isEmpty);
    _setCanChangePosition(node, text.isNotEmpty);
    _setSuccessCount(node, 1);
    _setFailureCount(node, text.isEmpty ? 0 : 1);
    _setIsConst(node, true);
  }

  @override
  void visitMatch(MatchExpression node) {
    final text = node.text;
    _setIsAlwaysSuccessful(node, text.isEmpty);
    _setCanChangePosition(node, text.isNotEmpty);
    _setSuccessCount(node, 1);
    _setFailureCount(node, text.isEmpty ? 0 : 1);
    _setIsConst(node, false);
  }

  @override
  void visitNotPredicate(NotPredicateExpression node) {
    final child = node.expression;
    _setIsVoid(child, true);
    _setParent(child, node);
    child.accept(this);
    _setIsAlwaysSuccessful(node, false);
    _setCanChangePosition(node, false);
    _setSuccessCount(node, child.failureCount);
    _setFailureCount(node, 1);
    _setIsConst(node, true);
  }

  @override
  void visitOneOrMore(OneOrMoreExpression node) {
    final child = node.expression;
    _setIsReturn(child, true);
    _setIsVoid(child, node.isVoid);
    _setParent(child, node);
    child.accept(this);
    _setIsAlwaysSuccessful(node, child.isAlwaysSuccessful);
    _setCanChangePosition(node, child.canChangePosition);
    _setSuccessCount(node, 1);
    _setFailureCount(node, 1);
    _setIsConst(node, false);
  }

  @override
  void visitOptional(OptionalExpression node) {
    final child = node.expression;
    _setIsVoid(child, node.isVoid);
    _setParent(child, node);
    child.accept(this);
    _setIsAlwaysSuccessful(node, true);
    _setCanChangePosition(node, child.canChangePosition);
    if (child is ProductionExpression) {
      _setSuccessCount(node, 1);
    } else if (child is AnyCharacterExpression ||
        child is CharacterClassExpression ||
        child is LiteralExpression ||
        child is MatchExpression ||
        child is TokenExpression) {
      _setSuccessCount(node, 1);
    } else {
      _setSuccessCount(node, child.successCount + child.failureCount);
    }

    _setFailureCount(node, 0);
    _setIsConst(node, false);
  }

  @override
  void visitOrderedChoice(OrderedChoiceExpression node) {
    final children = node.expressions;
    final last = children.last;
    var successCount = 0;
    var failureCount = 0;
    _setIsLatest(last, node.isLatest);
    for (var i = 0; i < children.length; i++) {
      final child = children[i];
      _setIsVoid(child, node.isVoid);
      _setIsReturn(child, node.isReturn);
      _setParent(child, node);
      child.accept(this);
      successCount += child.successCount;
      failureCount += child.failureCount;
    }

    _setSuccessCount(node, successCount);
    _setFailureCount(node, failureCount);
    _setIsAlwaysSuccessful(node, children.any((e) => e.isAlwaysSuccessful));
    _setCanChangePosition(node, children.any((e) => e.canChangePosition));
    if (children.length == 1) {
      final child = children.first;
      _setIsConst(node, child.isConst);
    } else {
      _setIsConst(node, false);
    }
  }

  @override
  void visitPosition(PositionExpression node) {
    _setIsAlwaysSuccessful(node, true);
    _setCanChangePosition(node, true);
    _setSuccessCount(node, 1);
    _setFailureCount(node, 0);
    _setIsConst(node, true);
  }

  @override
  void visitPredicate(PredicateExpression node) {
    _setIsAlwaysSuccessful(node, false);
    _setCanChangePosition(node, false);
    _setSuccessCount(node, 1);
    _setFailureCount(node, 1);
    _setIsConst(node, true);
  }

  @override
  void visitProduction(ProductionExpression node) {
    final name = node.name;
    final production = productions[name];
    _productionsUsed[name] = true;
    if (production == null) {
      _setIsAlwaysSuccessful(node, false);
      _setCanChangePosition(node, true);
    } else {
      final expression = production.expression;
      _setIsAlwaysSuccessful(node, expression.isAlwaysSuccessful);
      _setCanChangePosition(node, expression.canChangePosition);
    }

    _setSuccessCount(node, 1);
    _setFailureCount(node, node.isAlwaysSuccessful ? 0 : 1);
    _setIsConst(node, false);
  }

  @override
  void visitSequence(SequenceExpression node) {
    final children = node.expressions;
    final last = children.last;
    final semanticValues = <String>{};
    for (final child in children) {
      final semanticValue = child.semanticValue;
      if (semanticValue != null) {
        if (!semanticValues.add(semanticValue)) {
          _warnings.add('''
Duplicate semantic value name.
Semantic value: $semanticValue
Production: $_name''');
        }
      }
    }

    final isNotAlwaysSuccessful = children.any((e) => !e.isAlwaysSuccessful);
    _setIsReturn(last, node.isReturn);
    _setIsLatest(last, node.isLatest);
    if (children.length == 1) {
      final child = children.first;
      _setIsVoid(child, node.isVoid);
      _setParent(child, node);
      child.accept(this);
      _setIsConst(node, child.isConst);
      _setSuccessCount(node, child.successCount);
      _setFailureCount(node, child.failureCount);
    } else {
      var failureCount = 0;
      _setIsConst(node, false);
      for (final child in children) {
        _setIsVoid(child, true);
        _setParent(child, node);
        child.accept(this);
        failureCount += child.failureCount;
      }

      _setSuccessCount(node, last.successCount);
      _setFailureCount(node, failureCount);
    }

    _setIsAlwaysSuccessful(node, !isNotAlwaysSuccessful);
    _setCanChangePosition(node, children.any((e) => e.canChangePosition));
  }

  @override
  void visitToken(TokenExpression node) {
    _setIsAlwaysSuccessful(node, false);
    _setCanChangePosition(node, true);
    _setSuccessCount(node, 1);
    _setFailureCount(node, 1);
    _setIsConst(node, false);
  }

  @override
  void visitValue(ValueExpression node) {
    var valueType = node.valueType;
    _setIsAlwaysSuccessful(node, true);
    _setCanChangePosition(node, false);
    _setSuccessCount(node, 1);
    _setFailureCount(node, 0);
    var isConst = false;
    if (valueType != null) {
      valueType = valueType.trim();
      isConst = valueType.startsWith('const');
    }

    _setIsConst(node, isConst);
  }

  @override
  void visitWhile(WhileExpression node) {
    final child = node.expression;
    final range = node.range;
    final min = range.$1;
    final isAlwaysSuccessful = min == 0;
    _setIsReturn(child, true);
    _setIsVoid(child, node.isVoid);
    _setParent(child, node);
    child.accept(this);
    _setIsAlwaysSuccessful(
      node,
      child.isAlwaysSuccessful || isAlwaysSuccessful,
    );
    _setCanChangePosition(node, child.canChangePosition);
    _setSuccessCount(node, 1);
    _setFailureCount(node, min == 0 ? 0 : 1);
    _setIsConst(node, false);
  }

  @override
  void visitZeroOrMore(ZeroOrMoreExpression node) {
    final child = node.expression;
    _setIsReturn(child, true);
    _setIsVoid(child, node.isVoid);
    _setParent(child, node);
    child.accept(this);
    _setIsAlwaysSuccessful(node, true);
    _setCanChangePosition(node, child.canChangePosition);
    _setSuccessCount(node, 1);
    _setFailureCount(node, 0);
    _setIsConst(node, false);
  }

  void _setCanChangePosition(Expression node, bool canChangePosition) {
    if (node.canChangePosition != canChangePosition) {
      _hasChanges = true;
      node.canChangePosition = canChangePosition;
    }
  }

  void _setFailureCount(Expression node, int failureCount) {
    if (node.failureCount != failureCount) {
      _hasChanges = true;
      node.failureCount = failureCount;
    }
  }

  void _setIsAlwaysSuccessful(Expression node, bool isAlwaysSuccessful) {
    if (node.isAlwaysSuccessful != isAlwaysSuccessful) {
      _hasChanges = true;
      node.isAlwaysSuccessful = isAlwaysSuccessful;
    }
  }

  void _setIsConst(Expression node, bool isConst) {
    if (node.isConst != isConst) {
      _hasChanges = true;
      node.isConst = isConst;
    }
  }

  void _setIsLatest(Expression node, bool isLatest) {
    if (node.isLatest != isLatest) {
      _hasChanges = true;
      node.isLatest = isLatest;
    }
  }

  void _setIsReturn(Expression node, bool isReturn) {
    if (node.isReturn != isReturn) {
      _hasChanges = true;
      node.isReturn = isReturn;
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

  void _setParent(Expression node, Expression parent) {
    if (node.parent != parent) {
      _hasChanges = true;
      node.parent = parent;
    }
  }

  void _setSuccessCount(Expression node, int successCount) {
    if (node.successCount != successCount) {
      _hasChanges = true;
      node.successCount = successCount;
    }
  }
}
