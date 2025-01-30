// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/settings/settings_cubit/language_cubit.dart';
import 'package:news_app/my_theme.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key, required this.onDrawerItemClick});

  Function onDrawerItemClick;
  static const int categories = 1;
  static const int settings = 2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: MyTheme.greenColor,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.1),
          child: Text(
            BlocProvider.of<LanguageCubit>(context).currentLanguage == 'en'
                ? 'News App!'
                : BlocProvider.of<LanguageCubit>(context).currentLanguage ==
                        'ar'
                    ? 'الأخبار'
                    : BlocProvider.of<LanguageCubit>(context).currentLanguage ==
                            'de'
                        ? 'Nachrichten App'
                        : 'App Di Notizie',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            onDrawerItemClick(HomeDrawer.categories);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Icon(Icons.list),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  BlocProvider.of<LanguageCubit>(context).currentLanguage ==
                          'en'
                      ? 'Categories'
                      : BlocProvider.of<LanguageCubit>(context)
                                  .currentLanguage ==
                              'ar'
                          ? 'الفئات'
                          : BlocProvider.of<LanguageCubit>(context)
                                      .currentLanguage ==
                                  'de'
                              ? 'Kategorien'
                              : 'Categorie',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: MyTheme.blackColor),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            onDrawerItemClick(HomeDrawer.settings);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(Icons.settings),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  BlocProvider.of<LanguageCubit>(context).currentLanguage ==
                          'en'
                      ? 'Settings'
                      : BlocProvider.of<LanguageCubit>(context)
                                  .currentLanguage ==
                              'ar'
                          ? 'الاعدادات'
                          : BlocProvider.of<LanguageCubit>(context)
                                      .currentLanguage ==
                                  'de'
                              ? 'Einstellungen'
                              : 'Impostazioni',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: MyTheme.blackColor),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
