import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sm_compared/riverpod_providers.dart';

class RiverpodExample extends ConsumerWidget {
  const RiverpodExample({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColoredBox(
      color: Colors.orange,
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
                          ref.read(counter1Provider.notifier).state++;
                        },
                        child: const Text('Counter 1'),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${ref.watch(counter1Provider)} - ${ref.watch(counter2Provider)}',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          ref.read(counter2Provider.notifier).state++;
                        },
                        child: const Text('Counter 2'),
                      ),
                    ],
                  ),
                  Text(
                    'Total Riverpod: ${ref.watch(totalProvider)} even=${ref.watch(isEvenProvider)} odd=${ref.watch(isOddProvider)}',
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
