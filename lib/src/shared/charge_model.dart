import 'package:flutter/material.dart';

class Charge {
  final String amount;
  final String email;
  Widget logo;

  Charge(
      {
      @required this.amount,
      @required this.email,
        this.logo
      });
}
