import 'package:flutter/material.dart';

class TappableText extends StatelessWidget {
  final String data;
  final void Function() onPressed;

  TappableText(this.data, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      textColor: Theme.of(context).accentColor,
      padding: EdgeInsets.all(5),
      child: Text(
        data,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
