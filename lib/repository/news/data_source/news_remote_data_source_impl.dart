import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/settings/settings_cubit/language_cubit.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/repository/news/news_repository_contract.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManager apiManager;
  NewsRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<NewsResponse?> getNewsByCategoryId(String categoryId, BuildContext context, int pageNumber) async {
    var response = await apiManager.getNewsBySourceId(
        sourceId: categoryId,
        pageNumber: pageNumber,
        language: BlocProvider.of<LanguageCubit>(context).currentLanguage);
    return response;
  }
}
