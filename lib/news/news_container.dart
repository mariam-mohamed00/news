// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/news/news_item.dart';

class NewsContainer extends StatefulWidget {
  NewsContainer({super.key, required this.source});

  Source source;

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
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
                      ApiManager.getNewsBySourceId(widget.source.id ?? '');
                  setState(() {
                    
                  });
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
                      ApiManager.getNewsBySourceId(widget.source.id ?? '');
                   setState(() {
                     
                   });
                    },
                    child: const Text('Try again'))
              ],
            );
          }

          var newsList = snapshot.data?.articlesList ?? [];

          return 
          ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              return NewsItem(news: newsList[index]);
            },
          );
        }
        );
  }
}
