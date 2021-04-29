import 'dart:convert';

import 'package:http/http.dart' as http;

import 'global_config.dart';

dynamic createUser(
  String name,
  String username,
  String password,
  String role,
) async {
  final url = Uri.parse(baseUrl + "/create-user");
  final response = await http.post(
    url,
    body: {
      "email": username,
      "password": password,
      "name": name,
      "role": role,
    },
  );
  return jsonDecode(response.body);
}
