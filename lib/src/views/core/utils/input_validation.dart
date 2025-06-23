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
}
