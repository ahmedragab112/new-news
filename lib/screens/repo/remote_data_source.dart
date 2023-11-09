import 'dart:convert';

import 'package:news_app_cours/screens/repo/repositry.dart';
import 'package:http/http.dart' as http;
import '../../models/us_data.dart';
import '../../shared/constant/app_const.dart';

class RemoteDataSource implements HomeRepositry {
  @override
 Future<SourceData> getNewsData(String id, String category) async {
    try {
      Uri uri = Uri.https(AppConstant.baseUrl, '/v2/everything', {
        "sources": id,
        "q": category,
      });
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

  @override
 Future<SourceData> getSouresData() async {
    try {
      Uri url = Uri.https(
          AppConstant.baseUrl, '/v2/top-headlines', {"country": 'us'});
      final response =
          await http.get(url, headers: {'x-api-key': AppConstant.apiKey});
      SourceData data = SourceData.fromJson(jsonDecode(response.body));
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
