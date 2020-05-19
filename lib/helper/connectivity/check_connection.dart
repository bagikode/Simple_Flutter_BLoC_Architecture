import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

Future<bool> checkConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  bool isConnected = (connectivityResult == ConnectivityResult.wifi ||
      connectivityResult == ConnectivityResult.mobile);
  return isConnected;
}

showAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
       title: Text('no connection'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}
