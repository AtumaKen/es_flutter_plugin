import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;
    return isIOS
        ? CupertinoButton(
            child: Text("Pay"), color: Colors.green, onPressed: () {})
        : RaisedButton(
            onPressed: () {},
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              "Pay",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green,
          );
  }
}
