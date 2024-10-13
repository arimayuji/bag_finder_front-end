mixin ValidationMixin {
  String? validateRequiredField(
      String? value, String fieldName, bool isRequired) {
    if (isRequired && (value == null || value.isEmpty)) {
      return 'O campo $fieldName é obrigatório';
    }
    return null;
  }

  String? validateEmail(String value) {
    final RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (!emailRegExp.hasMatch(value)) {
      return 'Insira um email válido';
    }
    return null;
  }

  String? validatePassword(String value) {
    final RegExp passwordRegExp = RegExp(
      r'^(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$',
    );
    if (!passwordRegExp.hasMatch(value)) {
      return 'A senha deve conter pelo menos 8 caracteres e 1 caractere especial';
    }
    return null;
  }

  String? validateBrazilianPhone(String value) {
    final RegExp phoneRegExp = RegExp(
      r'^\(?[1-9]{2}\)?\s?[9]?[0-9]{4}\-?[0-9]{4}$',
    );
    if (!phoneRegExp.hasMatch(value)) {
      return 'Insira um telefone válido no formato (XX) XXXXX-XXXX ou (XX) XXXX-XXXX';
    }
    return null;
  }

  String? validateField(
      String? value, String fieldName, String fieldType, bool isRequired) {
    final requiredError = validateRequiredField(value, fieldName, isRequired);
    if (requiredError != null) {
      return requiredError;
    }

    if (value != null && value.isNotEmpty) {
      switch (fieldType.toLowerCase()) {
        case 'email':
          return validateEmail(value);
        case 'password':
          return validatePassword(value);
        case 'phone':
          return validateBrazilianPhone(value);
        default:
          return null;
      }
    }

    return null;
  }
}
