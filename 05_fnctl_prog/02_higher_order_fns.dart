/*
A higher-order function:

Takes a function as a parameter
OR returns a function
 */
void execute(Function action) {
  action();
}

void sayHi() {
  print('Hi!');
}

Function multiplyBy(int x) {
  return (int y) => x * y;
}

void main() {
  // passing a function
  execute(sayHi);
  // returning a function
  var doubleIt = multiplyBy(2);
  print(doubleIt(5)); // 10
}