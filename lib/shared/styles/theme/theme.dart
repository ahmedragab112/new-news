import 'package:flutter/material.dart';
import 'package:news_app_cours/shared/styles/fonts/text_style.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
          bodyLarge: AppTextStyle.bodyLarge,
          bodyMedium: AppTextStyle.bodyMeduim,
          bodySmall: AppTextStyle.bodySmall),
      appBarTheme: const AppBarTheme(
         backgroundColor: Colors.green,
        elevation: 0.0,
         shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              centerTitle: true,
        
      ));
  static ThemeData darkTheme = ThemeData();
}
