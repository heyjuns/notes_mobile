import 'package:firebase_auth/firebase_auth.dart';

import '../exceptions/app_exception.dart';
import '../exceptions/remote_exception.dart';

class FirebaseExceptionMapper {
  const FirebaseExceptionMapper._();

  static AppException map(Object error) {
    if (error is FirebaseAuthException) return _fromAuth(error);
    if (error is FirebaseException) return _fromFirestore(error);
    return RemoteException(message: error.toString());
  }

  static AppException _fromAuth(FirebaseAuthException e) => switch (e.code) {
        'user-not-found' ||
        'wrong-password' ||
        'invalid-credential' =>
          const UnauthorizedException(),
        'email-already-in-use' =>
          RemoteException(message: e.message ?? 'Email already in use'),
        'network-request-failed' =>
          const NetworkException(message: 'No internet connection'),
        _ => RemoteException(message: e.message ?? 'Authentication error'),
      };

  static AppException _fromFirestore(FirebaseException e) => switch (e.code) {
        'not-found' =>
          NotFoundException(message: e.message ?? 'Document not found'),
        'permission-denied' => const UnauthorizedException(),
        'unavailable' =>
          const NetworkException(message: 'Service unavailable'),
        _ => RemoteException(message: e.message ?? 'Firestore error'),
      };
}
