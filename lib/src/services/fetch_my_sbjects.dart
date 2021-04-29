import 'dart:convert';

import 'package:http/http.dart' as http;

import 'global_config.dart';

dynamic fetchMySubjects() async {
  final Uri url = Uri.parse(baseUrl + "/fetch-my-subjects")
      .replace(queryParameters: {"teacherId": loggedInUser.id.toString()});
  final response = await http.get(url);
  return json.decode(response.body);
}
