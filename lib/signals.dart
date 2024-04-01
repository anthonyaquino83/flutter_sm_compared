import 'package:signals_flutter/signals_flutter.dart';

final count1signal = signal(0);
final count2signal = signal(0);
final totalComputed = computed(() => count1signal.value + count2signal.value);
final isEvenComputed = computed(() => totalComputed.value.isEven);
final isOddComputed = computed(() => totalComputed.value.isOdd);
