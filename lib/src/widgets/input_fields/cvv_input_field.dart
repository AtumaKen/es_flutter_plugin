import 'package:es_flutter_plugin/src/utilities/card_utilities.dart';
import 'package:es_flutter_plugin/src/widgets/input_fields/base_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CvvInputField extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      keyboardType: TextInputType.number,
      hintText: "cvv",
      labelText: "cvv",
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(4),
      ],
      validator: (String value) => CardUtils.validateCVV(value),
    );
  }

}
