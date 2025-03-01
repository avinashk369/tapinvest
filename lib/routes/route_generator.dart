import 'package:flutter/material.dart';
import 'package:tapinvest/features/home/presentation/pages/home_screen.dart';
import 'package:tapinvest/features/instrument/presentation/pages/instrument_detail.dart';
import 'package:tapinvest/routes/route_animation.dart';

import 'route_const.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return switch (settings.name) {
      RouteConst.homeRoute => RouteAnimation(page: const HomeScreen()),
      RouteConst.bondDetail => RouteAnimation(page: const InstrumentDetail()),
      _ => _errorRoute(),
    };
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text('Error')),
          body: const Center(child: Text('ERROR')),
        );
      },
    );
  }
}
