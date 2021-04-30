import 'dart:convert';

import 'package:http/http.dart' as http;

import 'global_config.dart';

dynamic displayAllAssignments() async {
  final url = Uri.parse(baseUrl + "/display-all-assignments");
  final response = await http.get(url);
  return jsonDecode(response.body);
}
