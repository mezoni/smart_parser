import 'json_token.dart';

class JsonArray extends JsonValue {
  final Token openBracket;

  final List<JsonCollectionElement<JsonValue>> elements;

  final Token closeBracket;

  JsonArray(this.openBracket, this.elements, this.closeBracket);

  @override
  int get end => closeBracket.end;

  @override
  int get start => openBracket.start;

  @override
  T accept<T>(JsonVisitor<T> visitor) {
    return visitor.visitList(this);
  }

  @override
  String toString() {
    return '$openBracket${elements.join()}$closeBracket';
  }

  @override
  void visitChildren<T>(JsonVisitor<T> visitor) {
    for (final element in elements) {
      element.value.accept(visitor);
    }
  }
}

class JsonBoolean extends JsonValue {
  final Token booleanToken;

  JsonBoolean(this.booleanToken);

  @override
  int get end => booleanToken.end;

  @override
  int get start => booleanToken.start;

  @override
  T accept<T>(JsonVisitor<T> visitor) {
    return visitor.visitBoolean(this);
  }

  @override
  String toString() {
    return '$booleanToken';
  }
}

class JsonCollectionElement<T extends JsonValue> {
  final Token? comma;

  final T value;

  JsonCollectionElement(this.comma, this.value);

  @override
  String toString() {
    if (comma == null) {
      return '$value';
    }

    return '$comma $value';
  }
}

class JsonKeyValuePair extends JsonValue {
  final JsonString string;

  final Token colon;

  final JsonValue value;

  JsonKeyValuePair(this.string, this.colon, this.value);

  @override
  int get end => value.end;

  @override
  int get start => string.start;

  @override
  T accept<T>(JsonVisitor<T> visitor) {
    return visitor.visitKeyValuePair(this);
  }

  @override
  String toString() {
    return '$string $colon $value';
  }

  @override
  void visitChildren<T>(JsonVisitor<T> visitor) {
    string.accept(visitor);
    value.accept(visitor);
  }
}

class JsonNull extends JsonValue {
  final Token nullKeyword;

  JsonNull(this.nullKeyword);

  @override
  int get end => nullKeyword.end;

  @override
  int get start => nullKeyword.start;

  @override
  T accept<T>(JsonVisitor<T> visitor) {
    return visitor.visitNull(this);
  }

  @override
  String toString() {
    return '$nullKeyword';
  }
}

class JsonNumber extends JsonValue {
  final Token numberToken;

  JsonNumber(this.numberToken);

  @override
  int get end => numberToken.end;

  @override
  int get start => numberToken.start;

  @override
  T accept<T>(JsonVisitor<T> visitor) {
    return visitor.visitNumber(this);
  }

  @override
  String toString() {
    return '$numberToken';
  }
}

class JsonObject extends JsonValue {
  final Token openBrace;

  final List<JsonCollectionElement<JsonKeyValuePair>> elements;

  final Token closeBrace;

  JsonObject(this.openBrace, this.elements, this.closeBrace);

  @override
  int get end => closeBrace.end;

  @override
  int get start => openBrace.start;

  @override
  T accept<T>(JsonVisitor<T> visitor) {
    return visitor.visitObject(this);
  }

  @override
  String toString() {
    return '$openBrace${elements.join()}$closeBrace';
  }

  @override
  void visitChildren<T>(JsonVisitor<T> visitor) {
    for (final element in elements) {
      element.value.accept(visitor);
    }
  }
}

class JsonString extends JsonValue {
  final Token stringToken;

  JsonString(this.stringToken);

  @override
  int get end => stringToken.end;

  @override
  int get start => stringToken.start;

  @override
  T accept<T>(JsonVisitor<T> visitor) {
    return visitor.visitString(this);
  }

  @override
  String toString() {
    return '$stringToken';
  }
}

abstract class JsonValue {
  int get end;

  int get start;

  T accept<T>(JsonVisitor<T> visitor);

  void visitChildren<T>(JsonVisitor<T> visitor) {
    //
  }
}

abstract class JsonVisitor<T> {
  T visitBoolean(JsonBoolean node);

  T visitKeyValuePair(JsonKeyValuePair node);

  T visitList(JsonArray node);

  T visitNull(JsonNull node);

  T visitNumber(JsonNumber node);

  T visitObject(JsonObject node);

  T visitString(JsonString node);
}
