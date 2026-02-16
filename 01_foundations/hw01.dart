// Calculator: Build a command-line calculator with +, -, *, /, %
import 'dart:io';
// Starter for Exercise 1
double calculate(String operation, double a, double b) {
  switch (operation) {
    case '+': return a + b;
    case '-': return a - b;
    case '*': return a * b;
    case '/': return b != 0 ? a / b : 0;
    default: return 0;
  }
}

void checkArgsSanity(List<String> args) {
  // Check for the expected number of arguments (e.g., 2)
  if (args.length != 3) {
    // Print usage information to stderr
    stderr.writeln('Error: Expected 2 arguments, but found ${args.length}.');
    stderr.writeln('Usage: dart app,dart <operator> <float> <float>');
    stderr.writeln('');
    // Exit with a non-zero code to indicate an error
    exit(1);
  }

}

void main(List<String> args){
   checkArgsSanity(args);
   var operator = args[0];
   double? a = double.tryParse(args[1]);
   if (a ==null) {
     print("${args[1]} cannot be cast to double");
     exit(1);
   }
   double? b = double.tryParse(args[2]);
    if (b ==null) {
     print("${args[2]} cannot be cast to double");
     exit(1);
   }

   var result = calculate(operator, a, b);
   print(result);
}

