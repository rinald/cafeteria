import 'package:flutter/material.dart';

class SpacedInRow extends StatelessWidget {
  final List<Widget> children;
  final Widget spacer;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  SpacedInRow({
    this.children,
    this.spacer,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        children[0],
        for (int i = 1; i < children.length; i++) ...[
          spacer,
          children[i],
        ],
      ],
    );
  }
}

class SpacedOutRow extends StatelessWidget {
  final List<Widget> children;
  final Widget spacer;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  SpacedOutRow({
    this.children,
    this.spacer,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        spacer,
        for (int i = 0; i < children.length; i++) ...[
          children[i],
          spacer,
        ],
      ],
    );
  }
}
