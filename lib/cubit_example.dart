import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter1Cubit extends Cubit<int> {
  Counter1Cubit() : super(0);

  void increment() => emit(state + 1);
}

class Counter2Cubit extends Cubit<int> {
  Counter2Cubit() : super(0);

  void increment() => emit(state + 1);
}

class TotalCubit extends Cubit<(int total, bool isOdd, bool isEven)> {
  TotalCubit() : super((0, false, false));

  void calculateTotal(count1, count2) {
    final int total = count1 + count2;
    final bool isOdd = total.isOdd;
    final bool isEven = total.isEven;
    emit((total, isEven, isOdd));
  }
}

class CubitExample extends StatefulWidget {
  const CubitExample({
    super.key,
  });

  @override
  State<CubitExample> createState() => _CubitExampleState();
}

class _CubitExampleState extends State<CubitExample> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.yellow,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => Counter1Cubit(),
          ),
          BlocProvider(
            create: (context) => Counter2Cubit(),
          ),
          BlocProvider(
            create: (context) => TotalCubit()
              ..calculateTotal(context.read<Counter1Cubit>().state,
                  context.read<Counter2Cubit>().state),
          ),
        ],
        child: BlocBuilder<Counter1Cubit, int>(
          builder: (context, count1) {
            return BlocBuilder<Counter2Cubit, int>(
              builder: (context, count2) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    context.read<Counter1Cubit>().increment();
                                  },
                                  child: const Text('Counter 1'),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '$count1 - $count2',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    context.read<Counter2Cubit>().increment();
                                  },
                                  child: const Text('Counter 2'),
                                ),
                              ],
                            ),
                            MultiBlocListener(
                              listeners: [
                                BlocListener<Counter1Cubit, int>(
                                  listener: (context, listener1State) {
                                    context
                                        .read<TotalCubit>()
                                        .calculateTotal(listener1State, count2);
                                  },
                                ),
                                BlocListener<Counter2Cubit, int>(
                                  listener: (context, listener2State) {
                                    context
                                        .read<TotalCubit>()
                                        .calculateTotal(count1, listener2State);
                                  },
                                ),
                              ],
                              child: BlocBuilder<TotalCubit,
                                  (int total, bool isOdd, bool isEven)>(
                                builder: (context, state) {
                                  return Text(
                                    'Total Cubit: ${state.$1} even=${state.$2} odd=${state.$3}',
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
