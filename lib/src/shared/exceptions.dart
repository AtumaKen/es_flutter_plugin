class EasyswitchException implements Exception {
  String message;

  EasyswitchException(this.message);

  @override
  String toString() {
    if (message == null) return "Looks like you took a wrong turn";
    return message;
  }
}

class NoContextException extends EasyswitchException {
  NoContextException(String message) : super(message);
}

class AuthenticationException extends EasyswitchException {
  AuthenticationException(String message) : super(message);
}

class InvalidMerchantKeyException extends EasyswitchException {
  InvalidMerchantKeyException(String message) : super(message);
}

class LogoException extends EasyswitchException {
  LogoException(String message) : super(message);
}
