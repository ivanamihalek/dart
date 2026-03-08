// A closure is a function that "remembers" variables from its surrounding scope.

Function counter() {
  int count = 0;

  return () {
    count++;
    return count;
  };
}

void main() {
  var increment = counter();

  print(increment()); // 1
  print(increment()); // 2
  // Even though counter() has finished executing, count is remembered.
}
