import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../blocs/blocs.dart';
import '../../icons/line_icons.dart';
import '../../widgets/product_tile.dart';
import '../../widgets/spaced_column.dart';
import '../../widgets/spaced_row.dart';
import '../../widgets/tappable_text.dart';

class OrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _orderBloc = Provider.of<OrderBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Order'),
        centerTitle: true,
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
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) => AlertDialog(
                            title: Text('Clear?'),
                            content:
                                Text('Do you really want to clear the order?'),
                            actions: <Widget>[
                              TappableText(
                                'Yes',
                                onPressed: () {
                                  _orderBloc.clearOrder();
                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Cleared order.'),
                                      duration: Duration(seconds: 3),
                                    ),
                                  );
                                  Navigator.pop(context);
                                },
                              ),
                              TappableText(
                                'No',
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
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
