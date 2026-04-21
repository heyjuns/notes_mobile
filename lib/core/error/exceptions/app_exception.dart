import '../failures/failure.dart';

abstract class AppException implements Exception {
  final String message;
  final int? statusCode;

  const AppException({required this.message, this.statusCode});

  Failure toFailure();
}
