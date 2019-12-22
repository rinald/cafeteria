import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cafeteria'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.restaurant_menu,
              size: 120,
            ),
            SizedBox(
              height: 25,
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 25),
            //   child: Text(mock_text),
            // ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: <Widget>[
                Spacer(),
                Expanded(
                  flex: 3,
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.person),
                        Spacer(
                          flex: 1,
                        ),
                        Text('Login'),
                        Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 3,
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.settings),
                        Spacer(
                          flex: 1,
                        ),
                        Text('Settings'),
                        Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/settings'),
                  ),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
