import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show ChangeNotifierProvider, Provider;

// final mock_text =
//     'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sollicitudin imperdiet tortor. Mauris tempor dolor purus, eget ultrices nisl vulputate vel. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce libero metus, facilisis vel mollis vel, mollis ut odio.';

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
              size: 120,
            ),
            SizedBox(
              height: 25,
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 25),
            //   child: Text(mock_text),
            // ),
            SizedBox(
              height: 25,
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
              size: 120,
            ),
            SizedBox(height: 25),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 25),
            //   child: Text(mock_text),
            // ),
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
            size: 120,
          ),
          SizedBox(height: 25),
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 25),
          //   child: Text(mock_text),
          // ),
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
          centerTitle: true,
          title: Text('Cafeteria'),
        ),
        body: HomeView(),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
