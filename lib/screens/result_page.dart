import 'package:flutter/material.dart';
import '../component/reusable_button.dart';
import '../component/constants.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mortgage Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40.0),
                  ),
                  color: kBackgroundColorField,
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 100, horizontal: 30),
                      child: Text(
                          //TODO: print the monthly mortgage
                          'Your monthly payment is: ',
                        style: TextStyle(
                          fontSize: 40,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      '\$XXXXX',
                      style: TextStyle(
                        fontSize: 50,
                        color: kAccentColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),

              ),
            ),
            ReusableButton(
              theText: 'recalculate',
              theRoute: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
