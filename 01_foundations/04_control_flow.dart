void main() {
  int score = 85;

  if (score >= 90) {
    print('A');
  } else if (score >= 80) {
    print('B');
  } else {
    print('C');
  }

  // For loop
  for (int i = 0; i < 5; i++) {
    print('Count: $i');
  }

  // For-in (collections)
  List<String> fruits = ['apple', 'banana', 'orange'];
  for (String fruit in fruits) {
    print(fruit);
  }

  // While
  int count = 0;
  while (count < 3) {
    print(++count);
  }

  String day = 'Monday';

  switch (day) {
    case 'Monday':
    case 'Tuesday':
      print('Workday');
      break;
    case 'Saturday':
    case 'Sunday':
      print('Weekend');
      break;
    default:
      print('Midweek');
  }


}
