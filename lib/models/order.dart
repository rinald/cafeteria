import './product.dart';

class ProductInfo {
  final String name;
  final double price;
  final int quantity;

  ProductInfo({this.name, this.price, this.quantity});

  factory ProductInfo.of(Product product, int quantity) {
    return ProductInfo(
      name: product.displayName,
      price: product.price,
      quantity: quantity,
    );
  }
}

class Order {
  final _order = Map<Product, int>();

  Order(List<Product> products) {
    for (var product in products) {
      if (_order.containsKey(product)) {
        _order[product] += 1;
      } else {
        _order[product] = 1;
      }
    }
  }

  List<ProductInfo> get info {
    final _info = <ProductInfo>[];

    _order.forEach((product, quantity) {
      var _productInfo = ProductInfo.of(product, quantity);

      _info.add(_productInfo);
    });

    return _info;
  }
}
