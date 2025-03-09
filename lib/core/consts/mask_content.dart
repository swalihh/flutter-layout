String maskString(String input) {
  if (input.isEmpty) {
    return input;
  }
  
  // Check if the input is an email
  if (input.contains('@')) {
    return _maskEmail(input);
  }
  
  // Check if the input is a mobile number (basic check)
  if (RegExp(r'^\+?[0-9]{10,15}$').hasMatch(input)) {
    return _maskPhoneNumber(input);
  }
  
  // If it's a regular string, mask it
  return _maskPhoneNumber(input); // Using phone number masking for regular strings
}

String _maskEmail(String email) {
  int atIndex = email.indexOf('@');
  if (atIndex == -1) return email;

  String localPart = email.substring(0, atIndex);
  String domainPart = email.substring(atIndex);

  // Mask all characters except the first one
  String maskedLocalPart = 
      localPart.substring(0, localPart.length > 2 ? 3 : 1) +
      "*" * (localPart.length - (localPart.length > 2 ? 3 : 1));

  return maskedLocalPart + domainPart;
}

String _maskPhoneNumber(String number) {
  // Remove any non-digit characters
  String cleanNumber = number.replaceAll(RegExp(r'[^\d]'), '');
  
  // If number is too short, return as is
  if (cleanNumber.length < 4) return number;
  
  // Keep first 3 and last 3 digits visible, mask the rest
  String firstPart = cleanNumber.substring(0, 3);
  String lastPart = cleanNumber.substring(cleanNumber.length - 3);
  String maskedPart = '*' * (cleanNumber.length - 6);
  
  return firstPart + maskedPart + lastPart;
}

