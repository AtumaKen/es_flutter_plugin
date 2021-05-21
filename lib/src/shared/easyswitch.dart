import 'dart:io';

import 'package:es_flutter_plugin/src/models/initializationResponse.dart';
import 'package:es_flutter_plugin/src/service/card_service.dart';
import 'package:es_flutter_plugin/src/shared/charge_model.dart';
import 'package:es_flutter_plugin/src/shared/exceptions.dart';
import 'package:es_flutter_plugin/src/widgets/custom_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'checkoutresponse.dart';

class EasySwitchPlugin {
  //todo apply docs for the variables
  Charge _charge;
  String _merchantKey;
  BuildContext _context;

  EasySwitchPlugin({@required Charge charge,
    @required BuildContext context,
    @required merchantKey})
      : _charge = charge,
        _context = context,
        _merchantKey = merchantKey;

  Widget _cancelButton() {
    FlatButton(
        onPressed: () => Navigator.of(_context).pop(), child: Text("Cancel"));
  }

  Future<CheckoutResponse> validate() async {
    num.parse(_charge.amount);
    if (_context == null) {
      throw NoContextException("Context has to be provided");
    } else if (_charge == null ||
        _merchantKey.isEmpty ||
        !_merchantKey.startsWith("pk"))
      throw InvalidMerchantKeyException("Merchant key is invalid");
    else if (_charge.amount == null ||
        _charge.amount.isEmpty ||
        num.tryParse(_charge.amount) < 0)
      throw InvalidAmountException("Amount invalid");
    CheckoutResponse checkoutResponse = await _initializeSdk();
    return checkoutResponse;
  }

  Future<CheckoutResponse> _initializeSdk() async {
    InitializationResponse response = InitializationResponse();
    try {
      _progressDialog(
        "Initializing...",
        Platform.isIOS
            ? CupertinoActivityIndicator()
            : CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        ),
      );
      response = await CardService.initializeSdk(
          merchantKey: _merchantKey,
          amount: _charge.amount,
          email: _charge.email);
      Navigator.of(_context).pop();
    } on SocketException {
      Navigator.of(_context).pop();
      _progressDialog(
          "There was a network error during initialization", FlatButton(
          onPressed: () => Navigator.of(_context).pop(), child: Text("Cancel"))
      );
    } catch (e) {
      Navigator.of(_context).pop();
      _progressDialog(
          "There was a problem during initialization", FlatButton(
          onPressed: () => Navigator.of(_context).pop(), child: Text("Cancel"))
      );
    }
    if (response == null)
      throw AuthenticationException("Wrong Merchant key or Amount too large");
    CheckoutResponse checkoutResponse = await _pay(response);
    return checkoutResponse;
  }

  Future<CheckoutResponse> _pay(
      InitializationResponse initializationResponse) async {
    CheckoutResponse response = CheckoutResponse();
    response = await showDialog(
        barrierDismissible: false,
        context: _context,
        builder: (ctx) =>
            CustomAlertDialog(
              charge: _charge,
              initializationResponse: initializationResponse,
            ));

    ///response should be returned up the stack
    return response;
  }

  void _progressDialog(String text, Widget widget) {
    AlertDialog alert = AlertDialog(
      elevation: 0,
      content: Row(
        children: [
          widget,
          Container(margin: EdgeInsets.only(left: 15), child: Text(text)),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: _context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
