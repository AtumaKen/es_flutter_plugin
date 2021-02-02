import 'package:es_flutter_plugin/src/models/payment_card.dart';

class CardUtils{


  static CardType getCardTypeFrmNumber(String input) {
    CardType cardType;
    if (input.startsWith(RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType = CardType.MasterCard;
    } else if (input.startsWith(RegExp(r'[4]'))) {
      cardType = CardType.Visa;
    } else if (input
        .startsWith(RegExp(r'((506(0|1))|(507(8|9))|(6500))'))) {
      cardType = CardType.Verve;
    } else if (input.length <= 8) {
      cardType = CardType.Others;
    } else {
      cardType = CardType.Invalid;
    }
    return cardType;
  }

  static String getCleanedNumber(String text) {
    if (text == null) {
      return '';
    }
    return text.replaceAll(RegExp(r"[^0-9]"), '');
  }

  static String validateCardNumWithLuhnAlgorithm(String input) {
    if (input.isEmpty) {
      return "This is required field";
    }

    input = getCleanedNumber(input);

    if (input.length < 8) { // No need to even proceed with the validation if it's less than 8 characters
      return "This number is invalid";
    }

    int sum = 0;
    int length = input.length;
    for (var i = 0; i < length; i++) {
      // get digits in reverse order
      int digit = int.parse(input[length - i - 1]);

      // every 2nd number multiply with 2
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }

    if (sum % 10 == 0) {
      return null;
    }

    return "This number is invalid";
  }

  static String validateCVV(String value) {
    if (value.isEmpty) {
      return "CVV is required";
    }

    if (value.length < 3 || value.length > 4) {
      return "CVV is invalid";
    }
    return null;
  }
}