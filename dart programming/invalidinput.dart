import 'dart:io';

void main() {
  try {
    print("Enter a number: ");
    int? number = int.parse(stdin.readLineSync()!);
    print("You entered: $number");
  } catch (e) {
    print("Invalid input! Please enter a valid number.");
  }
}
