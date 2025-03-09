import 'package:shared_preferences/shared_preferences.dart';

class LoggedInUser {
  static String? id;
  static String? name;
  static String? email;
  static String? phoneNumber;
  static String? profilePic;
  static String? accessToken;
  static String? refreshToken;
  LoggedInUser.login(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    storeUserLocally();
  }
  LoggedInUser.kycToken(String token) {
    accessToken = token;
    storeUserLocally();
  }
  LoggedInUser.profile(Map<String, dynamic> json) {
    name = json['full_name'];
    email = json['email'];
    phoneNumber = json['mobile_number'];
    storeUserLocally();
  }
  static void storeUserLocally() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('id', id ?? '');
    await prefs.setString('email', email ?? '');
    await prefs.setString('name', name ?? '');
    await prefs.setString('phoneNumber', phoneNumber ?? '');
    await prefs.setString('profilePic', profilePic ?? '');
    await prefs.setString('accessToken', accessToken ?? '');
    await prefs.setString('refreshToken', refreshToken ?? '');
  }

  static Future<void> getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString('id');
    email = prefs.getString('email');
    name = prefs.getString('name');
    phoneNumber = prefs.getString('phoneNumber');
    profilePic = prefs.getString('profilePic');
    accessToken = prefs.getString('accessToken');
    refreshToken = prefs.getString('refreshToken');
  }

  static Future<void> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await getUserDetails();
  }
}
