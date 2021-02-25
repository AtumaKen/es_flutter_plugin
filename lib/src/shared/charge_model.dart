import 'package:flutter/material.dart';

class Charge {
  final String merchantKey;
  final String amount;
  final String email;
  Widget logo;

  Charge(
      {@required this.merchantKey,
      @required this.amount,
      @required this.email,
        this.logo
      });
}
