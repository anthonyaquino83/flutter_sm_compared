import 'package:flutter/material.dart';

class SetStateExample extends StatefulWidget {
  const SetStateExample({
    super.key,
  });

  @override
  State<SetStateExample> createState() => _SetStateExampleState();
}

class _SetStateExampleState extends State<SetStateExample> {
  int count1 = 0;
  int count2 = 0;
  int get total => count1 + count2;
  bool get isEven => total.isEven;
  bool get isOdd => total.isOdd;

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
                          setState(() {
                            count1++;
                          });
                        },
                        child: const Text('Counter 1'),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '$count1 - $count2',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            count2++;
                          });
                        },
                        child: const Text('Counter 2'),
                      ),
                    ],
                  ),
                  Text(
                    'Total setState: $total even=$isEven odd=$isOdd',
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