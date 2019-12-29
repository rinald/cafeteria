import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/product.dart' show Category;

extension on Category {
  String asString() {
    switch (this) {
      case Category.all:
        return 'All';
        break;
      case Category.food:
        return 'Food';
        break;
      case Category.snack:
        return 'Snack';
        break;
      case Category.drink:
        return 'Drink';
        break;
    }

    return 'Drink';
  }
}

class ProductChip extends StatelessWidget {
  final IconData avatar;
  final Category category;

  ProductChip({this.avatar, this.category});

  @override
  Widget build(BuildContext context) {
    final _category = Provider.of<ValueNotifier<Category>>(context);

    return ChoiceChip(
      avatar: Icon(
        avatar,
        color: _category.value == category
            ? Theme.of(context).primaryColor
            : Theme.of(context).accentColor,
      ),
      label: Text(category.asString()),
      selected: _category.value == category,
      onSelected: (_) => _category.value = category,
    );
  }
}
