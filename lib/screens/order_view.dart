import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.receipt,
            size: 120,
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
