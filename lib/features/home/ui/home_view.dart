import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/home/data/task_data.dart';

import 'widget/addTask_consumer.dart';
import 'widget/app_bar_section.dart';
import 'widget/task_list.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const AddTaskConsumer();
            },
          );
        },
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: const Icon(Icons.add),
      ),
      body: SizedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: AppBarSection(),
              ),
              SliverFillRemaining(
                child: TaskList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
