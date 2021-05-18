class CheckoutResponse {
  String message;
  bool status;
  String amount;
  String panLast4Digits;
  String transactionIdentifier;
  String cardType;
  String token;
  String tokenExpiryDate;
  String transactionRef;

  CheckoutResponse(
      {this.message = "Message is empty",
      this.status = false,
      this.transactionRef = "",
      this.transactionIdentifier = "",
      this.tokenExpiryDate = "",
      this.token = "",
      this.panLast4Digits = '',
      this.cardType = '',
      this.amount = ''});
}
