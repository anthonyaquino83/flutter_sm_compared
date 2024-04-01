import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

final count1signal = signal(0);
final count2signal = signal(0);
final totalComputed = computed(() => count1signal.value + count2signal.value);
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
      color: Colors.blue,
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
                          count1signal.value++;
                        },
                        child: const Text('Counter 1'),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${count1signal.watch(context)} - ${count2signal.watch(context)} ',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          count2signal.value++;
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
