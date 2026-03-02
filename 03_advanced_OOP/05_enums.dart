
enum Days { mon, tue, wed, thu, fri, sat, sun }

enum Priority {
  low(-1), normal(2), high(5), hysterical(9);

  final int level;
  const Priority(this.level);

  // bool get isUrgent => level >= 3;
  // Priority next() => values[(index + 1) % values.length];
}


enum OrderStatus {
  pending('Waiting...'),
  confirmed('On the way'),
  delivered('Complete');

  final String message;
  const OrderStatus(this.message);

  bool get isComplete => this == delivered;
}

void main() {
  print(Days.mon.index);  // 0
  print(Days.sun.index);  // 6

  print(Days.mon.name);  // mon
  print(Days.sun.name);  // sun


  OrderStatus status = OrderStatus.confirmed;
  print(status.message);     // "On the way"
  print(status.isComplete);  // false
}