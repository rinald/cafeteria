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
              final _info = _orderBloc.orders[index].info;

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
                  for (var info in _info)
                    ListTile(
                      title: Text('${info.name} x${info.quantity}'),
                      subtitle: Text('${info.price} LEK'),
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
