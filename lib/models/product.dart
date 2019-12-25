import 'package:meta/meta.dart';

enum Category { all, food, snack, drink }

class Product {
  final Category category;
  final String imagePath;
  final String displayName;
  final double price;

  const Product({
    this.category = Category.all,
    @required this.imagePath,
    @required this.displayName,
    @required this.price,
  })  : assert(imagePath != null),
        assert(displayName != null),
        assert(price != null);
}
