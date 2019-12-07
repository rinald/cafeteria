import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './screens/screens.dart';
import './blocs/theme_bloc.dart';
import './themes.dart';

class _App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeBloc = Provider.of<ThemeBloc>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cafeteria',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeBloc.themeMode,
      routes: {
        '/': (_) => HomeScreen(),
        '/login': (_) => LoginScreen(),
        '/settings': (_) => SettingsScreen(),
      },
    );
  }
}

class App extends StatelessWidget {
  final _themeBloc = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _themeBloc,
      child: _App(),
    );
  }
}
