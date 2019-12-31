import 'package:flutter/foundation.dart';

import '../models/product.dart';

class OrderBloc with ChangeNotifier {
  var _orders = <Map<Product, int>>[];
  var _recentlyDeletedOrders = <Map<Product, int>>[];

  Map<Product, int> _order = {};
  Map<Product, int> _recentlyDeletedOrder;

  double _orderTotal = 0;
  double _allOrdersTotal = 0;
  double _recentlyDeletedOrderTotal = 0;
  double _recentlyDeletedOrdersTotal = 0;

  double get orderTotal => _orderTotal;
  double get allOrdersTotal => _allOrdersTotal;
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
    _recentlyDeletedOrder = _order;
    _recentlyDeletedOrderTotal = _orderTotal;
    _order = {};
    _orderTotal = 0;

    notifyListeners();
  }

  void clearHistory() {
    _recentlyDeletedOrders = _orders;
    _recentlyDeletedOrdersTotal = _allOrdersTotal;
    _orders = [];
    _allOrdersTotal = 0;

    notifyListeners();
  }

  void restoreOrder() {
    _order = _recentlyDeletedOrder;
    _orderTotal = _recentlyDeletedOrderTotal;

    notifyListeners();
  }

  void restoreHistory() {
    _orders = _recentlyDeletedOrders;
    _allOrdersTotal = _recentlyDeletedOrdersTotal;

    notifyListeners();
  }

  void checkOut() {
    _allOrdersTotal += orderTotal;
    _orders.add(_order);
    _order = {};
    _orderTotal = 0;

    notifyListeners();
  }
}
