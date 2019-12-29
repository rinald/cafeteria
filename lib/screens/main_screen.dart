import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocs/blocs.dart';
import '../models/product.dart';

class _BottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _viewController = Provider.of<ViewController>(context);

    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      currentIndex: _viewController.index,
      selectedItemColor: Theme.of(context).accentColor,
      onTap: (index) => _viewController.index = index,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          title: Text('Home'),
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          title: Text('Order'),
          icon: Icon(Icons.receipt),
        ),
        BottomNavigationBarItem(
          title: Text('History'),
          icon: Icon(Icons.history),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final AnimatedCrossFadeBuilder _layoutBuilder = (
    topChild,
    topChildKey,
    bottomChild,
    bottomChildKey,
  ) {
    return Stack(
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
  };

  @override
  Widget build(BuildContext context) {
    final _viewController = Provider.of<ViewController>(context);

    return AnimatedCrossFade(
      crossFadeState: _viewController.showFirst
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      firstChild: _viewController.showFirst
          ? _viewController.firstView
          : _viewController.secondView,
      secondChild: _viewController.showFirst
          ? _viewController.secondView
          : _viewController.firstView,
      duration: Duration(milliseconds: 200),
      firstCurve: Curves.easeInCubic,
      secondCurve: Curves.easeInCubic,
      layoutBuilder: _layoutBuilder,
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ValueNotifier(Category.all),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductBloc(),
        ),
        ChangeNotifierProvider(
          create: (_) => ViewController(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderBloc(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Cafeteria'),
        ),
        body: _Body(),
        bottomNavigationBar: _BottomNavigationBar(),
      ),
    );
  }
}
