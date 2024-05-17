
import 'package:hive_flutter/hive_flutter.dart';
import 'package:maids_cc_task/features/todos/data/models/todo.dart';

import 'base_todos_local_data_sorce.dart';

class TodosLocalDataSource implements BaseTodosLocalDataSource {
  late Box todoBox;
  @override
  Future<void> openBox() async {
    todoBox = await Hive.openBox<Todo>("todo_box");
  }

  @override
  List<Todo> getCachedTodos() {
    return todoBox.values.toList() as List<Todo>;
  }

  @override
  Future<void> cacheTodos(List<Todo> todos) async {
    for (var element in todos) {
      await todoBox.put(element.id, element);
    }
  }
}
