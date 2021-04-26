class User {
  final dynamic id;
  final dynamic name;
  final dynamic password;
  final dynamic email;

  User({
    required this.id,
    required this.name,
    required this.password,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      email: json["email"],
      password: json["password"],
      name: json["name"],
    );
  }
}
