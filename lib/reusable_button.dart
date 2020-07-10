import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableButton extends StatelessWidget {
  ReusableButton({@required this.theText,@required this.theRoute});

  final String theText;
  final Function theRoute;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20.0),
      height: 80.0,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        color: kAccentColor,
        textColor: Colors.black,
        padding: EdgeInsets.all(8.0),
        splashColor: Colors.transparent,
        onPressed:  theRoute,
        child: Text(
          theText.toUpperCase(),
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}
