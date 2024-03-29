import 'package:flutter/material.dart';

class SuccessfulWidget extends StatefulWidget {
  final String amount;

  SuccessfulWidget({
    @required this.amount,
  });

  @override
  _SuccessfulWidgetState createState() {
    return new _SuccessfulWidgetState();
  }
}

class _SuccessfulWidgetState extends State<SuccessfulWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.check,
          size: 50,
          color: Colors.green,
        ),
        SizedBox(
          height: 13,
        ),
        Text("You have successfully paid ${widget.amount} naira"),
      ],
    );
  }
}
