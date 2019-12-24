import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../data/products.dart';
import '../widgets/product_card.dart';

class ProductOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _category = Provider.of<ValueNotifier<Category>>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ChoiceChip(
          avatar: Icon(
            Icons.done_all,
            color: _category.value == Category.all
                ? Theme.of(context).primaryColor
                : Theme.of(context).accentColor,
          ),
          label: Text('All'),
          selected: _category.value == Category.all,
          onSelected: (_) => _category.value = Category.all,
        ),
        SizedBox(width: 10),
        ChoiceChip(
          avatar: Icon(
            Icons.local_dining,
            color: _category.value == Category.food
                ? Theme.of(context).primaryColor
                : Theme.of(context).accentColor,
          ),
          label: Text('Food'),
          selected: _category.value == Category.food,
          onSelected: (_) => _category.value = Category.food,
        ),
        SizedBox(width: 10),
        ChoiceChip(
          avatar: Icon(
            Icons.fastfood,
            color: _category.value == Category.snack
                ? Theme.of(context).primaryColor
                : Theme.of(context).accentColor,
          ),
          label: Text('Snack'),
          selected: _category.value == Category.snack,
          onSelected: (_) => _category.value = Category.snack,
        ),
        SizedBox(width: 10),
        ChoiceChip(
          avatar: Icon(
            Icons.local_cafe,
            color: _category.value == Category.drink
                ? Theme.of(context).primaryColor
                : Theme.of(context).accentColor,
          ),
          label: Text('Drink'),
          selected: _category.value == Category.drink,
          onSelected: (_) => _category.value = Category.drink,
        ),
      ],
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _category = Provider.of<ValueNotifier<Category>>(context);

    return Column(
      children: <Widget>[
        ProductOptions(),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(16),
            childAspectRatio: 0.9,
            children: <Widget>[
              for (var product in productsOfCategory(_category.value))
                ProductCard(
                  product: product,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
