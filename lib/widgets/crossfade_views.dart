import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../blocs/view_controller.dart';

class CrossFadeViews extends StatelessWidget {
  final Duration duration;
  final Duration reverseDuration;
  final Curve firstCurve;
  final Curve secondCurve;

  CrossFadeViews({
    this.duration = const Duration(milliseconds: 200),
    this.reverseDuration = const Duration(milliseconds: 200),
    this.firstCurve = Curves.linear,
    this.secondCurve = Curves.linear,
  });

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<ViewController>(context);

    return AnimatedCrossFade(
      crossFadeState: _controller.showFirst
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      firstChild: _controller.showFirst
          ? _controller.firstView
          : _controller.secondView,
      secondChild: _controller.showFirst
          ? _controller.secondView
          : _controller.firstView,
      duration: duration,
      reverseDuration: reverseDuration,
      firstCurve: firstCurve,
      secondCurve: secondCurve,
      layoutBuilder: (
        topChild,
        topChildKey,
        bottomChild,
        bottomChildKey,
      ) {
        return Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              key: bottomChildKey,
              child: bottomChild,
            ),
            Positioned(
              key: topChildKey,
              child: topChild,
            ),
          ],
        );
      },
    );
  }
}
