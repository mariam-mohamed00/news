import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/category/cubit/category_id_state.dart';

class CategoryIdCubit extends Cubit<CategoryIdState> {
  CategoryIdCubit() : super(CategoryIdState());
  String categoryId = 'sports';

  void setCategoryId(String newCategoryId) {
    categoryId = newCategoryId;
    emit(CategoryIdState());
  }
}