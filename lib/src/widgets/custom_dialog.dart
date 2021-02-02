import 'package:es_flutter_plugin/src/widgets/input_fields/card_number_input_field.dart';
import 'package:es_flutter_plugin/src/widgets/company_logo.dart';
import 'package:es_flutter_plugin/src/widgets/input_fields/cvv_input_field.dart';
import 'package:es_flutter_plugin/src/widgets/pay_button.dart';
import 'package:es_flutter_plugin/src/widgets/widget_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'input_fields/expiry_input_field.dart';

class CustomAlertDialog extends StatefulWidget {
  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
  }
  // final Widget child;

  // const CustomAlertDialog({Key key, @required this.child}) : super(key: key);
class _CustomAlertDialogState<CustomAlertDialog> extends State with CardStateMixin{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildChild(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return AnimatedPadding(
      padding: mediaQuery.viewInsets +
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      duration: Duration(seconds: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, right: 8.0),
            child: GestureDetector(
              onTap: () => onCancelPress,
              child: Icon(
                Icons.cancel,
                color: Colors.white60,
                semanticLabel: "Close",
              ),
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
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 20.0, left: 15.0, right: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [CompanyLogo(), Text("Pay NGN 100")],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "email@email.com",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CardNumberInputField(),
                              SizedBox(
                                height: 22,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: CvvInputField(),
                                  ),
                                  SizedBox(
                                    width: 30.0,
                                  ),
                                  Expanded(
                                    child: ExpiryInputField(),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  child: PayButton()),
                            ],
                          ),
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
