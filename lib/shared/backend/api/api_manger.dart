import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_cours/models/us_data.dart';

class ApiManger {
  static const String baseUrl = 'newsapi.org';
  static Future<UsData> getSources() async {
    //GET https://newsapi.org/v2/top-headlines?country=us&apiKey=ab0488b02f3647f4b084fef1dabb8c8a

    Uri url = Uri.https(baseUrl, '/v2/top-headlines', {"country":'us'});
    final response = await http
        .get(url, headers: {'x-api-key': 'ab0488b02f3647f4b084fef1dabb8c8a'});
    UsData data = UsData.fromJson(jsonDecode(response.body));
    return data;
  }
}
