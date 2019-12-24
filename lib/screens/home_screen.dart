import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

import './home_view.dart';
import './order_view.dart';
import './history_view.dart';

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

class ProductList with ChangeNotifier {
  final _list = <Product>[];
  double price = 0;

  List<Product> get products => _list;

  void add(Product product) {
    _list.add(product);
    price += product.price;
    notifyListeners();
  }

  void remove(Product product) {
    _list.remove(product);
    price -= product.price;
    notifyListeners();
  }

  void clear() {
    _list.clear();
    price = 0;
    notifyListeners();
  }
}

class OrderList with ChangeNotifier {
  final _list = <double>[];
  double total = 0;

  List<double> get orders => _list;

  void create(double price) {
    _list.add(price);
    total += price;
    notifyListeners();
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _index = Provider.of<ValueNotifier<int>>(context);

    if (_index.value == 0) {
      return HomeView();
    } else if (_index.value == 1) {
      return OrderView();
    }

    return HistoryView();
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ValueNotifier(Category.all)),
        ChangeNotifierProvider.value(value: ProductList()),
        ChangeNotifierProvider.value(value: ValueNotifier(0)),
        ChangeNotifierProvider.value(value: OrderList()),
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Cafeteria'),
        ),
        body: MainView(),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
