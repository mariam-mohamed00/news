import 'package:flutter/material.dart';
import 'package:news_app/provider/category_provider.dart';
import 'package:news_app/provider/language_provider.dart';
import 'package:news_app/home/screens/settings/language_bottom_sheet.dart';
import 'package:news_app/my_theme.dart';
import 'package:provider/provider.dart';

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
    final categoryId = Provider.of<CategoryProvider>(context).categoryId;

    var languageProvider = Provider.of<LanguageProvider>(context);
    return Container(
      margin: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Language',
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
              showLanguageBottomSheet(categoryId ?? '');
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
                    (languageProvider.locale == 'en'
                        ? 'English'
                        : languageProvider.locale == 'ar'
                            ? 'Arabic'
                            : languageProvider.locale == 'de'
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
