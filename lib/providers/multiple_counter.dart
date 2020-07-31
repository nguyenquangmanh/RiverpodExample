
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

class Counter extends StateNotifier<int> {
  Counter() : super(0);
  void increment() {
    state++;
  }
}

final counterProviderFamily = AutoDisposeStateNotifierProvider.family<Counter, int>(
      (ref, index) => Counter(),
);

