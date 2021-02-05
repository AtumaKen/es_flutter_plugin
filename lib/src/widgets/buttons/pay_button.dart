import 'package:es_flutter_plugin/src/widgets/buttons/button_widget.dart';
import 'package:flutter/material.dart';

class PayButton extends StatelessWidget {
  final Function function;
  final String label;

  const PayButton({Key key, this.function, this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ButtonWidget(onPressed: function, label: label);
  }
}
