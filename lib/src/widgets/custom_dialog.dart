import 'package:es_flutter_plugin/src/widgets/card_number_input_field.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return AnimatedPadding(
      padding: mediaQuery.viewInsets +
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      duration: Duration(seconds: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/mastercard.png"),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, right: 8.0),
            child: Icon(
              Icons.cancel,
              color: Colors.white60,
              semanticLabel: "Close",
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                type: MaterialType.card,
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Text("Start"),
                            CardNumberInputField(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
