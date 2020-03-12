import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../blocs/user_bloc.dart';
import '../icons/line_icons.dart';
import '../widgets/spaced_widgets.dart';
import '../widgets/tappable_text.dart';

class _Body extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _userBloc = Provider.of<UserBloc>(context);

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: spacedIn(
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
                child: Row(
                  children: <Widget>[
                    Icon(LineIcons.alternate_sign_in),
                    ...spacedOut(
                      spacer: Spacer(),
                      children: <Widget>[
                        Text('Log In'),
                      ],
                    )
                  ],
                ),
                onPressed: () async {
                  if (await _userBloc.signIn(
                    _emailController.text,
                    _passwordController.text,
                  )) {
                    Navigator.pushReplacementNamed(context, '/main');
                  } else {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Login failed. Wrong email or password.'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                },
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
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, '/login');
                              },
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

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login'),
      ),
      body: _Body(),
    );
  }
}
