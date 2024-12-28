import 'package:flutter/material.dart';
import 'package:news_app/category/category_item.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/my_theme.dart';

class CategoryFragment extends StatelessWidget {
  CategoryFragment({super.key});

  var categoriesList = Category.getCategories();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Pick your category \nof interest',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: MyTheme.textColor),
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: categoriesList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              return CategoryItem(
                category: categoriesList[index],
                index: index,
              );
            },
          ),
        ),
      ],
    );
  }
}
