import 'package:flutter/material.dart';

class ViewController with ChangeNotifier {
  final List<Widget> views;
  ViewController({@required this.views}) : assert(views != null);

  int _firstIndex = 0;
  int _secondIndex = 0;
  bool _showFirst = true;

  int get index => _firstIndex;
  bool get showFirst => _showFirst;
  Widget get firstView => views[_firstIndex];
  Widget get secondView => views[_secondIndex];

  set index(int index) {
    if (_firstIndex != index) {
      _secondIndex = _firstIndex;
      _firstIndex = index;
      _showFirst = !_showFirst;
      notifyListeners();
    }
  }
}
