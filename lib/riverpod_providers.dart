import 'package:flutter_riverpod/flutter_riverpod.dart';

final counter1Provider = StateProvider((ref) => 0);
final counter2Provider = StateProvider((ref) => 0);
final totalProvider = StateProvider<int>(
    (ref) => ref.watch(counter1Provider) + ref.watch(counter2Provider));
final isEvenProvider = StateProvider((ref) => ref.watch(totalProvider).isEven);
final isOddProvider = StateProvider((ref) => ref.watch(totalProvider).isOdd);
