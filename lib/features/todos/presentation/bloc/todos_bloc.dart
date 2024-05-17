import 'package:bloc/bloc.dart';
import 'package:maids_cc_task/features/todos/data/repositories/base_todos_repository.dart';

import '../../data/models/paginated_todos.dart';
import '../../data/models/todo.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final BaseTodosRepository _baseTodosRepository;
  bool isLoading = false;
  bool stopLoading = false;
  int skip = 0;
  int total = 0;
  List<Todo> todos = [];

  TodosBloc(this._baseTodosRepository) : super(TodosInitial()) {
    on<GetTodos>(_getTodos);
    on<LoadMoreTodos>(_loadMoreTodos);
    on<CacheTodos>(_cacheTodos);
  }
  void _getTodos(GetTodos event, Emitter<TodosState> emit) async {
    final result = await _baseTodosRepository.getTodos(event.skip);
    result.fold((failure) => emit(GetTodosListFailureState(failure.error)),
        (paginatedTodos) {
      total = paginatedTodos.total;
      todos.addAll(paginatedTodos.todos);
      emit(GetTodosListSuccessState(paginatedTodos));
    });
  }

  void _loadMoreTodos(LoadMoreTodos event, Emitter<TodosState> emit) async {
    emit(const LoadMoreTodosLoadingState());
    skip = skip + 10;
    final result = await _baseTodosRepository.getTodos(skip);
    result.fold((failure) => emit(GetTodosListFailureState(failure.error)),
        (moreTodos) {
      todos = todos + moreTodos.todos;
      emit(const LoadMoreTodosSuccessState());
    });
  }

  void _cacheTodos(CacheTodos event, Emitter<TodosState> emit) async =>
      await _baseTodosRepository.cacheTodos(todos);
}
