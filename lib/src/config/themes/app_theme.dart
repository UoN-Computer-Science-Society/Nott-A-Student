import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData style (){
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.black,
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Color(0xff005697),
      splashColor: Colors.transparent,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      fontFamily: 'NimbusSansL',
    );
  }
}
