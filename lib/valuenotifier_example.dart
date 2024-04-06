import 'package:flutter/material.dart';

final counter1 = ValueNotifier(0);
final counter2 = ValueNotifier(0);

class ValueNotifierExample extends StatefulWidget {
  const ValueNotifierExample({
    super.key,
  });

  @override
  State<ValueNotifierExample> createState() => _ValueNotifierExampleState();
}

class _ValueNotifierExampleState extends State<ValueNotifierExample> {
  int get total => counter1.value + counter2.value;
  bool get isEven => total.isEven;
  bool get isOdd => total.isOdd;

  @override
  void initState() {
    super.initState();

    counter1.addListener(() {
      if (mounted) setState(() {});
    });

    counter2.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    'Total VN + setState: $total even=$isEven odd=$isOdd',
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
