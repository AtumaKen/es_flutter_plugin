import 'dart:io';

import 'package:es_flutter_plugin/es_flutter_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin CardStateMixin<T> on State {
  bool isProcessing = false;
  String confirmationMessage = 'Do you want to cancel this Transaction?';
  bool alwaysPop = false;

  Widget buildChild(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: buildChild(context), onWillPop: () => _onWillPop());
  }

  Future<bool> _onWillPop() async {
    if (isProcessing) {
      return false;
    }
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
    bool exit = await showDialog<bool>(
          context: context,
          builder: (BuildContext context) => dialog,
        ) ??
        false;

    if (exit) {
      Navigator.of(context).pop();
    }
    return false;
  }

  void onCancelPress() async {
    bool close = await _onWillPop();
    if (close) {
      Navigator.of(context).pop(getPopReturnValue());
    }
  }

  getPopReturnValue() {
    return null;
  }
}
