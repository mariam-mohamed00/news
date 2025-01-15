import 'package:flutter/material.dart';
import 'package:news_app/provider/category_provider.dart';
import 'package:news_app/provider/language_provider.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/routing/app_router.dart';
import 'package:news_app/routing/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => LanguageProvider()),
    ChangeNotifierProvider(
      create: (context) => CategoryProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      onGenerateRoute: AppRouter.generateRoute,
      theme: MyTheme.lightMode,
      locale: Locale(provider.locale),
      themeMode: ThemeMode.system,
    );
  }
}
