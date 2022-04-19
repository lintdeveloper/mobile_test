import 'package:flutter/material.dart';
import 'package:mobile_test/src/views/views.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get defaultRoutes {
    return <String, WidgetBuilder>{
      LandingScreen.routeName: (context) => const LandingScreen(),
      DashboardScreen.routeName: (context) => const DashboardScreen(),
      ProductDetailScreen.routeName: (context) => const ProductDetailScreen()
    };
  }
}
