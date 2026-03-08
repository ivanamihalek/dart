
void main() {
  // map() Transforms each element.
  var numbers = [1, 2, 3, 4];
  var doubled = numbers.map((n) => n * 2).toList();
  print(doubled); // [2, 4, 6, 8]

  // where() filter
  var evens = numbers.where((n) => n % 2 == 0).toList();
  print(evens); // [2, 4]

  // reduce() Combines elements into one value.
  var sum = numbers.reduce((a, b) => a + b);
  print(sum); // 10

}
