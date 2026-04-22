import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_mobile/features/auth/router/flight_router.dart';
import 'package:notes_mobile/features/note/router/note_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final appRouter = GoRouter(
 
  debugLogDiagnostics: true,
  initialLocation: AuthRouter.routes.first.path,
  navigatorKey: navigatorKey,
  routes: [...AuthRouter.routes, ...NoteRouter.routes],
);
