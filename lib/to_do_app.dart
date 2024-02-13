import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/home/logic/fetch_all_tasks/fetch_all_tasks_cubit.dart';

import 'core/router/routeing.dart';
import 'features/home/logic/add_task/add_task_cubit.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AddTaskCubit>(
            create: (context) => AddTaskCubit(),
          ),
          BlocProvider<FetchAllTasksCubit>(
            create: (context) => FetchAllTasksCubit()..fetchAllTasks(),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: AppRouts.router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
