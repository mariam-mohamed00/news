import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/settings/settings_cubit/language_cubit.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/repository/source/source_repository_contract.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource {
  ApiManager apiManager;
  SourceRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<SourceResponse?> getSourceByCategoryId(
      String categoryId, BuildContext context) async {
    var response = await apiManager.getSources(
        categoryId, BlocProvider.of<LanguageCubit>(context).currentLanguage);
    return response;
  }
}
