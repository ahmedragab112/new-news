import 'package:flutter/material.dart';
import 'package:news_app_cours/models/article.dart';
import 'package:news_app_cours/shared/widget/source_news.dart';

class TabsController extends StatefulWidget {
  const TabsController({super.key, required this.sources});
  final List<Article> sources;

  @override
  State<TabsController> createState() => _TabsControllerState();
}

class _TabsControllerState extends State<TabsController> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: TabBar(
        padding: EdgeInsets.only(top: 20),
        indicatorColor: Colors.black,
        isScrollable: true,
        onTap: (value) {
          index = value;
          setState(() {});
        },
        tabs: widget.sources
            .map((e) => SourceNews(
                  sourceName: e.source!.name!,
                  selected: widget.sources.indexOf(e) == index ? true : false,
                ))
            .toList(),
      ),
    );
  }
}
