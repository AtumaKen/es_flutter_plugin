import 'package:es_flutter_plugin/src/models/card_response.dart';
import 'package:es_flutter_plugin/src/models/otp_model.dart';
import 'package:es_flutter_plugin/src/models/payment_card.dart';
import 'package:es_flutter_plugin/src/service/card_service.dart';
import 'package:es_flutter_plugin/src/utilities/package_strings.dart';
import 'package:es_flutter_plugin/src/widgets/otp_widget.dart';
import 'package:es_flutter_plugin/src/widgets/buttons/button_widget.dart';
import 'package:es_flutter_plugin/src/widgets/widget_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'card_form_items.dart';

enum CardMode { Card, OTP }

class CustomAlertDialog extends StatefulWidget {
  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState<CustomAlertDialog> extends State
    with CardStateMixin {
  final _formKey = new GlobalKey<FormState>();
  PaymentCard _paymentCard = PaymentCard();
  CardResponse _cardResponse;
  CardMode _cardMode = CardMode.Card;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildChild(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return AnimatedPadding(
      padding: mediaQuery.viewInsets +
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      duration: Duration(seconds: 1),
      child: Center(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, right: 8.0),
                child: GestureDetector(
                  onTap: () => onCancelPress(),
                  child: Icon(
                    Icons.cancel,
                    color: Colors.white60,
                    semanticLabel: "Close",
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    type: MaterialType.card,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0),
                              child: _cardMode == CardMode.Card
                                  ? CardForm(_formKey, _paymentCard)
                                  : OTPWidget(_cardResponse.message, _controller),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: _cardMode == CardMode.Card
                                ? ButtonWidget(
                                    onPressed: _onSaved, label: "Pay")
                                : ButtonWidget(
                                    onPressed: _confirmOtp,
                                    label: "Confirm OTP",
                                  ),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            child: Image(
                              image: AssetImage("assets/images/poweredby.png",
                                  package: Strings.packageName),
                            ),
                          ),
                          SizedBox(height: 10)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onSaved() async {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();
    FocusScope.of(context).unfocus();
    _cardResponse = await CardService.submitCardDetails(_paymentCard);
    setState(() {
      _cardMode = CardMode.OTP;
    });
  }
  _confirmOtp(){
    OTPModel otpModel = OTPModel();
    otpModel.paymentCard = _paymentCard;
    otpModel.otp = _controller.text;
    CardService.confirmOtp(otpModel);
  }
}
