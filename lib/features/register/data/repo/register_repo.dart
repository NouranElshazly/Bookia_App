import 'package:bookia/core/networking/dio_factory.dart';
import 'package:bookia/features/login/data/repo/login_repo.dart';
import 'package:bookia/features/register/data/model/register_request_body.dart';

class RegisterRepo {
  static Future<bool> register(RegisterRequestBody body) async {
    try {
      final response = await DioFactory.dio.post(
        "Register",
        data: {
          "name": body.name,
          "email": body.email,
          "password": body.password,
          "password_confirmation": body.confirmPassword,
          "city": body.city,
          "address": body.address,
        },
      );
      if (response.statusCode == 201) {
        LoginRepo.saveUserToken(response.data["data"]["token"]);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
