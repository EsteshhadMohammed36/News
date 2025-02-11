import 'package:flutter/material.dart';

class AppTheme {
  static const Color lightColor = Color(0xffffffff);
  static const Color darkColor = Color(0xff171717);
  static const Color greyColor = Color(0xffA0A0A0);
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: lightColor,
      appBarTheme: AppBarTheme(
        backgroundColor: lightColor,
        foregroundColor: darkColor,
        centerTitle: true,
        //titleTextStyle:
      ),
      textTheme: TextTheme(
          titleLarge: TextStyle(
              color: darkColor, fontSize: 24, fontWeight: FontWeight.w500),
          titleMedium: TextStyle(
              color: darkColor, fontSize: 20, fontWeight: FontWeight.w500),
          titleSmall: TextStyle(
              color: lightColor, fontSize: 20, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(
              color: darkColor, fontSize: 16, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
              color: darkColor, fontSize: 14, fontWeight: FontWeight.bold),
          bodySmall: TextStyle(
              color: greyColor, fontSize: 12, fontWeight: FontWeight.w500)));

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: darkColor,
      appBarTheme: AppBarTheme(
        backgroundColor: darkColor,
        foregroundColor: lightColor,
        centerTitle: true,
        //titleTextStyle:
      ),
      textTheme: TextTheme(
          titleLarge: TextStyle(
              color: lightColor, fontSize: 24, fontWeight: FontWeight.w500),
          titleMedium: TextStyle(
              color: lightColor, fontSize: 20, fontWeight: FontWeight.w500),
          bodyLarge: TextStyle(
              color: lightColor, fontSize: 16, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
              color: lightColor, fontSize: 14, fontWeight: FontWeight.bold),
          bodySmall: TextStyle(
              color: greyColor, fontSize: 12, fontWeight: FontWeight.w500)));
}
