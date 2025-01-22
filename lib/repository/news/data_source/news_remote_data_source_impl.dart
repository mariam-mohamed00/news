import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/provider/language_provider.dart';
import 'package:news_app/repository/news/news_repository_contract.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManager apiManager;
  NewsRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<NewsResponse?> getNewsByCategoryId(String categoryId) async {
    var response = await apiManager.getNewsBySourceId(
        sourceId: categoryId, language: LanguageProvider.locale);
    return response;
  }
}
