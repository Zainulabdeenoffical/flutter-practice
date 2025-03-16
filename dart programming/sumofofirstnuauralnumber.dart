import 'dart:io';

int sumOfNumbers(int n) {
  int sum = 0;
  for (int i = 1; i <= n; i++) {
    sum += i;
  }
  return sum;
}

void main() {
  print("Enter a number: ");
  int? number = int.parse(stdin.readLineSync()!);

  print("Sum of first $number natural numbers is ${sumOfNumbers(number)}");
}
