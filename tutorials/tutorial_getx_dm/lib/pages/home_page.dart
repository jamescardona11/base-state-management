import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_getx_dm/controllers/home_controllers.dart';

class HomePage extends StatelessWidget {
  final homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: homeController,
      builder: (_) {
        print('Build home');
        return Scaffold(
          body: ListOfUserWidget(),
          floatingActionButton: FloatingActionButton(
            onPressed: homeController.increment,
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}

class ListOfUserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'users',
      builder: (_) {
        if (_.loading) return Center(child: LinearProgressIndicator());

        return ListView.builder(
          itemCount: _.users.length,
          itemBuilder: (context, index) {
            final user = _.users[index];
            return ListTile(
              title: Text(user.firstName),
              onTap: () => _.showUserProfile(user),
            );
          },
        );
      },
    );
  }
}
