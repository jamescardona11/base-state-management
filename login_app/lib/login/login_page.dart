import 'package:flutter/material.dart';
import 'package:login_app/login/layout/sign_in_page.dart';
import 'package:login_app/login/layout/sign_up_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          SignInPage(),
          SignUpPage(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.navigate_next,
          size: 35,
        ),
        onPressed: () {},
      ),
    );
  }
}
