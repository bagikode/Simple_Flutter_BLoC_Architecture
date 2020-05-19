

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {

  final _isOnBoardingSeenBeforeKey = "onboardingseen";
  Future<bool> isOnBoardingSeenBefore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isOnBoardingSeenBeforeKey) ?? false;
  }

  Future<void> setOnBoardingAlreadySeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_isOnBoardingSeenBeforeKey, true);
  }

}
