import '../../../domain/user/user.dart';
import '../create_user_request_data.dart';
import '../login_user_request_data.dart';

abstract class IAuthenticationService {
  Future<String> registerAndGetToken(CreateUserRequestData requestData);
  Future<String> tokenFromLogin(LoginUserRequestData requestData);
  Future<User> getUserFromToken(String token);
}
