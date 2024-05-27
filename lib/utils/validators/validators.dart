// Validating user input that return string if validation faild otherwise return null
abstract class Validators {
  static String? emailValidator(String? email) {
    if (email == null) return null;
    email = email.trim();
    if (email.isEmpty) {
      return "Field cant be empty";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return "Invalid Email Address";
    }
    return null;
  }

  static String? numberValidator(String? number) {
    if (number == null) return null;
    number = number.trim();
    if (number.isEmpty) {
      return "Field cant be empty";
    } else {
      try {
        int.parse(number);
      } on FormatException {
        return "Invalid Number";
      }
    }

    return null;
  }

  static String? nameValidator(String? name) {
    if (name == null) return null;
    if (name.isEmpty) {
      return "Field cant be empty";
    }
    return null;
  }

  static String? emptyValidator(String? name) {
    if (name == null) return null;
    if (name.isEmpty) {
      return "Field cant be empty";
    }
    return null;
  }

  static String? passwordValidator(String? password) =>
      password!.isNotEmpty && password.length > 5
          ? null
          : password.length < 6
              ? "Password should be of min. 6 digits"
              : "Not Valid";

  static String? passwordConfirmValidator(
          String? password, String newPassword) =>
      newPassword.isNotEmpty && newPassword.length > 5
          ? newPassword != password
              ? "Password don't match"
              : null
          : newPassword.length < 6
              ? "Password should be of min. 6 digits"
              : "Not Valid";

  static String? phoneNumberValidator(String? phone) {
    if (phone == null || phone.isEmpty) {
      return "Field cant be empty";
    }
    return null;
  }
}
