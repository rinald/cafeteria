import 'package:flutter/foundation.dart';

import '../models/product.dart';

class OrderBloc with ChangeNotifier {
  var _orders = <Map<Product, int>>[];

  Map<Product, int> _order = {};

  double _funds = 1000;
  double _orderTotal = 0;
  double _allOrdersTotal = 0;

  double get orderTotal => _orderTotal;
  double get allOrdersTotal => _allOrdersTotal;
  double get funds => _funds;

  List<Map<Product, int>> get orders => _orders;
  Map<Product, int> get order => _order;

  void add(Product product) {
    if (_order.containsKey(product)) {
      _order[product] += 1;
    } else {
      _order[product] = 1;
    }

    _orderTotal += product.price;

    notifyListeners();
  }

  void remove(Product product) {
    if (_order[product] == 1) {
      _order.remove(product);
    } else {
      _order[product] -= 1;
    }

    _orderTotal -= product.price;

    notifyListeners();
  }

  void removeAllOf(Product product) {
    _orderTotal -= _order[product] * product.price;
    _order.remove(product);

    notifyListeners();
  }

  void clearOrder() {
    _order = {};
    _orderTotal = 0;

    notifyListeners();
  }

  void clearHistory() {
    _orders = [];
    _allOrdersTotal = 0;

    notifyListeners();
  }

  bool checkOut() {
    if (orderTotal <= _funds) {
      _funds -= orderTotal;
      _allOrdersTotal += orderTotal;
      _orders.add(_order);
      _order = {};
      _orderTotal = 0;

      notifyListeners();

      return true;
    } else {
      return false;
    }
  }
}
