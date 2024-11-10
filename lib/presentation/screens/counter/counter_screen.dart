import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clickCounter = ref.watch(counterProvider);
    final isDarkmode = ref.watch(isDarkmodeProvider);
    
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Screen"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(isDarkmode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
              onPressed: () {
                ref.read(isDarkmodeProvider.notifier).update((state) => !state);
              },
            ),
          )
        ],
      ),
      body: Center(child: Text("Valor: $clickCounter")),
      floatingActionButton: FloatingActionButton(
       onPressed: () {
        ref.read(counterProvider.notifier).state++;
       },
        child: const Icon(Icons.add),
      ),
    );
  }
}