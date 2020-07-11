import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../component/constants.dart';

class ReusableTextFormFieldWithPrefix extends StatelessWidget {
  ReusableTextFormFieldWithPrefix(
      {@required this.prefixIcon, @required this.theLabelText, this.input});

  final IconData prefixIcon;
  final String theLabelText;
  final TextEditingController input;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: input,
      autofocus: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: kBackgroundColorField,
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