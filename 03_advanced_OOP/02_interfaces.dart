import 'dart:math' as math;

// 1. INTERFACE (no implementation allowed)
abstract interface class Shape {  // Dart 3+ syntax (or just abstract class Shape {})
  double get area;  // Pure contract - MUST implement
  String get description; // Pure contract
  void draw();  // Pure contract
}

// 2. IMPLEMENTATION
class Circle implements Shape {
  double radius;

  Circle(this.radius);

  @override
  double get area => 3.14159 * radius * radius;

  @override
  String get description => 'Circle (r=$radius)';

  @override
  void draw() {
    print('🔴 Drawing ${description}');
  }
}

class Rectangle implements Shape {
  double width, height;

  Rectangle(this.width, this.height);

  @override
  double get area => width * height;

  @override
  String get description => 'Rectangle (${width}x$height)';

  @override
  void draw() {
    print('📦 Drawing ${description}');
  }
}

class Triangle implements Shape {
  double side1, side2, side3;

  Triangle(this.side1, this.side2, this.side3);

  @override
  double get area {
    // Heron's formula
    double s = (side1 + side2 + side3) / 2;
    return math.sqrt(s * (s - side1) * (s - side2) * (s - side3));
  }

  @override
  String get description => 'Triangle (${side1}/${side2}/${side3})';

  @override
  void draw() {
    print('🔺 Drawing ${description}');
  }
}

void main() {
  // Polymorphism with interfaces!
  List<Shape> shapes = [
    Circle(5),
    Rectangle(4, 6),
    Triangle(3, 4, 5),
  ];

  double totalArea = 0;

  print('=== INTERFACE SHAPES ===');
  for (Shape shape in shapes) {
    print('${shape.description}: ${shape.area.toStringAsFixed(2)}');
    shape.draw();
    totalArea += shape.area;
  }

  print('\nTotal area: ${totalArea.toStringAsFixed(2)}');

  // Interface-specific methods only!
  // shape.someConcreteMethod(); // ❌ ERROR - interfaces have NO implementation!
}