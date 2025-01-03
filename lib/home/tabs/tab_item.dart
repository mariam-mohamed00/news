// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/my_theme.dart';

class TabItem extends StatelessWidget {
  TabItem({super.key, required this.isSelected, required this.source});

  bool isSelected;
  Source source;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
          color: isSelected ? MyTheme.greenColor : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(width: 3, color: MyTheme.greenColor)),
      child: Text(
        source.name ?? '',
        style: isSelected?  Theme.of(context).textTheme.titleLarge :  Theme.of(context).textTheme.titleLarge!.copyWith(color: MyTheme.greenColor),
      ),
    );
  }
}
