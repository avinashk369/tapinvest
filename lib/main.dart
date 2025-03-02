import 'package:flutter/material.dart';
import 'package:tapinvest/core/di/app_manager.dart';
import 'package:tapinvest/core/utils/app_colors.dart';
import 'package:tapinvest/core/utils/app_const.dart';
import 'package:tapinvest/routes/route_const.dart';
import 'package:tapinvest/routes/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppManager.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConst.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.bgColor,
        appBarTheme: AppBarTheme(backgroundColor: AppColors.bgColor),
      ),
      initialRoute: RouteConst.homeRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
