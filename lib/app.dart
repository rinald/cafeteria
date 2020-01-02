import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './blocs/user_bloc.dart';
import './screens/screens.dart';
import './themes/themes.dart';

class _App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeMode = Provider.of<ValueNotifier<ThemeMode>>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cafeteria',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode.value,
      routes: {
        '/': (_) => InitialScreen(),
        '/main': (_) => MainScreen(),
        '/login': (_) => LoginScreen(),
        '/settings': (_) => SettingsScreen(),
        '/signup': (_) => SignupScreen(),
      },
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ValueNotifier(ThemeMode.system),
        ),
        Provider(
          create: (_) => UserBloc(),
        )
      ],
      child: _App(),
    );
  }
}
