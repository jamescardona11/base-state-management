import 'package:flutter/material.dart';
import 'package:timer_app/timer_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer App',
      theme: ThemeData(primaryColor: Colors.teal),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Timer App'),
        ),
        body: TimerPage(),
      ),
    );
  }
}
