import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/settings/settings_cubit/language_cubit.dart';
import 'package:news_app/home/settings/settings_cubit/language_state.dart';
import 'package:news_app/my_bloc_observer.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/routing/app_router.dart';
import 'package:news_app/routing/routes.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(BlocProvider<LanguageCubit>(
    create: (context) => LanguageCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.home,
        onGenerateRoute: AppRouter.generateRoute,
        theme: MyTheme.lightMode,
        locale: Locale(BlocProvider.of<LanguageCubit>(context).currentLanguage),
      );
    });
  }
}
