class OTPResponse {
  String message;
  bool error;
  String amount;
  String panLast4Digits;
  String transactionIdentifier;
  String cardType;
  String token;
  String tokenExpiryDate;
  String transactionRef;

  OTPResponse(
      {this.message,
      this.error,
      this.amount,
      this.cardType,
      this.panLast4Digits,
      this.token,
      this.tokenExpiryDate,
        this.transactionRef,
      this.transactionIdentifier});
}
