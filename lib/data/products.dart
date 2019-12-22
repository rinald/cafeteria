import '../models/product.dart';

final products = [
  Product(
    category: Category.food,
    name: 'burger',
    displayName: 'Burger',
    price: 200,
    // aspectRatio: 12 / 9,
  ),
  Product(
    category: Category.food,
    name: 'pasta',
    displayName: 'Pasta',
    price: 250,
    // aspectRatio: 780 / 439,
  ),
  Product(
    category: Category.food,
    name: 'chicken_fillet',
    displayName: 'Chicken Fillet',
    price: 300,
    // aspectRatio: 840 / 560,
  ),
  Product(
    category: Category.snack,
    name: 'snickers',
    displayName: 'Snickers',
    price: 100,
    // aspectRatio: 395 / 527,
  ),
  Product(
    category: Category.drink,
    name: 'cocacola',
    displayName: 'Cocacola',
    price: 80,
    // aspectRatio: 1,
  ),
  Product(
    category: Category.snack,
    name: 'lion',
    displayName: 'Lion',
    price: 50,
    // aspectRatio: 1,
  ),
  Product(
    category: Category.snack,
    name: 'milka',
    displayName: 'Milka',
    price: 120,
    // aspectRatio: 1,
  ),
  Product(
    category: Category.snack,
    name: 'ice_tea',
    displayName: 'Ice Tea Lemon',
    price: 100,
    // aspectRatio: 1,
  ),
];

List<Product> productsOfCategory(Category category) => category == Category.all
    ? products
    : products
        .where((Product product) => product.category == category)
        .toList();
