import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const backgroundColor = Color(0xff222222);
const brightness = Brightness.dark;
const primaryColor = Color(0xffEF6B00);

const colorScheme = brightness;

ThemeData darkTheme() {
  return ThemeData(
    iconTheme: IconThemeData(
      size: 32,
      color: Colors.white70,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      centerTitle: true,
      elevation: 2.5,
      titleTextStyle: TextStyle(
        locale: Locale('pt_BR'),
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: primaryColor,
    accentColor: Colors.orangeAccent,
    backgroundColor: backgroundColor,
    indicatorColor: primaryColor,
    buttonColor: Colors.green,
    colorScheme: ColorScheme.dark(
      background: backgroundColor,
      //error:
    ),
    textTheme: TextTheme(
      bodyText1: GoogleFonts.oswald(
        fontSize: 24,
      ).apply(
        color: Colors.white,
      ),
      bodyText2: GoogleFonts.oswald(
        fontSize: 24,
      ),
    ).apply(
      bodyColor: Colors.white70,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.center,
        elevation: MaterialStateProperty.resolveWith((states) => 2.5),
        shadowColor:
            MaterialStateProperty.resolveWith((states) => Colors.white),
        backgroundColor:
            MaterialStateProperty.resolveWith((states) => primaryColor),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.green,
      textTheme: ButtonTextTheme.primary,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: backgroundColor,
      contentTextStyle: GoogleFonts.montserrat(
        background: Paint(),
        fontSize: 18,
        color: Colors.white,
      ),
      elevation: 4,
      titleTextStyle: GoogleFonts.montserrat(
        fontSize: 30,
      ),
    ),
  );
}
