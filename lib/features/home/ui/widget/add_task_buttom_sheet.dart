import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/helper/spacing.dart';
import 'package:todo_app/features/home/logic/add_task/add_task_cubit.dart';

import '../../data/task_data.dart';
import 'custom_elevated_button.dart';
import 'custom_text_field.dart';

class AddTaskForm extends StatefulWidget {
  AddTaskForm({
    super.key,
  });

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  String? title, subTitle;
  int selectedRadioValue = 0;
  final GlobalKey<FormState> formKey = GlobalKey();
  Color containerColor = Colors.white;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(60),
                const Center(
                  child: Text(
                    'New Task Todo',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                const Divider(
                  height: 25,
                  thickness: .9,
                  color: Colors.grey,
                ),
                const SizedBox(height: 7),
                const Text(
                  'Title Task',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                const SizedBox(height: 3),
                CutomTextFormFiled(
                  hintText: 'Add Task Name',
                  maxLines: 1,
                  onSaved: (data) {
                    if (data?.isNotEmpty ?? true) {
                      title = data;
                    }
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'Description',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                const SizedBox(height: 3),
                CutomTextFormFiled(
                  hintText: 'Add Description',
                  maxLines: 3,
                  onSaved: (data) {
                    if (data?.isNotEmpty ?? true) {
                      subTitle = data;
                    }
                  },
                ),
                verticalSpace(40),
                Column(
                  children: [
                    customElevetedButton(
                      backgroundColor: const Color.fromARGB(255, 6, 70, 180),
                      foregroundColor: Colors.white,
                      textName: 'Create Task',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          TasksModel newTask = TasksModel(
                            taskName: title!,
                            subTitle: subTitle!,
                            dateTime: DateTime.now(),
                          );
                          BlocProvider.of<AddTaskCubit>(context)
                              .addNewTask(newTask);
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                    ),
                    verticalSpace(10),
                    customElevetedButton(
                      textName: 'Cansel',
                      color: const Color.fromARGB(255, 6, 70, 180),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue.shade800,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
