// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/news/cubit/news_view_model.dart';
import 'package:news_app/home/news/cubit/states.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/home/news/news_item.dart';
import 'package:news_app/repository/news/news_dependency_injection.dart';

class NewsContainer extends StatefulWidget {
  Source source;
  NewsContainer({super.key, required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  NewsViewModel viewModel =
      NewsViewModel(newsRepositoryContract: injectNewsRepository());

  @override
  void initState() {
    super.initState();
    viewModel.scrollController.addListener(() {
      if (viewModel.scrollController.position.atEdge) {
        bool isTop = viewModel.scrollController.position.pixels == 0;
        if (!isTop) {
          viewModel.getNewsBySourceId(
              widget.source.id ?? '', context, ++viewModel.pageNumber);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    viewModel.newsList = [];
    viewModel.pageNumber = 1;

    viewModel.getNewsBySourceId(
        widget.source.id ?? '', context, viewModel.pageNumber);

    return BlocProvider<NewsViewModel>(
      create: (context) => viewModel,
      child: BlocBuilder<NewsViewModel, NewsStates>(
        builder: (context, state) {
          if (state is NewsSuccessState || viewModel.pageNumber > 1) {
            return ListView.builder(
              controller: viewModel.scrollController,
              itemCount: viewModel.newsList.length,
              itemBuilder: (context, index) {
                return NewsItem(news: viewModel.newsList[index]);
              },
            );
          } else if (state is NewsLoadingState) {
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
                      viewModel.getNewsBySourceId(widget.source.id ?? '',
                          context, viewModel.pageNumber);
                    },
                    child: const Text('Try again'))
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
