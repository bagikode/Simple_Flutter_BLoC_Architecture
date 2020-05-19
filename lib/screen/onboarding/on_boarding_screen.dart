import 'package:flutter/material.dart';
import 'package:flutterskeleton/helper/http/http_helper.dart';
import 'package:flutterskeleton/screen/login/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('On Boarding'),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Text('Ini tampilan on boarding hanya muncul sekali setelah aplikasi diinstal'),
                RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      'Mulai!',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      sharedPrefsHelper.setOnBoardingAlreadySeen();
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  LoginScreen()));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
