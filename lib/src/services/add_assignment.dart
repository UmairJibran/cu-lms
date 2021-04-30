import 'dart:convert';

import 'package:http/http.dart' as http;

import 'global_config.dart';

dynamic addAssignment({
  required int subjectId,
  required String assignmentTitle,
  required String assignmentDescription,
  String? supportingFile,
}) async {
  final url = Uri.parse(baseUrl + "/add-assignment");
  final response = await http.post(
    url,
    body: {
      "subjectId": subjectId.toString(),
      "assignmentTitle": assignmentTitle,
      "assignmentDescription": assignmentDescription,
      "assignmentSupportingFile": supportingFile,
    },
  );
  return jsonDecode(response.body);
}
