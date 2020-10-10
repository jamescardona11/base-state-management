import 'package:dio/dio.dart';
import 'package:tutorial_getx_dm/models/users.dart';

class UsersAPI {
  UsersAPI._internal();

  static UsersAPI _instance = UsersAPI._internal();
  static UsersAPI get instance => _instance;

  final _dio = Dio();

  Future<List<User>> getUsers(int page) async {
    try {
      final response = await _dio.get('https://reqres.in/api/users', queryParameters: {
        'page': page,
        'delay': 5,
      });

      return (response.data['data'] as List).map((e) => User.fromJson(e)).toList();
    } catch (e) {
      print('$e');
      return [];
    }
  }
}
