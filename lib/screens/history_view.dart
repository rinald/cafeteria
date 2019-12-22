import 'package:flutter/material.dart';

class HistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.history,
            size: 120,
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
