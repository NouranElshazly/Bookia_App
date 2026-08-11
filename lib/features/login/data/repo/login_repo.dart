import 'package:bookia/core/helper/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepo {
  static Dio dio = Dio();
  static void initLogger() {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          // don't print requests with uris containing '/posts'
          if (options.path.contains('/posts')) {
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        },
      ),
    );
  }

  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    initLogger();
    try {
      var response = await dio.post(
        "https://codingarabic.online/api/login",
        data: {"email": email, "password": password},
      );
      if (response.statusCode == 200) {
        saveUserToken(response.data["data"]["token"]);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<void> saveUserToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstant.userTokenKey, token);
  }
}
