import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/news/cubit/states.dart';
import 'package:news_app/repository/news/news_repository_contract.dart';

class NewsViewModel extends Cubit<NewsStates> {
  NewsRepositoryContract newsRepositoryContract;

  NewsViewModel({required this.newsRepositoryContract})
      : super(NewsLoadingState(loadingMessage: 'Loading...'));
  void getNewsBySourceId(String sourceId) async {
    try {
      emit(NewsLoadingState(loadingMessage: 'Loading...'));
      var response = await newsRepositoryContract.getNewsByCategoryId(sourceId);

      if (response?.status == 'error') {
        emit(NewsErrorState(errMessage: response!.message));
      } else {
        emit(NewsSuccessState(newsList: response!.articlesList!));
      }
    } catch (e) {
      emit(NewsErrorState(errMessage: e.toString()));
    }
  }
}
