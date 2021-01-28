import 'package:es_flutter_plugin/src/utilities/card_number_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardNumberInputField extends StatelessWidget {
  final TextEditingController _cardNumberController = TextEditingController();
  static final String packageName = "es_flutter_plugin";

  final List<Widget> _cardImageList = [
    Icon(
      Icons.payment_outlined,
      color: Colors.grey[700]
    ),
    Image(
        image: AssetImage(
          'assets/images/mastercard_grey.png',
          package: packageName,
        ),
        width: 40.0, height: 20),
    Image(
      image: AssetImage('assets/images/visa_grey.jpg', package: packageName),
      width: 40.0,
      height: 27
    ),
    Image(
      image: AssetImage('assets/images/verve_grey.png', package: packageName),
      width: 40.0,
    ),
    // Image.asset("assets/images/visa.png")
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        child: Theme(
          data: ThemeData(primarySwatch: Colors.green),
          child: TextField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(19),
              CardNumberInputFormatter()
            ],
            keyboardType: TextInputType.number,
            controller: _cardNumberController,
            cursorColor: Colors.green,
            textAlign: TextAlign.justify,
            decoration: InputDecoration(
              hintText: "0000 0000 0000 0000",
              labelText: "card number",
              suffix: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: _cardImageList,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
