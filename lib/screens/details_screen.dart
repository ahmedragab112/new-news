import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/article.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.articale});
  final Article articale;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'News',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 25,
                ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CachedNetworkImage(
                height: 180,
                width: double.infinity,
                fit: BoxFit.fill,
                imageUrl: articale.urlToImage ?? '',
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
              SizedBox(
                height: 10,
              ),
              AutoSizeText(
                articale.title ?? '',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
                maxLines: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                articale.publishedAt!.substring(0, 10),
                textAlign: TextAlign.end,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                articale.content!,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.start,
              )
            ],
          ),
        ));
  }
}
