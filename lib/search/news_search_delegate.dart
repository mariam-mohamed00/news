import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/news/news_item.dart';

class NewsSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return MyTheme.lightMode.copyWith(
        inputDecorationTheme: const InputDecorationTheme(
      activeIndicatorBorder: BorderSide.none,
      focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
    ));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.search,
          color: MyTheme.whiteColor,
        ),
        onPressed: () {
          showResults(context);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.close, color: MyTheme.whiteColor),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text('Results will appear here'),
      );
    }
    return FutureBuilder<NewsResponse>(
        future: ApiManager.searchNews(query),
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
                      ApiManager.searchNews(query);
                    },
                    child: const Text('Try again'))
              ],
            );
          }

          if (snapshot.data?.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data?.message ?? 'Failed to load news'),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.searchNews(query);
                    },
                    child: const Text('Try again'))
              ],
            );
          }

          var newsList = snapshot.data?.articlesList ?? [];

          return ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              return NewsItem(news: newsList[index]);
            },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
