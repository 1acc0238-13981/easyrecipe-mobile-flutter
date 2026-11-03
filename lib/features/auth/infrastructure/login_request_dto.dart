class LoginRequestDto {
  final String email;
  final String password;

  const new({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
