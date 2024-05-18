import 'package:equatable/equatable.dart';

import 'todo.dart';

class PaginatedTodos extends Equatable {
  final List<Todo> todos;
  final int? total, skip, limit;

  const PaginatedTodos(
      {required this.todos, this.total, this.skip, this.limit});
  @override
  List<Object?> get props => [todos, total, skip, limit];

  factory PaginatedTodos.fromJson(Map<String, dynamic> json) => PaginatedTodos(
        todos: List<Todo>.from(json["todos"].map((e) => Todo.fromJson(e))),
        total: json["total"] ?? 0,
        skip: json["skip"] ?? 0,
        limit: json["limit"] ?? 0,
      );
}
