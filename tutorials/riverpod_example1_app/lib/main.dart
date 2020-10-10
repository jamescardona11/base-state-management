import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'riverpod/checkbox_riverpod_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Riverpod solution - Flutter Explained',
        theme: ThemeData.light().copyWith(primaryColor: Color(0xFFe13133)),
        home: CheckboxRiverpodScreen(),
      ),
    );
  }
}
