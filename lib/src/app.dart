import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:mobile_test/config/config.dart';
import 'package:mobile_test/routes.dart';
import 'package:mobile_test/src/views/views.dart';
import 'package:mobile_test/utils/theme.dart';
import 'package:mobile_test/utils/utils.dart';

class App extends StatefulWidget {
  App({required Key key, required this.isToken}) : super(key: key);
  bool? isToken = false;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Logger _logger = Logger("AppState");


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: AppColors.primaryColor,
      statusBarColor: Colors.red,
    ));
    final config = AppConfig.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: config!.appName,
      theme: AppThemes.defaultTheme.copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: ZoomPageTransitionsBuilder()
          },
        ),
      ),
      home: LandingScreen(),
      routes: AppRoutes.defaultRoutes,
    );
  }
}