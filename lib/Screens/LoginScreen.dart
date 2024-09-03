import 'package:flutter/material.dart';
import 'package:linkyou_task/Services/GoogleAuthService.dart';
import 'package:linkyou_task/Widgets/SigninButton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SigninButton()
      ),
    );
  }
}
