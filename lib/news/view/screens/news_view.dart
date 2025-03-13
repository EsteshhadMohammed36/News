import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/view/widgets/news_item.dart';
import 'package:news/news/view_model/news_states.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';
import 'package:news/sources/data/models/SourcesResponse.dart';
import 'package:news/sources/view/widgets/tab_item.dart';
import 'package:news/sources/view_model/sources_states.dart';
import 'package:news/sources/view_model/sources_view_model.dart';

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
        BlocProvider<SourcesViewModel>(
          create: (_) => sourcesViewModel,
          child: BlocBuilder<SourcesViewModel, SourcesState>(
              builder: (context, state) {
            //loading
            if (state is SourcesLoadingState)
              return LoadingIndicator();
            //error
            else if (state is SourcesErrorState)
              return ErrorIndicator(errorMsg: state.errorMsg);
            //success
            else if (state is SourcesSuccessState) {
              List<Source> sources = state.sources;
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
            } else
              return SizedBox();
          }),
        ),
        Expanded(
          child: BlocProvider<NewsViewModel>(
            create: (_) => newsViewModel,
            child: BlocBuilder<NewsViewModel, NewsState>(
                builder: (context, state) {
              if (state is NewsLoadingState)
                return LoadingIndicator();
              else if (state is NewsErrorState)
                return ErrorIndicator(errorMsg: state.errorMsg);
              else if (state is NewsSuccessState) {
                return ListView.separated(
                    padding: EdgeInsets.all(16),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: state.news.length,
                    itemBuilder: (context, index) => NewsItem(
                          news: state.news[index],
                        ));
              } else
                return SizedBox();
            }),
          ),
        )
      ],
    );
  }
}
