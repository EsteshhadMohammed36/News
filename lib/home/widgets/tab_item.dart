import 'package:flutter/material.dart';
import 'package:news/models/SourcesResponse.dart';

class TabItem extends StatelessWidget {
  Source source;

  TabItem({required this.source});

  @override
  Widget build(BuildContext context) {
    return Text(
      source.name ?? '',
    );
  }
}
