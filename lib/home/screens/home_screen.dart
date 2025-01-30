import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/category/category_details.dart';
import 'package:news_app/home/category/category_fragment.dart';
import 'package:news_app/home/settings/settings.dart';
import 'package:news_app/home/settings/settings_cubit/language_cubit.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/home/screens/home_drawer.dart';
import 'package:news_app/home/search/news_search_delegate.dart';
import 'package:news_app/home/category/cubit/category_id_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryIdCubit categoryIdCubit = CategoryIdCubit();
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
        BlocProvider<CategoryIdCubit>(
          create: (context) => categoryIdCubit,
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                iconTheme: IconThemeData(color: MyTheme.whiteColor),
                title: Text(
                  selectedDrawerItem == HomeDrawer.settings
                      ? BlocProvider.of<LanguageCubit>(context)
                                  .currentLanguage ==
                              'en'
                          ? 'Settings'
                          : BlocProvider.of<LanguageCubit>(context)
                                      .currentLanguage ==
                                  'ar'
                              ? 'الاعدادات'
                              : BlocProvider.of<LanguageCubit>(context)
                                          .currentLanguage ==
                                      'de'
                                  ? 'Einstellungen'
                                  : 'Impostazioni'
                      : selectedCategory == null
                          ? BlocProvider.of<LanguageCubit>(context)
                                      .currentLanguage ==
                                  'en'
                              ? 'News App!'
                              : BlocProvider.of<LanguageCubit>(context)
                                          .currentLanguage ==
                                      'ar'
                                  ? 'الأخبار'
                                  : BlocProvider.of<LanguageCubit>(context)
                                              .currentLanguage ==
                                          'de'
                                      ? 'Nachrichten App'
                                      : 'App Di Notizie'
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
                  // ignore: prefer_const_constructors
                  ? Settings()
                  : selectedCategory == null
                      ? CategoryFragment(
                          onCategoryClick: onCategoryClick,
                        )
                      : CategoryDetails(category: selectedCategory!)),
        ),
      ],
    );
  }

  Category? selectedCategory;

  void onCategoryClick(Category newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
    categoryIdCubit.setCategoryId(newSelectedCategory.id);
  }

  int selectedDrawerItem = HomeDrawer.categories;
  void onDrawerItemClick(int newSelectedDrawerItem) {
    selectedDrawerItem = newSelectedDrawerItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
