import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/helper/spacing.dart';
import 'package:todo_app/features/home/data/task_data.dart';
import 'package:todo_app/features/update_task/ui/widget/update_body.dart';

import 'widget/app_bar_section.dart';

class UpdateView extends StatelessWidget {
  UpdateView({super.key, required this.tasksModel});
  TasksModel tasksModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20.h),
              const AppBarSection(),
              verticalSpace(30.h),
              UpdateBody(tasksModel: tasksModel),
            ],
          ),
        ),
      ),
    );
  }
}
