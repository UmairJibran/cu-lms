class Course {
  final dynamic id;
  final dynamic name;
  final dynamic prefix;
  final dynamic code;

  Course({
    required this.id,
    required this.name,
    required this.prefix,
    required this.code,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json["id"],
      name: json["name"],
      prefix: json["prefix"],
      code: json["code"],
    );
  }
}
