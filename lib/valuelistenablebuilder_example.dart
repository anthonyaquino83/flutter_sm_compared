import 'package:flutter/material.dart';

final counter1 = ValueNotifier(0);
final counter2 = ValueNotifier(0);

class ValueListenableBuilderExample extends StatefulWidget {
  const ValueListenableBuilderExample({
    super.key,
  });

  @override
  State<ValueListenableBuilderExample> createState() =>
      _ValueListenableBuilderExampleState();
}

class _ValueListenableBuilderExampleState
    extends State<ValueListenableBuilderExample> {
  int get total => counter1.value + counter2.value;
  bool get isEven => total.isEven;
  bool get isOdd => total.isOdd;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.purple,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder(
                valueListenable: counter1,
                builder: (context, value, child) {
                  return ValueListenableBuilder(
                    valueListenable: counter2,
                    builder: (context, value, child) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  counter1.value++;
                                },
                                child: const Text('Counter 1'),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${counter1.value} - ${counter2.value}',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  counter2.value++;
                                },
                                child: const Text('Counter 2'),
                              ),
                            ],
                          ),
                          Text(
                            'Total VN + VLB: $total even=$isEven odd=$isOdd',
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
