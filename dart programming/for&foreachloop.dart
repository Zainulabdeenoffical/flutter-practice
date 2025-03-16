void main() {
  for (int i = 0; i < 5; i++) {
    print('hello');
  }

  var arr = [1, 2, 3, 4, 5];
  for (int i in arr) {
    print(i);
  }
  List<String> fruits = ["Apple", "Banana", "Mango"];

  for (String fruit in fruits) {
    print(fruit);
  }
  List<int> numbers = [10, 20, 30, 40, 50];

  numbers.forEach((int num) {
    print(num);
  });
}
