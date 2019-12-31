import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

enum Category { all, dish, snack, drink }

List<Category> allCategories = [
  Category.all,
  Category.dish,
  Category.snack,
  Category.drink,
];

class Product extends Equatable {
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

  @override
  List<Object> get props => [category, imagePath, displayName, price];
}
