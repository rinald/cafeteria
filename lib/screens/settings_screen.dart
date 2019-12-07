import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../blocs/theme_bloc.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeBloc = Provider.of<ThemeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Theme'),
          ),
          RadioListTile(
            title: Text('System default'),
            value: ThemeMode.system,
            groupValue: _themeBloc.themeMode,
            onChanged: (ThemeMode mode) {
              _themeBloc.themeMode = mode;
            },
          ),
          RadioListTile(
            title: Text('Light'),
            value: ThemeMode.light,
            groupValue: _themeBloc.themeMode,
            onChanged: (ThemeMode mode) {
              _themeBloc.themeMode = mode;
            },
          ),
          RadioListTile(
            title: Text('Dark'),
            value: ThemeMode.dark,
            groupValue: _themeBloc.themeMode,
            onChanged: (ThemeMode mode) {
              _themeBloc.themeMode = mode;
            },
          ),
        ],
      ),
    );
  }
}
