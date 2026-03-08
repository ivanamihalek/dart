void main() {
  var numbers = [1, 2, 3];
  // a function without a name
  numbers.forEach((number) {
    print(number);
  });
  // short syntax ("arrow syntax"))
  numbers.forEach((number) => print(number));
}