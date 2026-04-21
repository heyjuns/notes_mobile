import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../service_locator.dart';

void initFirebaseInjection() {
  // Firebase Auth
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  // Firebase Firestore
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
}
