import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maids_cc_task/features/todos/data/models/todo.dart';
import 'package:maids_cc_task/features/todos/presentation/bloc/todos_bloc.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.todo});
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8.w),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Theme.of(context).cardColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                todo.todo,
                softWrap: true,
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 3,
              ),
            ),
            BlocBuilder<TodosBloc, TodosState>(
              builder: (context, state) {
                return Row(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                  ],
                );
              },
            )
          ],
        ));
  }
}
