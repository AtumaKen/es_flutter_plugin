import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function onPressed;
  final String label;

  const ButtonWidget({Key key, @required this.onPressed, @required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;
    final deviceSize = MediaQuery.of(context).size.height;
    return isIOS
        ? CupertinoButton(
            child: Text(label), color: Colors.green, onPressed: onPressed)
        : RaisedButton(
            onPressed: onPressed,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(horizontal: deviceSize * 0.08, vertical: deviceSize * 0.018),
            child: Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green,
          );
  }
}
