import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../blocs/product_bloc.dart';
import '../models/cart_entry.dart';

class CartEntryTile extends StatelessWidget {
  final CartEntry entry;

  CartEntryTile(this.entry);

  @override
  Widget build(BuildContext context) {
    final _productBloc = Provider.of<ProductBloc>(context);

    return ListTile(
      leading: AspectRatio(
        aspectRatio: 1.2,
        child: Image.asset(
          'assets/products/${entry.image}',
          fit: BoxFit.fitHeight,
        ),
      ),
      title: Text('${entry.name} x${_productBloc.products[entry]}'),
      subtitle: Text('${entry.price} LEK'),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () {
                _productBloc.remove(entry);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.highlight_off,
                color: Theme.of(context).errorColor,
              ),
              onPressed: () {
                _productBloc.removeAll(entry);
              },
            ),
          ],
        ),
      ),
    );
  }
}
