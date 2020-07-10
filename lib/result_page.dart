import 'package:flutter/material.dart';
import 'reusable_button.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mortgage Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              child: Text('da'),
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
    );
  }
}
