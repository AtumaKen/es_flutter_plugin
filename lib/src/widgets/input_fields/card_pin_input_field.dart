import 'package:es_flutter_plugin/src/models/payment_card.dart';
import 'package:es_flutter_plugin/src/widgets/input_fields/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'card_number_input_field.dart';

class CardPinInputFiled extends StatefulWidget {
  final PaymentCard _paymentCard;

  CardPinInputFiled(this._paymentCard,);

  @override
  _CardPinInputFiledState createState() => _CardPinInputFiledState();
}

class _CardPinInputFiledState extends State<CardPinInputFiled> {
  bool _obscureState = true;

  _changeObscureState() {
    if (mounted)
      setState(() {
        _obscureState = !_obscureState;
      });
  }

  String _validateCardPin(String value) {
    if (value.length < 4 || value.isEmpty) return "Card Pin is required";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      keyboardType: TextInputType.number,
      obscureText: _obscureState,
      suffix: GestureDetector(
        child: Icon(
          Icons.remove_red_eye_outlined,
          color: _obscureState == true ? Colors.grey : Colors.black12,
        ),
        onTap: _changeObscureState,
      ),
      hintText: "Enter 4 digit pin",
      labelText: "Card PIN",
      onSaved: (value) => widget._paymentCard.pin = value,
      validator: (value) => _validateCardPin(value),
      inputFormatters: [
        LengthLimitingTextInputFormatter(4),
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }
}
