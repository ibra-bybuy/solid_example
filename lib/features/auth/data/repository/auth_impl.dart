import 'package:injectable/injectable.dart';

import '../../domain/repository/auth_repository.dart';
import '../models/auth_request_data.dart';
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
