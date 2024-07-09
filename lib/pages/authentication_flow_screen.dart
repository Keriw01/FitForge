import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_forge/pages/home/main_page.dart';
import 'package:fit_forge/pages/auth/login/login_page.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthenticationFlowScreen extends StatelessWidget {
  const AuthenticationFlowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MainPage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
