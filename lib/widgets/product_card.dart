import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../blocs/product_bloc.dart';
import '../models/product.dart';
import '../models/cart_entry.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  ProductCard({@required this.product}) : assert(product != null);

  @override
  Widget build(BuildContext context) {
    final _productBloc = Provider.of<ProductBloc>(context);
    final _entry = CartEntry.of(product);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 2,
            child: Image.asset(
              'assets/products/${_entry.image}',
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${_entry.price} LEK',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.shopping_cart),
                    SizedBox(width: 5),
                    Text('${_productBloc.products[_entry] ?? 0}'),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.add_circle_outline),
                      onPressed: () {
                        _productBloc.add(product);
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
