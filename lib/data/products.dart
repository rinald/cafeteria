import '../models/product.dart';

const products = [
  Product(
    category: Category.dish,
    imagePath: 'burger.jpg',
    displayName: 'Burger',
    price: 170,
  ),
  Product(
    category: Category.dish,
    imagePath: 'tomato_pasta.jpg',
    displayName: 'Tomato Pasta',
    price: 250,
  ),
  Product(
    category: Category.dish,
    imagePath: 'chicken_pasta.jpg',
    displayName: 'Chicken Pasta',
    price: 250,
  ),
  Product(
    category: Category.dish,
    imagePath: 'chicken_fillet.jpg',
    displayName: 'Chicken Fillet',
    price: 250,
  ),
  Product(
    category: Category.dish,
    imagePath: 'doner.jpg',
    displayName: 'Doner Kebab',
    price: 170,
  ),
  Product(
    category: Category.dish,
    imagePath: 'fries.jpg',
    displayName: 'French Fries',
    price: 70,
  ),
  Product(
    category: Category.snack,
    imagePath: 'apple.jpg',
    displayName: 'Apple',
    price: 10,
  ),
  Product(
    category: Category.snack,
    imagePath: 'orange.jpg',
    displayName: 'Orange',
    price: 10,
  ),
  Product(
    category: Category.snack,
    imagePath: 'cupcake.jpg',
    displayName: 'Chocolate Cupcake',
    price: 70,
  ),
  Product(
    category: Category.drink,
    imagePath: 'coffee.jpg',
    displayName: 'Coffee',
    price: 70,
  ),
  Product(
    category: Category.drink,
    imagePath: 'espresso.webp',
    displayName: 'Espresso',
    price: 80,
  ),
  Product(
    category: Category.drink,
    imagePath: 'milk.jpg',
    displayName: 'Cocoa Milkshake',
    price: 110,
  ),
  Product(
    category: Category.drink,
    imagePath: 'green_tea.jpg',
    displayName: 'Green Tea',
    price: 120,
  ),
  Product(
    category: Category.drink,
    imagePath: 'black_tea.jpg',
    displayName: 'Black Tea',
    price: 120,
  ),
];

List<Product> productsOfCategory(Category category) => category == Category.all
    ? products
    : products
        .where((Product product) => product.category == category)
        .toList();
