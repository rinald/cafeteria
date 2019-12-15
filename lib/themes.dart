import 'package:flutter/material.dart';

import './colors.dart';

final baseLightTheme = ThemeData.light();
final baseDarkTheme = ThemeData.dark();

final lightTheme = ThemeData(
  platform: TargetPlatform.iOS,
  fontFamily: 'JosefinSans',
  brightness: Brightness.light,
  primaryColor: lightPrimary,
  primaryColorLight: lightPrimaryLight,
  primaryColorDark: lightPrimaryDark,
  accentColor: lightSecondary,
  accentColorBrightness: Brightness.light,
  buttonTheme: baseLightTheme.buttonTheme.copyWith(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
    colorScheme: baseLightTheme.buttonTheme.colorScheme.copyWith(
      primary: lightSecondary,
      secondary: lightPrimary,
    ),
    textTheme: ButtonTextTheme.accent,
    buttonColor: lightSecondary,
  ),
  cursorColor: lightSecondary,
  scaffoldBackgroundColor: lightPrimaryDark,
  primaryIconTheme: IconThemeData(
    color: lightSecondary,
  ),
  textSelectionColor: lightPrimary.withOpacity(0.5),
  textSelectionHandleColor: lightPrimary,
  hintColor: lightSecondary,
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: lightSecondary),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: lightSecondary,
        width: 2,
      ),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: lightSecondaryLight,
        width: 2,
      ),
    ),
  ),
);

final darkTheme = ThemeData(
  platform: TargetPlatform.iOS,
  fontFamily: 'JosefinSans',
  brightness: Brightness.dark,
  primaryColor: darkPrimary,
  primaryColorLight: darkPrimaryLight,
  primaryColorDark: darkPrimaryDark,
  accentColor: darkSecondary,
  accentColorBrightness: Brightness.dark,
  buttonTheme: baseDarkTheme.buttonTheme.copyWith(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
    colorScheme: baseDarkTheme.buttonTheme.colorScheme.copyWith(
      primary: darkSecondary,
      secondary: darkPrimary,
    ),
    textTheme: ButtonTextTheme.accent,
    buttonColor: darkSecondary,
  ),
  cursorColor: darkSecondary,
  scaffoldBackgroundColor: darkPrimary,
  primaryIconTheme: IconThemeData(
    color: darkSecondary,
  ),
  textSelectionColor: darkPrimary.withOpacity(0.5),
  textSelectionHandleColor: darkPrimary,
  hintColor: darkSecondary,
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: darkSecondary),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: darkSecondary,
        width: 2,
      ),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: darkSecondaryLight,
        width: 2,
      ),
    ),
  ),
);
