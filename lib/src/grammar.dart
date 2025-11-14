import 'expressions.dart';

class Grammar {
  final String? globals;

  final String? members;

  final List<Production> productions;

  Grammar({
    required this.globals,
    required this.members,
    required this.productions,
  });
}
