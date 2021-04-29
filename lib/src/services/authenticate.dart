import 'dart:convert';

import 'package:http/http.dart' as http;

import 'global_config.dart';

dynamic authenticateLogin(String username, String password) async {
  final url = Uri.parse(baseUrl + "/login");
  final response = await http.post(
    url,
    body: {"username": username, "password": password},
  );
  return jsonDecode(response.body);
}
