// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/home/category/category_details_view_model.dart';
import 'package:news_app/home/tabs/tab_container.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/my_theme.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({super.key, required this.category});
  Category category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getSourceByCategory(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<CategoryDetailsViewModel>(
          builder: (context, value, child) {
            if (viewModel.errMessage != null) {
              return Column(
                children: [
                  Text(viewModel.errMessage!),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.getSourceByCategory(widget.category.id);
                      },
                      child: const Text('Try again'))
                ],
              );
            } else if (viewModel.sourceList == null) {
              return Center(
                  child: CircularProgressIndicator(
                color: MyTheme.greenColor,
              ));
            } else {
              return TabContainer(sourceList: viewModel.sourceList!);
            }
          },
        ));
  }
}