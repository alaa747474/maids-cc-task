import 'package:dio/dio.dart';
import 'package:maids_cc_task/core/api/api_end_points.dart';
import 'package:maids_cc_task/core/api/api_service.dart';
import 'package:maids_cc_task/features/todos/data/datasource/remote/base_todos_remote_data_sorce.dart';

import '../../models/paginated_todos.dart';

class TodosRemoteDataSource implements BaseTodosRemoteDataSource {
  final ApiService _apiService;

  TodosRemoteDataSource(this._apiService);

  @override
  Future<PaginatedTodos> getTodos(int skip) async {
    Response response = await _apiService
        .get(ApiEndPoints.todos, queryParameters: {"limit": 10, "skip": skip});
    final json = response.data;
    return PaginatedTodos.fromJson(json);
  }

  @override
  Future<void> addTodo() {
    throw UnimplementedError();
  }

  @override
  Future<void> updateTodo() {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTodo() {
    throw UnimplementedError();
  }
}
