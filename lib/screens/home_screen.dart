import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

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

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _index = 0;

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

  void _onTap(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _index,
      onTap: _onTap,
      showUnselectedLabels: false,
      items: _barItems,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cafeteria'),
      ),
      body: ListView(
        children: [
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
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
