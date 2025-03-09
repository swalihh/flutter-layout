import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

import '../consts/string_manager.dart';

class CacheService {
  static final CacheService _singleton = CacheService._internal();

  factory CacheService() {
    return _singleton;
  }

  CacheService._internal();

  // if web we use the sharedpref
  Future<String?> readCache({required String key}) async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(key);
    } else {
      const storage = FlutterSecureStorage();
      return await storage.read(key: key);
    }
  }

  Future<void> writeCache({required String key, required String value}) async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
    } else {
      const storage = FlutterSecureStorage();
      await storage.write(key: key, value: value);
    }
  }

  Future<void> deleteCache({String? key}) async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      if (key != null) {
        await prefs.remove(key);
      } else {
        await prefs.remove(AppStrings.cToken);
      }
    } else {
      const storage = FlutterSecureStorage();
      await storage.delete(key: key ?? AppStrings.cToken);
    }
  }

  Future<void> deleteSignUpCache() async {
    final keysToDelete = [
      AppStrings.cToken,
      AppStrings.cIsSignup,
      AppStrings.cMobileNoKey,
      AppStrings.cEmailKey,
      AppStrings.cEmiratesID,
      AppStrings.cKycFailedTimes,
    ];

    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      for (var key in keysToDelete) {
        await prefs.remove(key);
      }
    } else {
      const storage = FlutterSecureStorage();
      for (var key in keysToDelete) {
        await storage.delete(key: key);
      }
    }
  }
}
