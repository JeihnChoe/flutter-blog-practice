class JoinDTO {
  String username;
  String password;
  String email;

  JoinDTO({
    required this.username,
    required this.password,
    required this.email,
  });

  Map<String, dynamic> toJson() =>
      {"username": username, "password": password, "email": email};
}
