import 'dart:convert';

import 'package:http/http.dart' as http;

import 'global_config.dart';

dynamic fetchCourses() async {
  final url = Uri.parse(baseUrl + "/fetch-courses");
  final response = await http.get(url);
  return (jsonDecode(response.body));
}
