import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/category/cubit/states.dart';
import 'package:news_app/provider/language_provider.dart';

class CategoryViewModel extends Cubit<SourceStates> {
  CategoryViewModel() : super(SourceLoadingState(loadingMessage: 'Loading...'));

  void getSourceByCategoryId(String categoryId) async {
    try {
      emit(SourceLoadingState(loadingMessage: 'Loading...'));
      var response =
          await ApiManager.getSources(categoryId, LanguageProvider.locale);
      if (response.status == 'error') {
        emit(SourceErrorState(errMessage: response.message));
      }
      emit(SourceSuccessState(sourceList: response.sourcesList!));
    } catch (e) {
      emit(SourceErrorState(errMessage: e.toString()));
    }
  }
}

/*
status:
initial state
loading
error
success
*/