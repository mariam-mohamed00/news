import 'package:flutter/material.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/routing/app_router.dart';
import 'package:news_app/routing/routes.dart';

void main()  {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      onGenerateRoute: AppRouter.generateRoute,
      theme: MyTheme.lightMode,
    );
  }


}
