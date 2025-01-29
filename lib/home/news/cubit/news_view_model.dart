import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/news/cubit/states.dart';
import 'package:news_app/repository/news/news_repository_contract.dart';

class NewsViewModel extends Cubit<NewsStates> {
  NewsRepositoryContract newsRepositoryContract;
  List newsList = [];
  int pageNumber = 1;
  final scrollController = ScrollController();
  NewsViewModel({required this.newsRepositoryContract})
      : super(NewsInitialState());

  void getNewsBySourceId(
      String sourceId, BuildContext context, int pageNumber) async {
    try {
      emit(NewsLoadingState(loadingMessage: 'Loading...'));

      var response = await newsRepositoryContract.getNewsByCategoryId(
          sourceId, context, pageNumber);
      if (response?.status == 'error') {
        emit(NewsErrorState(errMessage: response!.message));
      } else {
        newsList.addAll(response!.articlesList!);
        emit(NewsSuccessState());
      }
    } catch (e) {
      emit(NewsErrorState(errMessage: e.toString()));
    }
  }
}
