import 'package:flutter/material.dart';

import './colors.dart';

final baseLightTheme = ThemeData.light();
final baseDarkTheme = ThemeData.dark();

final lightTheme = ThemeData(
  fontFamily: 'JosefinSans',
  brightness: Brightness.light,
  primaryColor: lightPrimary,
  primaryColorDark: lightPrimaryDark,
  accentColor: lightAccent,
  buttonTheme: baseLightTheme.buttonTheme.copyWith(
    colorScheme: baseLightTheme.buttonTheme.colorScheme.copyWith(
      primary: lightAccent,
    ),
    textTheme: ButtonTextTheme.primary,
    buttonColor: lightPrimaryDark,
  ),
  scaffoldBackgroundColor: lightPrimary,
  primaryIconTheme: IconThemeData(
    color: lightAccent,
  ),
);

final darkTheme = ThemeData(
  fontFamily: 'JosefinSans',
  brightness: Brightness.dark,
  primaryColor: darkPrimary,
  primaryColorDark: darkPrimaryDark,
  accentColor: darkAccent,
  buttonTheme: baseLightTheme.buttonTheme.copyWith(
    colorScheme: baseLightTheme.buttonTheme.colorScheme.copyWith(
      primary: darkAccent,
    ),
    textTheme: ButtonTextTheme.primary,
    buttonColor: darkPrimaryDark,
  ),
  scaffoldBackgroundColor: darkPrimaryLight,
  primaryIconTheme: IconThemeData(
    color: darkAccent,
  ),
);
