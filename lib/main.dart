import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/home/data/task_data.dart';
import 'to_do_app.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(TasksModelAdapter());

  await Hive.openBox<TasksModel>("todo_box");

  runApp(const ToDoApp());
}
