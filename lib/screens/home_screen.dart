import 'package:flutter/material.dart';

_navigateTo(BuildContext context, String screen) =>
    Navigator.of(context).pushNamed(screen);

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cafeteria'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 1,
              child: RaisedButton(
                child: Text('Login Screen'),
                onPressed: () => _navigateTo(context, '/login'),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 1,
              child: RaisedButton(
                child: Text('Settings Screen'),
                onPressed: () => _navigateTo(context, '/settings'),
              ),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
