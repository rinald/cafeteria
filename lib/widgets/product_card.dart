import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../blocs/order_bloc.dart';
import '../icons/line_icons.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    final _orderBloc = Provider.of<OrderBloc>(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 2,
            child: Image.asset(
              'assets/products/${product.imagePath}',
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 12.0, 8.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.displayName,
                  style: TextStyle(
                    fontSize: 16,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${product.price} LEK',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Icon(LineIcons.shopping_cart),
                    SizedBox(width: 5),
                    Text('${_orderBloc.order[product] ?? 0}'),
                    Spacer(),
                    IconButton(
                      icon: Icon(LineIcons.plus_circle),
                      onPressed: () {
                        _orderBloc.add(product);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
