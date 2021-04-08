import 'package:es_flutter_plugin/src/models/payment_card.dart';
import 'package:es_flutter_plugin/src/utilities/card_number_input_formatter.dart';
import 'package:es_flutter_plugin/src/utilities/card_utilities.dart';
import 'package:es_flutter_plugin/src/utilities/package_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardNumberInputField extends StatefulWidget {
  final PaymentCard _paymentCard;
  final Function(CardType) _cardTypeState;


  const CardNumberInputField( this._paymentCard, this._cardTypeState);

  @override
  CardNumberInputFieldState createState() => CardNumberInputFieldState();
}

class CardNumberInputFieldState extends State<CardNumberInputField> {
  final TextEditingController _cardNumberController = TextEditingController();
  static final String _logoPath = "assets/images";
  static CardType _cardType;
  static Color _iconColor;

  @override
  void initState() {
    super.initState();
    _cardNumberController.addListener(() => _getCardTypeFrmNumber());
  }

  @override
  void dispose() {
    _cardNumberController.removeListener(_getCardTypeFrmNumber);
    _cardNumberController.dispose();
    super.dispose();
  }

  void _getCardTypeFrmNumber() {
    String cleanedDigits =
        CardUtils.getCleanedNumber(_cardNumberController.text);
    CardType cardType = CardUtils.getCardTypeFrmNumber(cleanedDigits);
    setState(() {
      _cardType = cardType;
      widget._cardTypeState(_cardType);
      _getIconColor();
    });
  }

  _getIconColor() {
    if (_cardNumberController.text.isEmpty || _cardType == null)
      _iconColor = Colors.grey[700];
    else if (_cardType == CardType.Others)
      _iconColor = Colors.green;
    else
      _iconColor = Colors.grey[700];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Theme(
        data: ThemeData(primarySwatch: Colors.green),
        child: TextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(19),
            CardNumberInputFormatter()
          ],
          keyboardType: TextInputType.number,
          onSaved: (value)=> widget._paymentCard.number = CardUtils.getCleanedNumber(value),
          validator: (input)=> CardUtils.validateCardNumWithLuhnAlgorithm(input),
          controller: _cardNumberController,
          cursorColor: Colors.green,
          textAlign: TextAlign.justify,
          decoration: InputDecoration(
            hintText: "0000 0000 0000 0000",
            labelText: "card number",
            suffix: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.payment_outlined, color: _iconColor),
                Image(
                    image: _cardType == CardType.MasterCard
                        ? AssetImage("$_logoPath/mastercard.png",
                            package: Strings.packageName)
                        : AssetImage(
                            '$_logoPath/mastercard_grey.png',
                            package: Strings.packageName,
                          ),
                    width: 40.0,
                    height: 20),
                Image(
                    image: _cardType == CardType.Visa
                        ? AssetImage("$_logoPath/visa.png",
                            package: Strings.packageName)
                        : AssetImage('$_logoPath/visa_grey.jpg',
                            package: Strings.packageName),
                    width: 40.0,
                    height: 27),
                Image(
                  image: _cardType == CardType.Verve
                      ? AssetImage("$_logoPath/verve.png",
                          package: Strings.packageName)
                      : AssetImage('$_logoPath/verve_grey.png',
                          package: Strings.packageName),
                  width: 40.0,
                ),
              ],
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
