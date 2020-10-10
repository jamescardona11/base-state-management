import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

final _counterProvider = StateProvider<int>((ref) => 0);

final _isEvenProvider = Provider<bool>((ref) {
  final counter = ref.watch(_counterProvider);
  return (counter.state.abs().isEven);
});

class CounterStateProviderPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final counter = watch(_counterProvider).state;
    final isEven = watch(_isEvenProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('ChangeNotifier Solution'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counter} --> isEven ${isEven}',
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'asa',
            onPressed: () => context.read(_counterProvider).state--,
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => context.read(_counterProvider).state++,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
