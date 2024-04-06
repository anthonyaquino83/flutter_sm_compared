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

class ValueNotifierExample extends StatefulWidget {
  const ValueNotifierExample({
    super.key,
  });

  @override
  State<ValueNotifierExample> createState() => _ValueNotifierExampleStat();
}

class _ValueNotifierExampleStat extends State<ValueNotifierExample> {
  @override
  void initState() {
    super.initState();

    total.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.cyan,
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
                          counter1.value++;
                        },
                        child: const Text('Counter 1'),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${counter1.value} - ${counter2.value}',
                        style: Theme.of(context).textTheme.displayMedium,
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
                    'Total VN: ${total.value} even=${isEven.value} odd=${isOdd.value}',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
