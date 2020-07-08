import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(MortgageCalculator());
}

class MortgageCalculator extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0a0e21),
        scaffoldBackgroundColor: Color(0xFF0a0e21),
        accentColor: Color(0xFF7cfc00),
      ),
      home: InputPage(),
    );
  }
}
