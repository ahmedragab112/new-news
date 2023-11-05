import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_cours/models/article.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CachedNetworkImage(
          height: 180,
          width: double.infinity,
          fit: BoxFit.fill,
          imageUrl: article.urlToImage ??
              'https://agentestudio.com/uploads/post/image/69/main_how_to_design_404_page.png',
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(article.source!.name!, textAlign: TextAlign.start),
        const SizedBox(
          height: 20,
        ),
        Text(
          article.description!,
          textAlign: TextAlign.start,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(article.publishedAt!.substring(0, 10), textAlign: TextAlign.end),
      ],
    );
  }
}
