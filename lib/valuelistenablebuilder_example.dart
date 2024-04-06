import 'package:flutter/material.dart';

final counter1 = ValueNotifier(0);
final counter2 = ValueNotifier(0);
final total = TotalNotifier();
final isEven = IsEvenNotifier();
final isOdd = IsOddNotifier();

class TotalNotifier extends ValueNotifier<int> {
  TotalNotifier() : super(counter1.value + counter2.value) {
    counter1.addListener(() {
      value = counter1.value + counter2.value;
    });
    counter2.addListener(() {
      value = counter1.value + counter2.value;
    });
  }
}

class IsEvenNotifier extends ValueNotifier<bool> {
  IsEvenNotifier() : super(total.value.isEven) {
    total.addListener(() {
      value = total.value.isEven;
    });
  }
}

class IsOddNotifier extends ValueNotifier<bool> {
  IsOddNotifier() : super(total.value.isOdd) {
    total.addListener(() {
      value = total.value.isOdd;
    });
  }
}

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
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.blue.shade100,
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
                          ValueListenableBuilder(
                              valueListenable: total,
                              builder: (context, total, child) {
                                return ValueListenableBuilder(
                                    valueListenable: isEven,
                                    builder: (context, isEven, child) {
                                      return ValueListenableBuilder(
                                          valueListenable: isOdd,
                                          builder: (context, isOdd, child) {
                                            return Text(
                                              'Total VN + VLB: $total even=$isEven odd=$isOdd',
                                            );
                                          });
                                    });
                              }),
                          // Text(
                          //   'Total VN + VLB: $total even=$isEven odd=$isOdd',
                          // ),
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
