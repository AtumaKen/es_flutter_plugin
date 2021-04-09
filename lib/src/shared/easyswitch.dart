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
  Charge _charge;
  String _merchantKey;
  BuildContext _context;

  EasySwitchPlugin(
      {@required Charge charge,
      @required BuildContext context,
      @required merchantKey})
      : _charge = charge,
        _context = context,
        _merchantKey = merchantKey;

  validate() {
    if (_context == null) {
      throw NoContextException("Context has to be provided");
    } else if (_charge == null ||
        _merchantKey.isEmpty ||
        !_merchantKey.startsWith("pk"))
      throw InvalidMerchantKeyException("Merchant key is invalid");
    initializeSdk();
  }

  void initializeSdk() async {
    InitializationResponse response = InitializationResponse();
    try {
       response = await CardService.initializeSdk(
          merchantKey: _merchantKey,
          amount: _charge.amount,
          email: _charge.email);
    }on SocketException {
      throw SocketException("There was a network error during initialization");
    }
    if (response == null)
      throw AuthenticationException("Wrong Merchant key or Amount too large");
    _pay(response);
  }

  Future<CheckoutResponse> _pay(
      InitializationResponse initializationResponse) async {
    CheckoutResponse response = await showDialog(
        barrierDismissible: false,
        context: _context,
        builder: (ctx) => CustomAlertDialog(
              charge: _charge,
              initializationResponse: initializationResponse,
            ));
    print(response.message);

    ///response should be returned up the stack
    return response;
  }
}
