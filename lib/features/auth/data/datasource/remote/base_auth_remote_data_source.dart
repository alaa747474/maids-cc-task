
import '../../models/user.dart';
import '../../params/login_params.dart';

abstract class BaseAuthRemoteDataSource {
  Future<User>login(LoginParams params);
}