/*
Functional programming favors immutable data (data that doesn’t change).

Mutable (not FP-style):
 */
void main() {
  final numbers = <int>[1, 2, 3];
  numbers.add(4);
  print(numbers); // [1, 2, 3, 4]

  // Immmutable-style
  var list = [1, 2, 3];
  var newList = [...list, 4]; // creates new list

  const list2 = [1, 2, 3]; // completely immutable
}