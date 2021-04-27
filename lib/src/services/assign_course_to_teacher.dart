import "./global_config.dart";

import "package:http/http.dart" as http;

dynamic assignCourseToTeacher({
  required int teacherId,
  required int courseId,
  required int subjectCredits,
}) async {
  final url = Uri.parse(baseUrl + "/assign-course-to-teacher");
  final response = await http.post(url, body: {
    "teacherId": teacherId.toString(),
    "courseID": courseId.toString(),
    "subjectCredits": subjectCredits.toString(),
  });
  return (response.body);
}
