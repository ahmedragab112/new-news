import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_cours/models/article.dart';
import 'package:news_app_cours/screens/cubit/states.dart';
import '../../models/category_model.dart';
import '../../models/us_data.dart';
import '../drawer_screen.dart';
import '../repo/repositry.dart';

class HomeCubit extends Cubit<HomeStates> {
  bool search = false;
  HomeRepositry repo;
  List<Article> artical = [];
  List<Article> sources = [];
  CategoryModel? categoryData;
  int index = 0;
  void changeSearch() {
    emit(HomeInitState());
    search = !search;
    emit(SearchState());
  }

  HomeCubit(this.repo) : super(HomeInitState());

  void onSelectCateogory(selectedCategory) {
    emit(HomeInitState());
    categoryData = selectedCategory;
    emit(HomeChangeCategoryState());
  }

  void openCategory(number) {
    emit(HomeInitState());
    if (number == DrawerScreen.catogryNumber) {
      categoryData = null;
      emit(OpenCategoryState());
    } else {}
  }

  static HomeCubit get(context) => BlocProvider.of(context);
  Future<void> getSources() async {
    emit(HomeSourcesLoadingState());
    try {
      
      SourceData sourceData = await repo.getSouresData();
      sources = sourceData.articles ?? [];
      emit(HomeGetSourcesSuccessState());
    } catch (e) {
      emit(HomeGetSourcesErrorState());
    }
  }

  void changeTap(int value) {
    emit(HomeInitState());
    index = value;
    emit(ChangeTapState());
  }

  Future<void> getNewsData() async {
    emit(HomeNewsLoadingState());
    try {
      SourceData sourceData =await repo.getNewsData(sources[index].source!.id, categoryData?.txt ?? '');
      artical = sourceData.articles ?? [];
      emit(HomeGetNewsSuccessState());
    } catch (e) {
      emit(HomeGetNewsErrorState());
      rethrow;
    }
  }
}
