import 'package:flutter/material.dart';
import 'package:login_app/home/home_page.dart';
import 'package:login_app/login/widgets/custom_textfield_widget.dart';
import 'package:login_app/services/http_services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  String email = '', pass = '';
  bool errorInField = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 35),
              FlutterLogo(size: size.width * 0.45),
              SizedBox(height: 25),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              CustomEmailTextField(
                onChanged: (value) {
                  email = value;
                  errorInField = false;
                  setState(() {});
                },
                errorInField: errorInField,
              ),
              CustomPasswordTextField(
                onChanged: (value) {
                  pass = value;
                  errorInField = false;
                  setState(() {});
                },
                errorInField: errorInField,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    color: Colors.blue,
                    minWidth: 120,
                    onPressed: callLogin,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(height: 15),
              ...[if (isLoading) CircularProgressIndicator()]
            ],
          ),
        ),
      ),
    );
  }

  void callLogin() async {
    bool isError = true;

    if (email.trim().contains('@') && pass.length > 6) {
      setState(() {
        isError = false;
        isLoading = true;
      });

      FocusScope.of(context).unfocus();
      final response = await HttpServices().callLogin(email, pass);
      if (response != 'OK') {
        setState(() {
          isLoading = false;
          //ERROR FROM SERVER
        });
      } else {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
        //Navigate

      }
    }

    if (isError) {
      errorInField = true;
      setState(() {});
    }
  }
}
