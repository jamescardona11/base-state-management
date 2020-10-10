import 'package:get/get.dart';

class HomeController extends GetxController {
  int _counter = 0;
  int get counter => _counter;

  @override
  void onInit() {
    super.onInit();
    print('Same as initState');
  }

  @override
  void onReady() {
    super.onReady();
    print('On Ready!');
  }

  void increment() {
    _counter++;
    update();
  }
}
