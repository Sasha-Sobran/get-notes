import 'package:dio/dio.dart';
import 'package:frontendik/http/http_client.dart';
import 'package:frontendik/models/user/user.dart';

class AuthApi {
  static Future<User> signUp(
    String name,
    String surname,
    String login,
    String email,
    String password,
  ) async {
    final response = await HTTPClient.api.post(
      '/auth/',
      data: {
        'name': name,
        'surname': surname,
        'login': login,
        'email': email,
        'password': password,
      },
    );

    return User.fromJson(response.data);
  }

  static Future<String> signIn(String login, String password) async {
    final formData = FormData.fromMap({
      'username': login,
      'password': password,
    });

    final response = await HTTPClient.api.post(
      '/auth/token',
      data: formData,
    );

    return response.data['access_token'];
  }
}
