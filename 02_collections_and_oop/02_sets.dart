void main() {
  Set<String> uniqueNames = {'Alice', 'Bob', 'Alice'}; // {'Alice', 'Bob'}

  uniqueNames.add('Charlie');     // {'Alice', 'Bob', 'Charlie'}
  uniqueNames.remove('Bob');      // {'Alice', 'Charlie'}
  print(uniqueNames);
  print(uniqueNames.contains('Alice')); // true
}