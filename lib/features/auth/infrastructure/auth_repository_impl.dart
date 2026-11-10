import 'package:easy_recipe/core/token_storage.dart';
import 'package:easy_recipe/features/auth/domain/auth_repository.dart';
import 'package:easy_recipe/features/auth/domain/user.dart';
import 'package:easy_recipe/features/auth/infrastructure/auth_api.dart';
import 'package:easy_recipe/features/auth/infrastructure/login_response_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _api;
  final TokenStorage _tokenStorage;
  const AuthRepositoryImpl({required this._api, required this._tokenStorage});

  @override
  Future<User> login(String email, String password) async {
    final LoginResponseDto dto = await _api.login(email, password);
    final User user = User(
      firstName: dto.firstName,
      lastName: dto.lastName,
      email: dto.email,
    );
    _tokenStorage.saveToken(dto.token);
    return user;
  }
}
