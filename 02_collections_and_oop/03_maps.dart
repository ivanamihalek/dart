int makeOlder(int age) {
  return age + 7;
}

void main() {
  // Create map
  Map<String, int> ages = {
    'Alice': 25,
    'Bob': 30,
  };

  // Add/update
  ages['Charlie'] = 35;
  ages.update('Alice', makeOlder); // Alice now 26

  // Access
  print(ages['Bob']);        // 30
  print(ages.containsKey('Dave')); // false

  // Iterate
  ages.forEach((name, age) {
    print('$name is $age years old');
  });
}