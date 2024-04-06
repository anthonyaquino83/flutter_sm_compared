import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

final counter1signal = signal(0);
final counter2signal = signal(0);
final totalComputed =
    computed(() => counter1signal.value + counter2signal.value);
final isEvenComputed = computed(() => totalComputed.value.isEven);
final isOddComputed = computed(() => totalComputed.value.isOdd);

class SignalsExample extends StatefulWidget {
  const SignalsExample({
    super.key,
  });

  @override
  State<SignalsExample> createState() => _SignalsExampleState();
}

class _SignalsExampleState extends State<SignalsExample> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.orange.shade400,
      child: Column(
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
                          counter1signal.value++;
                        },
                        child: const Text('Counter 1'),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${counter1signal.watch(context)} - ${counter2signal.watch(context)}',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          counter2signal.value++;
                        },
                        child: const Text('Counter 2'),
                      ),
                    ],
                  ),
                  Text(
                    'Total Signals: ${totalComputed.watch(context)} even=${isEvenComputed.watch(context)} odd=${isOddComputed.watch(context)}',
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
