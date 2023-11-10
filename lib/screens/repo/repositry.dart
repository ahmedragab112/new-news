import '../../models/us_data.dart';

abstract class HomeRepositry {
  Future<SourceData> getNewsData(String id, String category);
  Future<SourceData> getSouresData();
}
