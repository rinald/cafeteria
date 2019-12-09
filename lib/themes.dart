import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  fontFamily: 'JosefinSans',
  brightness: Brightness.light,
  primaryColor: Colors.white,
  primaryColorDark: Colors.white,
  accentColor: Colors.black,
  // appBarTheme: _appBarTheme,
);

final darkTheme = ThemeData(
  fontFamily: 'JosefinSans',
  brightness: Brightness.dark,
  primarySwatch: Colors.grey,
  accentColor: Colors.white,
  // appBarTheme: _appBarTheme,
);

// final _appBarTheme = AppBarTheme(
//   textTheme: TextTheme(
//     title: TextStyle(
//       color: Colors.black,
//       fontFamily: 'JosefinSans',
//       fontWeight: FontWeight.bold,
//       fontSize: 24,
//     ),
//   ),
// );
