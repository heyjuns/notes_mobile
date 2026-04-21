// core/error/exceptions/remote_exception.dart
import '../failures/failure.dart';
import 'app_exception.dart';

class RemoteException extends AppException {
  const RemoteException({required super.message, super.statusCode});

  @override
  Failure toFailure() =>
      Failure.remote(message: message, statusCode: statusCode);
}

class NetworkException extends AppException {
  const NetworkException({required super.message}) : super(statusCode: null);

  @override
  Failure toFailure() => Failure.network(message: message);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException() : super(message: 'Unauthorized');

  @override
  Failure toFailure() => const Failure.unauthorized();
}

class NotFoundException extends AppException {
  const NotFoundException({required super.message}) : super(statusCode: 404);

  @override
  Failure toFailure() => Failure.notFound(message: message);
}
