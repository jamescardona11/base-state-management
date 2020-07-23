import 'package:flutter/material.dart';
import 'package:login_app/login/widgets/custom_textfield_widget.dart';

class SignUpPage extends StatelessWidget {
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
                'Sign Up',
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
                  RawMaterialButton(
                    onPressed: () {},
                    child: Text('← Back to Login'),
                    padding: EdgeInsets.all(15.0),
                  ),
                  SizedBox(width: 10),
                  MaterialButton(
                    color: Colors.blue,
                    minWidth: 120,
                    onPressed: () {},
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  )
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
