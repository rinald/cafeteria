import 'package:flutter/material.dart';
import '../widgets.dart' show TappableText;

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                child: Text('Login'),
                onPressed: () {
                  print('Pressed!');
                },
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: TappableText(
                'Forgot your password?',
                onPressed: () {
                  print('You forgot your password.');
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account?"),
                TappableText(
                  'Sign up',
                  onPressed: () {
                    print('Sign up...');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
