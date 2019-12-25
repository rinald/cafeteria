import 'package:flutter/foundation.dart';

import '../models/cart_entry.dart';
import '../models/order.dart';

class OrderBloc with ChangeNotifier {
  final _orders = <Order>[];
  double total = 0;

  List<Order> get orders => _orders;

  void create(Map<CartEntry, int> products, double price) {
    final _order = Order(products);
    _orders.add(_order);
    total += price;
    notifyListeners();
  }
}
