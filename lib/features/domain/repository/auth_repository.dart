abstract class AuthRepository {
  Future<bool> signIn(String login, String password);
}
