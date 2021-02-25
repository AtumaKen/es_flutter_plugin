import 'package:es_flutter_plugin/src/models/payment_card.dart';
import 'package:es_flutter_plugin/src/widgets/input_fields/card_pin_input_field.dart';
import 'package:flutter/material.dart';

import 'input_fields/card_number_input_field.dart';
import 'input_fields/cvv_input_field.dart';
import 'input_fields/expiry_input_field.dart';

class CardForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  final PaymentCard _paymentCard;

  const CardForm(this._formKey, this._paymentCard);
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CardNumberInputField(_paymentCard),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CvvInputField(_paymentCard),
              ),
              SizedBox(
                width: 30.0,
              ),
              Expanded(
                child: ExpiryInputField(_paymentCard),
              )
            ],
          ),
          CardPinInputFiled(_paymentCard)
        ],
      ),
    );
  }
}
