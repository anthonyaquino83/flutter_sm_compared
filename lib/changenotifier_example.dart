import 'package:flutter/material.dart';
import 'changenotifier_counter.dart';

class ChangeNotifierExample extends StatefulWidget {
  const ChangeNotifierExample({
    super.key,
  });

  @override
  State<ChangeNotifierExample> createState() => _ChangeNotifierExampleState();
}

class _ChangeNotifierExampleState extends State<ChangeNotifierExample> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.blue.shade300,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListenableBuilder(
                listenable: counterNotifier,
                builder: (context, child) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              counterNotifier.counter1++;
                            },
                            child: const Text('Counter 1'),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${counterNotifier.counter1} - ${counterNotifier.counter2}',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              counterNotifier.counter2++;
                            },
                            child: const Text('Counter 2'),
                          ),
                        ],
                      ),
                      Text(
                        'Total CN: ${counterNotifier.total} even=${counterNotifier.isEven} odd=${counterNotifier.isOdd}',
                      ),
                    ],
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
