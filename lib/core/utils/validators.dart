class Validators {
  Validators._();

  static final Validators instance = Validators._();

  // validate phone number
  String? Function(String?)? validateMobileNumber() {
    Pattern patternMobileNumber = r'^(?:[+0]9)?[0-9]{10,15}$';
    return (value) {
      value = value?.trim();
      if (value!.isEmpty) {
        return "This field is empty";
      } else if (value.contains("+") && value.contains(RegExp(r'[0-9]|')) && !value.contains(RegExp(r'[a-zA-Z]'))) {
        return "Please provide a valid phone number";
      } else if (!value.contains(RegExp(r'[a-zA-Z]')) && value.contains(RegExp(r'[0-9]')) && !value.contains("+")) {
        if (checkPattern(pattern: patternMobileNumber, value: value)) {
          return "Please provide a valid phone number";
        }
      }
      return null;
    };
  }

  // validate name
  String? Function(String?)? validateName() {
    String patternName =
        r"^[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z]+[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z-_]*$";
    return (value) {
      if (value!.isEmpty) {
        return "This field is empty";
      } else if (value.toString().length < 2 && !checkPattern(pattern: patternName, value: value)) {
        return "This field must be at least 2 characters";
      } else if (value.toString().length > 30) {
        return "This field must be at most 30 characters";
      } else if (checkPattern(pattern: patternName, value: value)) {
        return null;
      }
      return null;
    };
  }

  // validate email
  String? validateEmail(String? value) {
    String patternEmail = r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)";
    if (value!.isEmpty) {
      return "This field is empty";
    } else if (checkPattern(pattern: patternEmail, value: value)) {
      return "Please enter a valid name";
    }
    return null;
  }

  // validate password
  String? validateLoginPassword(String? value) {
    if (value!.isEmpty) {
      return "This field is empty";
    }
    return null;
  }

  // validate is numeric
  bool isNumeric(String str) {
    Pattern patternInteger = r'^-?[0-9]+$';
    return checkPattern(pattern: patternInteger, value: str);
  }

  // check pattern
  bool checkPattern({pattern, value}) {
    RegExp regularCheck = RegExp(pattern);
    if (regularCheck.hasMatch(value)) {
      return false;
    }
    return true;
  }
}
