import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revenda_gas/app/shared/app_colors.dart';

const brightness = Brightness.dark;

class AppTheme {
  AppTheme();

  ThemeData get darkTheme => ThemeData(
        iconTheme: IconThemeData(
          size: 32,
          color: Colors.white70,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          elevation: 2.5,
          titleTextStyle: TextStyle(
            locale: Locale('pt_BR'),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: AppColors.primaryColor,
        accentColor: Colors.orangeAccent,
        backgroundColor: AppColors.backgroundColor,
        indicatorColor: AppColors.primaryColor,
        buttonColor: Colors.green,
        colorScheme: ColorScheme.dark(
          background: AppColors.backgroundColor,
          //error:
        ),
        textTheme: TextTheme(
          bodyText1: GoogleFonts.oswald(
            color: AppColors.white,
            fontSize: 24,
          ),
          bodyText2: GoogleFonts.oswald(
            color: AppColors.white,
            fontSize: 24,
          ),
          caption: GoogleFonts.oswald(
            color: AppColors.white,
            fontSize: 24,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: GoogleFonts.oswald(
            color: AppColors.white,
          ),
          suffixStyle: GoogleFonts.oswald(
            color: AppColors.yellow,
          ),
          errorStyle: GoogleFonts.oswald(
            fontSize: 14,
            //color: AppColors.red,
          ),
          prefixStyle: TextStyle(
            color: AppColors.red,
            decoration: TextDecoration.overline,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.green,
          textTheme: ButtonTextTheme.primary,
        ),
        dialogTheme: DialogTheme(
          backgroundColor: AppColors.backgroundColor,
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

  ThemeData get lightTheme => ThemeData(
        iconTheme: IconThemeData(
          size: 32,
          color: AppColors.accentColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          elevation: 2.5,
          titleTextStyle: TextStyle(
            locale: Locale('pt_BR'),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: AppColors.primaryColor,
        accentColor: Colors.orangeAccent,
        backgroundColor: AppColors.backgroundColor,
        indicatorColor: AppColors.primaryColor,
        colorScheme: ColorScheme.light(
          background: AppColors.backgroundColor,
          //error:
        ),
        dividerColor: AppColors.accentColor,
        dividerTheme: DividerThemeData(thickness: 2),
        textTheme: TextTheme(
          bodyText1: GoogleFonts.oswald(
            color: AppColors.colorText,
            fontSize: 24,
          ),
          bodyText2: GoogleFonts.oswald(
            color: AppColors.colorText,
            fontSize: 24,
          ),
          caption: GoogleFonts.oswald(
            color: AppColors.colorText,
            fontSize: 24,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: GoogleFonts.oswald(
              color: AppColors.colorText,
            ),
            suffixStyle: GoogleFonts.oswald(
              color: AppColors.yellow,
            ),
            errorStyle: GoogleFonts.oswald(
              fontSize: 14,
              //color: AppColors.red,
            ),
            prefixStyle: TextStyle(
              color: AppColors.red,
              decoration: TextDecoration.overline,
            ),
            hintStyle: TextStyle(color: AppColors.colorText)),
        buttonColor: Colors.green,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            alignment: Alignment.center,
            elevation: MaterialStateProperty.resolveWith((states) => 2.5),
            shadowColor: MaterialStateProperty.resolveWith(
              (states) => AppColors.white,
            ),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => AppColors.primaryColor,
            ),
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.green,
          textTheme: ButtonTextTheme.primary,
        ),
      );

  ThemeData get defaulTheme => ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
