import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../data/products.dart';
import '../../models/product.dart';
import '../../widgets/widgets.dart';

List<Widget> _productChips({Map<Category, IconData> items}) {
  final _widgets = <Widget>[];

  items.forEach(
    (category, icon) {
      _widgets.add(
        ProductChip(
          category: category,
          avatar: icon,
        ),
      );
    },
  );

  return _widgets;
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _category = Provider.of<ValueNotifier<Category>>(context);

    return Column(
      children: <Widget>[
        SpacedOutRow(
          spacer: SizedBox(width: 10),
          children: _productChips(
            items: {
              Category.all: Icons.done_all,
              Category.food: Icons.local_dining,
              Category.snack: Icons.fastfood,
              Category.drink: Icons.local_cafe,
            },
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(16),
            childAspectRatio: 0.9,
            children: productsOfCategory(_category.value)
                .map((product) => ProductCard(product))
                .toList(),
          ),
        ),
      ],
    );
  }
}
