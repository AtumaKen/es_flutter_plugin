import 'package:es_flutter_plugin/src/widgets/widget_mixin.dart';
import 'package:flutter/material.dart';

class SuccessfulWidget extends StatefulWidget {
  final int amount;

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
    return Column(children: [
      Icon(Icons.check, size: 30, color: Colors.green,),
      Text("You have successfully paid ${widget.amount} naira"),
    ],);
  }
}
