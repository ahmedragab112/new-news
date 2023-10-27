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
        elevation: 0.0,
      ));
  static ThemeData darkTheme = ThemeData();
}
