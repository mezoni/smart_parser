import 'expressions.dart';
import 'helper.dart' as helper;

class ExpressionTypeResolver implements Visitor<void> {
  static final Set<String> _defaultTypes = () {
    final result = <String>{};
    result.add(Expression.defaultType);
    const template = 'List<#>';
    var lastType = 'List<${Expression.defaultType}>';
    result.add(lastType);
    for (var i = 0; i < 20; i++) {
      lastType = template.replaceAll('#', lastType);
      result.add(lastType);
    }

    return result;
  }();

  var hasChanges = false;

  final Map<String, Production> productions;

  ExpressionTypeResolver({required this.productions});

  void resolve(Expression expression) {
    while (true) {
      hasChanges = false;
      expression.accept(this);
      if (!hasChanges) {
        break;
      }
    }
  }

  @override
  void visitAction(ActionExpression node) {
    _assignType(node, 'void');
  }

  @override
  void visitAndPredicate(AndPredicateExpression node) {
    final child = node.expression;
    child.accept(this);
    _assignType(node, 'void');
  }

  @override
  void visitAnyCharacter(AnyCharacterExpression node) {
    _assignType(node, 'int');
  }

  @override
  void visitCapture(CaptureExpression node) {
    _assignType(node, 'String');
  }

  @override
  void visitCharacterClass(CharacterClassExpression node) {
    _assignType(node, 'int');
  }

  @override
  void visitGroup(GroupExpression node) {
    _assignTypeBothWays(node);
  }

  @override
  void visitLiteral(LiteralExpression node) {
    _assignType(node, 'String');
  }

  @override
  void visitMatch(MatchExpression node) {
    _assignType(node, 'String');
  }

  @override
  void visitNotPredicate(NotPredicateExpression node) {
    final child = node.expression;
    child.accept(this);
    _assignType(node, 'void');
  }

  @override
  void visitOneOrMore(OneOrMoreExpression node) {
    _assignTypeForWhileExpression(node);
  }

  @override
  void visitOptional(OptionalExpression node) {
    final child = node.expression;
    child.accept(this);
    final childType = child.type;
    final type = helper.getNullableType(childType);
    _assignType(node, type);
  }

  @override
  void visitOrderedChoice(OrderedChoiceExpression node) {
    final children = node.expressions;
    final type = node.type;
    final types = <String>{};
    for (var i = 0; i < children.length; i++) {
      final child = children[i];
      _assignType(child, type);
      child.accept(this);
      types.add(child.type);
    }

    if (types.length == 1) {
      _assignType(node, types.first);
    }
  }

  @override
  void visitPosition(PositionExpression node) {
    _assignType(node, 'void');
  }

  @override
  void visitPredicate(PredicateExpression node) {
    _assignType(node, 'void');
  }

  @override
  void visitProduction(ProductionExpression node) {
    var production = node.production;
    if (production == null) {
      final name = node.name;
      production = productions[name];
    }

    if (production != null) {
      _assignType(node, production.type);
    }
  }

  @override
  void visitSequence(SequenceExpression node) {
    final children = node.expressions;
    final type = node.type;
    if (children.length == 1) {
      final child = children[0];
      _assignType(child, type);
      child.accept(this);
      _assignType(node, child.type);
    } else {
      Expression? resultingChild;
      for (var i = 0; i < children.length; i++) {
        final child = children[i];
        final semanticValue = child.semanticValue;
        if (semanticValue == '\$') {
          resultingChild = child;
          break;
        }
      }

      for (var i = 0; i < children.length; i++) {
        final child = children[i];
        if (child == resultingChild) {
          _assignType(child, node.type);
        }

        child.accept(this);
        if (child == resultingChild) {
          _assignType(node, child.type);
        }
      }
    }
  }

  @override
  void visitToken(TokenExpression node) {
    _assignType(node, 'Token');
  }

  @override
  void visitValue(ValueExpression node) {
    final explicitType = node.explicitType;
    _assignType(node, explicitType);
  }

  @override
  void visitWhile(WhileExpression node) {
    _assignTypeForWhileExpression(node);
  }

  @override
  void visitZeroOrMore(ZeroOrMoreExpression node) {
    _assignTypeForWhileExpression(node);
  }

  void _assignType(Expression node, String? type) {
    final explicitType = node.explicitType;
    if (explicitType != null) {
      type = explicitType;
      type = type.trim();
      if (type.startsWith('const')) {
        type = type.substring('const'.length);
        type = type.trimLeft();
      }
    }

    if (assignType(node, type)) {
      hasChanges = true;
    }
  }

  void _assignTypeBothWays(SingleExpression node) {
    final child = node.expression;
    final type = node.type;
    _assignType(child, type);
    child.accept(this);
    _assignType(node, child.type);
  }

  void _assignTypeForWhileExpression(SingleExpression node) {
    final child = node.expression;
    final type = node.type;
    if (type case final String type) {
      const prefix = 'List<';
      const suffix = '>';
      if (type.startsWith(prefix) && type.endsWith(suffix)) {
        final childType = type.substring(
          prefix.length,
          type.length - suffix.length,
        );
        _assignType(child, childType);
      }
    }

    child.accept(this);
    _assignType(node, 'List<${child.type}>');
  }

  static bool assignType(Expression node, String? type) {
    if (type == null) {
      return false;
    }

    type = type.trim();
    var nodeType = node.type.trim();
    nodeType = nodeType.startsWith('const')
        ? nodeType.substring('const'.length).trimLeft()
        : nodeType;
    if (nodeType == type) {
      return false;
    }

    if (!_defaultTypes.contains(nodeType)) {
      return false;
    }

    node.type = type;
    return true;
  }
}
