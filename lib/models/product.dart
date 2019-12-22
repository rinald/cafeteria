import 'package:meta/meta.dart';

enum Category { all, food, snack, drink }

class Product {
  final Category category;
  final String name;
  final String displayName;
  final double price;
  final double aspectRatio;

  Product({
    this.category = Category.all,
    @required this.name,
    @required this.displayName,
    @required this.price,
    this.aspectRatio,
  })  : assert(name != null),
        assert(displayName != null),
        assert(price != null);
}
