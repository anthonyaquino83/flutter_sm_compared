import 'package:flutter/material.dart';

class InheritedCounter extends InheritedWidget {
  final int counter1;
  final int counter2;

  const InheritedCounter({
    super.key,
    required super.child,
    required this.counter1,
    required this.counter2,
  });

  int get total => counter1 + counter2;
  bool get isEven => total.isEven;
  bool get isOdd => total.isOdd;

  static InheritedCounter of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedCounter>()!;

  @override
  bool updateShouldNotify(covariant InheritedCounter oldWidget) {
    return counter1 != oldWidget.counter1;
  }
}
