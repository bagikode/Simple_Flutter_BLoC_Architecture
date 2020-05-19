import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static String tag = "SPLASH SCREEN";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Icon(
            Icons.email,
            color: Colors.white,
            size: 80,
          ),
        ),
      ),
    );
  }
}
