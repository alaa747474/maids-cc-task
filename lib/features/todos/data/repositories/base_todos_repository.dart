import 'package:dartz/dartz.dart';
import 'package:maids_cc_task/core/errors/failure.dart';

import '../models/paginated_todos.dart';
import '../models/todo.dart';

abstract class BaseTodosRepository {
  Future<Either<Failure,PaginatedTodos>> getTodos(int skip);
  Future<void> cacheTodos(List<Todo> todos);
}
