import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';


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
        fillColor: kBackgroundColor,
        enabledBorder : kBorderStyleRadius,
        border: kBorderStyleRadius,
        prefixIcon: Icon(
          prefixIcon,
          size: kIconSize,
        ),
        suffixText: theSuffix,
        suffixStyle: TextStyle(
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
