import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tapinvest/core/di/injection.dart';

class AppManager {
  static Future<void> init() async {
    await configureDependencies();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
