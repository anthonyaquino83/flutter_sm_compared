import 'package:flutter/material.dart';

class InheritedCounter extends InheritedWidget {
  final int count1;
  final int count2;

  const InheritedCounter({
    super.key,
    required super.child,
    required this.count1,
    required this.count2,
  });

  int get total => count1 + count2;
  bool get isEven => total.isEven;
  bool get isOdd => total.isOdd;

  static InheritedCounter of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedCounter>()!;

  @override
  bool updateShouldNotify(covariant InheritedCounter oldWidget) {
    return count1 != oldWidget.count1;
  }
}
