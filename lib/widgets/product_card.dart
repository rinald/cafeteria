import 'package:cafeteria/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  ProductCard({@required this.product}) : assert(product != null);

  @override
  Widget build(BuildContext context) {
    final _products = Provider.of<ProductList>(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
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
                    fontWeight: FontWeight.bold,
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
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    // padding: EdgeInsets.all(0),
                    // alignment: Alignment.centerRight,
                    icon: Icon(Icons.add_circle_outline),
                    onPressed: () {
                      _products.add(product);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
