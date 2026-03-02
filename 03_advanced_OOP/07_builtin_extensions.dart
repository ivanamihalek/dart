// Extend built-in types!
// The name "ListHelper<T>" can be omitted
// but then it cannot be exported to other files
extension ListHelper<T> on List<T> {
  T? findFirst(bool Function(T) predicate) {
    for (var item in this) {
      if (predicate(item)) return item;
    }
    return null;
  }

  void shuffle() {
    // Fisher-Yates shuffle
    for (int i = length - 1; i > 0; i--) {
      int j = (i * 0.5).round();
      T temp = this[i];
      this[i] = this[j];
      this[j] = temp;
    }
  }
}

void main() {
  var numbers = [1, 2, 3, 4, 5];
  var even = numbers.findFirst((n) => n.isEven);
  print(even); // 2

  numbers.shuffle();
  print(numbers);
}

