import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tapinvest/core/di/injection.dart';

class AppManager {
  static Future<void> init() async {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    await Future.wait([
      configureDependencies(),
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]),
    ]);
  }
}
