import 'package:flutter/material.dart';
import 'package:mobile_test/src/core/core.dart';

class AppConfig extends InheritedWidget {
  const AppConfig({
    Key? key,
    required this.appName,
    required this.flavorName,
    required this.apiBaseUrl,
    required this.environment,
    required Widget child,
  }) : super(child: child, key: key);

  final String appName;
  final String flavorName;
  final String apiBaseUrl;
  final Environments environment;

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

}
