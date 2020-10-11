import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_getx_dm/controllers/reactive_controller.dart';
import 'package:tutorial_getx_dm/controllers/socket_client_controller.dart';

class ReactivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketController = Get.find<SocketClientController>();

    return GetBuilder<ReactiveController>(
      init: ReactiveController(),
      builder: (controller) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text('Pet age ${socketController.message}')),
              Obx(() => Text('Reactive Page ${controller.counter.value}')),
              Obx(() => Text('Date Page ${controller.currentDate.value}')),
              Obx(() => Text('OBS ${controller.currentDate.value}')),
              Container(
                width: Get.width,
                height: 350,
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.items.length,
                    itemBuilder: (context, index) {
                      return Text(controller.items[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'tag',
              child: Icon(Icons.add),
              onPressed: controller.increment,
            ),
            FloatingActionButton(
              heroTag: 'date',
              child: Icon(Icons.calendar_today),
              onPressed: controller.getDate,
            ),
          ],
        ),
      ),
    );
  }
}
