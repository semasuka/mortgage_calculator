import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//TODO: set up the landscape mode not to overflood

const accentColor = Color(0xFF7cfc00);
const backgroundColor = Color(0xFF1D1E33);

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

  int interest = 5;
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
                    activeColor: accentColor,
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
                    activeColor: accentColor,
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
              'Interest rate: $interest %',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            // INTEREST RATE SLIDER
            Expanded(
              child: Slider(
                value: interest.toDouble(),
                min: 0.0,
                max: 25.0,
                activeColor: accentColor,
                inactiveColor: backgroundColor,
                onChanged: (double newValue) {
                  setState(() {
                    interest = newValue.round();
                  });
                },
              ),
            ),
            //LOAN TERM
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 230,
                    child: ReusableTextFormFieldWithSuffix(
                      prefixIcon: FontAwesomeIcons.calendarAlt,
                      theLabelText: 'Loan Term',
                      theSuffix: 'Year(s)',
                    ),
                  ),
                ],
              ),
            ),
            //TODO: create a button that toggle the Tax text form field
            //ANNUAL TAX
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FlatButton(
                    child: _isTaxVisible == false
                        ? Text('Add tax')
                        : Text('Remove tax'),
                    onPressed: showTaxButton,
                  ),
                  Expanded(
                    child: Visibility(
                      visible: _isTaxVisible,
                      child: Container(
                        width: 200,
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
                        width: 200,
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
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 20.0),
              height: 80.0,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                color: accentColor,
                textColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.transparent,
                onPressed: () {
                  /*...*/
                },
                child: Text(
                  'calculate'.toUpperCase(),
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableTextFormFieldWithPrefix extends StatelessWidget {
  ReusableTextFormFieldWithPrefix(
      {@required this.prefixIcon, @required this.theLabelText});

  final IconData prefixIcon;
  final String theLabelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: backgroundColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40.0),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40.0),
          ),
        ),
        prefixIcon: Icon(
          prefixIcon,
          size: 20,
        ),
        prefixText: '\$ ',
        prefixStyle: TextStyle(
          fontSize: 18,
        ),
        labelText: theLabelText,
      ),
      //controller: homeValue,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ],
    );
  }
}

class ReusableTextFormFieldWithSuffix extends StatelessWidget {
  ReusableTextFormFieldWithSuffix(
      {@required this.prefixIcon,
      @required this.theSuffix,
      @required this.theLabelText});

  final IconData prefixIcon;
  final String theSuffix;
  final String theLabelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: backgroundColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40.0),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40.0),
          ),
        ),
        prefixIcon: Icon(
          prefixIcon,
          size: 20,
        ),
        suffixText: theSuffix,
        suffixStyle: TextStyle(
          fontSize: 18,
        ),
        labelText: theLabelText,
      ),
      //controller: homeValue,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ],
    );
  }
}
