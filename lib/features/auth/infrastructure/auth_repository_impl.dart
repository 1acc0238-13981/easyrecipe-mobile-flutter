import 'package:easy_recipe/features/auth/domain/auth_repository.dart';
import 'package:easy_recipe/features/auth/domain/user.dart';
import 'package:easy_recipe/features/auth/infrastructure/auth_api.dart';
import 'package:easy_recipe/features/auth/infrastructure/login_response_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi api;
  const new({required this.api});

  @override
  Future<User> login(String email, String password) async {
    final LoginResponseDto dto = await api.login(email, password);
    return User(
      firstName: dto.firstName,
      lastName: dto.lastName,
      email: dto.email,
    );
  }
}
