import 'package:flutter/material.dart';
import 'package:flutterskeleton/screen/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Login Screen'),
        ),
        body: Container(
          child: Center(
            child: RaisedButton(
                color: Colors.blue,
                child: Text(
                  'Go to Home',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                          HomeScreen()));
                }),
          ),
        ),
      ),
    );
  }
}
