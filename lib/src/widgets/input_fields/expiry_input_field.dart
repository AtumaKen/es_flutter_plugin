import 'package:es_flutter_plugin/src/utilities/expiry_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'base_textfield.dart';

class ExpiryInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      labelText: "expiry",
      keyboardType: TextInputType.number,
      hintText: "Enter expiry date",
      inputFormatters: [
        LengthLimitingTextInputFormatter(5),
        FilteringTextInputFormatter.digitsOnly,
        ExpiryInputFormatter(),
      ],
    );
  }
}
