import 'package:flutter/material.dart';
import 'package:news/news/view/widgets/news_item.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';
import 'package:news/sources/data/models/SourcesResponse.dart';
import 'package:news/sources/view/widgets/tab_item.dart';
import 'package:news/sources/view_model/sources_view_model.dart';
import 'package:provider/provider.dart';

import '../../view_model/news_view_model.dart';

class NewsView extends StatefulWidget {
  String categoryId;

  NewsView({required this.categoryId});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int index = 0;
  NewsViewModel newsViewModel = NewsViewModel();
  SourcesViewModel sourcesViewModel = SourcesViewModel();

  @override
  void initState() {
    super.initState();
    sourcesViewModel.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChangeNotifierProvider(
          create: (_) => sourcesViewModel,
          child: Consumer<SourcesViewModel>(builder: (_, viewModel, __) {
            //loading
            if (viewModel.isLoading)
              return LoadingIndicator();
            //error
            else if (sourcesViewModel.errorMsg != null)
              return ErrorIndicator(errorMsg: viewModel.errorMsg!);
            //success
            else {
              List<Source> sources = viewModel.sources;
              newsViewModel.getNews(sources[index].id!);
              return DefaultTabController(
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
              );
            }
          }),
        ),
        Expanded(
          child: ChangeNotifierProvider(
            create: (_) => newsViewModel,
            child: Consumer<NewsViewModel>(builder: (_, viewModel, __) {
              if (viewModel.isLoading)
                return LoadingIndicator();
              else if (viewModel.errorMsg != null)
                return ErrorIndicator(errorMsg: viewModel.errorMsg!);
              else {
                return ListView.separated(
                    padding: EdgeInsets.all(16),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: viewModel.news.length,
                    itemBuilder: (context, index) => NewsItem(
                          news: viewModel.news[index],
                        ));
              }
            }),
          ),
        )
      ],
    );
  }
}
