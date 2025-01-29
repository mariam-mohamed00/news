import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/settings/settings_cubit/language_cubit.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/my_theme.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key, required this.categoryId});

  final String categoryId;

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
} 

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FutureBuilder<SourceResponse>(
            future: ApiManager.getInstance().getSources(widget.categoryId, 'en'),
            builder: (context, snapshot) {
              return InkWell(
                  onTap: () {
                   BlocProvider.of<LanguageCubit>(context).changeLanguage('en') ;
                    Navigator.pop(context);
                  },
                  child: BlocProvider.of<LanguageCubit>(context).currentLanguage == 'en'
                      ? getSelectedItemWidget(context, 'English')
                      : getUnSelectedItemWidget(context, 'English'));
            }),
        FutureBuilder<SourceResponse>(
            future: ApiManager.getInstance().getSources(widget.categoryId, 'ar'),
            builder: (context, snapshot) {
              return InkWell(
                  onTap: () {
                    BlocProvider.of<LanguageCubit>(context).changeLanguage('ar');

                    Navigator.pop(context);
                  },
                  child: BlocProvider.of<LanguageCubit>(context).currentLanguage == 'ar'
                      ? getSelectedItemWidget(context, 'Arabic')
                      : getUnSelectedItemWidget(context, 'Arabic'));
            }),
        FutureBuilder<SourceResponse>(
            future: ApiManager.getInstance().getSources(widget.categoryId, 'de'),
            builder: (context, snapshot) {
              return InkWell(
                  onTap: () {
                    BlocProvider.of<LanguageCubit>(context).changeLanguage('de');

                    Navigator.pop(context);
                  },
                  child: BlocProvider.of<LanguageCubit>(context).currentLanguage == 'de'
                      ? getSelectedItemWidget(context, 'German')
                      : getUnSelectedItemWidget(context, 'German'));
            }),
        FutureBuilder<SourceResponse>(
            future: ApiManager.getInstance().getSources(widget.categoryId, 'it'),
            builder: (context, snapshot) {
              return InkWell(
                  onTap: () {
                    BlocProvider.of<LanguageCubit>(context).changeLanguage('it');

                    Navigator.pop(context);
                  },
                  child: BlocProvider.of<LanguageCubit>(context).currentLanguage == 'it'
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
