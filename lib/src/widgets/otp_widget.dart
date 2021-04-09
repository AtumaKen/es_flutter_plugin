import 'package:es_flutter_plugin/src/widgets/input_fields/otp_field.dart';
import 'package:flutter/material.dart';

import 'buttons/button_widget.dart';

class OTPWidget extends StatelessWidget {
  final String label;
  final TextEditingController textEditingController;
  final Function function;

  const OTPWidget(this.label, this.textEditingController, this.function);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text(label),
        SizedBox(
          height: 10,
        ),
        OTPField(controller: textEditingController),
        Container(
          alignment: Alignment.center,
          child: ButtonWidget(
            onPressed: function,
            label: "Confirm OTP",
          ),
        ),
      ],
    );
  }
}
