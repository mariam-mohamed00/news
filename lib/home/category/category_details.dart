// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/category/cubit/category_view_model.dart';
import 'package:news_app/home/category/cubit/states.dart';
import 'package:news_app/home/tabs/tab_container.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/repository/source/source_dependency_injection.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({super.key, required this.category});
  Category category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryViewModel viewModel = CategoryViewModel(sourceRepositoryContract: injectSourceRepository());

  @override
  void initState() {
    super.initState();
    viewModel.getSourceByCategoryId(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryViewModel, SourceStates> /*cubit ,state*/ (
      bloc: viewModel,
      builder: (context, state) {
        if (state is SourceLoadingState) {
          return Center(
              child: CircularProgressIndicator(
            color: MyTheme.greenColor,
          ));
        } else if (state is SourceErrorState) {
          return Column(
            children: [
              Text(state.errMessage!),
              ElevatedButton(
                  onPressed: () {
                    viewModel.getSourceByCategoryId(widget.category.id);
                  },
                  child: const Text('Try again'))
            ],
          );
        } else if (state is SourceSuccessState) {
          return TabContainer(sourceList: state.sourceList);
        }
        return Container();
      },
    );
  }
}