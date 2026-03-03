Stream<int> countStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() async {
  countStream().listen((number) {
    print(number);
  });
  await Future.delayed(Duration(seconds: 2));
  print("blah");
}