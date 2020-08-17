import 'package:get/state_manager.dart';

class CounterGet extends GetxController {
  var count = 0.obs;

  increment() => count.value++;
  decrement() => count.value--;
}
