/*
A pure function:

Always returns the same output for the same input
Has no side effects (doesn’t modify outside state)
✅ Pure:
 */
int add(int a, int b) {
  return a + b;
}

/*
❌ Not pure:
 */
int counter = 0;

int increment() {
  counter++;   // modifies external state
  return counter;
}
// Pure functions are easier to test and reason about.


