import 'dart:io';

int factorial(int num) {
  int result = 1;
  for (int i = 1; i <= num; i++) {
    result *= i;
  }
  return result;
}

void main() {
  print("Enter a number: ");
  int? number = int.parse(stdin.readLineSync()!);

  print("Factorial of $number is ${factorial(number)}");
}
