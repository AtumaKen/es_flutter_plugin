import 'package:es_flutter_plugin/src/models/card_response.dart';
import 'package:es_flutter_plugin/src/models/initializationResponse.dart';
import 'package:es_flutter_plugin/src/models/otp_model.dart';
import 'package:es_flutter_plugin/src/models/payment_card.dart';
import 'package:es_flutter_plugin/src/shared/charge_model.dart';
import 'package:es_flutter_plugin/src/shared/checkoutresponse.dart';
import 'package:es_flutter_plugin/src/utilities/package_strings.dart';
import 'package:es_flutter_plugin/src/widgets/otp_widget.dart';
import 'package:es_flutter_plugin/src/widgets/buttons/button_widget.dart';
import 'package:es_flutter_plugin/src/widgets/widget_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'card_form_items.dart';
import 'company_logo.dart';

enum CardMode { Card, OTP, Successful }

class CustomAlertDialog extends StatefulWidget {
  final Charge _charge;
  final InitializationResponse _initializationResponse;

  const CustomAlertDialog(
      {Key key, Charge charge, InitializationResponse initializationResponse})
      : _charge = charge,
        _initializationResponse = initializationResponse,
        super(key: key);

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState(_charge, _initializationResponse);
}

class _CustomAlertDialogState<CustomAlertDialog> extends State
    with CardStateMixin {
  final _formKey = new GlobalKey<FormState>();
  PaymentCard _paymentCard = PaymentCard();
  CardResponse _cardResponse;
  CardMode _cardMode = CardMode.Card;
  TextEditingController _controller = TextEditingController();
  final Charge _charge;
  CheckoutResponse _response;
  InitializationResponse _initializationResponse;

  _CustomAlertDialogState(this._charge, this._initializationResponse);

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
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CompanyLogo(logo: _charge.logo, logoUrl: _initializationResponse.logoUrl,),
                                      Column(
                                        children: [
                                          Text("Pay NGN ${_charge.amount}"),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(_charge.email)
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  _cardMode == CardMode.Card
                                      ? CardForm(
                                          _formKey,
                                          _paymentCard,
                                        )
                                      : OTPWidget(
                                          _cardResponse.message, _controller),
                                ],
                              ),
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
//    _cardResponse = await CardService.submitCardDetails(_paymentCard);
    _cardResponse = CardResponse(message: "Stuff", transactionRef: "Stuffer");
    setState(() {
      _cardMode = CardMode.OTP;
    });
  }

  _confirmOtp() {
    OTPModel otpModel = OTPModel();
    otpModel.paymentCard = _paymentCard;
    otpModel.otp = _controller.text;
//    CardService.confirmOtp(otpModel);
    _response = CheckoutResponse(message: "Success");
  }

  @override
  getPopReturnValue() {
    return _response;
  }
}
