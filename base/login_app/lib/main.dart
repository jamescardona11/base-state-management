import 'package:flutter/material.dart';
import 'package:login_app/login/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
