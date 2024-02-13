import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_app/features/home/logic/fetch_all_tasks/fetch_all_tasks_cubit.dart';

import '../../../../core/helper/spacing.dart';
import '../../../home/data/task_data.dart';
import '../../../home/ui/widget/custom_elevated_button.dart';
import '../../../home/ui/widget/custom_text_field.dart';

class UpdateSection extends StatefulWidget {
  const UpdateSection({
    Key? key,
    required this.tasksModel,
  }) : super(key: key);
  final TasksModel tasksModel;
  @override
  State<UpdateSection> createState() => _UpdateSectionState();
}

class _UpdateSectionState extends State<UpdateSection> {
  String? title, subTitle;

  int selectedRadioValue = 0;

  final GlobalKey<FormState> formKey = GlobalKey();

  Color containerColor = Colors.white;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              hintText: 'Update Task Name',
              maxLines: 1,
              initialValue: widget.tasksModel.taskName,
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
              hintText: 'Update Description',
              initialValue: widget.tasksModel.subTitle,
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
                  textName: 'Update Task',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      widget.tasksModel.taskName = title!;
                      widget.tasksModel.subTitle = subTitle!;
                      widget.tasksModel.dateTime = DateTime.now();
                      widget.tasksModel.save();
                      BlocProvider.of<FetchAllTasksCubit>(context)
                          .fetchAllTasks();

                      Navigator.pop(context);
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
    );
    ;
  }
}
