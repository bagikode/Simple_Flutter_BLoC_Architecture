import 'dart:convert';
import 'package:flutterskeleton/helper/util/logger.dart';
import 'package:flutterskeleton/models/home_model.dart';
import 'package:flutterskeleton/services/endpoint/home_endpoint.dart';
import '../../helper/http/http_helper.dart';

class HomeAPI {
  static String tag = "Home API";

  Map<String, String> headerHead = {
    "Content-Type": "application/json",
  };

  HomeAPI() {
    getHeaderAuthorization().then((val) => headerHead = val);
  }

  Future<List<HomeModel>> postHome() async {
    final response =
    await makeGetRequest(HomeEndpoints.postHome());

    print("Home Post : ${jsonEncode(response.body)}");

    Logger.log(tag, message: 'homePost : ${response.statusCode}');

    List post = json.decode(response.body);

    return post.map((json) => HomeModel.fromJson(json)).toList();
  }
}
