import 'package:flutter/material.dart';
import 'valuenotifiers.dart';

class ValueNotifierExample extends StatefulWidget {
  const ValueNotifierExample({
    super.key,
  });

  @override
  State<ValueNotifierExample> createState() => _ValueNotifierExampleState();
}

class _ValueNotifierExampleState extends State<ValueNotifierExample> {
  int get total => count1.value + count2.value;
  bool get isEven => total.isEven;
  bool get isOdd => total.isOdd;

  @override
  void initState() {
    super.initState();

    count1.addListener(() {
      if (mounted) setState(() {});
    });

    count2.addListener(() {
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
