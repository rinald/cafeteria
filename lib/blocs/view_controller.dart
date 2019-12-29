import 'package:flutter/material.dart';

import '../screens/views/views.dart';

class ViewController with ChangeNotifier {
  final _views = <Widget>[
    HomeView(),
    OrderView(),
    HistoryView(),
  ];

  int _firstIndex = 0;
  int _secondIndex = 0;
  bool _showFirst = true;

  int get index => _firstIndex;
  bool get showFirst => _showFirst;
  Widget get firstView => _views[_firstIndex];
  Widget get secondView => _views[_secondIndex];

  set index(int index) {
    if (_firstIndex != index) {
      _secondIndex = _firstIndex;
      _firstIndex = index;
      _showFirst = !_showFirst;
      notifyListeners();
    }
  }
}
