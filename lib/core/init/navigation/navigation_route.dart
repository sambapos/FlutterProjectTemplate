import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../views/auth/example.dart';
import '../../core_shelf.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.login:
        return normalNavigate(LoginScreen());
      default:
        return normalNavigate(LoginScreen());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
