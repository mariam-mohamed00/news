// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/my_theme.dart';

class NewsItem extends StatelessWidget {
  NewsItem({super.key, required this.news});
  News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:
                CachedNetworkImage(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              fit: BoxFit.fill,
              imageUrl: news.urltoimage ?? '',
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                color: MyTheme.greenColor,
              )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            news.author ?? '',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: MyTheme.textColor,
                fontSize: 10,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 12,
          ),

          Text(
            news.title ?? '',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: MyTheme.textColor,
                ),
          ),
          const SizedBox(
            height: 6,
          ),

          Text(
            news.publishedat ?? '',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: MyTheme.textColor,
                fontSize: 10,
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
