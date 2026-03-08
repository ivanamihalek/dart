// You can extend types to create reusable FP utilities.
extension IterableExtension<T> on Iterable<T> {
  Iterable<T> filter(bool Function(T) test) {
    return where(test);
  }
}