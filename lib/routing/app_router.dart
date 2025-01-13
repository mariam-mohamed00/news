import 'package:flutter/material.dart';
import 'package:news_app/home/news/news_details.dart';
import 'package:news_app/routing/routes.dart';

import '../home/screens/home_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
            builder: (context) => const HomeScreen(), settings: settings);
      case Routes.newDetails:
        return MaterialPageRoute(
            builder: (context) => const NewsDetails(), settings: settings);

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(),
        );
    }
  }
}
