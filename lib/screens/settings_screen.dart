import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

List<Widget> _themeOptions(
  BuildContext context, {
  Map<String, ThemeMode> items,
}) {
  final _themeMode = Provider.of<ValueNotifier<ThemeMode>>(context);
  final _widgets = <Widget>[];

  items.forEach(
    (title, themeMode) {
      _widgets.add(
        RadioListTile(
          activeColor: Theme.of(context).accentColor,
          title: Text(title),
          value: themeMode,
          groupValue: _themeMode.value,
          onChanged: (ThemeMode themeMode) => _themeMode.value = themeMode,
        ),
      );
    },
  );

  return _widgets;
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          ..._themeOptions(
            context,
            items: {
              'System default': ThemeMode.system,
              'Light': ThemeMode.light,
              'Dark': ThemeMode.dark,
            },
          ),
        ],
      ),
    );
  }
}
