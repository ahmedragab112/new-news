import 'package:flutter/material.dart';
import 'package:news_app_cours/models/article.dart';
import 'package:news_app_cours/screens/details_screen.dart';
import 'package:news_app_cours/shared/backend/api/api_manger.dart';
import 'package:news_app_cours/shared/widget/source_news.dart';

import '../shared/widget/news_item.dart';

class TabsController extends StatefulWidget {
  const TabsController(
      {super.key, required this.sources, required this.category});
  final List<Article> sources;

  final String category;
  @override
  State<TabsController> createState() => _TabsControllerState();
}

class _TabsControllerState extends State<TabsController> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28, bottom: 8, right: 8, left: 8),
      child: Column(
        children: [
          DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              indicatorColor: Colors.black,
              isScrollable: true,
              onTap: (value) {
                index = value;
                setState(() {});
              },
              tabs: widget.sources
                  .map(
                    (e) => SourceNews(
                      sourceName: e.source!.name!,
                      selected:
                          widget.sources.indexOf(e) == index ? true : false,
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder(
            future: ApiManger.getNewsData(
                source: widget.sources[index].source?.id ?? '',
                category: widget.category),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text('an error have been ouccered'),
                );
              }
              var articals = snapshot.data?.articles ?? [];
              return Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DetailsScreen(articale: articals[index], ),)  );
                      },
                      child: NewsItem(
                        article: articals[index]
                      ),
                    );
                  },
                  itemCount: articals.length,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
