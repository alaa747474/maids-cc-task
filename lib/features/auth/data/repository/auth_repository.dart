import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_error.dart';
import '../datasource/remote/base_auth_remote_data_source.dart';
import '../models/user.dart';
import '../params/login_params.dart';
import 'base_auth_repository.dart';

class AuthRepository implements BaseAuthRepository {
  final BaseAuthRemoteDataSource _dataSource;
  AuthRepository(this._dataSource);

  Future<Either<Failure, T>> _execute<T>(Future<T> Function() action) async {
    try {
      T result = await action();
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerError.fromDioException(e));
    } 
  }

  @override
  Future<Either<Failure, User>> login(LoginParams params) =>
      _execute(() => _dataSource.login(params));
}
