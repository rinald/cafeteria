import 'package:flutter/material.dart';

import '../widgets/spaced_column.dart';
import '../widgets/spaced_row.dart';

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cafeteria'),
      ),
      body: SpacedInColumn(
        mainAxisAlignment: MainAxisAlignment.center,
        spacer: SizedBox(height: 50),
        children: <Widget>[
          Icon(
            Icons.restaurant_menu,
            size: 120,
          ),
          SpacedOutRow(
            spacer: Spacer(),
            children: <Widget>[
              Expanded(
                flex: 3,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: SpacedInRow(
                    spacer: Spacer(),
                    children: <Widget>[
                      Icon(Icons.person),
                      Text('Login'),
                    ],
                  ),
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/login'),
                ),
              ),
              Expanded(
                flex: 3,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: SpacedInRow(
                    spacer: Spacer(),
                    children: <Widget>[
                      Icon(Icons.settings),
                      Text('Settings'),
                    ],
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/settings'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
