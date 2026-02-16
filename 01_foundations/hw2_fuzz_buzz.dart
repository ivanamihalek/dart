
void main() {

  for (int d=1; d<=100; d++) {
       if (d%3 == 0) {
         print("fuzz");
       } else if (d%5 == 0) {
         print("buzz");
       } else {
         print(d);
       }
  }

}