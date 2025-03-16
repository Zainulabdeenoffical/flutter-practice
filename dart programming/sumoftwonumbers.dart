import 'dart:io';

int addNumbers(int a, int b) {
  return a + b;
}

void main() {
  print("Enter first number: ");
  int num1 = int.parse(stdin.readLineSync()!);

  print("Enter second number: ");
  int num2 = int.parse(stdin.readLineSync()!);

  print("Sum: ${addNumbers(num1, num2)}");
}
