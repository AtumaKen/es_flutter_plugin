class PaymentCard {
  String number;
  String pin;
  String month;
  String year;
  String cvv;
  num amount;

  ///This is the email address the receipt will be sent to.
  String email;

  PaymentCard(
      {this.number,
      this.pin,
      this.month,
      this.year,
      this.cvv,
      this.amount,
      this.email});
}

enum CardType {
  MasterCard,
  Visa,
  Verve,
  Others, // Any other card issuer
  Invalid // We'll use this when the card is invalid
}
