import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin CardStateMixin on State {
  bool isProcessing = false;
  String confirmationMessage = 'Do you want to cancel payment?';
  bool alwaysPop = false;

  Widget buildChild(BuildContext context);


  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: buildChild(context), onWillPop: _onWillPop);
  }

  Future<bool> _onWillPop() async {
    print("scoping");
    // if (isProcessing) {
    //   print("here 1");
    //   return false;
    // }

    // var returnValue = getPopReturnValue();
    // if (alwaysPop) {
    //   Navigator.of(context).pop(returnValue);
    //   print("here 2");
    //   return false;
    // }

    var text = new Text(confirmationMessage);

    var dialog = Platform.isIOS
        ? new CupertinoAlertDialog(
            content: text,
            actions: <Widget>[
              new CupertinoDialogAction(
                child: const Text('Yes'),
                isDestructiveAction: true,
                onPressed: () {
                  Navigator.pop(context, true); // Returning true to
                  // _onWillPop will pop again.
                },
              ),
              new CupertinoDialogAction(
                child: const Text('No'),
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context,
                      false); // Pops the confirmation dialog but not the page.
                },
              ),
            ],
          )
        : new AlertDialog(
            content: text,
            actions: <Widget>[
              new FlatButton(
                  child: const Text('NO'),
                  onPressed: () {
                    Navigator.of(context).pop(
                        false); // Pops the confirmation dialog but not the page.
                  }),
              new FlatButton(
                  child: const Text('YES'),
                  onPressed: () {
                    Navigator.of(context).pop(
                        true); // Returning true to _onWillPop will pop again.
                  })
            ],
          );
    print("cool");
    bool exit = await showDialog<bool>(
          context: context,
          builder: (BuildContext context) => dialog,
        ) ??
        false;

    if (exit) {
      Navigator.of(context).pop();
    }
    print("cooler");
    return false;
  }

  void onCancelPress() async {
    print("we got here");
    bool close = await _onWillPop();
    if (close) {
      Navigator.of(context).pop(getPopReturnValue());
    }
  }

  getPopReturnValue() {
    return null;
  }

}
