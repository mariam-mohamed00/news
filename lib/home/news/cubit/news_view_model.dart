import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/news/cubit/states.dart';
import 'package:news_app/provider/language_provider.dart';

class NewsViewModel extends Cubit<NewsStates> {
  NewsViewModel() : super(NewsLoadingState(loadingMessage: 'Loading...'));

  void getNewsBySourceId(String sourceId) async {
    try {
      emit(NewsLoadingState(loadingMessage: 'Loading...'));
      var response = await ApiManager.getNewsBySourceId(
          sourceId: sourceId, language: LanguageProvider.locale);
      if (response.status == 'error') {
        emit(NewsErrorState(errMessage: response.message));
      } else {
        emit(NewsSuccessState(newsList: response.articlesList!));
      }
    } catch (e) {
      emit(NewsErrorState(errMessage: e.toString()));
    }
  }
}
