import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  fontFamily: 'SulphurPoint',
  brightness: Brightness.light,
  primarySwatch: Colors.deepOrange,
  appBarTheme: _appBarTheme,
);

final darkTheme = ThemeData(
  fontFamily: 'SulphurPoint',
  brightness: Brightness.dark,
  primarySwatch: Colors.grey,
  appBarTheme: _appBarTheme,
);

final _appBarTheme = AppBarTheme(
  textTheme: TextTheme(
    title: TextStyle(
      fontFamily: 'SulphurPoint',
      fontWeight: FontWeight.bold,
      fontSize: 26,
    ),
  ),
);
