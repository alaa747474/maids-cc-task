import '../../models/todo.dart';

abstract class BaseTodosLocalDataSource {
  Future<void> openBox();
  Future<void> cacheTodos(List<Todo>todos);
  List<Todo> getCachedTodos();

}
