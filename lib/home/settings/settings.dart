import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/settings/settings_cubit/language_cubit.dart';
import 'package:news_app/home/category/cubit/category_id_cubit.dart';
import 'package:news_app/home/settings/language_bottom_sheet.dart';
import 'package:news_app/my_theme.dart';

// ignore: must_be_immutable
class Settings extends StatefulWidget {
  const Settings({
    super.key,
  });

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            BlocProvider.of<LanguageCubit>(context).currentLanguage == 'en'
                ? 'Language'
                : BlocProvider.of<LanguageCubit>(context).currentLanguage ==
                        'ar'
                    ? 'اللغة'
                    : BlocProvider.of<LanguageCubit>(context).currentLanguage ==
                            'de'
                        ? 'Sprache'
                        : 'La lingua',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: MyTheme.blackColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet(
                  BlocProvider.of<CategoryIdCubit>(context).categoryId);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: MyTheme.greenColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    (BlocProvider.of<LanguageCubit>(context).currentLanguage ==
                            'en'
                        ? 'English'
                        : BlocProvider.of<LanguageCubit>(context)
                                    .currentLanguage ==
                                'ar'
                            ? 'Arabic'
                            : BlocProvider.of<LanguageCubit>(context)
                                        .currentLanguage ==
                                    'de'
                                ? 'German'
                                : 'Italian'),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Icon(Icons.arrow_drop_down, color: MyTheme.whiteColor)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet(String categoryId) {
    showModalBottomSheet(
      backgroundColor: MyTheme.whiteColor,
      context: context,
      builder: (context) => LanguageBottomSheet(
        categoryId: categoryId,
      ),
    );
  }
}
