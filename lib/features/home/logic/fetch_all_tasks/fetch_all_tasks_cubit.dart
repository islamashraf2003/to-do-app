import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/task_data.dart';

part 'fetch_all_tasks_state.dart';

class FetchAllTasksCubit extends Cubit<FetchAllTasksState> {
  FetchAllTasksCubit() : super(FetchAllTasksInitial());
  List<TasksModel>? taskModel;
  fetchAllTasks() {
    emit(FetchAllTasksLoading());
    var tasks = Hive.box<TasksModel>("todo_box");
    taskModel = tasks.values.toList();
    emit(FetchAllTasksSuccess());
  }
}
