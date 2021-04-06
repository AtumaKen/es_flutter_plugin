import 'package:flutter/material.dart';


class FailureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Icon(Icons.close, size: 30, color: Colors.red,),
      Text("Payment Unsuccessful"),
    ],);
  }
}
