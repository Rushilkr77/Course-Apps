import 'dart:math';

class Calculatorbrain {
  final int height;
  final int weight;
  double _bmi;
  Calculatorbrain({this.height, this.weight});
  String calculatebmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getresult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getinterpretation() {
    if (_bmi >= 25) {
      return 'Higher than normal. You should exercise more';
    } else if (_bmi > 18.5) {
      return 'All good!';
    } else {
      return 'Lower than normal. You should eat more';
    }
  }
}
