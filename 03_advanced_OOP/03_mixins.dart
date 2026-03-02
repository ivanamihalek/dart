// Mixin 1: Flyable behavior
// on restricts the base class that can use this mixin
mixin Flyable on Animal{
  void fly() => print('Flying high!');

  int get maxAltitude => 10000;
}

// Mixin 1: Flyable behavior
mixin Flyable2 {
  void fly() => print('Flying under the radar!');

  int get maxAltitude => 100;
}

// Mixin 2: Swimmer behavior
mixin Swimmer {
  void swim() => print('Swimming gracefully');

  double get swimSpeed => 5.0;
}

// Base class
class Animal {
  String name;
  Animal(this.name);
}

// Duck uses MULTIPLE mixins!
class Duck extends Animal with Flyable, Swimmer {
  Duck(String name) : super(name);

  @override
  void fly() {
    super.fly(); // Call parent mixin
    print('Quack quack while flying!');
  }
}
// this qill not work because Flyable
// can be a mixin only on something that extends Animale
// class Fly with Flyable, Swimmer {
//
//   String name;
//   Fly(this.name);
//
//   @override
//   void fly() {
//     super.fly(); // Call parent mixin
//     print('Buzz buzz while flying!');
//   }
// }


// drone suse multiple mixins too
class Drone extends Animal with Flyable, Flyable2 {
  Drone(String name) : super(name);

  @override
  void fly() {
    super.fly(); // Call parent mixin
    print('Drag optical cable while flying!');
  }
}

void main() {
  var donald = Duck('Donald');
  donald.fly();     // Flying high! Quack quack...
  donald.swim();    // Swimming gracefully

  var drone = Drone('big fat one');
  drone.fly();
  //
  // var fly = Fly('zunzara');
  // fly.fly();
  // fly.swim();
}