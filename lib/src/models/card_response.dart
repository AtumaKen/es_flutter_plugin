class CardResponse {
  String message;
  int status;
  bool error;
  String amount;
  String paymentId;

  CardResponse({this.message, this.status, this.error, this.amount, this.paymentId});
}
