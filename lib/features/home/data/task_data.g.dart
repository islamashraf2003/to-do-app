// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TasksModelAdapter extends TypeAdapter<TasksModel> {
  @override
  final int typeId = 0;

  @override
  TasksModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TasksModel(
      taskName: fields[0] as String,
      subTitle: fields[1] as String,
      dateTime: fields[2] as DateTime,
      isCheck: fields[3] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, TasksModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.taskName)
      ..writeByte(1)
      ..write(obj.subTitle)
      ..writeByte(2)
      ..write(obj.dateTime)
      ..writeByte(3)
      ..write(obj.isCheck);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TasksModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
