import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter/counter.dart';
import 'package:riverpod_counter/random_color.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            CounterText(),
          ],
        ),
      ),
      floatingActionButton: const Buttons(),
    );
  }
}

class CounterText extends ConsumerWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counter = ref.watch(counterProvider);
    final Color color = ref.watch(randomColorProvider);
    return Text(
      '$counter',
      style: TextStyle(
        color: color,
        fontSize: 64,
      ),
    );
  }
}

class Buttons extends ConsumerWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            ref.read(randomColorProvider.notifier).randomColor();
          },
          child: const Icon(Icons.color_lens),
        ),
        FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).resetCounter();
          },
          child: const Icon(Icons.exposure_zero),
        ),
        FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).decrementCounter();
          },
          child: const Icon(Icons.remove),
        ),
        FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).incrementCounter();
          },
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).multiplyCounter();
          },
          child: const Icon(Icons.close),
        ),
      ],
    );
  }
}
