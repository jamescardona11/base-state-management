import 'package:counter_app/change_notifier_page.dart';
import 'package:counter_app/state_notifier_page.dart';
import 'package:counter_app/state_provider_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

void main() {
  runApp(MyApp());
}

const changeNotifierRoute = 'changeNotifier';
const stateNotifierRoute = 'stateNotifier';
const stateProviderRoute = 'stateProvider';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => MyHomePage(),
          changeNotifierRoute: (context) => CounterChangeNotifierPage(),
          stateNotifierRoute: (context) => CounterStateNotifierPage(),
          stateProviderRoute: (context) => CounterStateProviderPage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, changeNotifierRoute);
              },
              child: Text('Change Notifier'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, stateNotifierRoute);
              },
              child: Text('State Notifier'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, stateProviderRoute);
              },
              child: Text('State Provider'),
            ),
          ],
        ),
      ),
    );
  }
}
