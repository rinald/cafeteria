import './cart_entry.dart';

class Order {
  final Map<CartEntry, int> products;

  Order(this.products);
}
