import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'todo.g.dart';
@HiveType(typeId: 1)
class Todo extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int userId;
  @HiveField(2)
  final String todo;
  @HiveField(3)
  final bool completed;

  const Todo(
      {required this.id,
      required this.userId,
      required this.todo,
      required this.completed});

  @override
  List<Object?> get props => [id, userId, todo, completed];

  Map<String, dynamic> toJson() {
    return {
      'userId': id,
      'todo': todo,
      'completed': completed,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
      id: json['id'],
      userId: json['userId'],
      todo: json['todo'],
      completed: json['completed']);
}
