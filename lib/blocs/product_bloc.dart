import 'package:flutter/foundation.dart';

import '../models/product.dart';

class ProductBloc with ChangeNotifier {
  final _products = <Product>[];
  double total = 0;

  List<Product> get products => _products;

  void add(Product product) {
    _products.add(product);
    total += product.price;
    notifyListeners();
  }

  void removeAt(int index) {
    total -= _products[index].price;

    _products.removeAt(index);

    notifyListeners();
  }

  void clear() {
    _products.clear();
    total = 0;
    notifyListeners();
  }
}
