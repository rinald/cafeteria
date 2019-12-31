import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../icons/line_icons.dart';
import '../blocs/blocs.dart';
import '../screens/views/views.dart';
import '../widgets/crossfade_views.dart';

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
          icon: Icon(LineIcons.home),
        ),
        BottomNavigationBarItem(
          title: Text('Order'),
          icon: Icon(LineIcons.receipt),
        ),
        BottomNavigationBarItem(
          title: Text('History'),
          icon: Icon(LineIcons.history),
        ),
      ],
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ViewController(
            views: <Widget>[
              ChangeNotifierProvider(
                create: (_) => ViewController(views: productViews),
                child: HomeView(),
              ),
              OrderView(),
              HistoryView(),
            ],
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderBloc(),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: CrossFadeViews(
            firstCurve: Curves.easeOutQuad,
            secondCurve: Curves.easeInQuad,
          ),
        ),
        bottomNavigationBar: _BottomNavigationBar(),
      ),
    );
  }
}
