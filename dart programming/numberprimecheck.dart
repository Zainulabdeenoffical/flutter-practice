import 'dart:io';


bool isPrime(int num) {
  if (num < 2) return false;
  for (int i = 2; i * i <= num; i++) {
    if (num % i == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  print("Enter a number: ");
  int num = int.parse(stdin.readLineSync()!);

  if (isPrime(num)) {
    print("$num is a Prime Number");
  } else {
    print("$num is Not a Prime Number");
  }
}
