import 'package:equatable/equatable.dart';

import './product.dart';

class CartEntry extends Equatable {
  final String name;
  final double price;
  final String image;

  const CartEntry({this.name, this.price, this.image});

  factory CartEntry.of(Product product) {
    return CartEntry(
      name: product.displayName,
      price: product.price,
      image: product.imagePath,
    );
  }

  @override
  List<Object> get props => [name, price, image];
}
