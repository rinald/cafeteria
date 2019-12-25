import '../models/product.dart';

const products = [
  const Product(
    category: Category.food,
    imagePath: 'burger.jpg',
    displayName: 'Burger',
    price: 200,
  ),
  const Product(
    category: Category.food,
    imagePath: 'pasta.jpg',
    displayName: 'Pasta',
    price: 250,
  ),
  const Product(
    category: Category.food,
    imagePath: 'chicken_fillet.jpg',
    displayName: 'Chicken Fillet',
    price: 300,
  ),
  const Product(
    category: Category.snack,
    imagePath: 'snickers.jpg',
    displayName: 'Snickers',
    price: 80,
  ),
  const Product(
    category: Category.drink,
    imagePath: 'cocacola.jpg',
    displayName: 'CocaCola',
    price: 90,
  ),
  const Product(
    category: Category.snack,
    imagePath: 'lion.jpg',
    displayName: 'Lion',
    price: 50,
  ),
  const Product(
    category: Category.snack,
    imagePath: 'milka.jpg',
    displayName: 'Milka',
    price: 130,
  ),
  const Product(
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
