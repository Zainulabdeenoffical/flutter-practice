// String globalVar = "I am a Global Variable";

// void main() {
//   print(globalVar);
//   anotherFunction();
// }

// void anotherFunction() {
//   print(globalVar);
// }
// void main() {

//   String localVar = "I am a Local Variable";

//   print(localVar);

//   anotherFunction();
// }

// void anotherFunction() {
//   // ❌ Error: localVar is not accessible here
//   // print(localVar);
// }

//   String localVar = "I am a Local Variable";

//   print(localVar);

//   anotherFunction();
// }

// void anotherFunction() {
//   // ❌ Error: localVar is not accessible here
//   // print(localVar);
// }
void main() {
  if (true) {
    int blockVar = 10;
    print("Inside Block: $blockVar"); // ✅ Accessible here
  }

  // ❌ Error: blockVar is not accessible outside the block
  // print(blockVar);
}
