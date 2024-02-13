import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/features/home/logic/fetch_all_tasks/fetch_all_tasks_cubit.dart';
import 'package:todo_app/features/update_task/ui/update_view.dart';

import '../../../../core/helper/spacing.dart';
import 'package:intl/intl.dart';

import '../../data/task_data.dart';

class TaskInfo extends StatefulWidget {
  TaskInfo({
    Key? key,
    required this.taskModel,
  }) : super(key: key);

  final TasksModel taskModel;

  @override
  State<TaskInfo> createState() => _TaskInfoState();
}

class _TaskInfoState extends State<TaskInfo> {
  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat.jm().format(widget.taskModel.dateTime);
    String formattedDate =
        DateFormat('E, MMM d, y').format(widget.taskModel.dateTime);
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(16),
            onPressed: (context) {
              widget.taskModel.delete();
              BlocProvider.of<FetchAllTasksCubit>(context).fetchAllTasks();
            },
            icon: Icons.delete,
            backgroundColor: Colors.red,
          ),
        ],
      ),
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            onPressed: (context) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UpdateView(tasksModel: widget.taskModel),
              ));
            },
            icon: Icons.edit,
            backgroundColor: Colors.grey.shade300,
          ),
        ],
      ),
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          color: widget.taskModel.isCheck ?? false
              ? const Color(0xff9DA9DE)
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Text(
                            widget.taskModel.taskName,
                            style: TextStyle(
                              color: widget.taskModel.isCheck ?? false
                                  ? const Color.fromARGB(255, 6, 70, 180)
                                  : null,
                              fontWeight: widget.taskModel.isCheck ?? false
                                  ? FontWeight.w500
                                  : FontWeight.w800,
                              fontSize: 24.sp,
                              decoration: widget.taskModel.isCheck ?? false
                                  ? TextDecoration.lineThrough
                                  : null,
                              decorationColor: widget.taskModel.isCheck ?? false
                                  ? const Color.fromARGB(255, 19, 96, 158)
                                  : Colors.black,
                              decorationThickness: 1.4,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Checkbox(
                              value: widget.taskModel.isCheck ?? false,
                              onChanged: (value) {
                                setState(() {
                                  widget.taskModel.isCheck = value;
                                });
                              },
                              activeColor: const Color(0xff4D5FD1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.taskModel.subTitle,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: widget.taskModel.isCheck ?? false
                                  ? const Color.fromARGB(255, 6, 70, 180)
                                  : Colors.grey,
                              fontSize: 15.sp,
                              decoration: widget.taskModel.isCheck ?? false
                                  ? TextDecoration.lineThrough
                                  : null,
                              decorationThickness: 1.8,
                              decorationColor: widget.taskModel.isCheck ?? false
                                  ? const Color.fromARGB(255, 19, 96, 158)
                                  : Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, top: 20),
                              child: Column(
                                children: [
                                  Text(
                                    formattedTime,
                                    style: TextStyle(
                                      color: widget.taskModel.isCheck ?? false
                                          ? Colors.white
                                          : null,
                                    ),
                                  ),
                                  verticalSpace(2),
                                  Text(
                                    formattedDate,
                                    style: TextStyle(
                                      color: widget.taskModel.isCheck ?? false
                                          ? Colors.white
                                          : null,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
