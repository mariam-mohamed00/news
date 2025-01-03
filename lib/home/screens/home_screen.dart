import 'package:flutter/material.dart';
import 'package:news_app/home/category/category_details.dart';
import 'package:news_app/home/category/category_fragment.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/home/screens/home_drawer.dart';
import 'package:news_app/home/screens/settings.dart';
import 'package:news_app/home/search/news_search_delegate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            'assets/images/pattern.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              iconTheme: IconThemeData(color: MyTheme.whiteColor),
              title: Text(
                selectedDrawerItem == HomeDrawer.settings
                    ? 'Settings'
                    : selectedCategory == null
                        ? 'News App'
                        : selectedCategory!.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.search,
                    size: 30,
                    color: MyTheme.whiteColor,
                  ),
                  onPressed: () {
                    showSearch(
                      context: context, delegate: NewsSearchDelegate());
                  },
                ),
              ],
            ),
            drawer: Drawer(
              child: HomeDrawer(
                onDrawerItemClick: onDrawerItemClick,
              ),
            ),
            body: selectedDrawerItem == HomeDrawer.settings
                ? const Settings()
                : selectedCategory == null
                    ? CategoryFragment(
                        onCategoryClick: onCategoryClick,
                      )
                    : CategoryDetails(category: selectedCategory!)),
      ],
    );
  }

  Category? selectedCategory;

  void onCategoryClick(Category newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  int selectedDrawerItem = HomeDrawer.categories;
  void onDrawerItemClick(int newSelectedDrawerItem) {
    selectedDrawerItem = newSelectedDrawerItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
