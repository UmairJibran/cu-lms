import 'dart:convert';

import 'package:http/http.dart' as http;

import 'global_config.dart';

dynamic createCourse(
  String name,
  String prefix,
  String code,
) async {
  final url = Uri.parse(baseUrl + "/add-course");
  final response = await http.post(
    url,
    body: {
      "prefix": prefix,
      "code": code,
      "name": name,
    },
  );
  return jsonDecode(response.body);
}
