class CardResponse {
  String message;
  int status;
  bool error;
  String amount;
  String paymentId;
  String transactionRef;

  CardResponse({this.message, this.status, this.error, this.amount, this.paymentId, this.transactionRef});
}
