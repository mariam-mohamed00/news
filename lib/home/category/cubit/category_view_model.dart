import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/category/cubit/states.dart';
import 'package:news_app/repository/source/source_repository_contract.dart';

class CategoryViewModel extends Cubit<SourceStates> {
   SourceRepositoryContract sourceRepositoryContract;

  CategoryViewModel({required this.sourceRepositoryContract}) : super(SourceLoadingState(loadingMessage: 'Loading...'));

  void getSourceByCategoryId(String categoryId) async {
    try {
      emit(SourceLoadingState(loadingMessage: 'Loading...'));
      var response =
          await sourceRepositoryContract.getSourceByCategoryId(categoryId);
      if (response?.status == 'error') {
        emit(SourceErrorState(errMessage: response!.message));
      }
      emit(SourceSuccessState(sourceList: response!.sourcesList!));
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