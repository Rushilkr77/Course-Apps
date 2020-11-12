import 'dart:ui';

import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF151A3C),
        scaffoldBackgroundColor: Color(0xFF0C1134),
      ),
      home: InputPage(),
    );
  }
}
