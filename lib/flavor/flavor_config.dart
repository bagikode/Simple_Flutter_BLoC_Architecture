import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterskeleton/helper/util/string_helper.dart';
import 'package:meta/meta.dart';

enum Flavor { dev, staging, production }

class FlavorValues {
  FlavorValues({@required this.baseUrl});

  final String baseUrl;
//Add other flavor specific values, e.g database name
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final Color color;
  final bool isUseStripe;
  final FlavorValues values;
  static FlavorConfig _instance;

  factory FlavorConfig({
    @required Flavor flavor,
    Color color = Colors.blue,
    @required FlavorValues values,
    isUseStripe = false,
  }) {
    _instance ??= FlavorConfig._internal(
        flavor, StringUtils.enumName(flavor.toString()), color, values,
        isUseStripe: isUseStripe);
    return _instance;
  }

  FlavorConfig._internal(this.flavor, this.name, this.color, this.values,
      {this.isUseStripe = false});

  static FlavorConfig get instance {
    return _instance;
  }

  static bool isProduction() => _instance.flavor == Flavor.production;

  static bool isStaging() => _instance.flavor == Flavor.staging;

  static bool isDevelopment() => _instance.flavor == Flavor.dev;

  static bool get isAbleToUseStripe => _instance.isUseStripe;

}
