import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_app/domain/user.dart';

class HttpServices {
  static const String _urlApi = 'https://reqres.in/api';

  Future<String> callLogin(String email, String pass) async {
    final finalUrl = _urlApi + '/login';
    final body = _loginMap(email, pass);
    final response = await http.post(finalUrl, body: body);

    final decodeBody = jsonDecode(response.body);
    if (_isOk(response.statusCode)) {
      return 'OK';
    } else {
      final error = decodeBody['error'] as String;
      return error;
    }
  }

  Future<List<User>> listUsers() async {
    final finalUrl = _urlApi + '/users?page=1&per_page=12';
    final response = await http.get(finalUrl);
    if (_isOk(response.statusCode)) {
      final decodeBody = jsonDecode(response.body);
      final users = decodeBody['data'] as List<dynamic>;
      final List<User> userReturn = [];
      users.forEach((element) {
        final map = element as Map<String, dynamic>;
        userReturn.add(User.fromJson(map));
      });

      return userReturn;
    } else {
      return [];
    }
  }

  Map<String, String> _loginMap(String email, String pass) => {
        'email': email,
        'password': pass,
      };

  bool _isOk(int statusCode) => statusCode == 200 || statusCode == 201;
}
