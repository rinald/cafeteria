import 'package:flutter/material.dart';

List<Widget> spacedIn({
  @required List<Widget> children,
  @required Widget spacer,
}) {
  return <Widget>[
    children[0],
    for (int i = 1; i < children.length; i++) ...[
      spacer,
      children[i],
    ],
  ];
}

List<Widget> spacedOut({
  @required List<Widget> children,
  @required Widget spacer,
}) {
  return <Widget>[
    spacer,
    for (int i = 0; i < children.length; i++) ...[
      children[i],
      spacer,
    ],
  ];
}
