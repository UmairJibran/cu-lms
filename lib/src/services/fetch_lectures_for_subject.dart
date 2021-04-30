import 'dart:convert';
import 'package:http/http.dart' as http;

import 'global_config.dart';

dynamic fetchLecturesForSubject(int subjectId) async {
  final url = Uri.parse(baseUrl + "/fetch-lectures-for-subject")
      .replace(queryParameters: {
    "subjectId": subjectId.toString(),
  });
  print(url);
  final response = await http.get(url);

  return jsonDecode(response.body);
}
