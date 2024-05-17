
import '../../models/paginated_todos.dart';

abstract class BaseTodosRemoteDataSource {
  Future<PaginatedTodos> getTodos(int skip);
  Future<void> addTodo();
  Future<void> deleteTodo();
  Future<void> updateTodo();
}
