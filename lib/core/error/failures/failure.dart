// core/error/failures/failure.dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'failure.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure.remote({required String message, int? statusCode}) =
      RemoteFailure;

  const factory Failure.network({required String message}) = NetworkFailure;
  const factory Failure.cache({required String message}) = CacheFailure;
  const factory Failure.notFound({required String message}) = NotFoundFailure;
  const factory Failure.unauthorized() = UnauthorizedFailure;
  const factory Failure.unknown({required String message}) = UnknownFailure;
}
