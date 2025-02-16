import 'package:flutter/material.dart';
import 'package:news/models/NewsResponse.dart';
import 'package:news/utils/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  NewsItem({required this.news});

  News news;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 1, color: AppTheme.darkColor)),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Image.network(news.urlToImage ?? '',
              fit: BoxFit.cover, width: double.infinity),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(style: textTheme.bodyLarge, news.title),
          ),
          Row(
            children: [
              Text(
                "By : ${news.author}",
                style: textTheme.bodySmall,
              ),
              Spacer(),
              Text(
                timeago.format(news.publishedAt),
                style: textTheme.bodySmall,
              ),
            ],
          )
        ]));
  }
}
