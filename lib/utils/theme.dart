
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'material_color.dart';

class AppThemes {
  static ThemeData defaultTheme = ThemeData(
    cupertinoOverrideTheme: const CupertinoThemeData(
      brightness: Brightness.light,
    ),
    primaryColor: AppColors.primaryColor,
    cardTheme: const CardTheme(
      margin: EdgeInsets.symmetric(vertical: 1.0),
      elevation: 0,
    ),
    buttonTheme: const ButtonThemeData(
      height: 50.0,
    ),
    textTheme: const TextTheme(
      subtitle1: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400
      ),
      headline6: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w700,
        color: AppColors.darkBlackColor,
        letterSpacing: -0.67,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.darkBlackColor,
      ),
      bodyText2: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor,
          letterSpacing: 0.3
      ),
      subtitle2: TextStyle(fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryColor,
          letterSpacing: 0.3
      ),
      headline4: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w700,
        color: AppColors.darkBlackColor,
        letterSpacing: -0.67,
      ),
      headline3: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.w700,
        color: AppColors.darkBlackColor,
      ),
    ),
    fontFamily: "GiraSans",
    primarySwatch: createMaterialColor(AppColors.primaryColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: AppColors.primaryColor,
          onSurface: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        )
    ),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.red,
      elevation: 0.0,
      toolbarTextStyle: TextStyle(
        fontSize: 16.0,
        color: AppColors.blackColor,
        fontWeight: FontWeight.w600,
      ) ,
      titleTextStyle: TextStyle(
        fontSize: 16.0,
        color: AppColors.blackColor,
        fontWeight: FontWeight.w600,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      errorStyle: TextStyle(color: AppColors.redColor),
      isCollapsed: true,
      fillColor: AppColors.whiteColor,
      // filled: true,
      isDense: false,
      hintStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      contentPadding: EdgeInsets.symmetric(vertical: 22, horizontal: 15),
    ),
  );
  static const OutlineInputBorder errorBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.redColor, width: 1),
    borderRadius: BorderRadius.all(Radius.circular(16)
    ),
  );
}