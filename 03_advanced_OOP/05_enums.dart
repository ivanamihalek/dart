enum OrderStatus {
  pending('Waiting...'),
  confirmed('On the way'),
  delivered('Complete');

  final String message;
  const OrderStatus(this.message);

  bool get isComplete => this == delivered;
}

void main() {
  OrderStatus status = OrderStatus.confirmed;
  print(status.message);     // "On the way"
  print(status.isComplete);  // false
}