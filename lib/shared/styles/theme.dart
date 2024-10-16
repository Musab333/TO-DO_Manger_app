import 'package:flutter/material.dart';

import 'color_app.dart';

ThemeData themeData = ThemeData(
  primarySwatch: Colors.blueGrey,
  fontFamily: 'Cairo',
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    centerTitle: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25.0),
        bottomRight: Radius.circular(25.0),
      ),
    ),
  ),
  scaffoldBackgroundColor: Colors.grey[200],
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    elevation: 0.0,
    backgroundColor: primaryColor,

    //iconSize: 25,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 30.0,
    backgroundColor: primaryColor,
    selectedItemColor: secondColor,
    unselectedItemColor: thirdColor,
    type: BottomNavigationBarType.fixed,
  ),
  textTheme: const TextTheme(
    labelMedium: TextStyle(
      color: thirdColor,
      fontFamily: 'Cairo',
    ),
  ),
);
