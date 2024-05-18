
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:maids_cc_task/core/errors/failure.dart';
import 'package:maids_cc_task/features/todos/data/datasource/remote/base_todos_remote_data_sorce.dart';

import 'package:maids_cc_task/features/todos/data/models/todo.dart';

import '../../../../core/errors/local_database_error.dart';
import '../../../../core/errors/server_error.dart';
import '../datasource/local/base_todos_local_data_sorce.dart';
import '../models/paginated_todos.dart';
import 'base_todos_repository.dart';

class TodosRepository implements BaseTodosRepository {
  final BaseTodosRemoteDataSource _baseTodosRemoteDataSource;
  final BaseTodosLocalDataSource _baseTodosLocalDataSource;

  TodosRepository(
      this._baseTodosRemoteDataSource, this._baseTodosLocalDataSource);
  Future<Either<Failure, T>> _execute<T>(Future<T> Function() action) async {
    try {
      T result = await action();
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerError.fromDioException(e));
    }
  }

  @override
  Future<Either<Failure, PaginatedTodos>> getTodos(int skip) async {
     await _baseTodosLocalDataSource.openBox();
    if (await InternetConnectionChecker().hasConnection) {
      return _execute(() => _baseTodosRemoteDataSource.getTodos(skip));
    } else {
      try {
        return Right(PaginatedTodos(todos: _baseTodosLocalDataSource.getCachedTodos(),));
      } on HiveError catch (e) {
        return Left(LocalDataBaseError(e.message));
      }
    }
  }

  @override
  Future<void> cacheTodos(List<Todo> todos) {
    return _baseTodosLocalDataSource.cacheTodos(todos);
  }
}
