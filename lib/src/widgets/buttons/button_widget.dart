import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function onPressed;
  final String label;
  final bool isLoading;

  const ButtonWidget(
      {Key key, @required this.onPressed, @required this.label, this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size.height;
    return isLoading
        ? new Container(
            width: 20.0,
            height: 20.0,
            child: new Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.green),
                child: new CircularProgressIndicator(
                  strokeWidth: 2.0,
                )),
          )
        : RaisedButton(
            onPressed: onPressed,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(
                horizontal: deviceSize * 0.08, vertical: deviceSize * 0.018),
            child: Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green,
          );
  }
}
