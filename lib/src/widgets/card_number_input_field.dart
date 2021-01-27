import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardNumberInputField extends StatelessWidget {
  final TextEditingController _cardNumberController = TextEditingController();

  final List<Widget> _cardImageList = [
    Icon(Icons.payment_sharp),
    // Image.asset("assets/images/mastercard.png"),
    // Image.asset("assets/images/visa.png")
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(19)
        ],
        keyboardType: TextInputType.number,
        controller: _cardNumberController,
        decoration: InputDecoration(
          suffix: Row(
            mainAxisSize: MainAxisSize.min,
            children: _cardImageList,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 0.001, style: BorderStyle.none)),
        ),
      ),
    );
  }
}
