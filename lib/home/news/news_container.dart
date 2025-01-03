// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/home/news/news_item.dart';

class NewsContainer extends StatefulWidget {
  NewsContainer({super.key, required this.source});

  Source source;

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  final scrollController = ScrollController();
  int pageNumber = 1;
  List<News> news = [];
  bool shouldLoadNextPage = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        /// على الحافة في التوب او البوتوم
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          shouldLoadNextPage = true;
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (shouldLoadNextPage) {
      ApiManager.getNewsBySourceId(
              sourceId: widget.source.id ?? '', pageNumber: ++pageNumber)
          .then((value) {
        news.addAll(value.articlesList ?? []);
      });
      shouldLoadNextPage = false;
      setState(() {});
    }
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsBySourceId(sourceId: widget.source.id ?? ''),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Column(
              children: [
                Text('${snapshot.error}'),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsBySourceId(
                          sourceId: widget.source.id ?? '');
                      setState(() {});
                    },
                    child: const Text('Try again'))
              ],
            );
          } else if (snapshot.hasData) {
            var newsList = snapshot.data?.articlesList ?? [];
            if (news.isEmpty && newsList.isNotEmpty) { 
              news = newsList;
            } else if (newsList.isNotEmpty &&
                news.first.title != newsList.first.title) {
              news = newsList;
              scrollController.jumpTo(0);
            }
            return ListView.builder(
              controller: scrollController,
              itemCount: news.length,
              itemBuilder: (context, index) {
                return NewsItem(news: news[index]);
              },
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
              color: MyTheme.greenColor,
            ));
          }
        });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
