void main() {
  // Create lists
  List<int> numbers = [1, 2, 3, 4, 5, 3, 3];
  List<String> names = ['Alice', 'Bob', 'Alice']; // Duplicates OK

  // List methods
  print(numbers.length);        // 7
  print(numbers[0]);           // 1 (first)
  print(numbers.last);         // 3 (last)

  numbers.add(6);              // [1,2,3,4,5,3, 3, 6]
  numbers.remove(3);           // [1,2,4,5,6]
  numbers.removeAt(0);         // [2,4,5,6]

  // List comprehension
  List<int> doubled = numbers.map((n) => n * 2).toList();
  print(doubled);              // [4, 8, 10, 12]
}