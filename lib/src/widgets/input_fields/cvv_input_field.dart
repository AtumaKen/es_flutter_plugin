import 'package:es_flutter_plugin/src/models/payment_card.dart';
import 'package:es_flutter_plugin/src/utilities/card_utilities.dart';
import 'package:es_flutter_plugin/src/widgets/input_fields/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CvvInputField extends StatelessWidget {
  final PaymentCard _paymentCard;

  const CvvInputField(this._paymentCard);

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      hintText: "cvv",
      labelText: "cvv",
      obscureText: false,
      onSaved: (value) => _paymentCard.cvv = value,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(4),
      ],
      validator: (String value) => CardUtils.validateCVV(value),
    );
  }
}
