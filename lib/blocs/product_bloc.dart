import 'package:flutter/foundation.dart';

import '../models/product.dart';
import '../models/cart_entry.dart';

class ProductBloc with ChangeNotifier {
  final _products = Map<CartEntry, int>();
  double total = 0;

  Map<CartEntry, int> get products => _products;

  void add(Product product) {
    final _entry = CartEntry.of(product);

    if (_products.containsKey(_entry)) {
      _products[_entry] += 1;
    } else {
      _products[_entry] = 1;
    }

    total += _entry.price;
    notifyListeners();
  }

  void remove(CartEntry entry) {
    if (_products[entry] == 1) {
      _products.remove(entry);
    } else {
      _products[entry] -= 1;
    }

    total -= entry.price;

    notifyListeners();
  }

  void removeAll(CartEntry entry) {
    total -= _products[entry] * entry.price;
    _products.remove(entry);

    notifyListeners();
  }

  void clear() {
    _products.clear();
    total = 0;

    notifyListeners();
  }
}
