import 'package:flutter/services.dart';

class Validator {
  static String? text(String? text) {
    if (text!.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? textSpecific(String text, String specific) {
    if (text.trim().isEmpty) {
      return '$specific is required';
    }
    return null;
  }

  static String? email(value) {
    // if (value==null ||value.isEmpty||value.toString().length<3) {
    //   return 'Please enter your email address';
    // }
    if (

        // !RegExp(
        //       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        //   .hasMatch(value)

        !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? mobile(value) {
    if (value.isEmpty) {
      return 'Please enter your mobile number';
    }
    if (value.length < 5) {
      return 'Please enter a valid mobile number';
    }
    return null;
  }

  static String? otp(value) {
    if (value.toString().isEmpty) {
      return 'Please enter your OTP';
    }
    if (value.toString().length < 6) {
      return 'Please enter a valid OTP';
    }
    return null;
  }

  static String? password(value) {
    RegExp uppercaseRegex = RegExp(r'[A-Z]');
    RegExp lowercaseRegex = RegExp(r'[a-z]');
    RegExp digitRegex = RegExp(r'[0-9]');
    RegExp specialCharRegex = RegExp(r'[!@#\$&*~]');
    if (value.isEmpty) {
      return 'Please enter a password';
    } else if (!uppercaseRegex.hasMatch(value)) {
      return 'Should contain at least one uppercase letter';
    } else if (!lowercaseRegex.hasMatch(value)) {
      return 'Should contain at least one lowercase letter';
    } else if (!digitRegex.hasMatch(value)) {
      return 'Should contain at least one digit';
    } else if (!specialCharRegex.hasMatch(value)) {
      return 'Should contain at least one special character';
    } else if (value.length < 8) {
      return 'Should be at least 8 characters';
    } else {
      return null;
    }
  }

  static String? url(value) {
    bool validURL = Uri.parse(value).isAbsolute;
    if (validURL) {
      return null;
    } else {
      return 'Please enter a valid URL';
    }
  }

  static String? numeric(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Only numeric values are allowed';
    }
    return null;
  }

  static String? validateDropdown({var value, required String msg}) {
    if (value == null) {
      return msg;
    }
    return null;
  }

  static String? isPasswordMatch(String? value1, String? value2) {
    if (value1 == null || value1.isEmpty || value2 == null || value2.isEmpty) {
      return 'Confirm your password';
    }
    return value1 == value2 ? null : 'Passwords do not match';
  }

  static String? numberValidate({
    required String? value,
    bool isPositive = false,
    bool isInteger = false,
    double minValue = double.negativeInfinity,
    double maxValue = double.infinity,
  }) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (value.contains(' ')) {
      return 'Spaces are not allowed';
    }

    final parsedValue = double.tryParse(value);

    if (parsedValue == null) {
      return 'Please enter a valid number';
    }

    if (isPositive && parsedValue <= 0) {
      return 'The number must be positive';
    }

    if (isInteger && parsedValue != parsedValue.toInt()) {
      return 'Please enter a valid integer';
    }

    if (parsedValue < minValue || parsedValue > maxValue) {
      return 'The number must be between $minValue and $maxValue';
    }

    return null;
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  final RegExp _decimalRegex = RegExp(r'^-?\d*\.?\d*$');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (_decimalRegex.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}
