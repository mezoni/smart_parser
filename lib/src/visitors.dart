import 'expressions.dart';

abstract class Visitor<T> {
  T visitAction(ActionExpression node);

  T visitAndPredicate(AndPredicateExpression node);

  T visitAnyCharacter(AnyCharacterExpression node);

  T visitCapture(CaptureExpression node);

  T visitCharacterClass(CharacterClassExpression node);

  T visitGroup(GroupExpression node);

  T visitLiteral(LiteralExpression node);

  T visitMatch(MatchExpression node);

  T visitNotPredicate(NotPredicateExpression node);

  T visitOneOrMore(OneOrMoreExpression node);

  T visitOptional(OptionalExpression node);

  T visitOrderedChoice(OrderedChoiceExpression node);

  T visitPosition(PositionExpression node);

  T visitPredicate(PredicateExpression node);

  T visitProduction(ProductionExpression node);

  T visitSequence(SequenceExpression node);

  T visitToken(TokenExpression node);

  T visitValue(ValueExpression node);

  T visitWhile(WhileExpression node);

  T visitZeroOrMore(ZeroOrMoreExpression node);
}

abstract class VisitorBase<T> implements Visitor<T> {
  @override
  T visitAction(ActionExpression node) => visitNode(node);

  @override
  T visitAndPredicate(AndPredicateExpression node) => visitNode(node);

  @override
  T visitAnyCharacter(AnyCharacterExpression node) => visitNode(node);

  @override
  T visitCapture(CaptureExpression node) => visitNode(node);

  @override
  T visitCharacterClass(CharacterClassExpression node) => visitNode(node);

  @override
  T visitGroup(GroupExpression node) => visitNode(node);

  @override
  T visitLiteral(LiteralExpression node) => visitNode(node);

  @override
  T visitMatch(MatchExpression node) => visitNode(node);

  T visitNode(Expression node);

  @override
  T visitNotPredicate(NotPredicateExpression node) => visitNode(node);

  @override
  T visitOneOrMore(OneOrMoreExpression node) => visitNode(node);

  @override
  T visitOptional(OptionalExpression node) => visitNode(node);

  @override
  T visitOrderedChoice(OrderedChoiceExpression node) => visitNode(node);

  @override
  T visitPosition(PositionExpression node) => visitNode(node);

  @override
  T visitPredicate(PredicateExpression node) => visitNode(node);

  @override
  T visitProduction(ProductionExpression node) => visitNode(node);

  @override
  T visitSequence(SequenceExpression node) => visitNode(node);

  @override
  T visitToken(TokenExpression node) => visitNode(node);

  @override
  T visitValue(ValueExpression node) => visitNode(node);

  @override
  T visitWhile(WhileExpression node) => visitNode(node);

  @override
  T visitZeroOrMore(ZeroOrMoreExpression node) => visitNode(node);
}
