part of 'todos_bloc.dart';

sealed class TodosEvent   {
  const TodosEvent();

  
}

class GetTodos extends TodosEvent {
  final int skip ;

  const GetTodos(this.skip);
}
class LoadMoreTodos extends TodosEvent {

  const LoadMoreTodos();
}
class CacheTodos extends TodosEvent {

  const CacheTodos();
}