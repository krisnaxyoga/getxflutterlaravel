import 'package:d_info/d_info.dart';
import 'package:money/config/api.dart';
import 'package:money/config/app_request.dart';
import 'package:money/config/session.dart';
import 'package:money/data/model/user.dart';

class SourceUser {
  static Future<bool> login(String email, String password) async {
    String url = 'http://172.17.2.76:8005/api/auth/login';
    Map? responseBody = await AppRequest.post(url, {
      'email': email,
      'password': password,
    });

    if (responseBody == null) return false;

    if (responseBody['success']) {
      var mapUser = responseBody['data'];
      Session.saveUser(User.fromJson(mapUser));
    }

    return responseBody['success'];
  }

  static Future<bool> register(
      String name, String email, String password) async {
    String url = 'http://172.17.2.76:8005/api/people/register';
    Map? responseBody = await AppRequest.post(url, {
      'name': name,
      'email': email,
      'password': password,
      'created_at': DateTime.now().toIso8601String(),
      'updated_at': DateTime.now().toIso8601String(),
    });
    print(responseBody);
    if (responseBody == null) return false;

    if (responseBody['success']) {
      DInfo.notifSuccess('success', 'success registrasi');
    } else {
      if (responseBody['message'] == 'email') {
        DInfo.toastError('Email sudah terdaftar');
      } else {
        DInfo.toastError('Gagal Register');
      }
    }

    return responseBody['success'];
  }
}
