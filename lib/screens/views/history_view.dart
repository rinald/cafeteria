import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../blocs/order_bloc.dart';
import '../../widgets/spaced_row.dart';
import '../../widgets/spaced_column.dart';

class HistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _orderBloc = Provider.of<OrderBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('All Orders'),
      ),
      body: SpacedInColumn(
        spacer: SizedBox(height: 4),
        children: <Widget>[
          SpacedOutRow(
            spacer: Spacer(),
            children: <Widget>[
              Text(
                'Total: ${_orderBloc.allOrdersTotal} LEK',
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              RaisedButton(
                child: Text('Clear'),
                onPressed: _orderBloc.orders.isEmpty
                    ? null
                    : () {
                        _orderBloc.clearHistory();
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Cleared history.'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: _orderBloc.restoreHistory,
                            ),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      },
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _orderBloc.orders.length,
              itemBuilder: (_, index) {
                final _order = _orderBloc.orders[index];

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
                    for (var product in _order.keys)
                      ListTile(
                        leading: AspectRatio(
                          aspectRatio: 1.2,
                          child: Image.asset(
                            'assets/products/${product.imagePath}',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        title:
                            Text('${product.displayName} x${_order[product]}'),
                        subtitle: Text('${product.price} LEK'),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
