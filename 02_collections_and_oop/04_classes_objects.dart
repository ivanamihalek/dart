class Person {
  // Fields (properties)
  String name;
  int age;

  // Constructor
  //Person( this.age, this.name);
  Person(int a, String n) :
    age = a,
    name = n;


  // Named constructor
  Person.guest() : name = 'Guest', age = 0;

  // Named constructor
  Person.guest2() : name = 'Tsueg', age = 100;

  // Method
  void introduce() {
    print('Hi, I\'m $name, $age years old');
  }

  // Getter
  String get description => '$name ($age)';

 // Getter
  (String, int) get asRecord => (name, age);

  // Setter
  set updateAge(int newAge) {
    if (newAge >= 0) age = newAge;
  }
}

void main() {
  var person1 = Person(25, 'Alice');
  var person2 = Person.guest();
  var person4 = Person.guest2();

  person1.introduce();      // Hi, I'm Alice, 25 years old
  print(person2.description); // Guest (0)
  print(person4.description);
  print(person4.asRecord);
  person1.updateAge = 26;
}
