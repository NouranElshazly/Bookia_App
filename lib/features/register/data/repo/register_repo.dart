import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RegisterRepo {
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

  static Future<bool> register({
    required String name,
    required String email,
    required String password,
    required String passwordconfirmation,
  }) async {
    initLogger();
    try {
      var response = await dio.post(
        "https://codingarabic.online/api/register",
        data: {
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": passwordconfirmation,
        },
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
