import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes_mobile/features/auth/data/models/user_model.dart';
import 'package:notes_mobile/core/error/exceptions/remote_exception.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/datasources/auth_remote_datasource.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  AuthRemoteDatasourceImpl(this._auth, this._firestore);

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _users =>
      _firestore.collection('users');

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
    final doc = await _users.doc(credential.user!.uid).get();
    if (!doc.exists) {
      throw const NotFoundException(message: 'User profile not found');
    }
    return UserModel.fromFirestore(doc);
  }

  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
    final model = UserModel(
      uid: credential.user!.uid,
      email: email.trim(),
      name: name.trim(),
      createdAt: DateTime.now(),
    );
    try {
      await _users.doc(model.uid).set(model.toFirestore());
    } catch (_) {
      await credential.user!.delete();
      rethrow;
    }
    return model;
  }

  @override
  Future<void> signOut() => _auth.signOut();

  @override
  Stream<UserModel?> getCurrentUser() {
    return _auth.authStateChanges().switchMap((user) {
      if (user == null) return Stream.value(null);

      return Stream.fromFuture(_users.doc(user.uid).get())
          .map((doc) {
            return doc.exists ? UserModel.fromFirestore(doc) : null;
          })
          .handleError((_) => null);
    });
  }
}
