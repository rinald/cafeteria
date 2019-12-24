import 'package:cafeteria/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _productList = Provider.of<ProductList>(context);
    final _orderList = Provider.of<OrderList>(context);

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Spacer(),
            Text(
              'Total: ${_productList.price} LEK',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            RaisedButton(
              child: Text('Check Out'),
              onPressed: _productList.products.isEmpty
                  ? null
                  : () {
                      _orderList.create(_productList.price);
                      _productList.clear();
                    },
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: 4),
        Expanded(
          child: ListView.builder(
            itemCount: _productList.products.length,
            itemBuilder: (_, index) => ListTile(
              leading: AspectRatio(
                aspectRatio: 1.2,
                child: Image.asset(
                  'assets/products/${_productList.products[index].imagePath}',
                  fit: BoxFit.fitHeight,
                ),
              ),
              title: Text(_productList.products[index].displayName),
              subtitle: Text('${_productList.products[index].price} LEK'),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  _productList.remove(_productList.products[index]);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
