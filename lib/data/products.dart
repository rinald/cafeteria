import '../models/product.dart';

const products = [
  Product(
    category: Category.dish,
    imagePath: 'burger.jpg',
    displayName: 'Burger',
    price: 200,
  ),
  Product(
    category: Category.dish,
    imagePath: 'pasta.jpg',
    displayName: 'Pasta',
    price: 250,
  ),
  Product(
    category: Category.dish,
    imagePath: 'chicken_fillet.jpg',
    displayName: 'Chicken Fillet',
    price: 300,
  ),
  Product(
    category: Category.snack,
    imagePath: 'snickers.jpg',
    displayName: 'Snickers',
    price: 80,
  ),
  Product(
    category: Category.drink,
    imagePath: 'cocacola.jpg',
    displayName: 'CocaCola',
    price: 90,
  ),
  Product(
    category: Category.snack,
    imagePath: 'lion.jpg',
    displayName: 'Lion',
    price: 50,
  ),
  Product(
    category: Category.snack,
    imagePath: 'milka.jpg',
    displayName: 'Milka',
    price: 130,
  ),
  Product(
    category: Category.drink,
    imagePath: 'ice_tea.jpg',
    displayName: 'Lemon Ice Tea',
    price: 100,
  ),
];

List<Product> productsOfCategory(Category category) => category == Category.all
    ? products
    : products
        .where((Product product) => product.category == category)
        .toList();
