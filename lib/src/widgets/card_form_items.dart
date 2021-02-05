import 'package:es_flutter_plugin/src/models/payment_card.dart';
import 'package:es_flutter_plugin/src/widgets/input_fields/card_pin_input_field.dart';
import 'package:flutter/material.dart';

import 'company_logo.dart';
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
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              CompanyLogo(),
              Text("Pay NGN 100")
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "email@email.com",
              style: TextStyle(fontSize: 17),
            ),
          ),
          SizedBox(
            height: 20,
          ),
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
