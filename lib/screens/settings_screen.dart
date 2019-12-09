import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

// import '../blocs/theme_bloc.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeMode = Provider.of<ValueNotifier<ThemeMode>>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
            groupValue: _themeMode.value,
            onChanged: (ThemeMode mode) => _themeMode.value = mode,
          ),
          RadioListTile(
            title: Text('Light'),
            value: ThemeMode.light,
            groupValue: _themeMode.value,
            onChanged: (ThemeMode mode) => _themeMode.value = mode,
          ),
          RadioListTile(
            title: Text('Dark'),
            value: ThemeMode.dark,
            groupValue: _themeMode.value,
            onChanged: (ThemeMode mode) => _themeMode.value = mode,
          ),
        ],
      ),
    );
  }
}
