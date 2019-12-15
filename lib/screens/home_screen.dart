import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:provider/provider.dart';

BottomNavigationBarItem _barItem({
  String title,
  IconData icon,
  IconData activeIcon,
}) {
  return BottomNavigationBarItem(
    title: Text(title),
    icon: Icon(icon),
    activeIcon: Icon(activeIcon),
  );
}

class BottomBar extends StatelessWidget {
  final _barItems = [
    _barItem(
      title: 'Home',
      icon: OMIcons.home,
      activeIcon: Icons.home,
    ),
    _barItem(
      title: 'Order',
      icon: OMIcons.receipt,
      activeIcon: Icons.receipt,
    ),
    _barItem(
      title: 'History',
      icon: OMIcons.history,
      activeIcon: Icons.history,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final _index = Provider.of<ValueNotifier<int>>(context);

    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      currentIndex: _index.value,
      selectedItemColor: Theme.of(context).accentColor,
      onTap: (int index) => _index.value = index,
      showUnselectedLabels: false,
      items: _barItems,
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _index = Provider.of<ValueNotifier<int>>(context);

    if (_index.value == 0) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.restaurant_menu,
              size: 150,
            ),
            SizedBox(
              height: 150,
            ),
            Row(
              children: <Widget>[
                Spacer(),
                Expanded(
                  flex: 3,
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.person),
                        Spacer(
                          flex: 1,
                        ),
                        Text('Login'),
                        Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 3,
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.info),
                        Spacer(
                          flex: 1,
                        ),
                        Text('About'),
                        Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/settings'),
                  ),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      );
    } else if (_index.value == 1) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.receipt,
              size: 40,
            ),
            Text('Make a new order...')
          ],
        ),
      );
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.history,
            size: 40,
          ),
          Text('History of orders...')
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ValueNotifier(0),
      child: Scaffold(
        appBar: AppBar(
          // centerTitle: true,
          title: Text('Cafeteria'),
          actions: <Widget>[
            IconButton(
              icon: Icon(OMIcons.settings),
              onPressed: () => Navigator.pushNamed(context, '/settings'),
            ),
          ],
        ),
        body: HomeView(),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
