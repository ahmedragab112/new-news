import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_cours/models/article.dart';

class DetailsItem extends StatelessWidget {
  const DetailsItem({super.key, required this.articale});
  final Article articale; 
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            height: 180,
            width: double.infinity,
            fit: BoxFit.fill,
            imageUrl: articale.urlToImage?? '',
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
          Text(
           articale.source!.name!,
            style: const TextStyle(fontSize: 15),
            textAlign: TextAlign.start,
          ),
          AutoSizeText(
            articale.title??'',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.black),
            maxLines: 2,
          ),
            Text(articale.publishedAt!.substring(0, 10), textAlign: TextAlign.end),
          const SizedBox(
            height: 20,
          ),
        articale.content==null?  Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              border: Border.all(color: Colors.green, width: 2),
            ),
            child: Text(
              articale.content??'',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black),
              maxLines: 20,
            ),
          ): 
          const SizedBox()
        ],
      ),
    );
  }
}
