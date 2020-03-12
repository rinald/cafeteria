import 'package:flutter/material.dart';

import '../../icons/line_icons.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Cafeteria'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(LineIcons.cog),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: spacedOut(
              spacer: SizedBox(width: 10),
              children: _productChips(
                items: {
                  Category.all: LineIcons.compass,
                  Category.dish: LineIcons.utensils,
                  Category.snack: LineIcons.hamburger,
                  Category.drink: LineIcons.coffee,
                },
              ),
            ),
          ),
          Expanded(
            child: CrossFadeViews(
              firstCurve: Curves.easeOutQuad,
              secondCurve: Curves.easeInQuad,
            ),
          ),
        ],
      ),
    );
  }
}
