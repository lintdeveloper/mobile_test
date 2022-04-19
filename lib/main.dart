// @dart=2.9

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_test/src/app.dart';
import 'package:mobile_test/start.dart';

void main() async {
  String _baseUrl = "";
  String _flavorName = "production";
  String _appName = "eCommerce";

  WidgetsFlutterBinding.ensureInitialized();
  //TODO: Add firebase crashlytics
  // await Firebase.initializeApp();
  // final crashlytics = await loadCrashlytics();

  // Wraps `app` in a guarded zone where all errors are reported to `crashlytics.recordError`.

  runZonedGuarded(() async {
    final app = await bootstrap(baseUrl: _baseUrl,
        flavorName: _flavorName, appName: _appName);
    runApp(app);
  }, (error, stack) {
    //TODO: Add crashlytics for logging errors
    // if (kReleaseMode)
    //   crashlytics.recordError(error, stack);
  });
}