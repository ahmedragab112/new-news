import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_cours/models/us_data.dart';
import 'package:news_app_cours/shared/constant/app_const.dart';

class ApiManger {
  
  static Future<SourceData> getNewsData(
      {required String source, required String category}) async {
    try {
      //GET https://newsapi.org/v2/everything?q=bitcoin&apiKey=ab0488b02f3647f4b084fef1dabb8c8a

      Uri uri = Uri.https(AppConstant.baseUrl, '/v2/everything',
          {"sources": source, "q": category});
      final response = await http.get(
        uri,
        headers: {'x-api-key': AppConstant.apiKey},
      );
      SourceData data = SourceData.fromJson(jsonDecode(response.body));
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
