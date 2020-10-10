import 'package:counter_app/notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _counterProvider = ChangeNotifierProvider<CounterChangeNotifier>((ref) {
  return CounterChangeNotifier();
});

class CounterChangeNotifierPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final counter = watch(_counterProvider);

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
              '${counter.count}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'asa',
            onPressed: context.read(_counterProvider).decrement,
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: context.read(_counterProvider).increment,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
