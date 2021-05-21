import 'dart:convert';

import 'package:es_flutter_plugin/src/models/card_response.dart';
import 'package:es_flutter_plugin/src/models/initializationResponse.dart';
import 'package:es_flutter_plugin/src/models/otp_model.dart';
import 'package:es_flutter_plugin/src/models/otp_response.dart';
import 'package:es_flutter_plugin/src/models/payment_card.dart';
import 'package:es_flutter_plugin/src/models/visa_transaction_model.dart';
import 'package:http/http.dart' as http;

class CardService {
  CardResponse processOtherCards(Map<dynamic, dynamic> switchData) {
    CardResponse cardResponse = CardResponse();
    if (switchData.containsKey("errors")) {
      return cardResponse
        ..error = true
        ..message = switchData["errors"][0]["message"]
        ..amount = "0"
        ..status = switchData["status"];
    }
    cardResponse
      ..message = switchData["message"]
      ..status = switchData["status"]
      ..amount = switchData["amount"]
      ..transactionRef = switchData["transactionRef"]
      ..paymentId = switchData["paymentId"]
      ..error = false;
    return cardResponse;
  }

  VisaResponseModel processVisaCards(Map<dynamic, dynamic> switchData) {
    return VisaResponseModel.fromJson(switchData);
  }

  Future<List<dynamic>> submitCardDetails(PaymentCard paymentCard) async {
    print(paymentCard.number);
    print(paymentCard.year);
    print(paymentCard.month);
    print(paymentCard.cvv);
    print(
        num.tryParse(paymentCard.pin == null ? "emppty pin" : paymentCard.pin));
    print(paymentCard.email);
    try {
      final response =
          await http.post("https://easyswitchgroup.com/appApi/appSdkLink.php",
              body: jsonEncode({
                "cardNo": paymentCard.number,
                "expiryYear": paymentCard.year,
                "expiryMonth": paymentCard.month,
                "ccvn": paymentCard.cvv,
                "cardPin": paymentCard.pin == null
                    ? ""
                    : num.tryParse(paymentCard.pin),
                "clientEmailPO": paymentCard.email,
                "amountPO": paymentCard.amount
              }));
      final responseData = jsonDecode(response.body) as Map<dynamic, dynamic>;
      print(responseData["switchData"].runtimeType);
      final switchData = responseData["switchData"] as Map<dynamic, dynamic>;
      switchData["status"] = responseData["status"];
      if (switchData["responseCode"] as String == "S0") {
        return [true, switchData];
      }
      return [false, switchData];
    } catch (e) {
      print(e.toString());
      return [0];
    }
  }

  static Future<OTPResponse> confirmOtp(OTPModel otpModel) async {
    print(otpModel.paymentCard.cvv);
    try {
      final response =
          await http.post("https://easyswitchgroup.com/appApi/confirmOtp.php",
              body: jsonEncode({
                "cardNo": otpModel.paymentCard.number,
                "expiryYear": otpModel.paymentCard.year,
                "expiryMonth": otpModel.paymentCard.month,
                "ccvnx": otpModel.paymentCard.cvv,
                "cardPin": otpModel.paymentCard.pin.isEmpty
                    ? ""
                    : num.tryParse(otpModel.paymentCard.pin),
                "clientEmailPO": otpModel.paymentCard.email,
                "otp": otpModel.otp,
                "paymentId": otpModel.cardResponse.paymentId,
                "amount": otpModel.paymentCard.amount,
                "transactionRef": otpModel.cardResponse.transactionRef,
                "merchId": otpModel.initializationResponse.merchantId
              }));
      print(jsonDecode(response.body));
      final responseData = jsonDecode(response.body) as Map<dynamic, dynamic>;
      if (responseData.containsKey("errors")) {
        final errorObject = responseData["errors"][0];
        return OTPResponse(
          message: errorObject["message"],
          error: true,
          amount: "0",
        );
      }
      return OTPResponse(
        error: false,
        amount: responseData["amount"],
        message: responseData["message"],
        panLast4Digits: responseData["panLast4Digits"],
        cardType: responseData["cardType"],
        transactionIdentifier: responseData["transactionIdentifier"],
        transactionRef: responseData["transactionRef"],
        token: responseData["token"],
        tokenExpiryDate: responseData["tokenExpiryDate"],
      );
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
      print(res);
      if (res["status"] == 200)
        return InitializationResponse(
            //todo: add amount from server
            merchantId: res["merchantID"],
            logoUrl: res["merchantLogoURL"]);
      else
        return null;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
