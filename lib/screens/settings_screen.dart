import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../widgets/widgets.dart';
import '../blocs/theme_bloc.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeBloc = Provider.of<ThemeBloc>(context);

    return SimpleScaffold(
      title: 'Settings',
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
          // SwitchListTile(
          //   title: Text('Enable dark mode'),
          //   value: _themeBloc.darkModeEnabled,
          //   onChanged: (bool value) {
          //     _themeBloc.changeTheme(value);
          //   },
          // ),
        ],
      ),
    );
  }
}
