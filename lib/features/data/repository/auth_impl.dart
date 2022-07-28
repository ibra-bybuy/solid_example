import 'package:auth_clean/features/data/models/auth_request_data.dart';
import 'package:auth_clean/features/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../sources/auth_source.dart';

@LazySingleton(as: AuthRepository)
class AuthImpl implements AuthRepository {
  final AuthSource authSource;

  const AuthImpl(this.authSource);

  @override
  Future<bool> signIn(String login, String password) async {
    final response = await authSource
        .signIn(AuthRequestData(login: login, password: password));

    return response.success;
  }
}
