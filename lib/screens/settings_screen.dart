import 'package:flutter/material.dart';

final _settingsScreen = Scaffold(
  appBar: AppBar(
    title: Text('Settings'),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.more_vert),
        onPressed: () {},
      )
    ],
  ),
);

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => _settingsScreen;
}
