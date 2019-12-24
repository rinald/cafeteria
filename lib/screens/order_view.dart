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
                      _orderBloc.create(_productBloc);
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
            itemBuilder: (_, index) => ListTile(
              leading: AspectRatio(
                aspectRatio: 1.2,
                child: Image.asset(
                  'assets/products/${_productBloc.products[index].imagePath}',
                  fit: BoxFit.fitHeight,
                ),
              ),
              title: Text(_productBloc.products[index].displayName),
              subtitle: Text('${_productBloc.products[index].price} LEK'),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  _productBloc.removeAt(index);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
