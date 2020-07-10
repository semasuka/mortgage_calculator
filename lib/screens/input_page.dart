import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../component/reusable_text_field_with_prefix.dart';
import '../component/reusable_text_field_with_suffix.dart';
import '../component/constants.dart';
import '../component/reusable_button.dart';
import 'result_page.dart';

//TODO: set up the landscape mode not to overflood

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final homeValue = TextEditingController();
  final downPayment = TextEditingController();
  final loanAmount = TextEditingController();
  final loanTerm = TextEditingController();
  int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 1;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  int _interest = 5;
  bool _isTaxVisible = false;
  bool _isInsuranceVisible = false;

  void showTaxButton() {
    setState(() {
      _isTaxVisible = !_isTaxVisible;
    });
  }

  void showInsuranceButton() {
    setState(() {
      _isInsuranceVisible = !_isInsuranceVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mortgage Calculator',
          style: TextStyle(
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: Column(
          children: [
            //HOME VALUE
            ReusableTextFormFieldWithPrefix(
                prefixIcon: FontAwesomeIcons.home, theLabelText: 'Home Value'),
            //TODO: force the focus to stay on the textfield when selecting the radio button
            //DOWN PAYMENT
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    // child:  ReusableTextFormFieldWithPrefix(prefixIcon: FontAwesomeIcons.moneyBillAlt,theLabelText: 'Down Payment'),
                    child: selectedRadio == 1
                        ? ReusableTextFormFieldWithPrefix(
                            prefixIcon: FontAwesomeIcons.moneyBillAlt,
                            theLabelText: 'Down Payment')
                        : ReusableTextFormFieldWithSuffix(
                            prefixIcon: FontAwesomeIcons.moneyBillAlt,
                            theLabelText: 'Down Payment',
                            theSuffix: '%'),
                  ),
                  Radio(
                    value: 1,
                    groupValue: selectedRadio,
                    activeColor: kAccentColor,
                    onChanged: (val) {
                      setSelectedRadio(val);
                    },
                  ),
                  Text(
                    '\$',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Radio(
                    value: 2,
                    groupValue: selectedRadio,
                    activeColor: kAccentColor,
                    onChanged: (val) {
                      setSelectedRadio(val);
                    },
                  ),
                  Text(
                    '\%',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            //LOAN AMOUNT
            Expanded(
              child: ReusableTextFormFieldWithPrefix(
                  prefixIcon: FontAwesomeIcons.handHoldingUsd,
                  theLabelText: 'Loan Amount'),
            ),
            // INTEREST RATE TEXT
            Text(
              'Interest rate: $_interest %',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            // INTEREST RATE SLIDER
            Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: kAccentColor,
                  inactiveTrackColor: Color(0xFF8D8E98),
                  thumbColor: kAccentColor,
                  overlayColor: Color(0x297cfc00),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
                ),
                child: Slider(
                  value: _interest.toDouble(),
                  min: 0.0,
                  max: 25.0,
                  onChanged: (double newValue) {
                    setState(() {
                      _interest = newValue.round();
                    });
                  },
                ),
              ),
            ),
            //LOAN TERM
            Expanded(
              child: Row(
                children: <Widget>[
                  Container(
                    width: kFieldWidth,
                    child: ReusableTextFormFieldWithSuffix(
                      prefixIcon: FontAwesomeIcons.calendarAlt,
                      theLabelText: 'Loan Term',
                      theSuffix: 'Year(s)',
                    ),
                  ),
                ],
              ),
            ),
            //TODO: designed the toggle button
            //ANNUAL TAX
            Expanded(
              child: Row(
                children: <Widget>[
                  FlatButton(
                    child: _isTaxVisible == false
                        ? Text('Add tax')
                        : Text('Remove tax'),
                    onPressed: showTaxButton,
                  ),
                  SizedBox(
                    width: 47,
                  ),
                  Expanded(
                    child: Visibility(
                      visible: _isTaxVisible,
                      child: Container(
                        width: kFieldWidth,
                        child: ReusableTextFormFieldWithPrefix(
                          prefixIcon: FontAwesomeIcons.fileInvoiceDollar,
                          theLabelText: 'Annual Tax',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //TODO: create a button that toggle the Insurance text form field
            //INSURANCE
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FlatButton(
                    child: _isInsuranceVisible == false
                        ? Text('Add insurance')
                        : Text('Remove insurance'),
                    onPressed: showInsuranceButton,
                  ),
                  Expanded(
                    child: Visibility(
                      visible: _isInsuranceVisible,
                      child: Container(
                        width: kFieldWidth,
                        child: ReusableTextFormFieldWithPrefix(
                          prefixIcon: FontAwesomeIcons.shieldAlt,
                          theLabelText: 'Insurance',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //CALCULATE BUTTON
            ReusableButton(
              theText: 'calculate',
              theRoute: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
