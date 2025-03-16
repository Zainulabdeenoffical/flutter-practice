void main() {
  greet("Zain");
  greet1(null);
  greet1("Abdullah");
}

void greet(String name) {
  print("Hello, $name!");
}

void greet1(String? name) {
  print("Hello, ${name ?? 'Guest'}!");
}
