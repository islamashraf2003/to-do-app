import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/task_data.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  addNewTask(TasksModel newTask) async {
    emit(AddTaskLoading());
    try {
      var taskBox = Hive.box<TasksModel>("todo_box");
      await taskBox.add(newTask);
      emit(AddTaskSuccess());
    } catch (e) {
      emit(
        AddTaskFailuer(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
