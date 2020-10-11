import 'dart:async';

import 'package:get/get.dart';
import 'package:tutorial_getx_dm/controllers/socket_client_controller.dart';
import 'package:tutorial_getx_dm/models/pet.dart';

class ReactiveController extends GetxController {
  RxInt counter = 0.obs;
  RxString currentDate = ''.obs;
  RxList<String> items = List<String>().obs;

  Pet myPet = Pet(name: 'Lito', age: 3);

  StreamSubscription<String> _subscription;

  @override
  void onInit() {
    super.onInit();

    final socket = Get.find<SocketClientController>();

    _subscription = socket.message.listen((String data) {
      //print('Message $data');
    });
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }

  void increment() {
    counter.value++;
    setPetAge(counter.value);
  }

  void getDate() {
    currentDate.value = DateTime.now().toString();
    addItem();
  }

  void addItem() {
    items.add(currentDate.value);
  }

  void setPetAge(int age) {
    myPet.age = age;
    //myPet.value = myPet.value.copyWith(age: age);
  }
}
