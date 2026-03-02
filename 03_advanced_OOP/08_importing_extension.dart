// without the keyword "short" we would export all extensions
// defined in   07_builtin_extensions.dart
import '07_builtin_extensions.dart' show ListHelper;

void main() {
  var numbers = [1, 2, 3, 4, 5];
  var even = numbers.findFirst((n) => n.isEven);
  print(even); // 2

  numbers.shuffle();
  print(numbers);
}
