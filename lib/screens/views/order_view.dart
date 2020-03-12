import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../blocs/blocs.dart';
import '../../icons/line_icons.dart';
import '../../widgets/product_tile.dart';
import '../../widgets/spaced_widgets.dart';
import '../../widgets/tappable_text.dart';

class OrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _orderBloc = Provider.of<OrderBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Order'),
        centerTitle: true,
      ),
      body: Column(
        children: spacedIn(
          spacer: SizedBox(height: 4),
          children: <Widget>[
            Row(
              children: spacedOut(
                spacer: Spacer(),
                children: <Widget>[
                  Text(
                    '${_orderBloc.orderTotal} LEK',
                    style: TextStyle(fontSize: 18),
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
                                content: Text(
                                    'Do you really want to clear the order?'),
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
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: spacedIn(
                spacer: SizedBox(width: 10),
                children: <Widget>[
                  Icon(
                    LineIcons.money_bill,
                    size: 30,
                  ),
                  Text('${_orderBloc.funds} LEK'),
                ],
              ),
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: _orderBloc.order.length,
                itemBuilder: (_, index) {
                  final _product = _orderBloc.order.keys.elementAt(index);

                  return ProductTile(_product);
                },
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Container(
                width: 150,
                height: 40,
                child: Row(
                  children: spacedOut(
                    spacer: Spacer(),
                    children: <Widget>[
                      Icon(
                        LineIcons.shopping_cart,
                        size: 32,
                      ),
                      Text(
                        'Check out',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onPressed: _orderBloc.order.isEmpty
                  ? null
                  : () {
                      if (_orderBloc.checkOut()) {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Successful checkout.'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      } else {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Not enough funds.'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }
                    },
            ),
            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
