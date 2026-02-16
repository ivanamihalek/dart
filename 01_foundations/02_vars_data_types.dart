/*
Key Rules:
    var infers type: var count = 10; (becomes int)
    final (can't reassign): final String name = 'Bob'; // assigned at runtime
    const (compile-time constant): const pi = 3.14; // assigned at compile time
 */


void main() {
  // Numbers
  int age = 25;
  double height = 5.9;
  final width;
  width = 5;

  // Strings
  String name = 'Alice';
  String greeting = "Hello, $name!"; // Interpolation

  // Boolean
  bool isStudent = true;

  // Dynamic (type not known at compile time - avoid in production)
  dynamic value = 42;
  value = "blah";

  print('Name: $name, Age: $age');
  print('Greeting: $greeting');
  print('width: $width');
}