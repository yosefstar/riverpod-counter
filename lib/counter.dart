import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  int build() => 0;

  void incrementCounter() {
    state++;
  }

  void decrementCounter() {
    state--;
  }

  void multiplyCounter() {
    state *= state;
  }

  void resetCounter() {
    state = 0;
  }
}
