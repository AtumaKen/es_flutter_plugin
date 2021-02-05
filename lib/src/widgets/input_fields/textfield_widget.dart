import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  //Other textfields are composed from this one
  final List<TextInputFormatter> inputFormatters;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Widget suffix;
  final String labelText;
  final String hintText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final bool obscureText;

   TextFieldWidget(
      {Key key,
        this.inputFormatters,
        this.keyboardType,
        this.controller,
        this.suffix,
        this.obscureText,
        this.onSaved,
        this.labelText,
        this.hintText,
        this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Theme(
        data: ThemeData(primarySwatch: Colors.green),
        child: TextFormField(
          onSaved: onSaved,
          obscureText: obscureText,
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
