import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_cours/models/article.dart';
import 'package:news_app_cours/screens/cubit/states.dart';
import 'package:http/http.dart' as http;
import '../../models/category_model.dart';
import '../../models/us_data.dart';
import '../../shared/constant/app_const.dart';
import '../drawer_screen.dart';

class HomeCubit extends Cubit<HomeStates> {
  bool search = false;
  List<Article> artical = [];
   List<Article> sources = [];
  CategoryModel? categoryData;
  int index = 0;
  void changeSearch() {
    emit(HomeInitState());
    search = !search;
    emit(SearchState());
  }

  HomeCubit() : super(HomeInitState());
 
  void onSelectCateogory(selectedCategory) {
    emit(HomeInitState());
    categoryData = selectedCategory;
    emit(HomeChangeCategoryState());
  }

  void openCategory(number) {
    if (number == DrawerScreen.catogryNumber) {
      categoryData = null;
    } else {}
    emit(OpenCategoryState());
  }

  static HomeCubit get(context) => BlocProvider.of(context);
  Future<void> getSources() async {
    emit(HomeSourcesLoadingState());
    try {
      Uri url = Uri.https(
          AppConstant.baseUrl, '/v2/top-headlines', {"country": 'us'});
      final response =
          await http.get(url, headers: {'x-api-key': AppConstant.apiKey});
      SourceData data = SourceData.fromJson(jsonDecode(response.body));
      emit(HomeGetSourcesSuccessState());
      sources = data.articles ?? [];
    } catch (e) {
      emit(HomeGetSourcesErrorState());
      rethrow;
    }
  }

 void changeTap(int value) {
    emit(HomeInitState());
    index = value;
    emit(ChangeTapState());
  }

  Future<void> getNewsData(
      ) async {
    emit(HomeNewsLoadingState());
    try {
      Uri uri = Uri.https(AppConstant.baseUrl, '/v2/everything',
          {"sources": artical[index].source!.name!, "q": categoryData!.txt});
      final response = await http.get(
        uri,
        headers: {'x-api-key': AppConstant.apiKey},
      );
      SourceData data = SourceData.fromJson(jsonDecode(response.body));
      emit(HomeGetNewsSuccessState());
      artical = data.articles ?? [];
    } catch (e) {
      emit(HomeGetNewsErrorState());
      rethrow;
    }
  }
}
