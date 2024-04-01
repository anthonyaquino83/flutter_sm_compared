import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int _count1 = 0;
  int get count1 => _count1;
  set count1(int value) {
    _count1 = value;
    notifyListeners();
  }

  int _count2 = 0;
  int get count2 => _count2;
  set count2(int value) {
    _count2 = value;
    notifyListeners();
  }

  int get total => count1 + count2;
  bool get isEven => total.isEven;
  bool get isOdd => total.isOdd;
}

final counterNotifier = Counter();
