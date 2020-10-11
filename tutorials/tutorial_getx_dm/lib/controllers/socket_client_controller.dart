import 'dart:async';
import 'package:get/get.dart';
import 'package:faker/faker.dart';

class SocketClientController extends GetxController {
  RxString message = ''.obs;
  RxInt counter = 0.obs;
  Timer _timer;
  Timer _timer2;
  final faker = Faker();

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  _init() {
    /*ever(counter, (_) {
      print('_Counter Change ${counter.value}');
    });*/

    /*once(counter, (_) {
      print('_Counter Change ${counter.value}');
    });*/

    debounce(counter, (_) {
      print('_Counter Change ${counter.value}');
    }, time: Duration(milliseconds: 1500));

    _timer = Timer.periodic(Duration(milliseconds: 2500), (timer) {
      message.value = faker.lorem.sentence();
    });

    _timer2 = Timer.periodic(Duration(milliseconds: 1500), (timer) {
      counter.value++;
    });
  }

  @override
  void onClose() {
    if (_timer != null) _timer?.cancel();
    if (_timer2 != null) _timer?.cancel();
    super.onClose();
  }
}
