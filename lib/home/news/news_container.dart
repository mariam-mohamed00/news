// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/news/cubit/news_view_model.dart';
import 'package:news_app/home/news/cubit/states.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/home/news/news_item.dart';
import 'package:news_app/provider/language_provider.dart';
import 'package:news_app/repository/news/news_dependency_injection.dart';

class NewsContainer extends StatefulWidget {
  NewsContainer({super.key, required this.source});

  Source source;

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  NewsViewModel viewModel = NewsViewModel(
      newsRepositoryContract: injectNewsRepository());
  final scrollController = ScrollController();
  bool shouldLoadNextPage = false;
  int pageNumber = 1;
  List<News> news = [];

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
      ApiManager.getInstance().getNewsBySourceId(
              sourceId: widget.source.id ?? '',
              pageNumber: ++pageNumber,
              language: LanguageProvider.locale)
          .then((value) {
        news.addAll(value.articlesList ?? []);
      });
      shouldLoadNextPage = false;
      setState(() {});
    }

    viewModel.getNewsBySourceId(widget.source.id ?? '');
    return BlocBuilder<NewsViewModel, NewsStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is NewsLoadingState) {
          return Center(
              child: CircularProgressIndicator(
            color: MyTheme.greenColor,
          ));
        } else if (state is NewsErrorState) {
          return Column(
            children: [
              Text(state.errMessage!),
              ElevatedButton(
                  onPressed: () {
                    viewModel.getNewsBySourceId(widget.source.id ?? '');
                  },
                  child: const Text('Try again'))
            ],
          );
        } else if (state is NewsSuccessState) {
          return ListView.builder(
            itemCount: state.newsList.length,
            itemBuilder: (context, index) {
              return NewsItem(news: state.newsList[index]);
            },
          );
        }
        return Container();
      },
    );
  }
}
