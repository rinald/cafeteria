import 'package:flutter/material.dart';
import 'package:cafeteria/screens/screens.dart';
import 'package:cafeteria/themes.dart';

final _app = MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Cafeteria',
  theme: lightTheme,
  darkTheme: darkTheme,
  themeMode: ThemeMode.system,
  routes: {
    '/': (_) => HomeScreen(),
    '/login': (_) => LoginScreen(),
    '/settings': (_) => SettingsScreen(),
  },
);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => _app;
}
