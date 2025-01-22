import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/provider/language_provider.dart';
import 'package:news_app/repository/source/source_repository_contract.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource {
  ApiManager apiManager;
  SourceRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<SourceResponse?> getSourceByCategoryId(String categoryId) async {
    var response =
        await apiManager.getSources(categoryId, LanguageProvider.locale);
    return response;
  }
}
