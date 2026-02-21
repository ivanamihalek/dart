abstract class Shape {
  // Abstract method (must implement) <==== NOTE
  double get area;

  // Concrete method
  void draw() => print('Drawing ${this.runtimeType}');

  // Getter with implementation
  String get description => 'A ${runtimeType}';
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double get area => 3.14159 * radius * radius;
}

class Rectangle extends Shape {
  double width, height;

  Rectangle(this.width, this.height);

  @override
  double get area => width * height;
}

void main() {
  List<Shape> shapes = [
    Circle(5),
    Rectangle(4, 6),
  ];

  for (var shape in shapes) {
    print('${shape.description}: ${shape.area}');
    shape.draw();
  }
}