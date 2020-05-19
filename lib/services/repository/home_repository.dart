
import 'package:flutterskeleton/models/home_model.dart';
import 'package:flutterskeleton/services/api/home_api.dart';

class HomeRepository {
  final HomeAPI _homeAPI = HomeAPI();

  Future<List<HomeModel>> postHome() =>
      _homeAPI.postHome();
}
