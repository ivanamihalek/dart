/*
Privacy is by convention.
Compiler warns only if a private attr is accessed from different library

 */

class BankAccount {
  // Private field (only accessible within this library/file)
  double _balance = 0;

  // Public getter (read-only access)
  String get owner => 'Account Holder';

  // Public getter for balance (can't modify directly)
  double get balance => _balance;

  // Public methods (control access)
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Deposited: $amount. New balance:$_balance');
    } else {
      print('Invalid deposit amount');
    }
  }

  bool withdraw(double amount) {
    if (amount <= _balance && amount > 0) {
      _balance -= amount;
      print('Withdrew:$amount. New balance: $_balance');
      return true;
    }
    print('Insufficient funds or invalid amount');
    return false;
  }

  // Private method (internal use only)
  void _updateInterest(double rate) {
    _balance *= (1 + rate);
  }
}

void main() {
  var account = BankAccount();

  print('Owner: ${account.owner}');
  print('Initial balance: ${account.balance}');

  account.deposit(1000);
  account.deposit(500);

  account.withdraw(300);
  account.withdraw(2000); // Will fail

  print('Final balance: ${account.balance}');

  // DEMONSTRATE PRIVACY LIMITATIONS:
  print('\n--- Privacy Test ---');
  account._balance = -100;  // OK - compiles!
  account._updateInterest(0.05); // OK - compiles!

  // But these are PRIVATE by CONVENTION:
  // You CAN access them, but you SHOULDN'T!
}