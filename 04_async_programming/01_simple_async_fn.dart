
Future<int> waiter() async {
    print("Waiter started");
    await Future.delayed(Duration(seconds: 2));
    print("Waiter about to return something.");
    return 7;
}

 someFn(result) {
    print("Got result: ${result*4}");
}

main() async {
  //String waiterResponse = await waiter();
  waiter().then((x)=>print("$x ****"));
  // waiter().then((result) {
  //   print("Got result: $result");
  // });

  print("bye bye");
}
