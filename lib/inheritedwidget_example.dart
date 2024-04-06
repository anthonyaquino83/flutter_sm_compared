import 'package:flutter/material.dart';
import 'package:flutter_sm_compared/inheritedwidget_counter.dart';

class InheritedWidgetExample extends StatefulWidget {
  const InheritedWidgetExample({
    super.key,
  });

  @override
  State<InheritedWidgetExample> createState() => _InheritedWidgetExampleState();
}

class _InheritedWidgetExampleState extends State<InheritedWidgetExample> {
  int counter1 = 0;
  int counter2 = 0;

  void incrementCount1() {
    setState(() {
      counter1 = counter1 + 1;
    });
  }

  void incrementCount2() {
    setState(() {
      counter2 = counter2 + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.green,
      child: Column(
        children: [
          InheritedCounter(
            counter1: counter1,
            counter2: counter2,
            child: Builder(builder: (context) {
              final inheritedCounter = InheritedCounter.of(context);
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              incrementCount1();
                            },
                            child: const Text('Counter 1'),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${inheritedCounter.counter1} - ${inheritedCounter.counter2}',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              incrementCount2();
                            },
                            child: const Text('Counter 2'),
                          ),
                        ],
                      ),
                      Text(
                        'Total IW: ${inheritedCounter.total} even=${inheritedCounter.isEven} odd=${inheritedCounter.isOdd}',
                      ),
                    ],
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
