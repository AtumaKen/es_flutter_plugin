import 'package:es_flutter_plugin/src/models/card_response.dart';
import 'package:es_flutter_plugin/src/models/initializationResponse.dart';
import 'package:es_flutter_plugin/src/models/payment_card.dart';
import 'package:es_flutter_plugin/src/models/visa_transaction_model.dart';

class OTPModel {
  PaymentCard paymentCard;
  String otp;
  CardResponse cardResponse;
  InitializationResponse initializationResponse;

  OTPModel({this.paymentCard, this.otp, this.cardResponse, this.initializationResponse});
}
