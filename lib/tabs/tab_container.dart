// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/tabs/tab_item.dart';

class TabContainer extends StatefulWidget {
  TabContainer({super.key, required this.sourceList});

  List<Source> sourceList;

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourceList.length,
        child: TabBar(
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            dividerColor: Colors.transparent,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            tabs: widget.sourceList
                .map((source) => TabItem(
                      isSelected:
                          selectedIndex == widget.sourceList.indexOf(source),
                      source: source,
                    ))
                .toList()));
  }
}
