import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/home/widgets/news_item.dart';
import 'package:news/home/widgets/tab_item.dart';
import 'package:news/models/source.dart';

class NewsView extends StatefulWidget {
  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: Source.sources.length,
          child: TabBar(
            labelStyle: Theme.of(context).textTheme.bodyLarge,
            unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
            indicatorColor: AppTheme.darkColor,
            onTap: (currentIndex) {
              index = currentIndex;
              setState(() {});
            },
            padding: EdgeInsets.zero,
            tabAlignment: TabAlignment.start,
            labelPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            isScrollable: true,
            tabs: Source.sources
                .map((source) => TabItem(
                      source: source,
                    ))
                .toList(),
          ),
        ),
        Expanded(
            child: ListView.separated(
                padding: EdgeInsets.all(16),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemCount: 10,
                itemBuilder: (context, index) => NewsItem()))
      ],
    );
  }
}
