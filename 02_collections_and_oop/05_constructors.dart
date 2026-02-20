class Car {
  final String brand;
  final String model;
  final int year;

  // Default constructor
  Car(this.brand, this.model, this.year);

  // Named constructors
  Car.tesla(String model) : brand = 'Tesla', model = model, year = 2024;
  Car.used(String brand, String model) :
      this.brand = brand, model = model, year = 2018;

  // Factory constructor (can return existing objects)
  factory Car.fromString(String input) {
    List<String> parts = input.split(' ');
    return Car(parts[0], parts[1], int.parse(parts[2]));
  }
}

void main() {
  Car car1 = Car("nexus", "blue", 2019);
  Car car2 = Car.tesla("silver");
  print(car2.model);

  Car car3 = Car.used('mercedes', "benz");
  print(car3.brand);

  Car car4 = Car.fromString("Skoda kanta 2001");
  print(car4.brand);
}