import 'dart:convert';

import 'package:http/http.dart' as http;

import 'global_config.dart';

dynamic fetchTeachers() async {
  final url = Uri.parse(baseUrl + "/fetch-teachers");
  final response = await http.get(url);
  return (jsonDecode(response.body));
}
