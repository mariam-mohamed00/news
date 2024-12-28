import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/tabs/tab_container.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
        future: ApiManager.getSources(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  Center(child: CircularProgressIndicator(color: MyTheme.greenColor,));
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text('${snapshot.error}'),
                ElevatedButton(onPressed: () {}, child: const Text('Try again'))
              ],
            );
          }

          if (snapshot.data?.status != 'ok') {
            return Column(
              children: [
                Text('${snapshot.data?.message}'),
                ElevatedButton(onPressed: () {}, child: const Text('Try again'))
              ],
            );
          }

          var list = snapshot.data?.sourcesList ?? [];

          return TabContainer(sourceList: list);
        });
  }
}
