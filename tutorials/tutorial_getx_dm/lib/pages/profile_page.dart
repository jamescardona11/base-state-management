import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_getx_dm/controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: Get.back,
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${controller.user.firstName}'),
              SizedBox(height: 10),
              CupertinoTextField(
                onChanged: controller.onInputTextChanged,
              ),
              SizedBox(height: 10),
              CupertinoButton(
                onPressed: controller.goToBackWithData,
                child: Text('Accept'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
