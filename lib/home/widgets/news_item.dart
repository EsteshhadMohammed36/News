import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    final dateTimeAgo = DateTime.now().subtract(Duration(minutes: 15));

    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 1, color: AppTheme.darkColor)),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Image.asset("assets/images/new.png",
              fit: BoxFit.cover, width: double.infinity),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
                style: textTheme.bodyLarge,
                "40-year-old man falls 200 feet to his death while canyoneering at national park"),
          ),
          Row(
            children: [
              Text(
                "By : Jon Haworth",
                style: textTheme.bodySmall,
              ),
              Spacer(),
              Text(
                timeago.format(dateTimeAgo),
                style: textTheme.bodySmall,
              ),
            ],
          )
        ]));
  }
}
