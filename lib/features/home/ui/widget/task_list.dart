import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/home/logic/fetch_all_tasks/fetch_all_tasks_cubit.dart';

import 'task_info.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAllTasksCubit, FetchAllTasksState>(
      builder: (context, state) {
        var task = BlocProvider.of<FetchAllTasksCubit>(context).taskModel ?? [];
        return ListView.builder(
          itemCount: task.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 18.h, left: 10.w, right: 10.w),
              child: TaskInfo(
                taskModel: task[index],
              ),
            );
          },
        );
      },
    );
  }
}
