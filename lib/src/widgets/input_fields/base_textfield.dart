import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseTextField extends StatelessWidget {
  final List<TextInputFormatter> inputFormatters;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Widget suffix;
  final String labelText;
  final String hintText;
  final FormFieldValidator<String> validator;


  const BaseTextField(
      {Key key,
        this.inputFormatters,
        this.keyboardType,
        this.controller,
        this.suffix,
        this.labelText,
        this.hintText,
        this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Theme(
        data: ThemeData(primarySwatch: Colors.green),
        child: TextFormField(
          cursorColor: Colors.green,
          textAlign: TextAlign.justify,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            suffix: suffix,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
