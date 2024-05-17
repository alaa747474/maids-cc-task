import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maids_cc_task/features/todos/data/repositories/base_todos_repository.dart';
import 'package:maids_cc_task/features/todos/presentation/bloc/todos_bloc.dart';

import '../../../../core/di/service_locator.dart';
import '../components/todos_list.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            TodosBloc(sl<BaseTodosRepository>())..add(const GetTodos(0)),
        child: Scaffold(
            body: Column(
          children: [
            BlocConsumer<TodosBloc, TodosState>(
              listener: (context, state) {
                if (state is GetTodosListSuccessState ||
                    state is LoadMoreTodosSuccessState) {
                  context.read<TodosBloc>().add(const CacheTodos());
                }
              },
              buildWhen: (previous, current) =>
                  current is GetTodosListSuccessState ||
                  current is LoadMoreTodosSuccessState,
              builder: (context, state) {
                return const Expanded(child: TodosList());
              },
            ),
            BlocBuilder<TodosBloc, TodosState>(
              builder: (context, state) {
                if (state is LoadMoreTodosLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container();
              },
            )
          ],
        )));
  }
}
