// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/provider/language_provider.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/home/tabs/tab_container.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({super.key, required this.category});
  Category category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);
    return FutureBuilder<SourceResponse>(
        future: ApiManager.getSources(widget.category.id, provider.locale),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: MyTheme.greenColor,
            ));
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text('${snapshot.error}'),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSources(widget.category.id, provider.locale);
                      setState(() {});
                    },
                    child: const Text('Try again'))
              ],
            );
          }

          if (snapshot.data?.status != 'ok') {
            return Column(
              children: [
                Text('${snapshot.data?.message}'),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSources(widget.category.id, provider.locale);
                      setState(() {});
                    },
                    child: const Text('Try again'))
              ],
            );
          }

          var list = snapshot.data?.sourcesList ?? [];

          return TabContainer(sourceList: list);
        });
  }
}
