import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'home_screen.dart' show OrderList;

class HistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _orderList = Provider.of<OrderList>(context);

    return Column(
      children: <Widget>[
        Text(
          'Total: ${_orderList.total} LEK',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Expanded(
          child: ListView.builder(
            itemCount: _orderList.orders.length,
            itemBuilder: (_, index) => ListTile(
              title: Text('Order #${index + 1}'),
              subtitle: Text('${_orderList.orders[index]} LEK'),
            ),
          ),
        ),
      ],
    );
  }
}
