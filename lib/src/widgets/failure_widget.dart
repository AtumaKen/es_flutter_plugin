import 'package:flutter/material.dart';


class FailureWidget extends StatelessWidget {
  final String message;
  FailureWidget({this.message});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Icon(Icons.close, size: 50, color: Colors.red,),
      SizedBox(height: 15,),
      Text(message),
    ],);
  }
}
