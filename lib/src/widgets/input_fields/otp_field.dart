import 'package:es_flutter_plugin/src/widgets/input_fields/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPField extends StatelessWidget {
  final TextEditingController controller;

  const OTPField({Key key, @required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      obscureText: false,
      controller: controller,
      hintText: "Enter OTP",
      labelText: "OTP",
    );
  }
}
