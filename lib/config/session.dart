import 'dart:convert';

import 'package:money/data/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import '../presentation/controller/c_user.dart';

class Session {
  static Future<bool> saveUser(User user, {required String token}) async {
    final pref = await SharedPreferences.getInstance();
    Map<String, dynamic> userData = {
      'user': user.toJson(),
      'token': token,
    };
    String stringUserData = jsonEncode(userData);
    bool success = await pref.setString('userData', stringUserData);
    if (success) {
      final cUser = Get.put(CUser());
      cUser.setData(user);
    }
    return success;
  }

  static Future<User> getUser() async {
    User user = User();
    final pref = await SharedPreferences.getInstance();
    String? stringUserData = await pref.getString('userData');
    if (stringUserData != null) {
      Map<String, dynamic> userData = jsonDecode(stringUserData);
      user = User.fromJson(userData['user']);
      // Optionally, you can retrieve and use the token here if needed
      String token = userData['token'];
    }
    final cUser = Get.put(CUser());
    cUser.setData(user);
    return user;
  }

  static Future<String?> getToken() async {
    final pref = await SharedPreferences.getInstance();
    String? stringUserData = await pref.getString('userData');
    if (stringUserData != null) {
      Map<String, dynamic> userData = jsonDecode(stringUserData);
      return userData['token'];
    }
    return null;
  }

  static Future<bool> clearUser() async {
    final pref = await SharedPreferences.getInstance();
    bool success = await pref.remove('userData');
    final cUser = Get.put(CUser());
    cUser.setData(User());
    return success;
  }
}
