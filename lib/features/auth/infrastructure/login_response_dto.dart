class LoginResponseDto {
  final String firstName;
  final String lastName;
  final String email;
  final String token;

  const new({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.token,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) {
    return LoginResponseDto(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      token: json['token'],
    );
  }
}
