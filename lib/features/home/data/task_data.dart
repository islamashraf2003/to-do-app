import 'package:hive/hive.dart';
part 'task_data.g.dart';

@HiveType(typeId: 0)
class TasksModel extends HiveObject {
  @HiveField(0)
  String taskName;

  @HiveField(1)
  String subTitle;

  @HiveField(2)
  DateTime dateTime;

  @HiveField(3)
  bool? isCheck;

  TasksModel({
    required this.taskName,
    required this.subTitle,
    required this.dateTime,
    this.isCheck = false,
  });
}
