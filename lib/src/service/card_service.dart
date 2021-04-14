import 'dart:convert';

import 'package:es_flutter_plugin/src/models/card_response.dart';
import 'package:es_flutter_plugin/src/models/initializationResponse.dart';
import 'package:es_flutter_plugin/src/models/otp_model.dart';
import 'package:es_flutter_plugin/src/models/payment_card.dart';
import 'package:http/http.dart' as http;

class CardService {
  static Future<CardResponse> submitCardDetails(PaymentCard paymentCard) async {
     print(paymentCard.number);
    print(paymentCard.year);
    print(paymentCard.month);
    print(paymentCard.cvv);
    // print(num.tryParse(paymentCard.pin));
    print( paymentCard.email);

    final response =
        await http.post("https://easyswitchgroup.com/appApi/appSdkLink.php",
            body: jsonEncode({
              "cardNo": paymentCard.number,
              "expiryYear": paymentCard.year,
              "expiryMonth": paymentCard.month,
              "ccvn": paymentCard.cvv,
              "cardPin": paymentCard.pin == null? "" : num.tryParse(paymentCard.pin),
              "clientEmailPO": paymentCard.email,
              "amountPO": paymentCard.amount
            }));
    CardResponse cardResponse = CardResponse();
    final responseData = jsonDecode(response.body) as Map<dynamic, dynamic>;
    print(responseData);
    final switchData = responseData["switchData"] as Map<dynamic, dynamic>;
    if (switchData.containsKey("errors")) {
      return cardResponse
        ..error = true
        ..message = switchData["errors"][0]["message"]
        ..amount = "0"
        ..status = responseData["status"];
    }
    cardResponse
      ..message = switchData["message"]
      ..status = responseData["status"]
      ..amount = switchData["amount"]
      ..paymentId = switchData["paymentId"]
      ..error = false;
    return cardResponse;
  }

//    static Future<CheckoutResponse> confirmOtp(OTPModel otpModel) async{
  static Future<void> confirmOtp(OTPModel otpModel) async {
    try {
      final response =
          await http.post("https://easyswitchgroup.com/appApi/confirmOtp.php",
              body: jsonEncode({
                "cardNo": otpModel.paymentCard.number,
                "expiryYear": otpModel.paymentCard.year,
                "expiryMonth": otpModel.paymentCard.month,
                "ccvn": otpModel.paymentCard.cvv,
                "cardPin": otpModel.paymentCard.pin.isEmpty
                    ? ""
                    : num.tryParse(otpModel.paymentCard.pin),
                "clientEmailPO": otpModel.paymentCard.email,
                "otp": otpModel.otp
              }));
      print(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  static Future<InitializationResponse> initializeSdk(
      {String merchantKey, String amount, String email}) async {
    try {
      final response =
          await http.post("https://easyswitchgroup.com/appApi/index.php",
              body: jsonEncode({
                "Authorization": merchantKey,
                "amount": amount,
                "clientEmail": email,
              }));
      final res = jsonDecode(response.body) as Map<String, dynamic>;
      if (res["status"] == 200)
        return InitializationResponse(
            merchantId: res["merchantID"], logoUrl: res["merchantLogoURL"]);
      else
        return null;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
