import 'package:flutter/material.dart';

abstract class AppTheme {
  static final light = ThemeData(
    scaffoldBackgroundColor: Color.fromRGBO(248, 248, 248, 1),
    bottomNavigationBarTheme: BottomNavigationBarThemeData( 
    //selectedItemColor: Colors.green,
    unselectedItemColor: const Color.fromRGBO(255, 255, 255, 1),
  ));
}
