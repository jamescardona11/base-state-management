import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_getx_dm/controllers/global_controller.dart';
import 'package:tutorial_getx_dm/controllers/socket_client_controller.dart';
import 'package:tutorial_getx_dm/pages/splash_page.dart';
import 'package:tutorial_getx_dm/widgets/products_list.dart';

import 'pages/reactive_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(GlobalController());
    Get.put(SocketClientController());
    return GetMaterialApp(
      title: 'Material App',
      home: Scaffold(
        //body: SplashPage(),
        body: ReactivePage(),
      ),
    );
  }
}
