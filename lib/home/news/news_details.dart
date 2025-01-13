import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/my_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)!.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: MyTheme.whiteColor),
        title: Text(
          '${news.title!.substring(0, 10)}...',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Stack(
        children: [
          Image.asset('assets/images/pattern.png', fit: BoxFit.cover),
          Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
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
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: MyTheme.textColor,
                  ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(news.content ?? '',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: MyTheme.textColor,
                    )),
            const SizedBox(
              height: 12,
            ),
            Text(
              news.publishedat ?? '',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: MyTheme.textColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.end,
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                _launchNewsUrl(news.url ?? '');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('View all article',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: MyTheme.blackColor,
                          )),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: MyTheme.blackColor,
                    size: 18,
                  )
                ],
              ),
            )
          ],
        ),
      ),
        ],
      )
    );
  }

  Future<void> _launchNewsUrl(String url) async {
    var uri = Uri.parse(url);
    await launchUrl(uri);
  }
}
