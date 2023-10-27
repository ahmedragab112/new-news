import 'article.dart';

class UsData {
  String? status;
  int? totalResults;
  List<Article>? articles;
  String? message;
  String? code; 
  UsData({this.status, this.totalResults, this.articles, this.code, this.message});

  factory UsData.fromJson(Map<String, dynamic> json) => UsData(
        status: json['status'] as String?,
        code: json['code '],
        message: json['message'],
        totalResults: json['totalResults'] as int?,
        articles: (json['articles'] as List<dynamic>?)
            ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
