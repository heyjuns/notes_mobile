import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppShell extends HookWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
