import "package:flutter/material.dart";

extension NavigatorsExtension on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) async {
    final currentRoute = ModalRoute.of(this)?.settings.name;
    if (currentRoute == routeName) return null;

    return Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) async {
    if(ModalRoute.of(this)?.settings.name == routeName) return;

    return Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {Object? arguments, RoutePredicate? predicate}) async {
    if(ModalRoute.of(this)?.settings.name == routeName) return;

    return Navigator.pushNamedAndRemoveUntil(this, routeName, arguments: arguments, predicate ?? (route) => false);
  }

  void pop() => Navigator.pop(this);
}
