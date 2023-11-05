import 'package:flutter/material.dart';
import 'package:news_app_cours/models/category_model.dart';
import 'package:news_app_cours/models/us_data.dart';
import 'package:news_app_cours/screens/tabs_controller.dart';
import '../screens/category_page.dart';
import '../screens/drawer_screen.dart';
import '../shared/backend/api/api_manger.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
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
          Scaffold(
            drawer: DrawerScreen(category: openCategory), 
            appBar: AppBar(
              title: Text(
                'News',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 25,
                    ),
              ),
            ),
            body: categoryData == null
                ? CategoryPage(
                    callBack: onSelectCateogory,
                  )
                : FutureBuilder<UsData>(
                    future: ApiManger.getSources(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text('an error have been ouccered'),
                        );
                      }
                      var sources = snapshot.data?.articles ?? [];
                      return TabsController(
                        sources: sources,
                        category: categoryData!.txt,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  CategoryModel? categoryData;

  void onSelectCateogory(selectedCategory) {
    categoryData = selectedCategory;
    setState(() {});
  }

  void openCategory(number) {
    if (number == DrawerScreen.catogryNumber) {
      categoryData = null;
    } else {}
    setState(() {});
  }
}