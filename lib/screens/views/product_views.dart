import 'package:flutter/material.dart';

import '../../data/products.dart';
import '../../models/product.dart';
import '../../widgets/product_card.dart';

final productViews = [
  for (var category in allCategories)
    GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(16),
      childAspectRatio: 0.9,
      children: productsOfCategory(category)
          .map((product) => ProductCard(product))
          .toList(),
    ),
];
