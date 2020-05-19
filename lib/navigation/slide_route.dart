
import 'package:flutter/material.dart';

class RouteTransition extends PageRouteBuilder {
  final Widget widget;
  final bool fade;

  RouteTransition({this.widget, this.fade = true})
      : super(
    pageBuilder: (context, animation,
        secondaryAnimation) {
      return widget;
    },
    transitionsBuilder: (context,
        animation,
        secondaryAnimation,
        child) {
      if (fade) {
        return FadeTransition(opacity: animation, child: child);
      }
      {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      }
    },
  );
}
