import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/helper/spacing.dart';
import 'package:todo_app/features/home/data/task_data.dart';

import 'udate_section.dart';

class UpdateBody extends StatelessWidget {
  UpdateBody({super.key, required this.tasksModel});
  TasksModel tasksModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "What are you planing 😇 ?",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 19,
            ),
          ),
          verticalSpace(30),
          UpdateSection(tasksModel: tasksModel),
        ],
      ),
    );
  }
}
