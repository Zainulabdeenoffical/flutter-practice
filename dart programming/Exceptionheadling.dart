void main() {
  try {
    int result = 10 ~/ 0;
    print("Result: $result");
  } catch (e) {
    print("Exception caught: $e");
  } finally {
    print("This block always executes.");
  }
}
