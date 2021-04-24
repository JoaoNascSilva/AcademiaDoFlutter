import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const backgroundColor = Color(0xffF2F2F2);
const brightness = Brightness.light;
const primaryColor = Color(0xfff2784b);
const accentColor = Color(0xffD67C3A);
const colorScheme = brightness;

ThemeData lightTheme() {
  return ThemeData(
    iconTheme: IconThemeData(
      size: 32,
      color: accentColor,
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
    colorScheme: ColorScheme.light(
      background: backgroundColor,
      //error:
    ),
    dividerColor: accentColor,
    dividerTheme: DividerThemeData(thickness: 2),
    textTheme: TextTheme(
      bodyText1: GoogleFonts.oswald(
        fontWeight: FontWeight.bold,
        textStyle: TextStyle(
          color: Colors.green[900],
        ),
        color: Colors.green[900],
        fontSize: 24,
      ).apply(
        color: primaryColor,
      ),
      bodyText2: GoogleFonts.oswald(
        fontSize: 18,
      ),
    ).apply(
      bodyColor: Colors.black54,
    ),
    buttonColor: Colors.green,
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
  );
}
