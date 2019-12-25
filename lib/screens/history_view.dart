import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../blocs/order_bloc.dart';

class HistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _orderBloc = Provider.of<OrderBloc>(context);

    return Column(
      children: <Widget>[
        Text(
          'Total: ${_orderBloc.total} LEK',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Expanded(
          child: ListView.builder(
            itemCount: _orderBloc.orders.length,
            itemBuilder: (_, index) {
              final _products = _orderBloc.orders[index].products;

              return Column(
                children: <Widget>[
                  Divider(),
                  Text(
                    'Order #${index + 1}',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(),
                  for (var _product in _products.keys)
                    ListTile(
                      leading: AspectRatio(
                        aspectRatio: 1.2,
                        child: Image.asset(
                          'assets/products/${_product.image}',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      title: Text('${_product.name} x${_products[_product]}'),
                      subtitle: Text('${_product.price} LEK'),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
