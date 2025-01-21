// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/category/cubit/category_view_model.dart';
import 'package:news_app/home/category/cubit/states.dart';
import 'package:news_app/home/tabs/tab_container.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/my_theme.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({super.key, required this.category});
  Category category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryViewModel viewModel = CategoryViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getSourceByCategoryId(widget.category.id);
  }

  /// MVVM
  // CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();
  // @override
  // void initState() {
  //   super.initState();
  //   viewModel.getSourceByCategory(widget.category.id);
  // }

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

    /// MVVM
    // return ChangeNotifierProvider(
    //     create: (context) => viewModel,
    //     child: Consumer<CategoryDetailsViewModel>(
    //       builder: (context, value, child) {
    //         if (viewModel.errMessage != null) {
    //           return Column(
    //             children: [
    //               Text(viewModel.errMessage!),
    //               ElevatedButton(
    //                   onPressed: () {
    //                     viewModel.getSourceByCategory(widget.category.id);
    //                   },
    //                   child: const Text('Try again'))
    //             ],
    //           );
    //         } else if (viewModel.sourceList == null) {
    //           return Center(
    //               child: CircularProgressIndicator(
    //             color: MyTheme.greenColor,
    //           ));
    //         } else {
    //           return TabContainer(sourceList: viewModel.sourceList!);
    //         }
    //       },
    //     ));
  }
}