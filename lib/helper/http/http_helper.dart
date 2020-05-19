import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:flutterskeleton/helper/shared_preferences_helper.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

SharedPrefsHelper sharedPrefsHelper = SharedPrefsHelper();
String tag = "HTTP HELPER";



/// Http "POST" request

Future<http.Response> makePostRequest(String url, Map<String, dynamic> data,
    ) async {
  print("--> POST $url");
  print("--> BODY ${jsonEncode(data)}");
  var response = await http.post(
    url,
    body: json.encode(data),
    headers: await getHeaderAuthorization(),
  );
  print("<-- POST $url");
  printResponse(response.body);
  return response;
}


/// Http "PATCH" request

Future<http.Response> makePatchRequest(String url, Map<String, dynamic> data,
    {bool forceUpdateToken = false}) async {
  print("--> PATCH $url");
  print("--> BODY ${jsonEncode(data)}");
  var response = await http.patch(
    url,
    body: json.encode(data),
    headers: await getHeaderAuthorization(),
  );
  print("<-- PATCH $url");
  printResponse(response.body);
  return response;
}


/// Http "GET" request

Future<http.Response> makeGetRequest(url) async {
  print("--> GET $url");
  var start = DateTime.now();
  var header = await getHeaderAuthorization();
  print(
      "--> Generate Header need ${DateTime.now().difference(start).inMilliseconds}ms");
  start = DateTime.now();
  final response = await http.get(url, headers: header);
  var end = DateTime.now().difference(start);
  print("<-- GET $url (${end.inMilliseconds}ms)");
  printResponse(response.body);
  return response;
}


Future printResponse(String response) async {
  JsonEncoder encoder = JsonEncoder.withIndent('  ');
  String prettyPrint = encoder.convert(jsonDecode(response));
  var splitted = prettyPrint.split("\n");
  if (splitted.length <= 80) {
    debugPrint(prettyPrint);
  } else {
    debugPrint(splitted.sublist(0, 60).join("\n"));
    var nextPrint =
    splitted.sublist(60).map((s) => s.replaceAll('  ', "")).join("");
    debugPrint(" ... $nextPrint");
  }
}

Future<Map<String, String>> getHeaderAuthorization() async {
  var startFunc = DateTime.now();
  var header = {
    'content-type': "application/json",
    'accept': "application/json",
  };
  var end = DateTime.now().difference(startFunc);
  print("Generate full header need ${end.inMilliseconds} ms");
  return header;
}

Future<void> printHeader(Map<String, String> header) async {
  var start = DateTime.now();
  header.forEach((key, value) {
    for (var i = 0; i < value.length; i += 250) {
      print(
          "--> $key: ${value.substring(i, value.length > i + 250 ? i + 250 : value.length)}");
    }
  });
  var end = DateTime.now().difference(start);
  print("Print header need ${end.inMilliseconds} ms");
}
