import 'package:flutter/material.dart';
import 'package:news_app/category/category_item.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/my_theme.dart';

// ignore: must_be_immutable
class CategoryFragment extends StatefulWidget {
  CategoryFragment({super.key, required this.onCategoryClick});

  Function onCategoryClick;

  @override
  State<CategoryFragment> createState() => _CategoryFragmentState();
}

class _CategoryFragmentState extends State<CategoryFragment> {
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
              return InkWell(
                onTap: () {
                  widget.onCategoryClick(categoriesList[index]);
                  setState(() {});
                },
                child: CategoryItem(
                  category: categoriesList[index],
                  index: index,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
