import 'package:flutter/material.dart';
import 'package:news/api_manager/api_service.dart';
import 'package:news/home/widgets/news_item.dart';
import 'package:news/home/widgets/tab_item.dart';
import 'package:news/models/NewsResponse.dart';
import 'package:news/models/SourcesResponse.dart';
import 'package:news/utils/app_theme.dart';
import 'package:news/utils/error_indicator.dart';
import 'package:news/utils/loading_indicator.dart';

class NewsView extends StatefulWidget {
  String categoryId;

  NewsView({required this.categoryId});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int index = 0;

  late Future<SourcesResponse> getSourceFuture =
      APIService.getSources(widget.categoryId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getSourceFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return LoadingIndicator();
        else if (snapshot.hasError || snapshot.data!.status != 'ok')
          return ErrorIndicator();
        else {
          List<Source> sources = snapshot.data?.sources ?? [];
          //print(sources);
          return Column(
            children: [
              DefaultTabController(
                length: sources.length,
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
                  labelPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  isScrollable: true,
                  tabs: sources
                      .map((source) => TabItem(
                            source: source,
                          ))
                      .toList(),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                    future: APIService.getNews(sources[index].id!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting)
                        return LoadingIndicator();
                      else if (snapshot.hasError ||
                          snapshot.data!.status != 'ok') {
                        return ErrorIndicator();
                      } else {
                        List<News> newsList = snapshot.data?.articles ?? [];
                        print(newsList);
                        return Expanded(
                            child: ListView.separated(
                                padding: EdgeInsets.all(16),
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 10,
                                    ),
                                itemCount: newsList.length,
                                itemBuilder: (context, index) => NewsItem(
                                      news: newsList[index],
                                    )));
                      }
                    }),
              )
            ],
          );
        }
      },
    );
  }
}
