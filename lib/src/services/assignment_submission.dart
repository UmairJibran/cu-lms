import 'dart:convert';
import 'package:http/http.dart' as http;

import 'global_config.dart';

dynamic assignmentSubmission(int assignmentId, String assignmentFile) async {
  final url = Uri.parse(baseUrl + "/assignment-submission");
  final response = await http.post(url, body: {
    "stdId": loggedInUser.id.toString(),
    "assignmentId": assignmentId.toString(),
    "assignmentFile": assignmentFile,
  });
  return jsonDecode(response.body);
}
