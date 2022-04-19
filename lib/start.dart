import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:mobile_test/config/config.dart';
import 'package:mobile_test/providers.dart';
import 'package:mobile_test/src/app.dart';
import 'package:provider/provider.dart';

import 'src/core/core.dart';

Future<Widget> bootstrap({required String flavorName,
  required String baseUrl,
  required String appName}) async {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    final err = '${record.level.name}: ${record.time}: ${record.message}';
    debugPrint(err);
    if (record.level >= Level.SEVERE) {
      //TODO: Add firebase crashlytics
      // FirebaseCrashlytics.instance
      //     .recordError(record.error, record.stackTrace, reason: record.message);
    }
  });
  String _baseUrl = baseUrl;
  String _flavorName = flavorName;
  String _appName = appName;

  Environments _environment = Environments.test;
  bool _addHeaders = false;
  bool _isAuthToken = false;

  return AppConfig(
      appName: _appName,
      flavorName: _flavorName,
      apiBaseUrl: _baseUrl,
      environment: _environment,
      child:  MultiProvider(
        providers: getProviders(),
        child: App(key: const Key("App"), isToken: _isAuthToken),
      ),
  );
}