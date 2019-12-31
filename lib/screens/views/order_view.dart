import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../blocs/blocs.dart';
import '../../icons/line_icons.dart';
import '../../widgets/product_tile.dart';
import '../../widgets/spaced_column.dart';
import '../../widgets/spaced_row.dart';

class OrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _orderBloc = Provider.of<OrderBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Order'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              LineIcons.shopping_cart,
            ),
            onPressed: _orderBloc.order.isEmpty
                ? null
                : () {
                    _orderBloc.checkOut();
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Successful checkout.'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  },
          ),
        ],
      ),
      body: SpacedInColumn(
        spacer: SizedBox(height: 4),
        children: <Widget>[
          SpacedOutRow(
            spacer: Spacer(),
            children: <Widget>[
              Text(
                '${_orderBloc.orderTotal} LEK',
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              RaisedButton(
                child: Text('Clear'),
                onPressed: _orderBloc.order.isEmpty
                    ? null
                    : () {
                        _orderBloc.clearOrder();
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Cleared order.'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: _orderBloc.restoreOrder,
                            ),
                          ),
                        );
                      },
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _orderBloc.order.length,
              itemBuilder: (_, index) {
                final _product = _orderBloc.order.keys.elementAt(index);

                return ProductTile(_product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
