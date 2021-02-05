import 'package:es_flutter_plugin/src/widgets/input_fields/otp_field.dart';
import 'package:flutter/material.dart';

class OTPWidget extends StatelessWidget {
  final String label;
  final TextEditingController textEditingController;

  const OTPWidget(this.label, this.textEditingController);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text(label),
        SizedBox(height: 10,),
        OTPField(controller: textEditingController),
      ],
    );
  }
}
