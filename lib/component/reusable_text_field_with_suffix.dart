import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';


class ReusableTextFormFieldWithSuffix extends StatelessWidget {
  ReusableTextFormFieldWithSuffix(
      {@required this.prefixIcon,
        @required this.theSuffix,
        @required this.theLabelText,
        this.input,
      });

  final IconData prefixIcon;
  final String theSuffix;
  final String theLabelText;
  final TextEditingController input;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      controller: input,
      decoration: InputDecoration(
        filled: true,
        fillColor: kBackgroundColorField,
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
