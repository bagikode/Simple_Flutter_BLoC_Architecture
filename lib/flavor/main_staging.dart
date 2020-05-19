import 'package:flutterskeleton/flavor/flavor_config.dart';
import 'package:flutterskeleton/helper/util/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutterskeleton/main.dart';

class AppBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

String tag = "MAIN-staging";

void main() async {


  WidgetsFlutterBinding.ensureInitialized();
//  BlocSupervisor().delegate = AppBlocDelegate();
  FlavorConfig(
      flavor: Flavor.production,
      values: FlavorValues(baseUrl: "https://jsonplaceholder.typicode.com"));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MaterialApp(
        theme: ThemeData(primaryColor: Colors.blue),
        home: MyApp(),
      ),
    );
  });
  Logger.log(tag, message: "${FlavorConfig.instance.values.baseUrl}");
}
