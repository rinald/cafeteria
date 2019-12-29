import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../blocs/blocs.dart';
import '../../widgets/cart_entry_tile.dart';
import '../../widgets/spaced_column.dart';
import '../../widgets/spaced_row.dart';

class OrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _productBloc = Provider.of<ProductBloc>(context);
    final _orderBloc = Provider.of<OrderBloc>(context);

    return SpacedInColumn(
      spacer: SizedBox(height: 4),
      children: <Widget>[
        SpacedOutRow(
          spacer: Spacer(),
          children: <Widget>[
            Text(
              'Total: ${_productBloc.total} LEK',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            RaisedButton(
              child: Text('Check Out'),
              onPressed: _productBloc.products.isEmpty
                  ? null
                  : () {
                      _orderBloc.create(
                          Map.from(_productBloc.products), _productBloc.total);
                      _productBloc.clear();
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: SpacedInRow(
                            spacer: SizedBox(width: 10),
                            children: <Widget>[
                              Icon(Icons.shopping_cart),
                              Text('Order successful.'),
                            ],
                          ),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _productBloc.products.length,
            itemBuilder: (_, index) {
              final _product = _productBloc.products.keys.elementAt(index);

              return CartEntryTile(_product);
            },
          ),
        ),
      ],
    );
  }
}
