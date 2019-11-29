import 'package:flutter/material.dart';

final _loginScreen = Scaffold(
  appBar: AppBar(
    title: Text('Login'),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.more_vert),
        onPressed: () {},
      )
    ],
  ),
);

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => _loginScreen;
}
