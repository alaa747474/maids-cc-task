import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/user.dart';
import '../params/login_params.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, User>> login(LoginParams params);
}
