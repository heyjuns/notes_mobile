import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(child: Center(child: FCircularProgress()));
  }
}
