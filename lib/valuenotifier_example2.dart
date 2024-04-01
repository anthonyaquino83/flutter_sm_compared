import 'package:flutter/material.dart';

final count1 = ValueNotifier(0);
final count2 = ValueNotifier(0);
final total = Total();
final isEvenNotifier = IsEvenNotifier();
final isOddNotifier = IsOddNotifier();

class Total extends ValueNotifier<int> {
  Total() : super(count1.value + count2.value) {
    count1.addListener(() {
      value = count1.value + count2.value;
    });
    count2.addListener(() {
      value = count1.value + count2.value;
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

class ValueNotifierExample2 extends StatefulWidget {
  const ValueNotifierExample2({
    super.key,
  });

  @override
  State<ValueNotifierExample2> createState() => _ValueNotifierExample2State();
}

class _ValueNotifierExample2State extends State<ValueNotifierExample2> {
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
      color: Colors.red,
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
                          count1.value++;
                        },
                        child: const Text('Counter 1'),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${count1.value} - ${count2.value}',
                        style: Theme.of(context).textTheme.displayMedium,
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
                    'Total VN2: ${total.value} even=${isEvenNotifier.value} odd=${isOddNotifier.value}',
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
