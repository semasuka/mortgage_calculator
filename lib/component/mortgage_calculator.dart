import 'package:flutter/cupertino.dart';
import '../screens/input_page.dart';
import 'dart:math';

class MortgageCalculator {
  MortgageCalculator({
    @required this.principal,
    @required this.interest,
    @required this.years,
    @required this.taxVisibility,
    @required this.insuranceVisibility,
    this.tax,
    this.insurance,
  });
  // principal = loan
  final double principal;
  final int interest;
  final int years;
  final double tax;
  final double insurance;
  final bool taxVisibility;
  final bool insuranceVisibility;

  String calculateMortgage() {
    double annualInterest = interest.toDouble() / 12;
    double months = years.toDouble() * 12;
    double monthlyPayment = principal *
        (annualInterest *
            pow(months, 1 + annualInterest) /
            (pow(months, 1 + annualInterest) - 1));
    if (taxVisibility) {
      monthlyPayment += tax;
      return monthlyPayment.toString();
    } else if (insuranceVisibility) {
      monthlyPayment += insurance;
      return monthlyPayment.toString();
    } else if (insuranceVisibility && taxVisibility) {
      monthlyPayment += (tax + insurance);
      return monthlyPayment.toString();
    } else {
      return monthlyPayment.toString();
    }
  }
}
