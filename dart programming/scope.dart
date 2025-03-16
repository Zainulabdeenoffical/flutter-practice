void main() {
  void outerFunction() {
    String outerVar = "Outer";

    void innerFunction() {
      print(outerVar);
    }

    innerFunction();
  }

  String globalVar = "I am Global Variable";
  String localVar = "I am Local Variable";
  int age = 21;

  print(globalVar);
  print(localVar);

  if (age == 21) {
    print('you are 21 years old');
  }

  if (true) {
    int age = 18;
    print("Age: $age");
  }

  outerFunction();
}
