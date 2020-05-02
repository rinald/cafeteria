import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../blocs/view_controller.dart';

import '../models/product.dart';

extension on Category {
  String get string {
    var string = this.toString().split('.').last;
    return string[0].toUpperCase() + string.substring(1);
  }
}

class ProductChip extends StatelessWidget {
  final IconData avatar;
  final Category category;

  ProductChip({this.avatar, this.category});

  @override
  Widget build(BuildContext context) {
    final _viewController = Provider.of<ViewController>(context);

    return ChoiceChip(
      avatar: Icon(
        avatar,
        color: allCategories[_viewController.index] == category
            ? Theme.of(context).primaryColor
            : Theme.of(context).accentColor,
      ),
      label: Text(
        category.string,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      selected: _viewController.index == allCategories.indexOf(category),
      onSelected: (_) =>
          _viewController.index = allCategories.indexOf(category),
    );
  }
}
