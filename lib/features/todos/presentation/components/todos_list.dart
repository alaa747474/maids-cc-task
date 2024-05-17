import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todos_bloc.dart';

class TodosList extends StatefulWidget {
  const TodosList({super.key});

  @override
  TodosListState createState() => TodosListState();
}

class TodosListState extends State<TodosList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom && !_isFetching && _isNotLastPage) {
      context.read<TodosBloc>().add(const LoadMoreTodos());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >= maxScroll * 0.9;
  }

  bool get _isFetching {
    final state = context.read<TodosBloc>().state;
    return state is LoadMoreTodosLoadingState;
  }

  bool get _isNotLastPage =>
      context.read<TodosBloc>().total > context.read<TodosBloc>().todos.length;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      buildWhen: (previous, current) =>
          current is GetTodosListSuccessState ||
          current is LoadMoreTodosSuccessState,
      builder: (context, state) {
        return ListView.builder(
          controller: _scrollController,
          itemCount: context.read<TodosBloc>().todos.length,
          itemBuilder: (context, index) {
            return Text(
              context.read<TodosBloc>().todos[index].id.toString(),
              style: const TextStyle(fontSize: 50),
            );
          },
        );
      },
    );
  }
}
