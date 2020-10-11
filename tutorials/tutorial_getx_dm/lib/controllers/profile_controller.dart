import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_getx_dm/models/users.dart';

class ProfileController extends GetxController {
  User _user;
  User get user => _user;

  String _inputText = '';

  @override
  void onInit() {
    super.onInit();

    _user = Get.arguments as User;
  }

  void onInputTextChanged(String text) {
    _inputText = text;
  }

  void goToBackWithData() {
    if (_inputText.trim().length > 0) {
      Get.back(result: _inputText);
    } else {
      Get.dialog(AlertDialog(
        title: Text('Error'),
        content: Text('set a valid value'),
        actions: [
          FlatButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Ok'),
          )
        ],
      ));
    }
  }
}
