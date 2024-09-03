import 'package:flutter/material.dart';
import 'package:linkyou_task/Services/GoogleAuthService.dart';

class SigninButton extends StatelessWidget {
  const SigninButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () async {
        await MyFireBaseAuth.signInWithGoogle(context);
      },          child: Container(
      width: 300,
      height: 100,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.white60,
            Colors.blueAccent,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(5, 5),
            blurRadius: 10,
          )
        ],
      ),
      child: const Center(
        child: Text(
          'Sign in With Google',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
    );
  }
}
