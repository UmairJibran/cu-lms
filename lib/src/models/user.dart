class User {
  final dynamic id;
  final dynamic name;
  final dynamic role;
  final dynamic username;

  User({
    required this.id,
    required this.name,
    required this.role,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      username: json["username"],
      role: json["role"],
      name: json["name"],
    );
  }
}
