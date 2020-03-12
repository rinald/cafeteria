import 'package:flutter/material.dart';

import '../icons/line_icons.dart';
import '../widgets/spaced_widgets.dart';

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: spacedIn(
          spacer: SizedBox(height: 50),
          children: <Widget>[
            Column(
              children: spacedIn(
                spacer: SizedBox(height: 50),
                children: <Widget>[
                  Row(
                    children: spacedOut(
                      spacer: Spacer(),
                      children: <Widget>[
                        Icon(
                          LineIcons.utensils,
                          size: 150,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Welcome!',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: spacedOut(
                spacer: Spacer(),
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(LineIcons.user),
                          Spacer(),
                          Text('Login'),
                          Spacer(),
                        ],
                      ),
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/login'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
