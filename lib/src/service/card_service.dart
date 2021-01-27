import 'package:es_flutter_plugin/src/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class CardService {

  final BuildContext context;

  CardService(this.context);

    Future<void> dataGet() async{
      var response = await http.post("https://easyswitchgroup.com/esmerchant/", body: {

      });
      print(response.body);
      _showErrorDialog("message");
    }
    void _showErrorDialog(String message) {
      showDialog(
        context: context,
        builder: (ctx) => CustomAlertDialog()
      );
    }


}