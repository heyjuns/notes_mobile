import 'package:flutter/material.dart';
import 'package:forui/widgets/header.dart';
import 'package:forui/widgets/scaffold.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: Text('Login')),
      child: Column(),
    );
  }
}
