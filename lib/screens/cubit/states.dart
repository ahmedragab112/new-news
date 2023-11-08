abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class HomeSourcesLoadingState extends HomeStates {}

class HomeNewsLoadingState extends HomeStates {}

class HomeChangeCategoryState extends HomeStates {}

class HomeGetSourcesSuccessState extends HomeStates {}

class OpenCategoryState extends HomeStates {}

class HomeGetSourcesErrorState extends HomeStates {}

class HomeGetNewsSuccessState extends HomeStates {}

class HomeGetNewsErrorState extends HomeStates {}

class SearchState extends HomeStates {}

class ChangeTapState extends HomeStates {}
