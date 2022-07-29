import 'package:injectable/injectable.dart';

import '../entities/auth_entities.dart';
import '../repository/auth_repository.dart';

@LazySingleton()
class AuthUsecase {
  final AuthRepository authRepository;
  const AuthUsecase(this.authRepository);

  Future<bool> signIn(AuthEntities entities) async {
    return authRepository.signIn(entities.login, entities.password);
  }
}
