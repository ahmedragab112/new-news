import 'article.dart';

class SourceData {
  String? status;
  int? totalResults;
  List<Article>? articles;
  String? message;
  String? code;
  SourceData(
      {this.status, this.totalResults, this.articles, this.code, this.message});

  factory SourceData.fromJson(Map<String, dynamic> json) => SourceData(
        status: json['status'] as String?,
        code: json['code '],
        message: json['message'],
        totalResults: json['totalResults'] as int?,
        articles: (json['articles'] as List<dynamic>?)
            ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
