import 'dart:convert';

import 'package:http/http.dart' as http;

import 'global_config.dart';

dynamic addLecture({
  required int subjectId,
  required String lectureTitle,
  required String lectureDescription,
  String? supportingFile,
}) async {
  final url = Uri.parse(baseUrl + "/lecture-upload");
  final response = await http.post(
    url,
    body: {
      "subjectId": subjectId.toString(),
      "lectureTitle": lectureTitle,
      "lectureDescription": lectureDescription,
      "lectureSupportingFile": supportingFile,
    },
  );
  return jsonDecode(response.body);
}
