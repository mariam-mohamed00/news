// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/news/news_container_view_model.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/home/news/news_item.dart';
import 'package:news_app/provider/language_provider.dart';
import 'package:provider/provider.dart';

class NewsContainer extends StatefulWidget {
  NewsContainer({super.key, required this.source});

  Source source;

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  NewsContainerViewModel viewModel = NewsContainerViewModel();

  final scrollController = ScrollController();
  int pageNumber = 1;
  List<News> news = [];
  bool shouldLoadNextPage = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
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
              sourceId: widget.source.id ?? '',
              pageNumber: ++pageNumber,
              language: LanguageProvider.locale)
          .then((value) {
        news.addAll(value.articlesList ?? []);
      });
      shouldLoadNextPage = false;
      setState(() {});
    }
    viewModel.getNewsBtSourceId(widget.source.id ?? '');

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsContainerViewModel>(
        builder: (context, value, child) {
          if (viewModel.errMessage != null) {
            return Column(
              children: [
                Text(viewModel.errMessage!),
                ElevatedButton(
                    onPressed: () {
                      viewModel.getNewsBtSourceId(widget.source.id ?? '');
                    },
                    child: const Text('Try again'))
              ],
            );
          } else if (viewModel.newsList == null) {
            return Center(
                child: CircularProgressIndicator(
              color: MyTheme.greenColor,
            ));
          } else {
            return ListView.builder(
              controller: scrollController,
              itemCount: viewModel.newsList!.length,
              itemBuilder: (context, index) {
                return NewsItem(news: viewModel.newsList![index]);
              },
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
