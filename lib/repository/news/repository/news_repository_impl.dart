import 'package:news_app/model/news_response.dart';
import 'package:news_app/repository/news/news_repository_contract.dart';

class NewsRepositoryImpl implements NewsRepositoryContract{
  NewsRemoteDataSource newsRemoteDataSource;
  NewsRepositoryImpl({required this.newsRemoteDataSource});
  @override
  Future<NewsResponse?> getNewsByCategoryId(String categoryId) {
    return newsRemoteDataSource.getNewsByCategoryId(categoryId);
  }
}