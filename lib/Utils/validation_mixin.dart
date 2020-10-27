class ValidationMixin {
  String validateEmail(String value) {
    if (!value.contains("@")) {
      return "Mail adress is not valid";
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length < 4) {
      return "Passwod must contain least 4 characters";
    }
    return null;
  }
}
