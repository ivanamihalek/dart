/*
Dart doesn’t have built-in Option or Either types like some FP languages, but you can mimic them or use packages like:

dartz
fpdart
Example using nullable:
 */
String? getName(bool success) {
  return success ? "Alice" : null;
}

void main() {
  var name = getName(false);
  print(name ?? "Default Name");
}