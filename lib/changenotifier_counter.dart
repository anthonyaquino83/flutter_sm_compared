import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int _counter1 = 0;
  int get counter1 => _counter1;
  set counter1(int value) {
    _counter1 = value;
    notifyListeners();
  }

  int _counter2 = 0;
  int get counter2 => _counter2;
  set counter2(int value) {
    _counter2 = value;
    notifyListeners();
  }

  int get total => counter1 + counter2;
  bool get isEven => total.isEven;
  bool get isOdd => total.isOdd;
}

final counterNotifier = Counter();
