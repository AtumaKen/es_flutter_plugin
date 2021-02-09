class PaymentCard {
  String number;
  String pin;
  String month;
  String year;
  String cvv;
  String amount;

  PaymentCard(
      {this.number, this.pin, this.month, this.year, this.cvv, this.amount});
}

enum CardType {
  MasterCard,
  Visa,
  Verve,
  Others, // Any other card issuer
  Invalid // We'll use this when the card is invalid
}