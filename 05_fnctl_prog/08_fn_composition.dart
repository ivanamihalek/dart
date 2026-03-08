// Combining small functions to build bigger ones.
int add2(int x) => x + 2;
int multiply3(int x) => x * 3;

int compose(int Function(int) f, int Function(int) g, int value) {
  return f(g(value));
}

void main() {
  var result = compose(add2, multiply3, 4);
  print(result); // add2(multiply3(4)) = 14
}
