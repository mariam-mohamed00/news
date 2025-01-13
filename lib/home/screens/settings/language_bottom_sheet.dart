import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/provider/language_provider.dart';
import 'package:news_app/my_theme.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key, required this.categoryId});

  final String categoryId;

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FutureBuilder(
            future: ApiManager.getSources(widget.categoryId, 'en'),
            builder: (context, snapshot) {
              return InkWell(
                  onTap: () {
                    provider.changeLocale('en');
                  },
                  child: provider.locale == 'en'
                      ? getSelectedItemWidget(context, 'English')
                      : getUnSelectedItemWidget(context, 'English'));
            }),
        FutureBuilder(
            future: ApiManager.getSources(widget.categoryId, 'ar'),
            builder: (context, snapshot) {
              return InkWell(
                  onTap: () {
                    provider.changeLocale('ar');
                  },
                  child: provider.locale == 'ar'
                      ? getSelectedItemWidget(context, 'Arabic')
                      : getUnSelectedItemWidget(context, 'Arabic'));
            }),
        FutureBuilder(
            future: ApiManager.getSources(widget.categoryId, 'de'),
            builder: (context, snapshot) {
              return InkWell(
                  onTap: () {
                    provider.changeLocale('de');
                  },
                  child: provider.locale == 'de'
                      ? getSelectedItemWidget(context, 'German')
                      : getUnSelectedItemWidget(context, 'German'));
            }),
        FutureBuilder(
            future: ApiManager.getSources(widget.categoryId, 'it'),
            builder: (context, snapshot) {
              return InkWell(
                  onTap: () {
                    provider.changeLocale('it');
                  },
                  child: provider.locale == 'it'
                      ? getSelectedItemWidget(context, 'Italian')
                      : getUnSelectedItemWidget(context, 'Italian'));
            }),
      ],
    );
  }

  Widget getSelectedItemWidget(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: MyTheme.greenColor),
          ),
          Icon(
            Icons.check,
            color: MyTheme.greenColor,
            size: 30,
          ),
        ],
      ),
    );
  }

  Widget getUnSelectedItemWidget(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: MyTheme.blackColor),
      ),
    );
  }
}
