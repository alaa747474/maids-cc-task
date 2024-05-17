part of 'todos_bloc.dart';

sealed class TodosState   {
  const TodosState();


}

final class TodosInitial extends TodosState {}

final class GetTodosListSuccessState extends TodosState {
  final PaginatedTodos paginatedTodos;
  const GetTodosListSuccessState(this.paginatedTodos);

}

final class GetTodosListFailureState extends TodosState {
  final String error;
  const GetTodosListFailureState(this.error);

}

 class LoadMoreTodosLoadingState extends TodosState {
  const LoadMoreTodosLoadingState();
}

 class LoadMoreTodosSuccessState extends TodosState {
  const LoadMoreTodosSuccessState();
}
 class CacheTodosSuccessState extends TodosState {
  const CacheTodosSuccessState();
}