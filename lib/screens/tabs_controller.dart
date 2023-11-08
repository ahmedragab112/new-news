import 'package:flutter/material.dart';
import 'package:news_app_cours/screens/cubit/cubit.dart';
import 'package:news_app_cours/screens/details_screen.dart';
import 'package:news_app_cours/shared/widget/source_news.dart';
import '../shared/widget/news_item.dart';

class TabsController extends StatelessWidget {
  const TabsController({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28, bottom: 8, right: 8, left: 8),
      child: Column(
        children: [
          DefaultTabController(
            length: HomeCubit.get(context).sources.length,
            child: TabBar(
              indicatorColor: Colors.black,
              isScrollable: true,
              onTap: (value) {
                HomeCubit.get(context).changeTap(value);
              },
              tabs: HomeCubit.get(context)
                  .sources
                  .map(
                    (e) => SourceNews(
                      sourceName: e.source!.name!,
                      selected: HomeCubit.get(context).index ==
                              HomeCubit.get(context).sources.indexOf(e)
                          ? true
                          : false,
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            articale: HomeCubit.get(context).artical[index],
                          ),
                        ));
                  },
                  child:
                      NewsItem(article: HomeCubit.get(context).artical[index]),
                );
              },
              itemCount: HomeCubit.get(context).artical.length,
            ),
          )
        ],
      ),
    );
  }
}
