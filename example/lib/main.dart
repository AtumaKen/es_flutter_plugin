import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:es_flutter_plugin/es_flutter_plugin.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      // platformVersion = await EsFlutterPlugin.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  Charge setUpCharge() {
    return Charge(
        amount: amountController.text, email: emailController.text,);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    amountController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:10.0, vertical: 8.0),
          child: Center(
            child: Column(
              children: [
//                Text('Running on: $_platformVersion\n'),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(hintText: "Enter Email"),
                ),
                TextField(
                  controller: amountController,
                  decoration: InputDecoration(hintText: "Enter Amount"),
                ),
                MaterialButton(
                  onPressed: () {
                    Charge charge = setUpCharge();
                    EasySwitchPlugin(
                      context: context,
                      charge: charge,
                      merchantKey:
                          "pk_test_lPexiZEbPVLHpowBvz/kSGR7StYAxVE8QBJCqFtg3CC6cmA1rIMBGlTjpd8IG2Kn",
                    ).validate();
                  },
                  child: Text("Pay"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
