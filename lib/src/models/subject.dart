class Subject {
  final dynamic id;
  final dynamic courseId;
  final dynamic subjectCredits;
  final dynamic name;
  final dynamic prefix;
  final dynamic code;

  Subject({
    required this.id,
    required this.courseId,
    required this.name,
    required this.subjectCredits,
    required this.code,
    required this.prefix,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json["id"],
      code: json["code"],
      prefix: json["prefix"],
      name: json["name"],
      subjectCredits: json["subject_credits"],
      courseId: json["course_id"],
    );
  }
}
