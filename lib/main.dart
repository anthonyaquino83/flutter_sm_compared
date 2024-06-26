import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sm_compared/riverpod_example.dart';
import 'package:flutter_sm_compared/setstate_example.dart';
import 'package:flutter_sm_compared/signals_example.dart';
import 'changenotifier_example.dart';
import 'cubit_example.dart';
import 'inheritedwidget_example.dart';
import 'valuenotifier_example.dart';
import 'valuelistenablebuilder_example.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
      ),
      home: const Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('State Management Compared'),
            // 64 loc (VSCodeCounter and same Flutter autoformat)
            // internal packages
            SetStateExample(),
            // 75 loc
            InheritedWidgetExample(),
            // 80 loc
            ChangeNotifierExample(),
            // 91 loc
            ValueNotifierExample(),
            // 109 loc
            ValueListenableBuilderExample(),
            // external packages
            // 58 loc
            ProviderScope(child: RiverpodExample()),
            // 61 loc
            SignalsExample(),
            // 120 loc
            CubitExample(),
          ],
        ),
      ),
    );
  }
}
