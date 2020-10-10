import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_getx_dm/controllers/home_controllers.dart';

class HomePage extends StatelessWidget {
  final homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: homeController,
      builder: (_) => Scaffold(
        body: Center(
          child: Text('-->> ${_.counter}'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: homeController.increment,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
