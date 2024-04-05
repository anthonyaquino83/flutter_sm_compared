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
        ],
        child: BlocBuilder<Counter1Cubit, int>(
          builder: (context, state) {
            return BlocBuilder<Counter2Cubit, int>(
              builder: (context, state2) {
                final int total = state + state2;
                final bool isEven = total.isEven;
                final bool isOdd = total.isOdd;
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
                                  '$state - $state2',
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
                            Text(
                              'Total Cubit: $total even=$isEven odd=$isOdd',
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
