import 'package:flutter/material.dart';
import 'package:news_app/my_theme.dart';

class Category {
  String id;
  String image;
  String title;
  Color color;

  Category({required this.id, required this.image, required this.title, required this.color});

  static List<Category> getCategories() {
    return [
      Category(id: 'sports', image: 'assets/images/ball.png', title: 'Sports', color: MyTheme.redColor),
      Category(id: 'general', image: 'assets/images/Politics.png', title: 'General', color: MyTheme.blueColor),
      Category(id: 'health', image: 'assets/images/health.png', title: 'Health', color: MyTheme.pinkColor),
      Category(id: 'business', image: 'assets/images/bussines.png', title: 'Business', color: MyTheme.brownColor),
      Category(id: 'entertainment', image: 'assets/images/environment.png', title: 'Entertainment', color: MyTheme.cyanColor),
      Category(id: 'science', image: 'assets/images/science.png', title: 'Science', color: MyTheme.yellowColor),
      Category(id: 'technology', image: 'assets/images/logo.png', title: 'Technology', color: MyTheme.blackDark),
    ];
  }

}
