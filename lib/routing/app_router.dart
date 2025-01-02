import 'package:flutter/material.dart';
import 'package:news_app/routing/routes.dart';

import '../screens/home_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
            builder: (context) => const HomeScreen(), settings: settings);

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(),
        );
    }
  }
}
