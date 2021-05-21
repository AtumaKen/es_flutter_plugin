import 'package:es_flutter_plugin/src/widgets/buttons/button_widget.dart';
import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  final String message;
  final Function tryAgain;

  FailureWidget({this.message, this.tryAgain});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.error,
          size: 50,
          color: Colors.red,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          message,
          maxLines: 2,
        ),
        SizedBox(
          height: 10,
        ),
        ButtonWidget(
          onPressed: tryAgain,
          label: "Try Again",
          isLoading: false,
        ),
      ],
    );
  }
}
