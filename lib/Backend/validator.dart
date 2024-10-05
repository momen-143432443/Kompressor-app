class ValidatorExe {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    // final emailRegExp = RegExp(r'@#%^&*()_+$?><.,;:][}{}]');
    // if (!emailRegExp.hasMatch(value)) {
    //   return 'Email is invalid';
    // }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length <= 6) {
      return 'The password must be at least 6 characters';
    }
    if (value.contains(RegExp(r'[A-Z]'))) {
      return 'The password must be contain at least one uppercase letter';
    }
    if (!value.contains(r'[0-9]')) {
      return 'The password must be contain at least one number';
    }
    return null;
  }
}
