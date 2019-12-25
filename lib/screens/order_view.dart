import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../blocs/blocs.dart';

class OrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _productBloc = Provider.of<ProductBloc>(context);
    final _orderBloc = Provider.of<OrderBloc>(context);

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Spacer(),
            Text(
              'Total: ${_productBloc.total} LEK',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            RaisedButton(
              child: Text('Check Out'),
              onPressed: _productBloc.products.isEmpty
                  ? null
                  : () {
                      _orderBloc.create(
                          Map.from(_productBloc.products), _productBloc.total);
                      _productBloc.clear();
                    },
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: 4),
        Expanded(
          child: ListView.builder(
            itemCount: _productBloc.products.length,
            itemBuilder: (_, index) {
              final _product = _productBloc.products.keys.elementAt(index);

              return ListTile(
                leading: AspectRatio(
                  aspectRatio: 1.2,
                  child: Image.asset(
                    'assets/products/${_product.image}',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                title: Text(
                    '${_product.name} x${_productBloc.products[_product]}'),
                subtitle: Text('${_product.price} LEK'),
                trailing: Container(
                  width: 100,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          _productBloc.remove(_product);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.highlight_off,
                          color: Theme.of(context).errorColor,
                        ),
                        onPressed: () {
                          _productBloc.removeAll(_product);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
