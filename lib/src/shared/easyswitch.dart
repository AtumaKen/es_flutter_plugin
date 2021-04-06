import 'package:es_flutter_plugin/src/shared/charge_model.dart';
import 'package:es_flutter_plugin/src/shared/exceptions.dart';
import 'package:es_flutter_plugin/src/widgets/custom_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'checkoutresponse.dart';
import 'package:flutter/material.dart';

class EasySwitchPlugin {
  Charge _charge;
  BuildContext _context;

  EasySwitchPlugin({@required Charge charge, @required BuildContext context})
      : _charge = charge,
        _context = context;

  validate() {
    if (_context == null) {
      throw NoContextException("Context has to be provided");
    } else if (_charge == null ||
        _charge.merchantKey.isEmpty ||
        !_charge.merchantKey.startsWith("pk"))
      throw InvalidMerchantKeyException("Merchant key is invalid");

    _pay();
  }

  Future<CheckoutResponse> _pay() async {
    CheckoutResponse response = await showDialog(
        barrierDismissible: false,
        context: _context,
        builder: (ctx) => CustomAlertDialog(charge: _charge));
    print(response.message);
    return response;
  }
}
