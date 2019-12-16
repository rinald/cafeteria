import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show ChangeNotifierProvider, Provider;

class BottomBar extends StatelessWidget {
  final _barItems = [
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
                        Icon(Icons.settings),
                        Spacer(
                          flex: 1,
                        ),
                        Text('Settings'),
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
        ),
        body: HomeView(),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
