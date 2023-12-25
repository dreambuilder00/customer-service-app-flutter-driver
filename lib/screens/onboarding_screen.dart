import 'package:driver/screens/choice_screen.dart';
import 'package:driver/screens/login_signup_screen.dart';
import 'package:driver/screens/map_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  static const String route = '/onboarding';

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return user != null ? const ChoiceScreen() : const LoginSignupScreen();
  }
}
