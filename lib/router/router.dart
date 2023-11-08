import 'package:flutter/material.dart';
import 'package:news_app_cours/layout/home_layout.dart';

import 'routes.dart';

class AppRouter {
  static Route<Widget> generatRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeLayout:
        return MaterialPageRoute(
          builder: (_) =>   HomeLayout(),
        );
   
     
      default:
        return MaterialPageRoute(
          builder: (_) =>   HomeLayout(),
        );
    }
  }
}