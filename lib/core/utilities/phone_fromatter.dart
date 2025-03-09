class PhoneNumberFormatter {
  static String formatPhoneNumber(String result) {
    List<String> parts = result.split(" - "); 
    
    if (parts.length > 1) {
      String phoneWithCode = parts[1].trim(); 
      List<String> phoneParts = phoneWithCode.split(" ");

      if (phoneParts.length > 1) {
        return phoneParts.sublist(1).join(" "); 
      }
      return phoneParts[0]; 
    }
    
    return result;
  }

static String extractPhoneNumber(String result) {
  List<String> parts = result.split(" - "); 

  if (parts.length > 1) {
    return parts[1].trim(); 
  }
  
  return result; 
}

}
