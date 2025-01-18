import 'package:news_app/model/news_response.dart';

abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsLoadingState extends NewsStates {
  String? loadingMessage;
  NewsLoadingState({required this.loadingMessage});
}

class NewsErrorState extends NewsStates {
  String? errMessage;
  NewsErrorState({required this.errMessage});
}

class NewsSuccessState extends NewsStates {
  List<News> newsList;
  NewsSuccessState({required this.newsList});
}
