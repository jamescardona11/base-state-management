import 'package:get/get.dart';
import 'package:tutorial_getx_dm/pages/home_page.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();

    Future.delayed(Duration(seconds: 2), () {
      Get.to(HomePage());
    });
  }
}
