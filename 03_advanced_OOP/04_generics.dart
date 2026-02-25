// Generic Stack
class Stack<T> {
  List<T> _items = [];

  void push(T item) => _items.add(item);

  T? pop() => _items.isNotEmpty ? _items.removeLast() : null;

  bool get isEmpty => _items.isEmpty;
}

// Type-safe usage
void main() {
  var intStack = Stack<int>();
  intStack.push(42);
  intStack.push(100);

  print(intStack.pop()); // 100 (int!)

  // String stack
  var nameStack = Stack<String>();
  nameStack.push('Alice');

  // ERROR: nameStack.push(42); // Won't compile!

  //collection generics
  //Map<String, List<Person>> peopleByCity = {};
  List<Map<String, dynamic>> jsonData = [];
  Set<int> uniqueIds = {};
}
