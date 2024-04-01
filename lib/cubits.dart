import 'package:flutter_bloc/flutter_bloc.dart';

class Counter1Cubit extends Cubit<int> {
  Counter1Cubit() : super(0);

  void increment() => emit(state + 1);
}

class Counter2Cubit extends Cubit<int> {
  Counter2Cubit() : super(0);

  void increment() => emit(state + 1);
}
