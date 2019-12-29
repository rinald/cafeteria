import 'package:flutter/material.dart';

import '../widgets/spaced_column.dart';
import '../widgets/tappable_text.dart';

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
            Container(
              width: double.infinity,
              child: RaisedButton(
                child: Text('Login'),
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/main'),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: TappableText(
                'Forgot your password?',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return Scaffold(
                          appBar: AppBar(
                            centerTitle: true,
                            title: Text('Reset password'),
                          ),
                          body: Center(
                            child: RaisedButton(
                              child: Text('Reset Password'),
                              onPressed: () => Navigator.pushReplacementNamed(
                                  context, '/login'),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account?"),
                TappableText(
                  'Sign up',
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/signup'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
