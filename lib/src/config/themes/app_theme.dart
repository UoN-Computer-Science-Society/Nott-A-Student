import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData style() {
    return ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xff005697),
        splashColor: Colors.transparent,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
        fontFamily: 'Nimbus Sans L',
        textTheme: const TextTheme(
            headlineLarge: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            headlineMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            titleMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xff000000),
            ),
            titleSmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xff005697),
            ),
            bodyMedium: TextStyle(
                fontFamily: 'Work Sans',
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: Color(0xff324553))));
  }
}
