import 'package:es_flutter_plugin/src/widgets/widget_mixin.dart';
import 'package:flutter/material.dart';

class SuccessfulWidget extends StatefulWidget {
  final int amount;
  final VoidCallback onCountdownComplete;

  SuccessfulWidget({@required this.amount, @required this.onCountdownComplete});

  @override
  _SuccessfulWidgetState createState() {
    return new _SuccessfulWidgetState();
  }
}

class _SuccessfulWidgetState extends State<SuccessfulWidget>
    with SingleTickerProviderStateMixin {
  final sizedBox = const SizedBox(height: 20.0);
  AnimationController _mainController;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}
