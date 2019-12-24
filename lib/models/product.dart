import 'package:meta/meta.dart';

enum Category { all, food, snack, drink }

class Product {
  final Category category;
  final String imagePath;
  final String displayName;
  final double price;
  final double aspectRatio;

  Product({
    this.category = Category.all,
    @required this.imagePath,
    @required this.displayName,
    @required this.price,
    this.aspectRatio,
  })  : assert(imagePath != null),
        assert(displayName != null),
        assert(price != null);
}
