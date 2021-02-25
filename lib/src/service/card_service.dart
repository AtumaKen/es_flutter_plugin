import 'dart:convert';

import 'package:es_flutter_plugin/src/models/card_response.dart';
import 'package:es_flutter_plugin/src/models/otp_model.dart';
import 'package:es_flutter_plugin/src/models/payment_card.dart';
import 'package:http/http.dart' as http;


class CardService {

  // final BuildContext context;
  //
  // CardService(this.context);
  //
  //   Future<void> dataGet() async{
  //     var response = await http.post("https://easyswitchgroup.com/esmerchant/", body: {
  //
  //     });
  //     print(response.body);
  //     _showErrorDialog("message");
  //   }
  //   void _showErrorDialog(String message) {
  //     showDialog(
  //       context: context,
  //       builder: (ctx) => CustomAlertDialog()
  //     );
  //   }

     static Future<CardResponse> submitCardDetails(PaymentCard paymentCard) async{
      final response = await http.post("https://easyswitchgroup.com/appApi/", body: jsonEncode({
        "cardNo" : paymentCard.number,
        "expiryYear" : paymentCard.year,
        "expiryMonth" : paymentCard.month,
        "ccvn" : paymentCard.cvv,
        "cardPin" : num.tryParse(paymentCard.pin),
        "clientEmailPO" : "atumakk@gmail.com",
        "amountPO" : 100
      }));
      print(jsonDecode(response.body));
      final responseData = jsonDecode(response.body) as Map<dynamic, dynamic>;
      // if (!responseData.containsKey("responseCode")) return null;
      CardResponse cardResponse = CardResponse();
      cardResponse..message = responseData["message"];
      cardResponse..transactionRef = responseData["transactionRef"];
      return cardResponse;
    }

    static Future<void> confirmOtp(OTPModel otpModel) async{
      final response = await http.post("https://easyswitchgroup.com/appApi/confirmOtp.php", body: jsonEncode({
        "cardNo" : otpModel.paymentCard.number,
        "expiryYear" : otpModel.paymentCard.year,
        "expiryMonth" : otpModel.paymentCard.month,
        "ccvn" : otpModel.paymentCard.cvv,
        "cardPin" : num.tryParse(otpModel.paymentCard.pin),
        "clientEmailPO" : "atumakk@gmail.com",
        "otp" : otpModel.otp
      }));
      print(jsonDecode(response.body));
    }
}