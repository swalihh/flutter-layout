// class Validations {
//   static String? isEmpty(String? value, String field) =>
//       value == null || value.trim().isEmpty ? '$field is required' : null;

//   static String? isNumber(String? value, String field) {
//     final hasNumber = RegExp(r'^\d+$');
//     if (value == null || value.isEmpty) return '$field is Required';
//     return hasNumber.hasMatch(value) ? null : 'Only numbers are allowed';
//   }

//   static String? isEmail(String? value) {
//     final hasEmail = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
//     if (value == null || value.isEmpty) return 'Email is Required';
//     return hasEmail.hasMatch(value) ? null : 'Invalid email';
//   }

//   static String? isPassword(String? value) {
//     if (value == null || value.isEmpty) return 'Password is required';
//     if (value.length < 8) return 'Password requires at least 8 characters';
//     return null;
//   }

//   static String? isPasswordMatch(String? value1, String? value2) {
//     if (value1 == null || value1.isEmpty || value2 == null || value2.isEmpty) {
//       return 'Confirm your password';
//     }
//     return value1 == value2 ? null : 'Passwords do not match';
//   }

//   static String? isMobileNumber(String? value) {
//     final hasNumber = RegExp(r'^\d+$');
//     if (value == null || value.isEmpty) return 'Mobile number is required';
//     if (!hasNumber.hasMatch(value)) return 'Only numbers are allowed';
//     if (value.length < 4) return 'Mobile number must be at least 4 digits';
//     if (value.length > 14) return 'Mobile number must not exceed 14 digits';
//     return null;
//   }
// }
