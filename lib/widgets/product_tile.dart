import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../blocs/order_bloc.dart';
import '../icons/line_icons.dart';
import '../models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    final _orderBloc = Provider.of<OrderBloc>(context);

    return ListTile(
      leading: AspectRatio(
        aspectRatio: 1.2,
        child: Image.asset(
          'assets/products/${product.imagePath}',
          fit: BoxFit.fitHeight,
        ),
      ),
      title: Text('${product.displayName} x${_orderBloc.order[product]}'),
      subtitle: Text('${product.price} LEK'),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(LineIcons.minus_circle),
              onPressed: () {
                _orderBloc.remove(product);
              },
            ),
            IconButton(
              icon: Icon(
                LineIcons.times_circle,
                color: Theme.of(context).errorColor,
              ),
              onPressed: () {
                _orderBloc.removeAllOf(product);
              },
            ),
          ],
        ),
      ),
    );
  }
}
