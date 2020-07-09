import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'input_page.dart';

const BorderStyleRadius = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(40.0),
  ),
);
const double IconSize = 20;
const double FontSize = 18;

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
        enabledBorder : BorderStyleRadius,
        border: BorderStyleRadius,
        prefixIcon: Icon(
          prefixIcon,
          size: IconSize,
        ),
        suffixText: theSuffix,
        suffixStyle: TextStyle(
          fontSize: FontSize,
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
