/*
class Dog extends Animal {
  // These are both correct:

  @override                        // ← modern recommended style
  void makeSound() { ... }

  void makeSound() { ... }         // ← also 100% legal, just less explicit
}

"Not necessary, but please add @override — it's good style and helps prevent bugs."
Reasons:
    Makes it immediately obvious that this method is not a new method
    Catches typos/renaming mistakes very early (safety net)
    Improves readability, especially in large classes
    Matches the style used in almost all official Flutter examples since ~2020
 */

class Animal {
  String name;
  Animal(this.name);

  void makeSound() {
    print('$name makes a sound ****************');
  }

  void sleep() => print('$name is sleeping');
}

class Dog extends Animal {
  Dog(String name) : super(name); // Call parent constructor

  @override
  void makeSound() {
    print('$name says WOOF!');
  }

  // Dog-specific method
  void fetch() => print('$name is fetching the ball!');
}

class Cat extends Animal {
  Cat(String name) : super(name);

  @override
  void makeSound() {
    print('$name says MEOW!');
  }
}

void main() {
  List<Animal> pets = [
    Dog('Buddy'),
    Cat('Whiskers'),
    Dog('Max'),
  ];

  for (Animal pet in pets) {
    pet.makeSound();  // Each calls its own version!
    pet.sleep();
  }
}