import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'reusable_text_field_with_suffix.dart';
import 'input_page.dart';

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
        enabledBorder: BorderStyleRadius,
        border: BorderStyleRadius,
        prefixIcon: Icon(
          prefixIcon,
          size: IconSize,
        ),
        prefixText: '\$ ',
        prefixStyle: TextStyle(
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