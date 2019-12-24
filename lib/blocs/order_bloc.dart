import 'package:flutter/foundation.dart';

import '../blocs/product_bloc.dart';
import '../models/order.dart';

class OrderBloc with ChangeNotifier {
  final _orders = <Order>[];
  double total = 0;

  List<Order> get orders => _orders;

  void create(ProductBloc productBloc) {
    _orders.add(Order(productBloc.products));
    total += productBloc.total;
    notifyListeners();
  }
}
