import 'dart:io';

void checkEvenOdd(int num) {
  if (num % 2 == 0) {
    print("$num is Even");
  } else {
    print("$num is Odd");
  }
}

void main() {
  print("Enter a number: ");
  int? number = int.parse(stdin.readLineSync()!);

  checkEvenOdd(number);
}
