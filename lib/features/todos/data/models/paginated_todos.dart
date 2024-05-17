
import 'package:equatable/equatable.dart';

import 'todo.dart';

class PaginatedTodos extends Equatable {
  final List<Todo> todos;
  final int total, skip, limit;

  const PaginatedTodos(
      {required this.todos,
      required this.total,
      required this.skip,
      required this.limit});
  @override
  List<Object?> get props => [todos, total, skip, limit];

  factory PaginatedTodos.fromJson(Map<String, dynamic> json) => PaginatedTodos(
        todos: List<Todo>.from(json["todos"].map((e) => Todo.fromJson(e))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );
}
