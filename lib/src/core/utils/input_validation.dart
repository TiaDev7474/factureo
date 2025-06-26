class InputValidation {
  static String? validateNumericValue(
    String? value, {
    String requiredMessage = "Requis",
    String? invalidMessage,
  }) {
    if (value == null || value.isEmpty) {
      return requiredMessage;
    }
    final parsedValue = int.tryParse(value);
    if (parsedValue == null || parsedValue <= 0) {
      return invalidMessage;
    }
    return null;
  }

  static String? validateEmail(
    String? value, {
    String requiredMessage = "Requis",
    String? invalidMessage,
  }) {
    if (value == null || value.isEmpty) {
      return requiredMessage;
    }
    bool isValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value);
    if (!isValid) {
      return invalidMessage;
    }
    return null;
  }
}
