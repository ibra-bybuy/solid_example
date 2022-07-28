import 'package:auth_clean/features/data/models/auth_request_data.dart';
import 'package:auth_clean/features/data/models/auth_response_data.dart';
import 'package:injectable/injectable.dart';

abstract class AuthSource {
  Future<AuthResponseData> signIn(AuthRequestData data);
}

@LazySingleton(as: AuthSource)
class AuthSourceImpl implements AuthSource {
  @override
  Future<AuthResponseData> signIn(AuthRequestData data) {
    // Fake api Request

    bool valid = data.login == "test" && data.password == "1234";

    return Future.value(AuthResponseData(success: valid));
  }
}
