import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:provider/provider.dart';

// import '../blocs/navbar_bloc.dart';

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
      currentIndex: _index.value,
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
      return ListView(
        children: <Widget>[
          ListTile(
            title: Text('Login Screen'),
            leading: Icon(OMIcons.person),
            onTap: () => Navigator.pushNamed(context, '/login'),
          ),
          ListTile(
            title: Text('Settings Screen'),
            leading: Icon(OMIcons.settings),
            onTap: () => Navigator.pushNamed(context, '/settings'),
          ),
        ],
      );
    } else if (_index.value == 1) {
      return Center(
        child: Icon(
          Icons.receipt,
          size: 40,
        ),
      );
    }

    return Center(
      child: Icon(
        Icons.history,
        size: 40,
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
