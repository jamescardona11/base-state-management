import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_getx_dm/controllers/global_controller.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final controller = Get.find<GlobalController>();
    return GetBuilder<GlobalController>(
      id: 'products',
      builder: (controller) => Scaffold(
        appBar: AppBar(
          actions: [
            GetBuilder<GlobalController>(
              builder: (controller) => FlatButton(
                onPressed: () {},
                child: Text('Favorites (${controller.favorites.length})'),
              ),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.products[index].name),
              subtitle: Text(controller.products[index].description),
              trailing: IconButton(
                onPressed: () => controller.onFavorite(index),
                icon: Icon(
                  Icons.favorite,
                  color: controller.products[index].favorite ? Colors.blue : Colors.grey,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
