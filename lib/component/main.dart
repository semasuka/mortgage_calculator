import 'package:flutter/material.dart';
import '../screens/input_page.dart';
import 'constants.dart';

void main() {
  runApp(MortgageCalculator());
}

class MortgageCalculator extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: kBackgroungColor,
        scaffoldBackgroundColor: kBackgroungColor,
        accentColor: kAccentColor,
      ),
      home: InputPage(),
    );
  }
}
