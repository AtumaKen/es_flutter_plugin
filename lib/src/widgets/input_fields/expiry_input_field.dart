import 'package:es_flutter_plugin/src/models/payment_card.dart';
import 'package:es_flutter_plugin/src/utilities/card_utilities.dart';
import 'package:es_flutter_plugin/src/utilities/expiry_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'textfield_widget.dart';

class ExpiryInputField extends StatelessWidget {
  final PaymentCard _paymentCard;

  const ExpiryInputField(this._paymentCard);

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      validator: (value) =>
          CardUtils.validateDate(CardUtils.getExpiryDate(value)),
      labelText: "expiry",
      obscureText: false,
      onSaved: (value) {
        List<int> expiry = CardUtils.getExpiryDate(value);
         _paymentCard.month = expiry[0].toString();
        _paymentCard.year = expiry[1].toString();
      },
      keyboardType: TextInputType.number,
      hintText: "MM/YY",
      inputFormatters: [
        LengthLimitingTextInputFormatter(5),
        FilteringTextInputFormatter.digitsOnly,
        ExpiryInputFormatter(),
      ],
    );
  }
}
