import 'dart:io';

void main() {
  print("Enter a number: ");
  int? number = int.parse(stdin.readLineSync()!);

  if (number > 0) {
    print("$number is Positive");
  } else if (number < 0) {
    print("$number is Negative");
  } else {
    print("The number is Zero");
  }
}
