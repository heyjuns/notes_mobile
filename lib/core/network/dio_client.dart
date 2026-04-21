import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

class DioClient {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        headers: {'X-Candidate-Email': 'juandaleonardo7@gmail.com'},
        baseUrl:
            'https://blackjet-flutter-interview-backend-production.up.railway.app',
      ),
    );

    dio.interceptors.addAll([
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: false,
          printResponseMessage: true,
          printErrorHeaders: true,
        ),
      ),
    ]);

    return dio;
  }
}
