import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_cours/screens/cubit/cubit.dart';
import 'package:news_app_cours/screens/cubit/states.dart';
import 'package:news_app_cours/screens/repo/remote_data_source.dart';
import 'package:news_app_cours/screens/tabs_controller.dart';
import '../screens/category_page.dart';
import '../screens/drawer_screen.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            'assets/images/pattern.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          BlocProvider(
            create: (context) => HomeCubit(RemoteDataSource())..getSources(),
            child: BlocConsumer<HomeCubit, HomeStates>(
              listener: (context, state) {
                if (state is HomeSourcesLoadingState ||
                    state is HomeNewsLoadingState) {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => const AlertDialog(
                      title: Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  );
                } else if (state is HomeGetSourcesSuccessState) {
                  HomeCubit.get(context).getNewsData();
                } else if (state is HomeGetSourcesErrorState) {
                } else if (state is HomeGetNewsSuccessState) {
                  Navigator.pop(context);
                } else if (state is HomeGetNewsErrorState) {
                } else if (state is ChangeTapState) {
                  HomeCubit.get(context).getNewsData();
                } else if (state is HomeChangeCategoryState) {}
              },
              builder: (context, state) {
                return Scaffold(
                  drawer: DrawerScreen(
                      category: HomeCubit.get(context).openCategory),
                  appBar: HomeCubit.get(context).search == false
                      ? AppBar(
                          actions: [
                            IconButton(
                                onPressed: () {
                                  HomeCubit.get(context).changeSearch();
                                },
                                icon: const Icon(Icons.search))
                          ],
                          title: Text(
                            'News',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 25,
                                ),
                          ),
                        )
                      : AppBar(
                          toolbarHeight: 70,
                          centerTitle: true,
                          title: TextField(
                            onChanged: (value) {
                          
                            },
                            controller: controller,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              focusColor: Colors.green,
                              filled: true,
                              hintText: 'Search',
                              prefixIcon: const Icon(
                                Icons.close,
                                color: Colors.green,
                              ),
                              suffixIcon: const Icon(
                                Icons.search,
                                color: Colors.green,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide:
                                      const BorderSide(color: Colors.green)),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.green),
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                          ),
                        ),
                  body: HomeCubit.get(context).categoryData == null
                      ? CategoryPage(
                          callBack: HomeCubit.get(context).onSelectCateogory,
                        )
                      : const TabsController(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
