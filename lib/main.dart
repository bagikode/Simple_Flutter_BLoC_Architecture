
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterskeleton/helper/util/logger.dart';
import 'package:flutterskeleton/screen/splash/splash_screen.dart';
import 'helper/shared_preferences_helper.dart';
import 'navigation/router.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  static const String tag = "SPLASH SCREEN";
  final _sharedPreferenceHelper = SharedPrefsHelper();

  @override
  void initState() {
    Logger.log(tag, message: "INIT SPLASH SCREEN");
    new Future.delayed(const Duration(seconds: 2), () {
      checkFirstSeen();
    });

    super.initState();
  }

  Future checkFirstSeen() async {
    if (await _sharedPreferenceHelper.isOnBoardingSeenBefore()) {
      Router.goToLoginScreen(context);
    } else {
      Router.goToOnBoardingAppScreen(context);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: SplashScreen(),
    );
  }
}
