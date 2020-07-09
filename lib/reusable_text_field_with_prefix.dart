import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';

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
        fillColor: kBackgroundColor,
        enabledBorder: kBorderStyleRadius,
        border: kBorderStyleRadius,
        prefixIcon: Icon(
          prefixIcon,
          size: kIconSize,
        ),
        prefixText: '\$ ',
        prefixStyle: TextStyle(
          fontSize: kFontSize,
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