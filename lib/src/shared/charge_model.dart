import 'package:flutter/material.dart';

class Charge {
  final String amount;
  final String email;

  /// pass null if you want to use image provided during registration
  Widget logo;

  Charge(
      {
      @required this.amount,
      @required this.email,
        this.logo
      });
}
