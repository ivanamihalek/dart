/*
In Dart, every generic type parameter must be declared in angle brackets <>
on the entity that uses it, whether that's a class, function, or method.
 Without <T> on the function, Dart doesn't know that T is a type parameter
 rather than a concrete (but undefined) type.
 */

sealed class Result<T> {}

class Success<T> extends Result<T> {
  final T data;
  Success(this.data);
}

class Failure<T> extends Result<T> {
  final String error;
  Failure(this.error);
}
//  In Dart, generic type parameters must be declared on the function signature.
// so this would be wrong:
// T processResult(Result<T> result) {
// the proper signature declaration:
T processResult<T>(Result<T> result) {
  switch (result) {
    case Success(data: final data):
      return data;
    case Failure(error: final error):
      throw Exception(error);
  }
}

void main() {
  final success = Success<int>(42);
  final failure = Failure<int>('Something went wrong');

  print(processResult(success));         // 42
  print(processResult(failure));         // throws Exception
}