import 'package:flutter/material.dart';

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
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
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
                // color: Colors.black,
                // textColor: Colors.white,
                child: Text('Login'),
                onPressed: () {
                  print('Pressed!');
                },
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text('Forgot Password?'),
                onPressed: () {
                  print('You forgot your password.');
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account?"),
                FlatButton(
                  child: Text('Sign up'),
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
