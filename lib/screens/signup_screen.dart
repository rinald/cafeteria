import 'package:flutter/material.dart';

import '../widgets/spaced_column.dart';

class SignupScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign Up'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: SpacedInColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          spacer: SizedBox(height: 10),
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            TextField(
              obscureText: true,
              controller: _passwordRetypeController,
              decoration: InputDecoration(
                labelText: 'Retype Password',
              ),
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                child: Text('Sign Up'),
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/main'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
