import 'package:flutter/material.dart';

class SimpleScaffold extends StatelessWidget {
  final String title;
  final List<Widget> actions;
  final Widget body;
  final Widget floatingButton;
  final Widget bottomBar;
  final Widget drawer;

  SimpleScaffold(
      {this.title,
      this.actions,
      this.body,
      this.floatingButton,
      this.bottomBar,
      this.drawer});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text(title)),
      ),
      body: body,
      drawer: drawer,
      floatingActionButton: floatingButton,
      bottomNavigationBar: bottomBar,
    );
  }
}
