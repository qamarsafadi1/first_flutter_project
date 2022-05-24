import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF0A0D22),
        colorScheme: ColorScheme.light().copyWith(
          primary: Color(0xFF0A0D22),
        ),
      ),
      home: InputPage(),
    );
  }
}
