// Basic function
String greet(String name) {
  return 'Hello, $name!';
}

int summa(int a, [int? b=5]) {
  var retval = b == null? a : a+b;
  return retval;
}

int summb(int a, {int? b=5}) {
  var retval = b == null? a : a+b;
  return retval;
}

// With optional parameters
String describePerson(String name, {int? age, String? city}) {
  return '$name ${age != null ? '($age)' : ''} from $city';
}

// Arrow syntax (single expression)
int square(int x) => x * x;

// Main function parameters
void main(List<String> args) {
  print(greet('Alice'));
  print(greet(args[0]));
  print(describePerson('Bob', age: 30, city: 'NYC'));
  print(square(5));
  print(summa(6, 66));
  print(summb(6, b:66));
}
