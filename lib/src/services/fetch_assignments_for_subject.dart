import 'dart:convert';
import 'package:http/http.dart' as http;

import 'global_config.dart';

dynamic fetchAssignmentsForSubject(int subjectId) async {
  final url = Uri.parse(baseUrl + "/fetch-assignment-for-subject")
      .replace(queryParameters: {
    "subjectId": subjectId.toString(),
  });
  final response = await http.get(url);

  return jsonDecode(response.body);
}
