import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/firebase/firebase_injection.dart';
import 'core/network/dio_client.dart';
import 'core/network/http_overrides.dart';
import 'core/service_locator.dart';
import 'features/auth/auth_container.dart';
import 'features/note/note_container.dart';

Future<void> bootstrapApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp();

  HttpOverrides.global = CustomHttpOverrides();

  sl.registerLazySingleton<Dio>(() => DioClient.create());

  // initFirebaseInjection();
  initAuthInjection();
  initNoteInjection();
}
