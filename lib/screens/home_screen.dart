import 'package:flutter/material.dart';
import 'package:news_app/category/category_fragment.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              automaticallyImplyLeading: false,
              title: Text(
                'News App',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            body: CategoryFragment())
      ],
    );
  }
}
