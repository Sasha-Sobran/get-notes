import 'package:dio/dio.dart';

import 'package:frontendik/core/app_env.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HTTPClient {
  static late Dio api;

  static void init() async {
    api = Dio();
    api.options.baseUrl = AppEnv.apiUrl;

    api.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
      ),
    );
  }
}
