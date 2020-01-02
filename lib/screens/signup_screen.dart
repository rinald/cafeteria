import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../blocs/user_bloc.dart';
import '../widgets/spaced_column.dart';

class _Body extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _userBloc = Provider.of<UserBloc>(context);

    return Container(
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
              onPressed: () {
                if (_passwordRetypeController.text ==
                    _passwordController.text) {
                  _userBloc.signUp(
                      _emailController.text, _passwordController.text);
                  Navigator.pushReplacementNamed(context, '/main');
                } else {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Signup failed. Passwords don\'t match.'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign Up'),
      ),
      body: _Body(),
    );
  }
}
