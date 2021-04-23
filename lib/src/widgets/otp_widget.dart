import 'package:es_flutter_plugin/src/widgets/input_fields/otp_field.dart';
import 'package:flutter/material.dart';

import 'buttons/button_widget.dart';

class OTPWidget extends StatefulWidget {
  final String label;
  final TextEditingController textEditingController;
  final Function function;

  const OTPWidget(this.label, this.textEditingController, this.function,);

  @override
  _OTPWidgetState createState() => _OTPWidgetState();
}

class _OTPWidgetState extends State<OTPWidget> {
  bool isLoading = false;
  void _executeFunction(){
    if(mounted)
    setState((){
      isLoading = true;
    });
    widget.function();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text(widget.label),
        SizedBox(
          height: 10,
        ),
        OTPField(controller: widget.textEditingController),
        Container(
          alignment: Alignment.center,
          child: ButtonWidget(
            onPressed: _executeFunction,
            label: "Confirm OTP",
            isLoading: isLoading,
          ),
        ),
      ],
    );
  }
}
