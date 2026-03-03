
Future<String> waiter() async {
    print("Waiter started");
    await Future.delayed(Duration(seconds: 2));
    print("Waiter about to return something.");
    return "Waiter returned";
}

main() async {
  //String waiterResponse = await waiter();
  waiter().then((result) {
    print("Got result: $result");
  });
  print("bye bye");
}
