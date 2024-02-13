import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/home/logic/add_task/add_task_cubit.dart';

import '../../logic/fetch_all_tasks/fetch_all_tasks_cubit.dart';
import 'add_task_buttom_sheet.dart';

class AddTaskConsumer extends StatelessWidget {
  const AddTaskConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskCubit, AddTaskState>(
      listener: (context, state) {
        if (state is AddTaskFailuer) {
          log(state.errorMessage);
        } else if (state is AddTaskSuccess) {
          BlocProvider.of<FetchAllTasksCubit>(context).fetchAllTasks();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return AddTaskForm();
      },
    );
  }
}
