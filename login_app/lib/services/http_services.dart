import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpServices {
  static const String _urlApi = 'https://reqres.in/api';

  Future<void> callLogin(String email, String pass) async {
    final finalUrl = _urlApi + '/login';
    final body = loginRegisterBody(email, pass);
    final response = await http.post(finalUrl, body: body);

    if (_isOk(response.statusCode)) {
      final decodeBody = jsonDecode(response.body);
    } else {}
  }

  Map<String, String> loginRegisterBody(String email, String pass) => {
        'email': email,
        'password': pass,
      };

  bool _isOk(int statusCode) => statusCode == 200 || statusCode == 201;
}
