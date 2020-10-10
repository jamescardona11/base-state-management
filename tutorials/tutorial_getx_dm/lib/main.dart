import 'package:flutter/material.dart';
import 'package:tutorial_getx_dm/pages/home_page.dart';
import 'package:tutorial_getx_dm/pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: SplashPage(),
      ),
    );
  }
}
