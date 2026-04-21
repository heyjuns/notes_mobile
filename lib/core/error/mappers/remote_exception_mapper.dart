// core/error/mappers/remote_exception_mapper.dart
import 'package:dio/dio.dart';
import 'dart:io';

import '../exceptions/app_exception.dart';
import '../exceptions/remote_exception.dart';

class RemoteExceptionMapper {
  const RemoteExceptionMapper._();

  static AppException map(Object error) {
    if (error is DioException) return _fromDio(error);
    if (error is SocketException) {
      return const NetworkException(message: 'No internet connection');
    }
    return RemoteException(message: error.toString());
  }

  static AppException _fromDio(DioException e) {
    final code = e.response?.statusCode;
    final message = e.response?.data?['message'];

    return switch (e.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.connectionError => const NetworkException(
        message: 'No internet connection',
      ),

      DioExceptionType.badResponse => switch (code) {
        401 => const UnauthorizedException(),
        404 => NotFoundException(message: message ?? 'Not found'),
        504 => RemoteException(
          message: message ?? 'Server error',
          statusCode: code,
        ),
        _ => RemoteException(
          message: message ?? 'Unexpected error',
          statusCode: code,
        ),
      },

      _ => RemoteException(message: e.message ?? 'Unexpected error'),
    };
  }
}
