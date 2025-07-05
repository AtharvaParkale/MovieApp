import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/secrets/app_secrets.dart';

class DioProvider {
  static Dio createDioClient() {
    final dio = Dio(BaseOptions(baseUrl: Constants.baseUrl));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.queryParameters['api_key'] = AppSecrets.tmDbApiKey;
          return handler.next(options);
        },
      ),
    );
    return dio;
  }
}
