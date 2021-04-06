import 'package:es_flutter_plugin/src/models/payment_card.dart';
import 'package:es_flutter_plugin/src/widgets/input_fields/card_pin_input_field.dart';
import 'package:flutter/material.dart';

import 'input_fields/card_number_input_field.dart';
import 'input_fields/cvv_input_field.dart';
import 'input_fields/expiry_input_field.dart';

class CardForm extends StatefulWidget {
  final GlobalKey<FormState> _formKey;
  final PaymentCard _paymentCard;

  const CardForm(this._formKey, this._paymentCard);

  @override
  _CardFormState createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  bool visibility = false;

  void _cardState(CardType cardType) {
    if (cardType != CardType.Visa && cardType != CardType.Invalid)
      setState(() {
        visibility = true;
      });
    else
      setState(() {
        visibility = false;
      });
    print(visibility);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardNumberInputField(widget._paymentCard, _cardState),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CvvInputField(widget._paymentCard),
              ),
              SizedBox(
                width: 30.0,
              ),
              Expanded(
                child: ExpiryInputField(widget._paymentCard),
              )
            ],
          ),
          Visibility(
              visible: visibility,
              child: CardPinInputFiled(widget._paymentCard))
        ],
      ),
    );
  }
}
