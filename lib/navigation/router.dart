import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterskeleton/screen/login/login_screen.dart';
import 'package:flutterskeleton/screen/onboarding/on_boarding_screen.dart';


class Router {

  static void goToLoginScreen(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        settings: RouteSettings(name: 'Auth Phone Screen'),
        builder: (context) => LoginScreen(),
      ),
          (_) => false,
    );
  }

  static void goToOnBoardingAppScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        settings: RouteSettings(name: 'On Boarding Start'),
        builder: (context) => OnBoardingScreen(),
      ),
    );
  }
}
