import 'dart:io';


int findMax(int a, int b) {
  return (a > b) ? a : b;
}

void main() {
  print("Enter first number: ");
  int num1 = int.parse(stdin.readLineSync()!);

  print("Enter second number: ");
  int num2 = int.parse(stdin.readLineSync()!);

  print("The maximum number is: ${findMax(num1, num2)}");
}
