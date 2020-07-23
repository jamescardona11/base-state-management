import 'package:flutter/material.dart';
import 'package:login_app/login/widgets/custom_textfield_widget.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 35),
              FlutterLogo(size: size.width * 0.45),
              SizedBox(height: 25),
              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              CustomEmailTextField(),
              CustomPasswordTextField(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    color: Colors.blue,
                    minWidth: 120,
                    onPressed: () {},
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  RawMaterialButton(
                    onPressed: () {},
                    child: Text('Go to Register'),
                    padding: EdgeInsets.all(15.0),
                  ),
                ],
              ),
              SizedBox(height: 15),
              CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
