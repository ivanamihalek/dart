
/*
In Dart, functions are first-class objects. This means you can:

Assign them to variables
Pass them as arguments
Return them from other functions

 */
void greet(String name) {
  print('Hello, $name');
}

void main() {
  var sayHello = greet; // assign function to variable
  sayHello('Alice');
}