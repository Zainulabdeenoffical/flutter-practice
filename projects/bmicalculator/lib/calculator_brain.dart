import 'dart:math';


// https://en.wikipedia.org/wiki/Body_mass_index

class CalculatorBrain {
  CalculatorBrain(this.height, this.weight) {
    _bmi = weight / pow(height / 100, 2);
  }

  final int height;
  final int weight;
  late double _bmi;

  String calculateBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi >= 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "You have a higher weight than normal body. Try to exercise more.";
    } else if (_bmi >= 18.5) {
      return "You have a normal body weight. Good job!";
    } else {
      return "You have a lower weight than normal body. Try to eat more.";
    }
  }
}
