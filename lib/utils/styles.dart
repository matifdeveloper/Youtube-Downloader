import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static ThemeData theme = ThemeData(
    primarySwatch: Colors.red,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.white,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Colors.red,
      shadowColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.redAccent,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      labelStyle: TextStyle(
        color: Colors.black,
      ),
      focusColor: Colors.black,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.redAccent,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.0,
          color: Colors.redAccent,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.redAccent,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: Colors.grey,
        backgroundColor: Colors.red,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.red,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.red,
  );

  // Custom theme defined
  static TextStyle get subHeadingStyle => GoogleFonts.lato(
    textStyle: const TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
  );
  static TextStyle get titleStyle => GoogleFonts.lato(
    textStyle: const TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
  );
  static TextStyle get bodyStyle => GoogleFonts.lato(
    textStyle: const TextStyle(
        color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
  );



}