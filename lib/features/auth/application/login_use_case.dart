import 'package:easy_recipe/features/auth/domain/auth_repository.dart';
import 'package:easy_recipe/features/auth/domain/user.dart';

class LoginUseCase {
  final AuthRepository repository;

  const new({required this.repository});

  Future<User> execute(String email, String password) {
    return repository.login(email, password);
  }
}
