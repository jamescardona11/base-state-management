import 'package:get/get.dart';
import 'package:tutorial_getx_dm/api/users_api.dart';
import 'package:tutorial_getx_dm/models/users.dart';
import 'package:tutorial_getx_dm/pages/profile_page.dart';

class HomeController extends GetxController {
  int _counter = 0;
  List<User> _users = [];
  bool _loading = true;

  int get counter => _counter;
  bool get loading => _loading;
  List<User> get users => _users;

  @override
  void onInit() {
    super.onInit();
    print('Same as initState');
  }

  @override
  void onReady() {
    super.onReady();
    print('On Ready!');
    loadUsers();
  }

  Future loadUsers() async {
    final data = await UsersAPI.instance.getUsers(1);
    _users = data;
    _loading = false;
    update(['users']);
  }

  void increment() {
    _counter++;
    update(['text']);
  }

  Future showUserProfile(User user) async {
    final result = await Get.to<String>(
      ProfilePage(),
      arguments: user,
    );

    if (result != null) {
      print('dif');
    }
  }
}
