import 'dart:async';

import 'package:chat_app/ui/auth/login/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash_screen';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    });
    return Scaffold(
      body: Image.asset(
        'assets/images/splash.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}