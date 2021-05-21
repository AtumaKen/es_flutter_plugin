import 'dart:io';

import 'package:es_flutter_plugin/src/models/visa_transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VisaWebView extends StatefulWidget {
  final VisaResponseModel visaResponseModel;

  VisaWebView({this.visaResponseModel});

  @override
  _VisaWebViewState createState() => _VisaWebViewState();
}

class _VisaWebViewState extends State<VisaWebView> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    print("https://easyswitchgroup.com/easyswitchpay/secureRedirect.php?ACSUrl="
        "${widget.visaResponseModel.acsUrl}&TermUrl=${widget.visaResponseModel.termUrl}&MD="
        "${widget.visaResponseModel.mD}&PaReq=${widget.visaResponseModel.paReq}");
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      debuggingEnabled: true,
      initialUrl:
          "https://easyswitchgroup.com/easyswitchpay/secureRedirect.php?ACSUrl="
          "'${widget.visaResponseModel.acsUrl}'&TermUrl='${widget.visaResponseModel.termUrl}'&MD="
          "${widget.visaResponseModel.mD}'&PaReq='${widget.visaResponseModel.paReq}'",
    );
  }
}
