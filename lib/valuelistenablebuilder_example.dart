import 'package:flutter/material.dart';
import 'valuenotifiers.dart';

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
  int get total => count1.value + count2.value;
  bool get isEven => total.isEven;
  bool get isOdd => total.isOdd;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.green,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder(
                valueListenable: count1,
                builder: (context, value, child) {
                  return ValueListenableBuilder(
                    valueListenable: count2,
                    builder: (context, value, child) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  count1.value++;
                                },
                                child: const Text('Counter 1'),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${count1.value} - ${count2.value}',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  count2.value++;
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
