import 'package:flutter/material.dart';
import 'package:news_app_cours/models/us_data.dart';
import 'package:news_app_cours/screens/tabs_controller.dart';
import 'package:news_app_cours/shared/backend/api/api_manger.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

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
            appBar: AppBar(
              backgroundColor: Colors.green,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              centerTitle: true,
              title: Text(
                'News',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 25,
                    ),
              ),
            ),
            body: FutureBuilder<UsData>(
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
                return TabsController(sources: sources, category:'food' ,);
              },
            ),
          ),
        ],
      ),
    );
  }
}
